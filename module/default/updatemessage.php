<?php
// module/default/updatemessage.php 2011-08-09(v1) 2011-08-27(v2)

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

if (substr(CURRENT_PATH, 0, 6) == '/user/') {
	if (substr(CURRENT_PATH, 6) != CURRENT_USER) {
		window::error('您无权操作当前信息！');
	}
} else { // is a message sent to some object
	if (!group::check_priv(CURRENT_PATH, PRIV_WRITE)) {
		window::error('您无权操作当前信息！');
	}
}

require_once libfile('class/message');

$target = CURRENT_PATH;
$path = $_GET['msgpath'];
$found = message::message_exists($path, $target);
if (empty($found)) {
	window::error('消息ID不存在！');
}

if (isset($_GET['sticky'])) {
	message::set_sticky($path, $target, $_GET['sticky']);
}

if (isset($_GET['important'])) {
	message::set_important($path, $target, $_GET['important']);
}

redirect('/home');
?>
