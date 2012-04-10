<?php
// module/default/removelisten.php 2011-08-24

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

$path = isset($_GET['path']) ? $_GET['path'] : CURRENT_PATH;

$status = OBJ::remove_listener($path, '/user/'.CURRENT_USER);
if ($status) {
	window::ok("已成功取消关注！");
} else {
	window::error("您还没有关注此内容！");
}
?>
