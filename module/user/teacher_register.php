<?php
// module/user/teacher_register.php 2011-09-25

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require_once modulefile('common', 'header');
?>
<script>
function $(a) {
	return document.getElementById(a);
}

function register_check() {
	if (document.getElementById('login_name').value == '') {
		alert("请填写登录名！");
		return false;
	} else if (document.getElementById('password').value == '') {
		alert("请填写密码！");
		return false;
	} else if (document.getElementById('password').value != document.getElementById('password_check').value) {
		alert("两次输入的密码不匹配！");
		return false;
	} else if (document.getElementById('realname').value == '') {
		alert("请填写真实姓名！");
		return false;
	} else if (document.getElementById('dept').value == '') {
		alert("请选择院系！");
		return false;
	} else if ($('email').value == '') {
		alert("请填写邮件地址！");
		return false;
	}
	return true;
}
</script>
<article>
<h1>教师注册专用入口</h1>
<form class="large" action="/user/register" onsubmit="return register_check();" method="post">
<table>
<tr><td>登录名</td><td><input type="text" id="login_name" name="login_name" /></td><td class="comment">任何您方便记住的（昵称，QQ号，手机号，学号，Email地址……）仅用于登录，以后可以修改</td></tr>
<tr><td>真实姓名</td><td><input type="text" id="realname" name="realname" /></td><td class="comment">本网站实行实名制，请填写真实姓名</td></tr>
<tr><td>密码</td><td><input type="password" id="password" name="password" /></td><td class="comment">请填写密码</td></tr>
<tr><td>确认密码</td><td><input type="password" id="password_check" name="password_check" /></td><td class="comment">请再次填写密码</td></tr>
<input name="type" type="hidden" value="teacher" />
<tr><td>院系</td><td>
<select id="dept" name="dept"><option value="">请选择院系</option><?php require 'static/deptlist' ?></select></td><td class="comment">请选择您所在的院系</td></tr>
<tr><td>E-mail</td><td><input type="text" id="email" name="email" /></td><td>@ustc.edu.cn</td>
<input name="email_source" type="hidden" value="ustc.edu.cn"></tr>
<tr><td></td><td><button type="submit">立即注册</button></td><td></td></tr>
</table>

</article>
<?php
require_once modulefile('common', 'footer');
?>
