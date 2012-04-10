<?php
// module/home/addfriend_verify.php 2011-08-16

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require_once libfile('class/message');
$msg = message::getbyid($_GET['msgid']);
if (empty($msg)) {
	window::error("验证消息不存在！");
}
$user = substr($msg['source'], 6);
if (!is_numeric($user) || $user == 0) {
	window::error("这不是一条加好友的验证消息！");
}
$status = user::add_friend(CURRENT_USER, $user);
message::delete($_GET['msgid']);

switch ($status) {
	case USER_NOT_EXIST: 	window::error('此用户不存在！');
	case CANNOT_ADD_SELF_AS_FRIEND:	window::error('不能加自己为好友！');
	case HAVE_BEEN_FRIEND:	window::error('此用户已经是你的好友了！');
	default: redirect('/home/friend');
}
?>
