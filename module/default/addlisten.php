<?php
// module/default/addlisten.php 2011-08-24

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

$path = isset($_GET['path']) ? $_GET['path'] : CURRENT_PATH;

$status = OBJ::add_listener($path, '/user/'.CURRENT_USER);
OBJ::send_history($path, '/user/'.CURRENT_USER, 7 * 86400); // send history in previous 7 days

if ($status) {
	window::ok("添加关注成功，现在将跳转到被关注页面...", $path);
} else {
	window::error("添加关注失败，请检查被关注内容是否存在");
}
?>
