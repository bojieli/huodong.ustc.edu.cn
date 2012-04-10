<?php
// module/message/delete.php 2011-08-09 boj

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require_once libfile('class/message');

if (empty($_GET['msgpath'])) {
	window::error('消息路径不合法！');
}

$status = message::delete($_GET['msgpath'], CURRENT_PATH));
switch ($status) {
	case FAILED: window::error('删除失败，消息不存在！');
	case NOT_ALLOWED: window::error('您没有权限执行删除操作！');
	case SUCCESS: redirect(CURRENT_PATH);
	default: window::error('内部错误！');
}
?>
