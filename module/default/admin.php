<?php
// module/default/admin.php 2011-08-14

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require modulefile('common', 'header');

echo '<aside>';
require modulefile('default', 'nav');
echo '</aside>';

echo '<article>';

$admins = group::getlist('admin');
if (empty($admins)) {
	echo '<p>管理员列表为空</p>';
} else { ?>
<table class="ulist">
<?php
foreach ($admins as $admin) { ?>
<tr><td>ID: <?=$admin ?></td><td><?=user::getrealname($admin); ?></td><td><a href="<?=CURRENT_PATH ?>?action=setadmin&admin=false&user=<?=$admin ?>">删除管理员</a></td></tr>
<?php }
?>
</table>
<?php } ?>
<form action="<?=CURRENT_PATH ?>?action=setadmin&admin=true" method="post">
<button type="submit">添加管理员</button>&nbsp;&nbsp;(输入待添加的管理员ID)<input type="text" name="user" />
</form>
<?php
echo '</article>';

require modulefile('common', 'footer');
?>
