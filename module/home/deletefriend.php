<?php
// module/home/deletefriend.php 2011-08-15

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

if (empty($_GET['user'])) {
	$_GET['user'] = $_POST['user'];
}
$status = user::remove_listen(CURRENT_USER, $_GET['user']);
switch ($status) {
	case USER_NOT_EXIST: window::error('此用户不存在！');
	case NOT_HAVE_BEEN_FRIEND: window::error('此用户还不是你的好友，何来删除？');
	default: redirect('/home/friend');
}

redirect('/home/friend');
?>
