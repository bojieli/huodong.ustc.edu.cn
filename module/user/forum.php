<?php
// module/home/forum.php 2011-08-14

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require_once modulefile('common', 'header');

echo '<aside>';
require modulefile('user', 'nav');
echo '</aside>';

echo '<article><table><tr><th>论坛名称</th><th>论坛简介</th><th>加关注</th></tr>';

$groups = OBJ::select_class('portal');
foreach ($groups as $group) {
?>
<tr><td><a href="<?=$group['path'] ?>"><?=$group['title'] ?></a></td><td><?=$group['abstract'] ?></td><td><a href="<?=$group['path'] ?>?action=addlisten">加关注</a>&nbsp;&nbsp;<a href="<?=$group['path'] ?>?action=removelisten">取消关注</a></td></tr>
<?php }
echo '</table></article>';

require_once modulefile('common', 'footer');
?>
