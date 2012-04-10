<?php
// module/message/delete.php 2011-08-09 boj

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require_once libfile('class/message');

if (empty($_GET['id'])) {
	// /message/id
	$_GET['id'] = substr(CURRENT_PATH, 9);
}
if (!is_numeric($_GET['id'])) {
	window::error('消息ID不合法！');
}

if (message::delete($_GET['id'])) {
	redirect('/home');
} else {
	window::error('删除失败，请检查是否有权限！');
}
?>
