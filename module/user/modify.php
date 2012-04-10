<?php
// module/user/modify.php 2011-08-13

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

function show_form() { 

$attrs = array('login_name', 'password', 'password_check', 'realname', 'student_id', 'grade', 'dept', 'class');
$names = array(
	'login_name' => '登录名',
	'password' => '密码',
	'password_check' => '确认密码',
	'realname' => '真实姓名',
	'student_id' => '学号',
	'grade' => '入学年份',
	'dept' => '所属院系',
	'class' => '所属班级'
	);
$comments = array(
	'login_name' => '登录时使用的名称，仅用于登录',
	'password' => '如不需修改无需填写',
	'password_check' => '如需要修改密码，请重复输入密码'
	);
$defaults = user::getinfo(CURRENT_USER);
$defaults['password'] = '';
$defaults['password_check'] = '';
foreach ($attrs as $attr) {
	if (!isset($defaults[$attr])) $defaults[$attr] = '';
	if (!isset($comments[$attr])) $comments[$attr] = '';
}

$attrss = array('tel', 'address', 'birthday', 'signature', 'profile', 'email', 'qq');
$namess = array(
	'tel' => '手机号',
	'address' => '科大住址',
	'birthday' => '生日',
	'signature' => '个性签名',
	'profile' => '个人简历',
	'email' => '电子邮件',
	'qq' => 'QQ号'
	);
$commentss = array();
$defaultss = user::getprofile(CURRENT_USER);
foreach ($attrss as $attr) {
	if (!isset($defaultss[$attr])) $defaultss[$attr] = '';
	if (!isset($commentss[$attr])) $commentss[$attr] = '';
}
?>
<script>
function check_input() {
	if (document.getElementById('password').value != document.getElementById('password_check').value) {
		alert('两次输入的密码不匹配！');
		return false;
	}
	if (document.getElementById('login_name').value == '') {
		alert('登录名不能为空！');
		return false;
	}
	if (document.getElementById('realname').value == '') {
		alert('不填写真实姓名，大家可就找不到你了～');
		return false;
	}
	return true;
}
</script>
<h1>填写个人信息</h1>
<p>社团报名的时候需要这些信息。如果现在没时间，以后再完善也来得及～
<form action="/user/update" onsubmit="return check_input();" method="post">
<h1>基本信息</h1>
<table class="form">
<?php	foreach ($attrs as $attr) { ?>
<tr><td><?=$names[$attr] ?></td><td><input type="<?=($attr == 'password' || $attr == 'password_check' ? 'password' : 'text') ?>" autocomplete="off" id="<?=$attr ?>" name="<?=$attr ?>" value="<?=$defaults[$attr] ?>" /></td><td class="comment"><?=$comments[$attr] ?></td></tr>
<?php	} ?>
</table>
<h1>详细信息</h1>
<table>
<?php	foreach ($attrss as $attr) { ?>
<tr><td><?=$namess[$attr] ?></td><td>
<?php if (in_array($attr, array('profile', 'signature'))) { ?>
<textarea id="<?=$attr ?>" name="<?=$attr ?>"><?=$defaultss[$attr] ?></textarea>
<?php } else { ?>
<input type="text" id="<?=$attr ?>" name="<?=$attr ?>" value="<?=$defaultss[$attr] ?>" /></td>
<?php } ?>
<td class="comment"><?=$commentss[$attr] ?></td></tr>
<?php	} ?>
<tr><td></td><td><button type="submit">提交更改</button></td></tr>
</table>
</form>
<?php } // end function show_form

require modulefile('common', 'header');

echo '<aside>';
require modulefile('user', 'nav');
echo '</aside>';

echo '<article>';
show_form();
echo '</article>';

require modulefile('common', 'footer');
?>
