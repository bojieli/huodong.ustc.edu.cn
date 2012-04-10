<?php
// include/class_event.php 2011-07-08 boj
// event dispatching mechanism

// After initializing, the kernel transfers control to event processor,
//	which sits in a tight loop processing the event queue,
//	dispatching every event to its handler (by dispatcher),
//	until the queue is empty or some event handler explicitly exits
//	the whole program or throws an unrecoverable exception.
// Then, event processor transfers control back to the kernel,
//	and output the final results.

// On triggering an event, the event can be configured as synchronous or
//	asynchronous (default). Synchronous event is nothing different
//	from function calls, so arguments and return value are natural.
// Event triggered in synchronous type is in fact converted to a function
//	call, and return to the caller once finished.
// The rest of this document focus on asynchronous event, the default type.

// As the reason for introducing an event queue, event dispatching is a
//	dynamic process. Event handlers may trigger new events at any time.
// This version cannot detect infinite event loops, while the maximum 
//	execution time can help.

// By introducing arguments to event, more information can be provided, thus
//	decreasing overuse of global attributes.

// The return value of an event is a bit noisy for its intervention into
//	sequential control flow, thus it is not supported.
// Developers may introduce a callback function pointer as an argument for the
//	event, and explicitly jump to callback at the end of event handler.
// Developers should be aware that no warranty of execution order provided
//	when using event-based object operations.

// For efficiency, object_path is removed in this version,
//	only events in current object can be triggered.

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

class event {
	// event queue
	var $event_queue = array();
	//var $object_path = array();
	var $event_args = array();
	var $queue_front = 0;
	var $queue_rear = 0;
	
	// user defined event handlers
	var $event_handlers = array();
	// system events cannot be removed. They have to be handled to keep the system running.
	var $system_event_handlers = array(
	//	'select'	=> 'OBJ::select',
	//	'get'		=> 'OBJ::get',
	//	'read' 		=> 'OBJ::read',
		'read'		=> 'OBJ::output',
		'set' 		=> 'OBJ::set',
		'write' 	=> 'OBJ::update',
		'insert'	=> 'OBJ::insert',
		'create'	=> 'OBJ::insert',
		'update'	=> 'OBJ::update',
		'modify'	=> 'OBJ::update',
		'delete'	=> 'OBJ::delete',
		'remove'	=> 'OBJ::delete',
		'move'		=> 'OBJ::move',
		'grant' 	=> 'OBJ::grant',
		'revoke'	=> 'OBJ::revoke'
		);
	
	// singleton
	function &instance() {
		static $object;
		if(empty($object)) {
			$object = new event();
		}
		return $object;
	}
	
	// temporary : use modules instead of event
	// only initial event is taken and passed control to event handler module
	function init() {
		global $_G;
		$event = $_G['event'];
		
		$event = event::special_event($event);
		$class = event::special_class($event);
		
		event::log_event($event);

		$file = modulefile($class, $event);

		if (@file_exists($file)) {
			include $file; // this is the last step of 'chainloader'
		} else { // use default class
			$file = modulefile('default', $event);
			if (@file_exists($file)) {
				include $file;
			} else {
				$file = modulefile('group', $event);
				if (@file_exists($file)) {
					include $file;
				}
				else {
					error::system_error('Action Undefined');
				}
			}
		}
		// no more actions need to be taken
	}
	// define the initial event
	// currently not implemented
	/*
	function init($event = '', $event_args = array()) {
		if(!empty($event)) {
			$this->set($event, $event_args);
		} else {
			global $_G;
			if (empty($_G['event']))
				$this->set('read', null);
			else
				$this->set($_G['event'], null);
		}
		$this->init_handlers();
	}
	*/
	
	function special_event($event) {
		$classes = array('user', 'group', 'system');
		$paths = explode('/', CURRENT_PATH);
		foreach ($classes as $class) {
			// /class/event/...
			if ($paths[1] == $class) {
				// overwrite event for special class to replace /user?action=register with /user/register
				// 	or use /user/profile/10000 to be path of user profile
				if (isset($paths[2]) && isvarname($paths[2])) {
					return $paths[2];
				}
			}
		}
		
		return $event;
	}

	// we have to make some hack on special paths
	function special_class($event) {
	
		// for inserts, class is the one identified by new object
		//	to allow different handlers for different types (e.g. message)
		if ($event == 'insert') {
			if (!empty($_POST['class'])) {
				return $_POST['class'];
			} else {
				return OBJ::get_default_child_class(CURRENT_PATH);
			}
		}

		$classes = array('user', 'group', 'system');
		
		$paths = explode('/', CURRENT_PATH);
		foreach ($classes as $class) {
			// /class/event/...
			if ($paths[1] == $class) {
				// overwrite event for special class to replace /user?action=register with /user/register
				// 	or use /user/profile/10000 to be path of user profile
				if (isset($paths[2]) && isvarname($paths[2])) {
					return $class;
				} elseif (empty($paths[2]) || (is_numeric($paths[2]) && empty($paths[3]))) {
					return $class;
				}
			}
		}

		return OBJ::get_class(CURRENT_PATH); // the default way
	}
	
	// log every event triggered
	function log_event($event) {
		DB::query("INSERT INTO common_event_log (`uid`,`euid`,`ip`,`time`,`path`,`event`) VALUES ('".CURRENT_USER."', '".CURRENT_EUID."', '".CURRENT_IP."', '".CURRENT_TIMESTAMP."', '".CURRENT_PATH."', '".$event."')");
	}
	
	// the core dispatcher of events
	// Note that if multiple handler exists, the return value is the last one.
	// For chain handling processes, the return value of one handler is
	//	sent to the next handler as an argument (previous_result)
	
	// common function 'call' is required
	function dispatch($event = '', $arguments = array()) {
		if (empty($this->event_handlers[$event])) {
			return false; // no handlers found
		}
		
		$arguments['event'] = $event; // tell handler the event name to enable one handler to handle multiple events
		
		$return = null;
		if (isset($this->system_event_handlers[$event])) { // call system event handler
			$return = call($this->system_event_handlers[$event], $arguments);
		}
		
		if (is_array($this->event_handlers[$event])) { // call user defined event handlers
			foreach ($this->event_handlers[$event] as $handler) {
				if (!empty($return)) {
					$return = call($handler, array_merge($arguments, array('return_value' => $return)));
				} else {
					$return = call($handler, $arguments);
				}
			}
		}
		return $return;
	}
	
	// automatically dispatch the next event from event queue
	function dispatch_next() {
		$event_args = array();
		$event = $this->get($event_args);
		$this->dispatch($event, $event_args); // no return value
	}
	
	// ========== HANDLERS ==========
	
	function init_handlers() {
		OBJ::get_handlers($this->event_handlers);  // get by reference
	}
	
	// handler should be a valid function name or method name
	// add one handler at one time
	// no warranty provided for the execution sequence of several handlers
	function add_handler($event, $handler) {
		if (!isvarname($event) || !isfuncname($handler) && !ismethodname($handler)) {
			return false; // not a valid event or handler
		}
		if (empty($this->event_handlers[$event])) { // event not registered
			$this->event_handlers[$event] = array($handler);
		} elseif (is_array($this->event_handlers[$event])) { // have been multiple handlers
			$this->event_handlers[$event][] = $handler;
		}
		OBJ::set_handlers($this->event_handlers);
	}
	
	function remove_handler($event, $handler) {
		if (!isvarname($event) || !isfuncname($handler) && !ismethodname($handler)) {
			return false; // not a valid event or handler
		}
		if (empty($this->event_handlers[$event])) {
			return false; // event not found
		} elseif (is_array($this->event_handlers[$event])) { // find the handler and unset it
			$count = count($this->event_handlers[$event]);
			for ($idx = 0; $idx < $count; ++$idx)
				if ($this->event_handlers[$event][$idx] == $handler) {
					unset($this->event_handlers[$event][$idx]);
					OBJ::set_handlers($this->event_handlers);
					return true;
				}
		}
		return false; // handler not found
	}
	
	function get_handler($event) {
		return $this->event_handlers[$event];
	}
	
	function get_handler_count($event) {
		return count($this->event_handlers[$event]);
	}
	
	function is_handler_exist($event, $handler) {
		return in_array($handler, $this->event_handlers[$event]);
	}
	
	function remove_event($event) {
		if (!isvarname($event)) {
			return false; // not a valid event
		}
		if (!empty($this->event_handlers[$event])) {
			if (isset($this->system_event_handlers[$event])) {
				return false; // cannot remove system events
			}
			unset($this->event_handlers[$event]);
			OBJ::set_handlers($this->event_handlers);
			return true;
		}
		return false; // not found
	}
	
	// ========== ASYNCHRONOUS EVENTS ==========
	
	function set($event, $event_args) {
		if (!isvarname($event)) {
			return false; // not a valid event
		}
		$event = strtolower($event);
		$this->event_queue[$this->queue_rear] = $event;
		//$this->object_path[$this->queue_rear] = $object_path;
		$this->event_args[$this->queue_rear] = $event_args;
		$this->queue_rear++;
		return true;
	}
	
	function get(&$event_args) {
		if ($this->queue_front == $this->queue_rear) {
			return null; // empty queue
		} else {
			$event = $this->event_queue[$this->queue_front];
			//$object_path = $this->object_path[$queue_front];
			$event_args = $this->event_args[$this->queue_front];
			$this->queue_front++;
			return $event;
		}
	}
	
	function is_queue_empty() {
		return ($this->queue_front == $this->queue_rear);
	}
	
	function event_num_in_queue() {
		return ($this->queue_rear - $this->queue_front);
	}
	
	function clear() {
		$this->queue_front = $this->queue_rear = 0;
		unset($this->event_queue);
		//unset($this->object_path);
		unset($this->event_args);
		$this->event_queue = array();
		//$this->object_path = array();
		$this->event_args = array();
	}
	
	// ========== SYNCHRONOUS EVENTS ==========
	
	function call($event, $arguments) {
		return $this->dispatch($event, $arguments); // get return value
	}
}
