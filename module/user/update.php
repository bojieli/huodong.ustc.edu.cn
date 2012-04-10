<?php
// module/user/update.php 2011-08-12
// update user profile

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

$data = $_POST;
$status = user::update(CURRENT_USER, $data);
switch ($status) {
	case 1: redirect('/user/modify');
	case LOGIN_NAME_EXISTS: window::error('此登录名已经被占用，请换一个～');
	case USER_NOT_EXIST: window::error('您还没有登录，请先登录！');
	default: window::error('您填写的信息存在问题，请返回重新填写！');
}
?>
