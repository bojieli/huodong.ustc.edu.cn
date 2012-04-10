<?php
// module/default/list.php 2011-08-15

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require modulefile('common', 'header');

echo '<aside>';
require modulefile('portal', 'nav');
echo '</aside>';

echo '<article>';
$attrs = array('path', 'author', 'author_name', 'class', 'title', 'content');
$result = OBJ::select(CURRENT_PATH, $attrs);

if (empty($result)) { ?>
<h1>还没有内容！</h1>
<?php } else { ?>
<h1><?=CURRENT_PATH ?>中的内容列表 (共<?=count($result) ?>个)</h1>
<table class="list">
<tr><th>路径</th><th>作者</th><th>类别</th><th>标题</th><th>内容</th><th>操作</th></tr>
<?php foreach ($result as $object) { ?>
<tr><td><a href="<?=$object['path']?>"><?=$object['path']?></a></td><td><a href="/user/<?=$object['author']?>"><?=$object['author_name']?></a></td><td><?=$object['class']?></td><td style="max-width: 80px;"><?=$object['title']?></td><td style="max-width:300px"><?=substr($object['content'], 0, 300) ?></td><td><a href="<?=$object['path']?>?action=modify">修改</a>&nbsp;<a href="<?=$object['path']?>?action=delete">删除</a></td></tr>
<?php } ?>
</table>
<?php } ?>
<p><a href="<?=CURRENT_PATH ?>?action=add" class="large">添加内容</a>
</article>
<?php
require modulefile('common', 'footer');
?>
