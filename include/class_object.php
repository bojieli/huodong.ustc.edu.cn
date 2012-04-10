<?php
// include/class_object.php 2011-07-10 boj
// operations on objects

// This class SHOULD NOT be created an instance.

// Object data structure in relational database
// It's a bit of hack, but before we can develop a new DBMS, we have to do so.

/*
CREATE TABLE common_object (
	-- common attributes
	`name` varchar(255) NOT NULL DEFAULT '',
	`path` varchar(255) NOT NULL DEFAULT '',
	`parent` varchar(255) NOT NULL DEFAULT '',
	`grandparent` varchar(255) NOT NULL DEFAULT '',
	`grandgrandparent` varchar(255) NOT NULL DEFAULT '',
	`author` int(10) NOT NULL DEFAULT '0',
	`author_name` varchar(255) NOT NULL DEFAULT '',
	`class` varchar(255) NOT NULL DEFAULT '',
	`inherit_class` varchar(255) NOT NULL DEFAULT '',
	`default_child_class` varchar(255) NOT NULL DEFAULT '',
	
	-- statistics
	`select_count` int(10) unsigned NOT NULL DEFAULT '0',
	`read_count` int(10) unsigned NOT NULL DEFAULT '0',
	`update_count` int(10) unsigned NOT NULL DEFAULT '0',
	`child_count` int(10) unsigned NOT NULL DEFAULT '0',
	`sub_object_count` int(10) unsigned NOT NULL DEFAULT '0',
	`next_child_id` int(10) unsigned NOT NULL DEFAULT '1',
	`create_time` int(10) unsigned NOT NULL DEFAULT '0',
	`modify_time` int(10) unsigned NOT NULL DEFAULT '0',
	`insert_time` int(10) unsigned NOT NULL DEFAULT '0',
	`access_time` int(10) unsigned NOT NULL DEFAULT '0',
	
	-- privilege
	`priv` smallint(3) NOT NULL DEFAULT '755',
	`priv_group` smallint(3) NOT NULL DEFAULT '755',
	`admin` text NOT NULL,
	`member` text NOT NULL,
	`whitelist` text NOT NULL,
	`blacklist` text NOT NULL,
	
	-- group relationship
	`agent` text NOT NULL,
	`friend` text NOT NULL,
	`listen` text NOT NULL,
	`listener` text NOT NULL,
	`include` text NOT NULL,
	`profile` text NOT NULL,
	
	-- common attributes
	`event_handlers` text NOT NULL,
	`template` text NOT NULL,
	`javascript` text NOT NULL,
	`css` text NOT NULL,
	`script` text NOT NULL,
	`credit` text NOT NULL,
	`siteroot` text NOT NULL,
	`note` text NOT NULL,
	`draft` text NOT NULL,
	`inbox` text NOT NULL,
	`title` text NOT NULL,
	`abstract` text NOT NULL,
	`content` text NOT NULL,
	`order` text NOT NULL,
	`settings` text NOT NULL,
	`tag` text NOT NULL,
	`rate` text NOT NULL,

	PRIMARY KEY (`path`)
);
*/

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

global $_OBJ; // object cache

class OBJ {

	// kernel should call this before any opreations on object
	function init() {
		init_priv(); // in include/function_rulelist
	}
	
	// 'attributes' argument in READ functions can be null (select all), a string (attribute name),
	//	or an array (array of attribute names).
	
	// conditional (SQL syntax) select child objects from a given parent
	// In further version it should be implemented by following the object tree from the root.
	function select($parent_object_path = '.', $attributes = '', $condition = '', $order = '', $limit = '') {

		if (!ispath($parent_object_path)) {
			return null; // not valid object path
		}
		$parent_object_path = OBJ::absolute_path($parent_object_path);
		
		if (is_array($condition)) {
			$condition['parent'] = $parent_object_path;
		}
		elseif (!empty($condition)) {
			$condition .= " AND `parent` = '$parent_object_path'";
		}
		else {
			$condition = "`parent` = '$parent_object_path'";
		}
		
		if (!empty($attributes) && !is_array($attributes)) {
			$attributes = array($attributes);
		}
		
		$return = DB::select($attributes, $condition, $order, $limit);

		if (isset($return[0]['path'])) {
			foreach ($return as $row) {
				OBJ::cache_set($row['path'], $row);
			}
		}
		return $return;
	}
	
	function count($parent_object_path = '.', $condition = '') {
	
		if (!ispath($parent_object_path)) {
			return null; // not valid object path
		}
		$parent_object_path = OBJ::absolute_path($parent_object_path);
		
		if (is_array($condition)) {
			$condition['parent'] = $parent_object_path;
		}
		elseif (!empty($condition)) {
			$condition .= " AND `parent` = '".$parent_object_path."'";
		}
		
		return DB::count($condition);
	}
	
	function is_object_exist($object_path) {
		$num = DB::result_first("SELECT COUNT(*) FROM common_object WHERE `path` = '$object_path'");
		return (!empty($num));
	}
	
	/*
	// This function is deprecated for it is really too slow...
	
	// conditional (SQL syntax) find sub objects from a given root
	// implemented by breadth-first traversal of object tree
	
	// The depth limit defines the max depth by default, where 0 is root itself, 1 is root and its children, etc.
	//	However, we can define both the min depth and the max depth, using syntax: min_depth,max_depth
	//	For example, "1,2" (quotation marks excluded) means to get all children and children's children of root.
	function find($root_object_path = '.', $depth_limit = INFINITY, $attributes = array(), $condition = '', $order = '', $limit = '') {

		if ($depth_limit == 1) { // identical to OBJ::select
			return OBJ::select($root_object_path, $attributes, $condition, $order, $limit);
		}
		
		if (!ispath($root_object_path)) {
			return null;
		}
		$root_object_path = OBJ::absolute_path($root_object_path);
		
		$depth_limit = explode(',', $depth_limit);
		if (is_numeric($depth_limit[1])) {
			$max_depth = $depth_limit[1];
			$min_depth = $depth_limit[0];
		} else {
			$max_depth = $depth_limit;
			$min_depth = 0;
		}
		
		if (!in_array('path', $attributes)) {
			$attributes[] = 'path'; // add 'path' to attributes selected to enable traversal
		}
		
		$queue = array();
		$front = 0;
		$rear = 1;
		$queue[0] = OBJ::get($root_object_path, $attributes); // get the root
		$queue[0]['relative_depth'] = 0;
		
		while ($rear > $front) { // breath-first traversal
			$curr_depth = $queue[$front]['relative_depth'];
			$front++;
			if ($curr_depth == $max_depth) {
				continue;
			}
			$curr_path = $queue[$front]['path'];
			
			$condition = '`parent` = \''.$curr_path.'\' AND '.$condition;
			$tmp_result = DB::select($attributes, $condition, $order, $limit);
			
			$tmp_result_count = count($tmp_result);
			for ($idx = 0; $idx < $tmp_result_count; $idx++) {
				OBJ::cache_set($tmp_result[$idx]['path'], $tmp_result[$idx]); // cache				
				$tmp_result[$idx]['relative_depth'] = $curr_depth + 1; // This attribute is intentionally added.
			}
			
			$queue = array_merge($queue, $tmp_result);
			$rear += $tmp_result_count;
		}
		
		for ($idx = 0; $idx < $rear && $queue[$idx]['relative_path'] < $min_depth; $idx++) {
			unset($queue[$idx]); // clear all results less than min_depth
		}
		
		return $queue;
	}
	*/
	
	// This version of `find` can only find depth 3 or less, using parent, grandparent and grandgrandparent
	function find($root_object_path = '.', $depth_limit = 3, $attributes = array(), $condition = '', $order = '', $limit = '') {
		if ($condition == '') {
			$condition = '1'; // form valid parent string
		}
		
		if ($depth_limit == 0) {
			return OBJ::get($root_object_path, $attributes);
		} elseif ($depth_limit == 1) {
			return OBJ::select($root_object_path, $attributes, $condition, $order, $limit);
		} elseif ($depth_limit == 2) {
			return DB::select($attributes, $condition." AND (`parent` = '$root_object_path' OR `grandparent` ='$root_object_path')", $order, $limit);
		} else { // depth_limit >= 3
			return DB::select($attributes, $condition." AND (`parent` = '$root_object_path' OR `grandparent` ='$root_object_path' OR `grandgrandparent` = '$root_object_path')", $order, $limit);
		}
	}
	
	// select all objects in a given class
	function select_class($class) {
		return DB::fetch_all("SELECT * FROM common_object WHERE `class` = '$class'");
	}
	
	// get attributes from a given object
	function get($object_path = '.', $attributes = array()) {

		if (!ispath($object_path)) {
			return null;
		}
		if (!is_array($attributes)) { // attribute can be a string
			$attributes = array($attributes);
		}
		if (count($attributes) >= 2) {
			$flag = 1;
		}
		$object_path = OBJ::absolute_path($object_path);
		
		$object = array();
		if (OBJ::is_cached($object_path) && !empty($attributes)) { // empty means all
			$in_cache = true;			
			$count = count($attributes);
			for ($i=0; $i<$count; $i++) {
				if (OBJ::is_cached($object_path, $attributes[$i])) {
					$object[$attributes[$i]] = OBJ::cache_get($object_path, $attributes[$i]);
					unset($attributes[$i]);
				}
			}
			if (!empty($attributes)) {
				$in_cache = false;
			}	
		}
		if (empty($in_cache)) { // attributes are not in cache
			$rs = DB::select($attributes, array('path' => $object_path));
			if (empty($rs)) {
				return null; // not found
			}
			// merge result in cache and from database
			$object = array_merge($object, $rs[0]);  // the first and only result

			// if not root, get inherit attributes not set in current object
			if ($object_path != OBJ::get_parent($object_path)) {
				$inherit = array();
				foreach ($attributes as $attr) {
					if (!isset($object[$attr])) {
						$inherit[] = $attr;
					}
				}
				if (!empty($inherit)) {
					$object = array_merge($object, OBJ::get(OBJ::get_parent($object_path), $inherit));
				}
			}
			
			OBJ::cache_set($object['path'], $object);
		}
		return $object;
	}
	
	// get the value of a single attribute
	function get_attr($object_path, $attribute_name) {
		$object = OBJ::get($object_path, array($attribute_name));
		return !empty($object) ? $object[$attribute_name] : null;
	}
	
	// parse the template and get HTML output of a given object
	// this function requires function parse_template
	function read($object_path = '.') {
		$object = OBJ::get($object_path, 'template');
		if (!function_exists('parse_template')) {
			require libfile('function/template');
		}
		return parse_template($object['template'], $object_path);
	}
	
	function output($object_path = '.') {
		echo OBJ::read($object_path);
	}
	
	// set a certain attribute to a given object
	function set_attr($object_path = '.', $attribute = '', $value = '') {

		if (!ispath($object_path)) {
			return null;
		}
		$object_path = OBJ::absolute_path($object_path);
		if (!isvarname($attribute)) {
			return null;
		}
		$value = addslashes($value); // the value may include illegal character
		OBJ::cache_set($object_path, array($attribute => $value));
		DB::update(array($attribute, $value), $object_path);
	}
	
	// 'attributes' argument in WRITE functions should be an associative array
	//	of attribute names (as key) and their values (as value).
	
	// the same with 'update'
	function set($object_path = '.', $attributes = array()) {
		OBJ::update($object_path, $attributes);
	}
	
	// insert a new object to given parent
	function insert($parent_object_path = '.', $attributes = array()) {
		if (!ispath($parent_object_path)) {
			return false; // not valid path
		}
		
		$parent_object_path = OBJ::absolute_path($parent_object_path);
		$attributes['parent'] = $parent_object_path;
		
		// set default class
		if (empty($attributes['class'])) {
			$attributes['class'] = OBJ::get_default_child_class($parent_object_path);
		}
		
		// set default value
		if (!empty($attributes['class'])) {
			$default = DB::fetch_first("SELECT * FROM common_object_default WHERE `class` = '".$attributes['class']."'");
			if (!empty($default)) {
				foreach ($default as $key => $value) {
					if (!isset($attributes[$key])) {
						$attributes[$key] = $value;
					}
				}
			}
			$diyattrs = DB::fetch_all("SELECT `name`, `value` FROM common_attribute_default WHERE `class` = '".$attributes['class']."'");
			foreach ($diyattrs as $diyattr) {
				if (!isset($attributes[$diyattr['name']])) {
					$attributes[$diyattr['name']] = $diyattr['value'];
				}
			}
		}

		// censor HTML tags and banned words
		$attributes = censor($attributes);

		return DB::insert($attributes); // return path of new object
	}
	
	// update a given object
	function update($object_path = '.', $attributes = array()) {

		if (!ispath($object_path)) {
			return false;
		}
		$object_path = OBJ::absolute_path($object_path);
		
		OBJ::cache_set($object_path, $attributes);
		
		// censor HTML tags and banned words (by reference)
		$atttibutes = censor($attributes);
		
		DB::update($object_path, $attributes);
	}
	
	// delete a given object
	function delete($object_path = '.') {

		if (!ispath($object_path)) {
			return false;
		}
		$object_path = OBJ::absolute_path($object_path);
		
		OBJ::cache_unset($object_path);
		DB::delete($object_path);
	}
	
	// move a given object to target path
	function move($source_object_path = '.', $target_object_path = '.') {
		
		if (!ispath($source_object_path) || !ispath($target_object_path)) {
			return false;
		}
		$source_object_path = OBJ::absolute_path($source_object_path);
		$target_object_path = OBJ::absolute_path($target_object_path);
		
		OBJ::update($source_object_path, array('path', $target_object_path));
	}
	
	// get class of a given object
	// currently no privilege control is enforced here
	function get_class($object_path) {
		$object_path = OBJ::absolute_path($object_path);
		$result = DB::result_first("SELECT class FROM common_object WHERE `path` = '$object_path'");
		return !empty($result) ? $result : 'default';
	}
	
	// get a list of all classes
	function get_class_list() {
		return DB::fetch_all("SELECT class FROM common_object_default");
	}
	
	// get default object of a given class
	function get_default($class) {
		$common = DB::fetch_first("SELECT * FROM common_object_default WHERE `class` = '$class'");
		$diy = DB::fetch_all("SELECT `name`, `value` FROM common_attribute_default WHERE `class` = '$class'");
		foreach ($diy as $attr) {
			$common[$attr['name']] = $attr['value'];
		}
		return $common;
	}
	
	function get_default_child_class($path = CURRENT_PATH) {
		$path = OBJ::absolute_path($path);
		$class = DB::result_first("SELECT `default_child_class` FROM common_object WHERE `path` = '$path'");
		return !empty($class) ? $class : 'default';
	}
	
	// update default object of a given class (ADMIN ONLY)
	// use MySQL REPLACE INTO
	function update_default($data) {
		$class = $data['class'];
		if (!isvarname($class)) {
			return false;
		}

		$common_attributes = array();
		$diy_attributes = array();
		OBJ::default_common_attributes($data, $common_attributes, $diy_attributes);
		$sql = DB::implode_field_value($common_attributes);
		
		// replace default object (if exist, update; if not exist, insert) (MySQL only)
		DB::query("REPLACE INTO common_object_default SET ".$sql);
		foreach($diy_attributes as $key => $value) {
			DB::query("REPLACE INTO common_attribute_default SET `class` = '$class', `name` = '$key', `value` = '$value' WHERE `class` = '$class' AND `name` = '$key'");
		}
	}
	
	function default_common_attributes(&$attributes, &$common_attributes, &$diy_attributes) {
		global $_G;
		
		foreach ($attributes as $key => $value) {
			if (in_array($key, $_G['default_common_attrnames'])) {
				$common_attributes[$key] = $value;				
			} else {
				$diy_attributes[$key] = $value;
			}
		}
	}
	
	// check whether a certain user has the privilege to do certain operation
	function check_priv($object_path = CURRENT_PATH, $opreation = PRIV_READ, $user = CURRENT_USER) {
		return check_priv($object_path, $opreation, $user);
	}
	
	// DEPRECATED
	// grant privileges on an object to a user / group
	function grant($object_path = '.', $user, $opreation = PRIV_ALL) {
	
	}
	
	// DEPRECATED
	// revoke privileges on an object from user / group
	function revoke($object_path = '.', $user, $opreation = PRIV_ALL) {
	
	}
	
	function get_list($action, $path) {
		$rs = DB::result_first("SELECT `$action` FROM common_object WHERE `path` = '$path'");
		if (empty($rs)) {
			return array();
		} else {
			return unserialize($rs);
		}
	}

	function set_list($action, $path, $list) {
		if (!is_array($list)) {
			$list = array($list);
		}
		$list = serialize($list);
		return DB::query("UPDATE common_object SET `$action` = '$list' WHERE `path` = '$path'");
	}

	function add_to_list($action, $path, $new) {
		$list = OBJ::get_list($action, $path);
		if (!in_array($new, $list)) {
			$list[] = $new;
		}
		return OBJ::set_list($action, $path, $list);
	}

	function remove_from_list($action, $path, $old) {
		$list = OBJ::get_list($action, $path);
		$count = count($list);
		for ($i=0; $i<$count; $i++) {
			if ($list[$i] == $old)  {
				unset($list[$i]);
				OBJ::set_list($action, $path, $list);
				return true;
			}
		}
		return false;
	}

	function get_listener($path = CURRENT_PATH) {
		if (substr($path, 0, 6) == '/user/') {
			return user::get_listener_list(substr($path, 6));
		} else {
			return OBJ::get_list('listener', $path);
		}
	}

	function get_listen($path = CURRENT_PATH) {
		if (substr($path, 0, 6) == '/user/') {
			return user::get_listen_list(substr($path, 6));
		} else {
			return OBJ::get_list('listen', $path);
		}
	}

	function add_listener($path = CURRENT_PATH, $listener) {
		
		if (substr($listener, 0, 6) == '/user/') {
			user::add_to_list('listen', substr($listener, 6), $path);
		} else {
			OBJ::add_to_list('listen', $listener, $path);
		}
		
		return OBJ::add_to_list('listener', $path, $listener);
	}

	function remove_listener($path = CURRENT_PATH, $listener) {

		if (substr($listener, 0, 6) == '/user/') {
			user::remove_from_list('listen', substr($listener, 6), $path);
		} else {
			OBJ::remove_from_list('listen', $listener, $path);
		}

		return OBJ::remove_from_list('listener', $path, $listener);
	}

	function getrealname($path = CURRENT_PATH) {
		if (substr($path, 0, 6) == '/user/') {
			return user::getrealname(substr($path, 6));
		} else {
			return OBJ::get_attr($path, 'title');
		}
	}

	function send_history($path, $user, $time) {
		$from = CURRENT_TIMESTAMP - $time;
		$objects = OBJ::find($path, 3, array('path'), "`create_time` > '$from'");
		foreach ($objects as $object) {
			OBJ::send_notify($object['path'], 'insert', $user);
		}
	}

	function send_notify($path, $event, $user) {
		$object = OBJ::get($path, array('title', 'class', 'author', 'author_name'));
		
		if ($object['class'] == 'message') {
			return; // messages are not to be notified
		}
		
		// if title is not available, fetch content instead
		if (empty($object['title'])) {
			$object['title'] = OBJ::get_attr($path, 'content');
		}
		
		//if ($object['author'] != CURRENT_USER) { // [[author]]发表了文章: [[title]]
			$msg = link2user($object['author'], $object['author_name']);
		//} else { // 我发表了文章: [[title]]
		//	$msg = '我';
		//}
		$msg .= OBJ::explain_class($object['class'], $event).': <a href="'.$path.'">'.$object['title'].'</a>';

		require_once libfile('class/message');
		message::send($msg, $path, $user);
	}

	function notify($path, $event) {
		$listeners = OBJ::get_list('listener', $path);
		foreach ($listeners as $listener) {
			OBJ::send_notify($path, $event, $listener);
		}

		if ($event == 'insert') { // insert is not listened by the new object itself
			$curr_path = OBJ::get_parent($path);
		} else {
			$curr_path = $path;
		}
		
		// recursively send notify to inherit listeners
		while ($curr_path != '/') {
			$listeners = OBJ::get_list('listener', $curr_path);
			foreach ($listeners as $listener) {
				OBJ::send_notify($path, $event, $listener); // note that the path is original, elsewise we would have used recursive call
			}
			
			// if not inherit, do not go to next loop
			$listener_inherit = OBJ::get_attr($curr_path, 'listener_inherit');
			if (empty($listener_inherit)) {
				break;
			}
			$curr_path = OBJ::get_parent($curr_path);
		}
	}

	function explain_class($class, $event) {
		static $actions = array(
			'default' => array(
				'select' => '访问了对象',
				'insert' => '插入了对象',
				'update' => '修改了对象',
				'delete' => '删除了对象',
				'poke' => '在内容中提到了你'
				),
			'article' => array(
				'select' => '阅读了文章',
				'insert' => '发表了文章',
				'update' => '修改了文章',
				'delete' => '删除了文章',
				'poke' => '在文章中提到了你'
				),
			'file' => array(
				'select' => '下载了文件',
				'insert' => '上传了文件',
				'update' => '修改了文件',
				'delete' => '删除了文件'
				),
			'portal' => array(
				'select' => '查看了主页',
				'insert' => '新建了主页',
				'update' => '更新了主页',
				'delete' => '删除了主页',
				'poke' => '在主页上提到了你'
				),
			'channel' => array(
				'select' => '阅读了频道',
				'insert' => '添加了频道',
				'update' => '更新了频道',
				'delete' => '删除了频道',
				'poke' => '在频道中提到了你'
				),
			'message' => array(
				'select' => '查看了消息',
				'insert' => '发送了消息',
				'update' => '修改了消息',
				'delete' => '删除了消息',
				'poke' => '在消息中提到了你'
				),
			'reply' => array(
				'select' => '查看了回复',
				'insert' => '发表了回复',
				'update' => '修改了回复',
				'delete' => '删除了回复',
				'poke' => '在回复中提到了你'
				)
			);
		if (isset($actions[$class][$event])) {
			return $actions[$class][$event];
		}
		$class_name = OBJ::class_name($class);
		$event_name = OBJ::event_name($event);
		if ($class_name != 'undefined' && $event_name != 'undefined') {
			return $event_name.'了'.$class_name; // this is a chinese hack
		}
		return 'undefined';
	}

	function class_name($class) {
		static $names = array(
			'default' => '默认',
			'article' => '文章',
			'channel' => '频道',
			'portal' => '主页',
			'blog' => '博客',
			'file' => '文件',
			'board' => '版块',
			'forum' => '论坛',
			'wiki' => '百科',
			'live' => '直播',
			'question' => '问答',
			'message' => '消息',
			'reply' => '回复'
			);
		return isset($names[$class]) ? $names[$class] : 'undefined';
	}

	function event_name($event) {
		return OBJ::action_name($event);
	}

	function action_name($action) {
		static $actions = array(
			'select' => '访问',
			'read' => '阅读',
			'update' => '修改',
			'delete' => '删除',
			'insert' => '插入',
			'poke' => '点名'
			);
		return isset($actions[$action]) ? $actions[$action] : 'undefined';
	}

	// ===== THE FOLLOWING FUNCTIONS ARE FOR STRING PROCESSING RELATED TO OBJECTS
	// Note that these functions are only string processors, they do not guarantee 
	//	the existence of the object referred to by path.

	// get parent of a given path.
	function get_parent($path) {
		$pos = strrpos($path, '/');
		if ($pos > 0)
			return substr($path, 0, $pos);
		else
			return '/';
	}
	
	// get absolute path from relative path
	function absolute_path($relative_path) {
		if (empty($relative_path)) {
			return CURRENT_PATH;
		}
		if ($relative_path[0] == '/') { // already absolute path
			return $relative_path;
		}
		$curr_path = CURRENT_PATH;
		$paths = explode('/', $relative_path);
		foreach ($paths as $path) {
			$path = trim($path);
			if ($path == '..') {
				$curr_path = OBJ::get_parent($curr_path);
			} elseif (isvarname($path)) {
				$curr_path .= '/'.$path;
			}
			// otherwise current path does not change
		}
		return $curr_path;
	}
	
	// ===== THE FOLLOWING FUNCTIONS ARE FOR INTERNAL USE ONLY =====
	
	// THIS FUNCTION SHOULD BE CALLED ONLY BY CLASS::EVENT
	function get_handlers(&$event_handlers) {
		global $db;
		$event_handlers = unserialize($db->fetch_first("SELECT event_handlers FROM common_object WHERE `path` = '".CURRENT_OBJECT."'"));
	}
	
	// THIS FUNCTION SHOULD BE CALLED ONLY BY CLASS::EVENT
	function set_handlers(&$event_handlers) {
		global $db;
		$db->query("UPDATE common_object SET `event_handlers` = ".serialize($event_handlers)." WHERE `path` = '".CURRENT_OBJECT."'");
	}
	
	// ===== BEGIN OF OBJECT CACHE =====
	// set or refresh object cache
	function cache_set($path, $object) {
		global $_OBJ;
		if (isset($_OBJ[$path])) {
			$_OBJ[$path] = array_merge($_OBJ[$path], $object);
		} else {
			$_OBJ[$path] = $object;
		}
	}
	
	// get the value of an attribute from object cache
	function cache_get($path, $attribute) {
		global $_OBJ;
		if (isset($_OBJ[$path][$attribute])) {
			return $_OBJ[$path][$attribute];
		}
		else return null;
	}
	
	// tell whether a path or attribute is cached
	function is_cached($path, $attribute = null) {
		global $_OBJ;
		return isset($_OBJ[$path]) && (empty($attribute) || isset($_OBJ[$path][$attribute]));
	}
	
	// delete an object in cache
	function cache_unset($path) {
		global $_OBJ;
		if (isset($_OBJ[$path])) {
			unset($_OBJ[$path]);
		}
	}
	// ===== END OF OBJECT CACHE =====
	
	// implode array into SQL columns expression
	function implode_attr($attributes) {
		if (empty($attributes)) { // all attributes
			return '*';
		}
		if (!is_array($attributes)) { // get one attribute: a simple string
			return '`'.$attributes.'`';
		}
		return '`'.implode($attributes, '`,`').'`'; // columns to use in SELECT
	}
	
	// implode associative array into SQL INSERT keys
	function implode_key($attributes) {
		$key = '';
		foreach ($attributes as $k => $v) {
			$key .= '`'.gaddslashes($k).'`,';
		}
		return substr($key,0,-1);
	}
	
	// implode associative array into SQL INSERT values
	function implode_value($attributes) {
		$value = '';
		foreach ($attributes as $k => $v) {
			$value .= '\''.gaddslashes($v).'\',';
		}
		return substr($value,0,-1);
	}
}
