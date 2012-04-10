<?php
// module/home/group.php 2011-08-14

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require_once modulefile('common', 'header');

echo '<aside>';
require modulefile('user', 'nav');
echo '</aside>';

echo '<article><table class="list"><tr><th>组织名称</th><th>组织简介</th><th>加关注</th><th>加入组织</th></tr>';

$groups = OBJ::select_class('group');
foreach ($groups as $group) {
?>
<tr><td><a href="<?=$group['path'] ?>"><?=$group['title'] ?></a></td><td><?=$group['abstract'] ?></td><td><a href="<?=$group['path'] ?>?action=addlisten">加关注</a>&nbsp;&nbsp;<a href="<?=$group['path'] ?>?action=removelisten">取消关注</a></td><td><a href="<?=$group['path'] ?>?action=join">加入组织</a></td></tr>
<?php }
echo '</table><br />';
echo '<a class="large" href="/group/create">创建组织</a>';
echo '</article>';

require_once modulefile('common', 'footer');
?>
