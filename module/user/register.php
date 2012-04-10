<?php
// module/user/register.php

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

if ($_POST['password'] != $_POST['password_check']) {
	window::error("两次输入的密码不匹配！");
	exit();
}

$profile = $_POST;
$profile['email'] = $_POST['email'].$_POST['email_source'];
$profile['school'] = 'ustc';
if (empty($profile['login_name']) || empty($profile['password'])) {
	window::error("信息不完整，请重新填写！");
}
$status = user::add($profile);

if ($status == 1) {
	redirect('/user/firstlogin');
} elseif ($status == LOGIN_NAME_EXISTS) {
	window::error("您指定的登录名已经被占用，请换一个～");
} else {
	window::error("填写的信息不正确，请返回重新填写");
}
?>
