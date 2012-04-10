<?php
// module/user/login.php 2011-08-11

if (!isset($_POST['login_login_name']) || !isset($_POST['login_password'])) {
	window::error("请输入用户名和密码！");
}
$login_name = $_POST['login_login_name'];
$password = $_POST['login_password'];

$status = user::login($login_name, $password);
switch ($status) {
	case 1 : break;
	case USER_LOCKED:		window::error("您的帐号已被管理员锁定，请联系管理员！");
	case LOGIN_TOO_MANY_TIMES:	window::error("您错误登录的次数过多，请稍后再试！");
	case LOGIN_NAME_NOT_EXIST:	window::error("您要登录的用户名不存在！");
	case PASSWORD_INCORRECT:	window::error("密码错误！");
	default: window::error("未知错误，请尝试重新登录！");
}
redirect2home();
?>
