<?php
// module/system/update.php 2011-08-13

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

if (!group::isadmin(CURRENT_USER, '/')) {
	window::error('仅有网站开发团队才能访问此页面！');
}

$data = $_POST;
OBJ::update_default($data);
redirect('/system');
?>
