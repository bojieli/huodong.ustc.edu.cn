<?php
// module/group/group_nav.php 2011-08-10

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

$members = group::getlist('member');
if (!is_array($members)) {
	window::error("对不起，您没有权限读取该组织的成员列表！");
}

echo '<p>组织成员列表</p>';
echo '<a href="'.CURRENT_PATH.'?action=adduser&prompt=true" class="button">添加新成员</a>';
echo '<ul>';
foreach ($members as $member) {
	$name = user::getrealname($member);
	echo '<li>'.link2user($member, $name);
	if (defined('IS_ADMIN')) {
		echo '&nbsp;<a href="'.CURRENT_PATH.'?action=deleteuser">从组织中删除此用户</a>';
		if (!group::isadmin($member)) {
			echo '&nbsp;<a href="'.CURRENT_PATH.'?action=setadmin&admin=true&user='.$member.'">设为管理员</a>';
		} else {
			echo '&nbsp;<a href="'.CURRENT_PATH.'?action=setadmin&admin=false&user='.$member.'">删除管理员</a>';
		}
	}
	echo '</li>';
}
echo '</ul>'."\n";
?>
