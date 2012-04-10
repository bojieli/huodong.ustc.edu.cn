<?php
// module/group/setadmin.php 2011-08-10

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

if (!group::isadmin(CURRENT_USER)) {
	window::error("您不是管理员，无权对管理员组进行操作！");
}

$_GET['user'] = $_POST['user'];
if (!is_numeric($_GET['user'])) {
	window::error("用户ID必须是数字！");
}

if ($_GET['admin'] == 'true') {
	$user = $_GET['user'];
	if (!group::add('admin', $user, CURRENT_PATH)) {
		window::error("添加管理员失败，请重新操作～");
	}
}

elseif ($_GET['admin'] == 'false') {
	$user = $_GET['user'];
	if (!group::remove('admin', $user, CURRENT_PATH)) {
		window::error("删除管理员失败，请重新操作～");
	}
}

else window::error("内部错误：操作未定义");

redirect(CURRENT_PATH);
?>
