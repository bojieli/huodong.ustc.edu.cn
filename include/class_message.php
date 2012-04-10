<?php
// include/class_message.php 2011-08-08 boj
// common message management interface

// this class should NOT be created an instance

// new infrastructure of message: 2011-08-25
class message {
	
	function get($target, $from_time = 0, $to_time = CURRENT_TIMESTAMP, $start = 0, $num = INFINITY) {
		$sql = "SELECT * FROM common_object, common_inbox WHERE common_inbox.target = '$target' AND common_inbox.path = common_object.path";

		if ($from_time > 0) {
			$sql .= " AND common_object.create_time > '$from_time'";
		}
		if ($to_time < CURRENT_TIMESTAMP) {
			$sql .= " AND common_object.create_time <= '$to_time'";
		}
		
		$sql .= " ORDER BY common_object.create_time DESC";
		
		// cannnot fetch more than 100 messages...
		if ($num > 100) {
			$num = 100;
		}
		
		if ($start > 0 || $num < INFINITY) {
			$sql .= " LIMIT $start, $num";
		}
		
		return DB::fetch_all($sql);
	}
	
	function getbysource($source, $from_time = 0, $to_time = CURRENT_TIMESTAMP, $start = 0, $num = INFINITY) {
		$sql = "SELECT * FROM common_object WHERE `parent` = '$source' AND `class` = 'message'";

		if ($from_time > 0) {
			$sql .= " AND `time` > '$from_time'";
		}
		if ($to_time < CURRENT_TIMESTAMP) {
			$sql .= " AND `time` <= '$to_time'";
		}
		
		if ($start > 0 || $num < INFINITY) {
			$sql .= " LIMIT $start, $num";
		}
		return DB::fetch_all($sql);
	}
	
	// receiver can delete message in his/her inbox, but not the original message
	function delete($message_path, $target) {
		if (!check_priv($target, PRIV_WRITE)) {
			return NOT_ALLOWED;
		}
		return DB::query("DELETE FROM common_inbox WHERE `path` = '$message_path' AND `target` = '$target'") ? SUCCESS : FAILED;
	}

	function message_exists($message_path, $target) {
		return DB::result_first("SELECT COUNT(*) FROM common_inbox WHERE `path` = '$message_path' AND `target` = '$target'");
	}
	
	function set_sticky($message_path, $target, $sticky = false) {
		$sticky = $sticky ? 1 : 0;
		return DB::query("UPDATE common_inbox SET `sticky` = '$sticky' WHERE `path` = '$message_path' AND `target` = '$target'");
	}

	function set_important($message_path, $target, $important = true) {
		$important = $important ? 1 : 0;
		return DB::query("UPDATE common_inbox SET `important` = '$important' WHERE `path` = '$message_path' AND `target` = '$target'");
	}

	// send a message to all its listeners
	function sendtolistener($content, $source, $referer = CURRENT_OBJECT, $sticky = false, $important = false, $auto_forward = false) {		
		$listeners = OBJ::get_listener($source);
		$message_path = message::send($content, $source, $listeners, $referer, $sticky, $important);

		if ($auto_forward) {
			message::auto_forward($message_path, $listeners);
		}
		return $message_path;
	}

	// send message 
	function send($content, $source, $target, $referer = CURRENT_OBJECT, $sticky = false, $important = false, $auto_forward = false) {
		
		global $_G;
		// max message length
		if (strlen($content) > $_G['max_message_length']) {
			return false;
		}
		
		if (!is_array($target)) {
			$target = array($target);
		}

		// someone must have errorously missed the /user/ before uid
		while (list($index, $path) = each($target)) {
			if (is_numeric($path)) {
				$target[$index] = '/user/'.$path;
			}
		}

		$message_path = message::create($content, $source, $referer);
		message::deliver($message_path, $target, $sticky, $important);

		if ($auto_forward) {
			message::auto_forward($message_path, $target);
		}

		return $message_path; // return message path for further action
	}

	function auto_forward($message_path, $original_target) {
		foreach ($original_target as $target) {
			$listeners = OBJ::get_listener($target);
			message::forward($message_path, $listeners);
		}
	}
	
	// create a new message (insert a message object into source)
	// Note that creating a message does not imply that the message is sent. Should be used with function deliver.
	function create($content, $source, $referer) {
		return OBJ::insert($source, array('class' => 'message', 'content' => $content, 'referer' => $referer));
	}

	// deliver a message to inbox
	function deliver($message_path, $target, $sticky = false, $important = false) {
		if (!is_array($target)) {
			$target = array($target);
		}
		$sticky = $sticky ? 1 : 0;
		$important = $important ? 1 : 0;
		foreach ($target as $curr_target) {
			DB::query("INSERT INTO common_inbox (`target`, `path`, `sticky`, `important`) VALUES ('$curr_target', '$message_path', '$sticky', '$important')");
		}
	}

	// forward a message with some text added to it
	function forward($message_path, $target, $prefix = '', $referer = CURRENT_PATH) {
		$msg = OBJ::get($message_path);
		if (empty($msg)) {
			return NOT_FOUND;
		}
		$msg['source'] = OBJ::get_parent($msg['path']);
		if (empty($prefix)) {
			$prefix = '转发自'.OBJ::getrealname($msg['source']).': '; 
		}
		$msg['content'] = $prefix.$msg['content'];
		$msg['referer'] = $referer;
		$message_path = message::create($msg['content'], $msg['source'], $msg['referer']);
		message::deliver($message_path, $target);
		return $message_path;
	}

	function forwardtolistener($message_path, $object_path, $referer = CURRENT_PATH) {
		$target = OBJ::get_listener($object_path);
		return message::forward($message_path, $target, $referer);
	}
}

class message_old {
	
	function getbysource($source, $from_time = 0, $to_time = CURRENT_TIMESTAMP) {
		$sql = "SELECT * FROM common_message WHERE `source` = '$source'";

		if ($from_time > 0) {
			$sql .= " AND `time` > '$from_time'";
		}
		if ($to_time < CURRENT_TIMESTAMP) {
			$sql .= " AND `time` <= '$to_time'";
		}

		$sql .= ' ORDER BY `id` DESC';
		return DB::fetch_all($sql);
	}

	function getbytarget($target, $from_time = 0, $to_time = CURRENT_TIMESTAMP) {
		$sql = "SELECT * FROM common_message, common_message_inbox WHERE common_message_inbox.path = '$target' AND common_message_inbox.msgid = common_message.id";

		if ($from_time > 0) {
			$sql .= " AND common_message.time > '$from_time'";
		}
		if ($to_time < CURRENT_TIMESTAMP) {
			$sql .= " AND common_message.time <= '$to_time'";
		}
		
		$sql .= " ORDER BY common_message.id DESC";
		return DB::fetch_all($sql);
	}
	
	function getbyreferer($referer) {
		$sql = "SELECT * FROM common_message WHERE `referer` = '$referer' ORDER BY `id` DESC";
		return DB::fetch_all($sql);
	}

	// should be used by admin only
	function getbytime($from_time = 0, $to_time = CURRENT_TIMESTAMP) {
		$sql = "SELECT * FROM common_message WHERE `time` > '$from_time' AND `time` < '$to_time' ORDER BY `id` DESC";
		return DB::fetch_all($sql);
	}
	
	/* DEPRECATED
	function get($source, $target, $from_time = 0, $to_time = CURRENT_TIMESTAMP) {

		if ($source == 'all') {
			$sql = "SELECT * FROM common_message WHERE 1 ";
		} else {
			$sql = "SELECT * FROM common_message WHERE `source` = '$source' ";
		}
		if ($target != 'all') {
			$sql .= " AND `target` = '$target'";
		}

		if ($from_time > 0) {
			$sql .= " AND `time` > $from_time";
		}
		if ($to_time < CURRENT_TIMESTAMP) {
			$sql .= " AND `time` <= $to_time";
		}

		$sql .= " ORDER BY `id` DESC";
		return DB::fetch_all($sql);
	}*/
	
	// only sender can modify message content
	function update($msgid, $content) {
		$message = DB::fetch_first("SELECT source FROM common_message WHERE `id` = '$msgid'");
		if (empty($message)) {
			return NOT_FOUND;
		}
		if (!check_priv($message['source'], PRIV_WRITE)) {
			return NOT_ALLOWED;
		}
		$sql = "UPDATE common_message SET `content` = '$content' WHERE `id` = '$msgid'";
		return DB::query($sql) ? SUCCESS : FAILED;
	}
	
	/* DEPRECATED
	function update($id, $content, $source, $target, $path = CURRENT_OBJECT, $sticky = false, $important = false, $auto_forward = false, $system = false) {
		$msg = DB::fetch_first("SELECT source, target FROM common_message WHERE `id` = '$id'");
		if ($msg['source'] == '/user/'.CURRENT_USER || $msg['target'] == '/user/'.CURRENT_USER) {
			return DB::query(message::msg2sql($id, $content, $source, $target, $path, $sticky, $important, $auto_forward, $system));
		} else {
			return false;
		}
	}*/
	
	// only sender can delete message
	function delete($msgid) {
		$message = DB::fetch_first("SELECT source FROM common_message WHERE `id` = '$msgid'");
		if (!check_priv($message['source'], PRIV_WRITE)) {
			return NOT_ALLOWED;
		}
		DB::query("DELETE FROM common_message_inbox WHERE `msgid` = '$msgid'");
		return DB::query("DELETE FROM common_message WHERE `id` = '$msgid'") ? SUCCESS : FAILED;
	}

	// receiver can delete message in his/her inbox, but not the original message
	function delete_inbox($path, $msgid) {
		if (!check_priv($path, PRIV_WRITE)) {
			return NOT_ALLOWED;
		}
		return DB::query("DELETE FROM common_message_inbox WHERE `msgid` = '$msgid' AND `path` = '$path'") ? SUCCESS : FAILED;
	}

	/* DEPRECATED
	function delete($id) {
		$msg = DB::fetch_first("SELECT source, target FROM common_message WHERE `id` = '$id'");
		if ($msg['source'] == '/user/'.CURRENT_USER || $msg['target'] == '/user/'.CURRENT_USER) {
			return DB::query("DELETE FROM common_message WHERE `id` = '$id'");
		} else {
			return false;
		}
	}
	*/

	function sendtolistener($content, $source, $referer = CURRENT_OBJECT, $sticky = false, $important = false, $auto_forward = false) {		
		$listeners = OBJ::get_listener($source);
		$msgid = message::send($content, $source, $listeners, $referer, $sticky, $important);

		if ($auto_forward) {
			message::auto_forward($msgid, $listeners);
		}
		return $msgid;
	}

	function send($content, $source, $target, $referer = CURRENT_OBJECT, $sticky = false, $important = false, $auto_forward = false) {
		
		global $_G;
		// max message length
		if (strlen($content) > $_G['max_message_length']) {
			return false;
		}
		
		$msgid = message::create($content, $source, $referer);
		message::deliver($msgid, $target, $sticky, $important);

		if ($auto_forward) {
			message::auto_forward($msgid, $target);
		}

		return $msgid; // return message id for further action
	}

	function auto_forward($msgid, $original_target) {
		foreach ($original_target as $target) {
			$listeners = OBJ::get_listener($target);
			message::forward($msgid, $listeners);
		}
	}

	/* DEPRECATED
	function send($content, $source, $target, $path = CURRENT_OBJECT, $sticky = false, $important = false, $auto_forward = false, $system = false) {
		
		global $_G;
		// max message length
		if (strlen($content) > $_G['max_message_length']) {
			return false;
		}
		
		if (!DB::query(message::msg2sql('insert', $content, $source, $target, $path, $sticky, $important, $auto_forward, $system))) {
			return false;
		}
		
		if ($auto_forward) {
			// form of user target: /user/10000
			$user = substr($target, 6);
			if (!forward($content, $user, $path, $source)) {
				return false;
			}
		}

		return DB::insert_id(); // return message id for further action
	}*/

	// create a new message
	// Note that creating a message does not imply that the message is sent. Should be used with function deliver.
	function create($content, $source, $referer) {
		DB::query("INSERT INTO common_message SET `content` = '$content', `source` = '$source', `referer` = '$referer'");
		return DB::insert_id();
	}

	/* DEPRECATED
	function msg2sql($action, $content, $source, $target, $referer = CURRENT_OBJECT, $sticky = false, $important = false, $auto_forward = false) {
		$content = censor($content);
		
		if (substr($source, 0, 5) == '/user') {
			$user = substr($source, 6);
			$source_name = user::getrealname($user);
		} else {
			$source_name = OBJ::get_attr($source, 'name');
		}
		
		$sticky = $sticky ? 1 : 0;
		$important = $important ? 1 : 0;
		
		if ($action == 'insert') {
			$sql = "INSERT INTO common_message (`source`, `source_name`, `target`, `referer`, `time`, `content`, `sticky`, `important`, `system`) VALUES ('$source', '$source_name', '$target', '$referer', '".CURRENT_TIMESTAMP."', '$content', '$sticky', '$important', '$system')";
		} else { // action = id
			$sql = "UPDATE common_message SET `source` = '$source', `source_name` = '$source_name', `target` = '$target', `referer` = '$referer', `time` = '".CURRENT_TIMESTAMP."', `content` = '$content', `sticky` = '$sticky', `important` = '$important', `system` = '$system' WHERE `id` = '$action'";
		}
		
		return $sql;
	}*/
	
	// deliver a message to inbox
	function deliver($msgid, $target, $sticky = false, $important = false) {
		if (!is_array($target)) {
			$target = array($target);
		}
		$sticky = $sticky ? 1 : 0;
		$important = $important ? 1 : 0;
		foreach ($target as $path) {
			DB::query("INSERT INTO common_message_inbox SET (`msgid`, `path`, `sticky`, `important`) VALUES ('$msgid', '$path', '$sticky', '$important')");
		}
	}

	// forward a message with some text added to it
	function forward($msgid, $target, $prefix = '', $referer = CURRENT_PATH) {
		$msg = message::getbyid($msgid);
		if (empty($msg)) {
			return NOT_FOUND;
		}
		if (empty($prefix)) {
			$prefix = '转发自'.OBJ::getrealname($msg['source']).': '; 
		}
		$msg['content'] = $prefix.$msg['content'];
		$msg['referer'] = $referer;
		$msgid = message::create($msg['content'], $msg['source'], $msg['referer']);
		message::deliver($msgid, $target);
		return $msgid;
	}

	/* DEPRECATED
	function forward($msgid, $target) {
		if (empty($source)) {
			$source = '/user/'.CURRENT_USER;
		}
		if (is_numeric($user)) {
			if (is_numeric(substr($source, 6))) {
				$source = user::getrealname(substr($source, 6));
			}
			$content = '转发自'.$source.': '.$content;
			$friends = user::get_listener_list($user);
			$friends[] = $user;
			foreach ($friends as $friend) {
				// Forward from SOMEBODY: ORIGINAL_CONTENT
				message::send($content, '/user/'.$user, '/user/'.$friend, $path, false, false, false, false);
				// forwarded messages are not allowed to be sticky, important or auto_forward.
			}
		}
		return true;
	}*/

	/* DEPRECATED
	function get_reply($path) {
		
		$sql = "SELECT author, author_name, content FROM common_object WHERE `parent` = '$path'";
		$replies = DB::fetch_all($sql);
		return $replies;
	}*/
	
	function getbyid($id) {
		return DB::fetch_first("SELECT * FROM common_message WHERE `id` = '$id'");
	}
	
	function get_important($target) {
		return DB::fetch_all("SELECT * FROM common_message, common_message_inbox WHERE common_message_inbox.target = '$target' AND common_message_inbox.important = '1' AND common_message.id = common_message_inbox.msgid");
	}
}
?>
