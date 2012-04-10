<?php
// module/message/insert.php 2011-08-25
// inserting message is different from other objects

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require_once libfile('class/message');

if (CURRENT_USER > 0) { // is login
	if (!empty($_POST['uploadattach'])) {
		$filename = OBJ::get_attr($_POST['uploadattach'], 'title');
		$_POST['content'] .= '<div class="attach"><a href="'.$_POST['uploadattach'].'">'.$filename.'</a></div>';
	}
	if (!empty($_POST['uploadphoto'])) {
		$path = $_POST['uploadphoto'];
		$_POST['content'] .= '<div class="photo"><img src="'.$path.'?action=thumb" onclick="this.src=\\\''.$path.'\\\';if (this.width <= 180) {this.width = 540; } else { if (this.height <= 360) { this.width = 180; } else { this.width = this.width * 120 / this.height; } }" /></div>';
	}
	
	if (empty($_POST['content'])) {
		window::error("请填写内容！");
	}
	$poke = parse_poke($_POST['content']);
	
	if (empty($_POST['source'])) {
		$_POST['source'] = CURRENT_PATH;
	}
	$_POST['sticky'] = empty($_POST['sticky']) ? 0 : 1;
	$_POST['important'] = empty($_POST['important']) ? 0 : 1;
	$_POST['auto_forward'] = empty($_POST['auto_forward']) ? 0 : 1;

	if (!empty($_POST['target'])) { // message specially sent is marked sticky
		if( !message::send($_POST['content'], $_POST['source'], $_POST['target'], CURRENT_PATH, $_POST['sticky'], $_POST['important'], $_POST['auto_forward'])) {
			window::error('发送消息未成功，请重新发送～');
		}
	}
	else { // is a message to every listener
		$listeners = OBJ::get_listener($_POST['source']);
		if (!empty($poke)) {
			$listeners = array_merge($listeners, $poke);
		}
		$listeners[] = CURRENT_USER; // send it to myself!!!
		$status = message::send($_POST['content'], $_POST['source'], $listeners, CURRENT_PATH, $_POST['sticky'], $_POST['important'], $_POST['auto_forward']);
		if (!$status) {
			window::error('发送消息未成功，请重新发送～');
		}
	}
		
	// publish to campus live board
	if (!empty($_POST['publish'])) {
		OBJ::insert('/ustclive', array('content' => $_POST['content'], 'class' => 'default'));
	}
	
	if (!empty($_POST['redirect'])) {
		redirect($_POST['redirect']);
	} else {
		redirect(CURRENT_PATH);
	}
}
else {
	window::error('您还没有登录，请首先登录！');
}
?>
