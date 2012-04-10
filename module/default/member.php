<?php
// module/default/member.php 2011-08-14

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require modulefile('common', 'header');

echo '<aside>';
require modulefile('default', 'nav');
echo '</aside>';

echo '<article>';

$members = group::getlist('member');

if (empty($members)) {
	echo '<p>用户组为空</p>';
} elseif ($members[0] == 'all') {
	echo '<p>用户组为全部用户</p>';
} else { ?>
<table class="ulist">
<?php
foreach ($members as $member) { ?>
<tr><td>ID: <?=$member ?></td><td><?=user::getrealname($member); ?></td><td><a href="<?=CURRENT_PATH ?>?action=deleteuser&user=<?=$member ?>">删除此用户</a></td><td><a href="<?=CURRENT_PATH ?>?action=setadmin&admin=true&user=<?=$member ?>">设为管理员</a></td></tr>
<?php }
?>
</table>
<?php } ?>
<form action="<?=CURRENT_PATH ?>?action=adduser" method="post">
<button type="submit">添加用户</button>&nbsp;&nbsp;(输入待添加的用户ID)<input type="text" name="user" />
</form>
<?php
echo '</article>';

require modulefile('common', 'footer');
?>
