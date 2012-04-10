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
<?php
$questions = OBJ::select(CURRENT_PATH, '', array('class' => 'question'));
if (empty($questions)) { ?>
<h1>还没有任何提问，赶快提问吧！</h1>
<?php } else { ?>
<ul class="board">
<?php foreach ($questions as $question) { ?>
<li><p class="title"><a href="<?=$question['author'] ?>"><?=$question['author_name'] ?></a>: <?=$question['title'] ?></p><p class="content"><?=$question['content'] ?></p>
<p class="info">提问于 <?=date("Y-m-d H:i:s", $question['create_time']) ?></p>
<?php $replies = OBJ::select($question['path'], '', array('class' => 'reply'));
if (!empty($replies)) { ?>
<ul class="reply">
<?php foreach ($replies as $reply) { ?>
<li><p class="info"><a href="<?=$reply['author'] ?>"><?=$reply['author_name'] ?></a> 回答于 <?=date("Y-m-d H:i:s", $reply['create_time']) ?></p><p class="content"><?=$reply['content'] ?></p></li>
<?php } //end foreach reply ?>
</ul>
<?php } //end if reply ?>
<form class="reply" action="<?=$question['path'] ?>?action=insert" method="post">
<textarea name="content" class="lighttext" style="width:400px;height:20px;" onfocus="this.style.width='400px';this.style.height='100px'; if(this.value=='在此输入你的回答'){this.value = '';this.style.color = '#333';}">在此输入你的回答</textarea>
<button type="submit">我来回答</button>
</form>
</li>
<?php } //end foreach question ?>
</ul>
<?php } //end else ?>
<div class="post">
<h2>提问</h2>
<form class="post" action="<?=CURRENT_PATH ?>?action=insert" method="post">
<table class="form">
<tr><th>问题</th><td><textarea name="title" rows="3" /></textarea></td></tr>
<tr><th>补充说明<br />(选填)</th><td><textarea name="content" rows="5"></textarea></td></tr>
<tr><td></td><td><button class="large" type="submit">我要提问</button></td></tr>
</table>
</form>
</div>
</article>
<?php
require modulefile('common', 'footer');
?>
