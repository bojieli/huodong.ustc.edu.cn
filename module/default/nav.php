<?php
// module/default/nav.php 2011-08-13

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

$class = OBJ::get_attr(CURRENT_PATH, 'class');
$module = modulefile($class, 'nav');
if (@file_exists($module)) {
	require $module; // nav defined in specific class
} else {
// default nav
?>
<nav>
<ul><li><a href="<?=CURRENT_PATH ?>"><?=CURRENT_PATH ?></a></li>
<li><a href="<?=CURRENT_PATH ?>?action=list">列出内容</a></li>
<li><a href="<?=CURRENT_PATH ?>?action=find">查找内容</a></li>
<li><a href="<?=CURRENT_PATH ?>?action=modify">修改内容</a></li>
<li><a href="<?=CURRENT_PATH ?>?action=add">添加内容</a></li>
<li><a href="<?=CURRENT_PATH ?>?action=listener">粉丝列表</a></li>
<li><a href="<?=CURRENT_PATH ?>?action=admin">管理员组</a></li>
<li><a href="<?=CURRENT_PATH ?>?action=member">成员用户组</a></li>
</ul>
</nav>
<?php } ?>
