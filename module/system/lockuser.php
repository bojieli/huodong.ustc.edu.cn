<?php
// module/system/userlist.php 2011-08-15

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}
if (!group::isadmin(CURRENT_USER, '/')) {
	window::error('仅有网站开发团队才能访问此页面！');
}

$user = $_GET['user'];
if (!is_numeric($user)) {
	echo '用户ID不合法';
}

if ($_GET['lock'] == 'true') {
	DB::query("UPDATE common_user SET `status` = '-1' WHERE `uid` = '$user'");
	user::logout($user); // force logout
}
if ($_GET['lock'] == 'false') {
	DB::query("UPDATE common_user SET `status` = '0' WHERE `uid` = '$user'");
}
redirect('/system/userlist');
?>
