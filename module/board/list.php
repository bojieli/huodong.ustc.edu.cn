<?php
// module/board/list.php 2011-09-05

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require modulefile('common', 'header');

echo '<aside>';
require modulefile('default', 'nav');
echo '</aside>';

echo '<article>';
$attrs = array('path', 'author', 'create_time', 'next_child_id', 'insert_time', 'title');
$result = OBJ::select(CURRENT_PATH, $attrs, array('class' => 'post'), 'create_time DESC');

if (empty($result)) { ?>
<h1>还没有帖子！</h1>
<?php } else { ?>
<h1><?=OBJ::get_attr(CURRENT_PATH, 'title') ?> 帖子列表</h1>
<table class="list">
<tr><th>标题</th><th>作者</th><th>发表时间</th><th>回复数</th><th>最后回复</th><th>操作</th></tr>
<?php foreach ($result as $object) { ?>
<tr>
<td><a href="<?=$object['path']?>"><?=$object['title']?></a></td>
<td><?=link2user($object['author']) ?></td>
<td><?=date("Y-m-d H:i:s", $object['create_time']) ?></td>
<td><?=($object['next_child_id']-1) ?></td>
<td><?=date("Y-m-d H:i:s", $object['insert_time']) ?></td>
<td><a href="<?=$object['path']?>?action=modify">修改</a>&nbsp;<a href="<?=$object['path']?>?action=delete">删除</a></td>
</tr>
<?php } ?>
</table>
<?php } ?>
</article>
<?php
require modulefile('common', 'footer');
?>
