<?php
// module/default/listwenda.php 2011-09-25

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require modulefile('common', 'header');

echo '<aside>';
require modulefile('default', 'nav');
echo '</aside>';

echo '<article>';
$attrs = array('path', 'admin', 'order', 'title', 'content');
$result = OBJ::select(CURRENT_PATH, $attrs, array('class' => 'wenda'));

if (empty($result)) { ?>
<h1>还没有问答！</h1>
<?php } else { ?>
<h1><?=OBJ::get_attr(CURRENT_PATH, 'title') ?>互动问答：板块列表</h1>
<table class="list">
<tr><th>标题</th><th>路径</th><th>管理员</th><th>显示顺序</th><th>操作</th></tr>
<?php foreach ($result as $object) { ?>
<tr>
<th><?=$object['title']?></th>
<td><a href="<?=$object['path']?>"><?=$object['path']?></a></td>
<td><?php $admins = unserialize($object['admin']);
if (empty($admins)) { echo '无'; }
else foreach ($admins as $admin) { echo link2user($admin); } ?></td>
<td><?=$object['order']?></td>
<td><a href="<?=$object['path']?>?action=modify">修改</a>&nbsp;<a href="<?=$object['path']?>?action=delete">删除</a></td>
</tr>
<?php } ?>
</table>
<?php } ?>
<p><a href="<?=CURRENT_PATH ?>?action=addwenda" class="large">添加问答版块</a>
</article>
<?php
require modulefile('common', 'footer');
?>
