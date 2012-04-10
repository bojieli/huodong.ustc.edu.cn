<?php
// module/root/read.php

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

if (CURRENT_USER > 0) { // is login
	redirect2home();
}

require modulefile('common', 'header');
?>
<script>
function $(a) {
	return document.getElementById(a);
}

function login_check() {
	if (document.getElementById('login_login_name').value == '') {
		alert("请填写登录名！");
		return false;
	} else if (document.getElementById('login_password').value == '') {
		alert("请填写密码！");
		return false;
	}
	return true;
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
	} else if (document.getElementById('grade').value == '') {
		alert("请选择年级！");
		return false;
	} else if (document.getElementById('dept').value == '') {
		alert("请选择院系！");
		return false;
	} else if (document.getElementById('class').value == '') {
		alert("请选择班级！");
		return false;
	} else if ($('email').value == '') {
		alert("请填写邮件地址！");
		return false;
	}
	return true;
}
</script>
<aside style="background:#E4F7FA;">
<form class="login" action="/user/login" onsubmit="return login_check();" method="post">
<table>
<tr><td>登录名</td><td><input type="text" id="login_login_name" name="login_login_name" /></td></tr>
<tr><td>密码</td><td><input type="password" id="login_password" name="login_password" /></td></tr>
<tr><td></td><td><button type="submit">登录</button></td></tr>
</table>
</form>
</aside>
<article>
<h1>格物网 - 科大生活从这里启航</h1>
<h2>网站建设中，期待更多精彩……</h2>
<ul class="small" style="padding-left:20px"><li>加入班级，熟悉同学，班级动态天天见，再也不会错过班级活动，快要考试了也会提醒你～
<li>加入社团，参与活动，社团信息一站通，再也不用群发短信，让组织内部的动态和想法尽情流通吧～
<li>科大有哪些知名校友？传说中的六教在哪里？什么时候有校车？校园百科期待大家共同完善～
<li>学术，英语，出国，找不到资料、找不到知音？网络可是最快捷的工具！
<li>想对TA说句悄悄话？怎样在发帖时输入数学公式？还有更多有趣小应用等你发掘哦～
</ul>
<hr />
<form class="large" action="/user/register" onsubmit="return register_check();" method="post">
<table>
<tr><td>登录名</td><td><input type="text" id="login_name" name="login_name" /></td><td class="comment">任何你方便记住的（昵称，QQ号，手机号，学号，Email地址……）仅用于登录，以后可以修改</td></tr>
<tr><td>真实姓名</td><td><input type="text" id="realname" name="realname" /></td><td class="comment">填写真实姓名，大家才能在班级和社团中找到你哦～</td></tr>
<tr><td>密码</td><td><input type="password" id="password" name="password" /></td><td class="comment">请填写密码</td></tr>
<tr><td>确认密码</td><td><input type="password" id="password_check" name="password_check" /></td><td class="comment">请再次填写密码</td></tr>
<tr><td>院系</td><td>
<select id="dept" name="dept"><option value="">请选择院系</option><?php require 'static/deptlist' ?></select></td><td class="comment">请选择你所在的系别与班级</td></tr>
<tr><td>班级</td><td>
<select id="type" name="type"><option value="PB">本科生</option><option value="SA">研究生</option><option value="BA">博士</option></select>&nbsp;&nbsp;&nbsp;
<select id="grade" name="grade"><option value="2011">2011级</option><option value="2010">2010级</option><option value="2009">2009级</option><option value="2008">2008级</option><option value="2007">2007级</option><option value="2006">2006级</option><option value="2005">2005级</option></select>&nbsp;&nbsp;&nbsp;
<select id="class" name="class"><option value="1">1班</option><option value="2">2班</option><option value="3">3班</option><option value="4">4班</option><option value="5">5班</option><option value="6">6班</option><option value="shaonianban">少年班</option><option value="chuangxinban">创新班</option></select></td><td class="comment">如果系里只有一个班，就选1班吧～</td></tr>
<tr><td>E-mail</td><td><input type="text" id="email" name="email" /></td><td>@mail.ustc.edu.cn</td>
<input name="email_source" type="hidden" value="mail.ustc.edu.cn">
</tr>
<tr><td></td><td><button type="submit">立即注册</button></td><td></td></tr>
</table>
</form>
<br /><p><a class="large button" href="/user/teacher_register">教师注册专用入口</a>
</article>
<?php
require modulefile('common', 'footer');
?>
