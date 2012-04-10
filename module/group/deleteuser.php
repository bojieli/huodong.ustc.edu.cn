<?php
// module/group/group_deleteuser.php 2011-08-10

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

$_GET['user'] = $_POST['user'];
if (isset($_GET['user'])) {
	if (!is_numeric($_GET['user'])) {
		window::error('用户ID必须是数字！');
	}
	if (!group::remove('member', $_GET['user'], CURRENT_PATH)) {
		window::error('用户不存在或您没有权限删除用户。');
	}
}
else {
	window::error('没有指定用户ID！');
}
redirect(CURRENT_PATH);
?>
