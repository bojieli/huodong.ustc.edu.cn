<?php
// module/channel/read.php 2011-08-18

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require modulefile('portal', 'header');
echo '<aside>';
require modulefile('nav', 'read');
echo '</aside>';

$title = OBJ::get_attr(CURRENT_OBJECT, 'title');
echo '<article><h1 class="title">'.$title.'</h1>';
if (check_priv(CURRENT_PATH, PRIV_INSERT)) {
	echo '<p><a href="'.CURRENT_PATH.'?action=post"><button class="large">发表文章</button></a></p>';
}
$articles = OBJ::select(CURRENT_OBJECT, array('name', 'path', 'title', 'author', 'author_name', 'create_time'), array('class' => 'article'), '`order` DESC, `create_time` DESC');
if (empty($articles)) {
	echo '<br /><h2>该栏目目前还没有文章！</h2><br />';
} else {
echo '<table class="list"><tr><th></th><th>标题</th><th>作者</th><th>发表时间</th></tr>';
foreach ($articles as $article) { ?>
<tr><td class="id"></td><td class="title"><a href="<?=$article['path'] ?>"><?=$article['title'] ?></a></td><td class="author"><?=link2user($article['author'], $article['author_name']) ?></td><td class="time"><?=date("Y-m-d H:i:s", $article['create_time']) ?></td></tr>
<?php }
echo '</table>';
} // end else
echo '</article>';

require modulefile('common', 'footer');
?>
