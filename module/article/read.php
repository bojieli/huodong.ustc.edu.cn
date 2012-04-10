<?php
// module/article/read.php 2011-08-09 boj

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

if (!defined('HEADER')) {
	require modulefile('portal', 'header');
	echo '<aside>';
	require modulefile('nav', 'read');
	echo '</aside>';
	echo '<article>';
	$flag = 1;
}	

function read_reply($path) {
	$replies = OBJ::select($path, array('author', 'author_name', 'content'), array('class' => 'reply'));
	foreach ($replies as $reply) {
		// <div class="reply"><a href="/user/10000">AUTHOR_NAME</a>: CONTENT</div>
		echo '<div class="reply"><a href="/user/'.$reply['author'].'">'.$reply['author_name'].'</a>: '.$reply['content'].'</div>'."\n";
	}
}

// self call
article_read(CURRENT_PATH);

// should call this
function article_read($path = CURRENT_PATH) {

$object = OBJ::get($path);
?>
<div class="article">
<div class="title"><?=$object['title'] ?></div>
<div class="desc">作者：<a href="/user/<?=$object['author'] ?>"><?=$object['author_name'] ?></a>&nbsp;发表时间：<?=date("Y-m-d H:i:s", $object['create_time']) ?></div>
<div class="content"><?=$object['content'] ?></div>
<?php read_reply($path); ?>
<div class="post">
<h2>快速回复</h2>
<form action="<?=CURRENT_PATH ?>?action=insert" method="post">
<p><textarea name="content" style="width:500px;height:100px;"></textarea>
<p><button class="large" type="submit">回复</button>
<p><a href="<?=CURRENT_PATH ?>?action=post">高级模式</a>&nbsp;&nbsp;可以输入带格式内容、上传图片附件等
</form>
</div>
</div>
<?php }
if ($flag) {
	echo '</article>';
	require modulefile('common', 'footer');
}
?>
