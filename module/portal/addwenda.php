<?php
// module/default/addwenda.php 2011-09-25

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require modulefile('common', 'header');

echo '<aside>';
require modulefile('default', 'nav');
echo '</aside>';
?>
<article>
<h1>添加新问答版块</h1>
<form action="<?=CURRENT_PATH ?>?action=insert" method="post">
<input type="hidden" name="class" value="wenda" />
<input type="hidden" name="priv" value="755" />
<input type="hidden" name="priv_group" value="744" />
<table class="form">
<tr><th>版块名称</th><td><input type="text" name="title" /></td><td></td></tr>
<tr><th>路径</th><td><input type="text" name="name" /></td><td class="comment"><strong>一般不需要指定。</strong>若不指定，将自动分配路径。今后不可修改</td></tr>
<tr><th>版块简介</th><td colspan="2"><textarea rows="4" name="abstract"></textarea></td><td></td></tr>
<tr><td></td><td><button type="submit" class="large">添加版块</button></td></tr>
</table>
</form>
</article>
<?php
require modulefile('common', 'footer');
?>
