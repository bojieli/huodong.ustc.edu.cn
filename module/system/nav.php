<?php
// module/system/nav.php 2011-08-13

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}
if (!group::isadmin(CURRENT_USER, '/')) {
	window::error('仅有网站开发团队才能访问此页面！');
}
?>
<nav>
<ul>
<li>用户管理
<ul><li><a href="/system/userlist">查看用户列表</a></li></ul>
<li>修改默认类<ul>
<?php 
$classes = OBJ::get_class_list();
foreach ($classes as $class) { 
	$class = $class['class'];
?>
<li><a href="/system?class=<?=$class ?>"><?=$class ?></a></li>
<?php } ?>
<li><a href="/system/add">添加默认类</a></li></ul>
</ul>
</nav>
