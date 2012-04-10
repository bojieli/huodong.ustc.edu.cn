<?php
// module/wenda/read.php

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require modulefile('portal', 'header');

echo '<aside>';
require modulefile('nav', 'read');
echo '</aside>';
?>
<article>
<p class="abstract"><?=OBJ::get_attr(CURRENT_PATH, 'abstract'); ?></p>
<?php
$posts = OBJ::select(CURRENT_PATH, '', array('class' => 'post'));
if (empty($posts)) { ?>
<h1>还没有任何帖子，赶快发帖吧！</h1>
<?php } else { ?>
<ul class="board">
<?php foreach ($posts as $post) { ?>
<li><p class="title"><a href="<?=$post['author'] ?>"><?=$post['author_name'] ?></a>: <?=$post['title'] ?></p>
<p class="content"><?=$post['content'] ?></p>
<p class="info">发表于 <?=date("Y-m-d H:i:s", $post['create_time']) ?></p>
<?php $replies = OBJ::select($post['path'], '', array('class' => 'reply'));
if (!empty($replies)) { ?>
<ul class="reply">
<?php foreach ($replies as $reply) { ?>
<li><p class="info"><a href="<?=$reply['author'] ?>"><?=$reply['author_name'] ?></a> 回复于 <?=date("Y-m-d H:i:s", $reply['create_time']) ?></p><p class="content"><?=$reply['content'] ?></p></li>
<?php } //end foreach reply ?>
</ul>
<?php } //end if reply ?>
<form class="reply" action="<?=$post['path'] ?>?action=insert" method="post">
<textarea name="content" class="lighttext" style="width:400px;height:20px;" onfocus="this.style.width='400px';this.style.height='100px'; if(this.value=='你想说些什么？'){this.value = '';this.style.color = '#333';}">你想说些什么？</textarea>
<button type="submit">立即回复</button>
</form>
</li>
<?php } //end foreach question ?>
</ul>
<?php } //end else ?>
<br />
<div class="post">
<h2>快速发帖</h2>
<form action="<?=CURRENT_PATH ?>?action=insert" method="post">
<table class="form">
<tr><td>标题</td><td><input name="title" style="width:500px" /></td>
<tr><td>内容</td><td><textarea name="content" style="width:500px;height:100px;"></textarea></td></tr>
<tr><td></td><td><button class="large" type="submit">发帖</button></td></tr>
<tr><td></td><td><a href="<?=CURRENT_PATH ?>?action=post">高级模式</a>&nbsp;&nbsp;可以输入带格式内容、上传图片附件等</td></tr>
</table>
</form>
</div>
</article>
<?php
require modulefile('common', 'footer');
?>
