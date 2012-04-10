<?php
// module/default/nav.php 2011-08-13

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}
?>
<nav>
<ul><li><a href="<?=CURRENT_PATH ?>"><?=OBJ::get_attr(CURRENT_PATH, 'title') ?></a></li>
<li><a href="<?=CURRENT_PATH ?>?action=list">帖子列表</a></li>
<li><a href="<?=CURRENT_PATH ?>?action=find">查找帖子</a></li>
<li><a href="<?=CURRENT_PATH ?>?action=modify">版块设置</a></li>
<li><a href="<?=CURRENT_PATH ?>?action=listener">粉丝列表</a></li>
<li><a href="<?=CURRENT_PATH ?>?action=admin">管理员组</a></li>
<li><a href="<?=CURRENT_PATH ?>?action=member">成员用户组</a></li>
</ul>
</nav>
