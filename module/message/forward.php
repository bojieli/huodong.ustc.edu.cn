<?php
// module/message/forward.php 2011-08-09 boj

// usage: <message>?action=forward&object_path=<object>

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require_once libfile('class/message');

if (empty($_GET['object_path'])) {
	window::error('消息ID不合法！');
}

if (CURRENT_USER > 0) { // is login
	$status = message::forwardtolistener(CURRENT_PATH, $_GET['object_path']);
	switch ($status) {
		case NOT_FOUND: window::error('消息不存在！');
		case NOT_ALLOWED: window::error('您没有权限执行转发操作！');
	}
	redirect($_GET['object_path']);
}
else {
	window::error('您还没有登录，请首先登录！');
}
?>
