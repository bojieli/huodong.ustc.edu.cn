<?php
// module/group/create.php

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

if (!defined('HEADER')) {
	$footer = true;
	require modulefile('common', 'header');
	echo '<aside>';
	require modulefile('user', 'nav');
	echo '</aside>';
	echo '<article>';
}
?>
<table class="form">
<form action="/?action=insert" method="post">
<input type="hidden" name="parent" value="/" />
<input type="hidden" name="class" value="portal" />
<tr><th>组织名称</th><td><input id="title" name="title" /></td><td class="comment">(今后可修改)</td></tr>
<tr><th>网址</th><td><?=$_SERVER['HTTP_HOST'] ?>/<input id="name" name="name" /></td><td class="comment">给组织一个好记的网址，便于宣传。<p>只能由字母、数字、下划线构成，首字母不能是数字。<span style="color:red">(仔细选取，今后不可修改，不能与已存在的组织重复)</span></td></tr>
<tr><th>组织简介</th><td><textarea id="abstract" name="abstract" rows="7" cols="30"></textarea></td><td class="comment">(150字以内)<br />组织简介会显示在很多重要地方，请认真填写，展现组织最吸引人的一面 (今后可修改)</td></tr>
<tr><th>权限设置</th><td><strong>会员</strong> <input type="checkbox" name="priv_member_read" checked="true" />读取内容&nbsp;&nbsp;<input type="checkbox" name="priv_member_write" />完全控制&nbsp;&nbsp;<input type="checkbox" name="priv_member_insert" checked="true" />发表内容<br /><strong>其他人</strong> <input type="checkbox" name="priv_guest_read" checked="true" />读取内容&nbsp;&nbsp;<input type="checkbox" name="priv_guest_write" />完全控制&nbsp;&nbsp;<input type="checkbox" name="priv_guest_insert" />添加内容</td><td class="comment">权限分为管理员组、成员组、其他人三种类别，每组有读（访问）、写（完全控制）、插入（添加内容）三种权限，可以分别设置。管理员拥有全部权限。</td></tr>
<tr><th>用户组权限</th><td><strong>会员</strong><input type="checkbox" name="group_member_read" checked="true" />读取成员列表&nbsp;&nbsp;<input type="checkbox" name="priv_member_write" />完全控制&nbsp;&nbsp;<input type="checkbox" name="priv_member_insert" checked="true" />添加新成员<br /><strong>其他人</strong> <input type="checkbox" name="priv_guest_read" checked="true" />读取成员列表&nbsp;&nbsp;<input type="checkbox" name="priv_guest_write" />完全控制&nbsp;&nbsp;<input type="checkbox" name="priv_guest_insert" />加入组织</td><td class="comment">权限分为管理员组、成员组、其他人三种类别，每组有读取成员列表、修改（完全控制）成员列表、添加新成员三种权限，可以分别设置。管理员拥有全部权限。</td></tr>
<tr><td></td><td><button class="large" type="submit">创建组织</td></td></tr>
</form>
</table>
<?php
if ($footer) {
	echo '</article>';
	require modulefile('common', 'footer');
}
?>
