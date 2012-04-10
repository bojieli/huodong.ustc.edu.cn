<?php
// module/notice/post.php 2011-08-24

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require modulefile('common', 'header');
echo '<aside>';
require modulefile('nav', 'read');
echo '</aside>';
echo '<article>';
?>
<form action="<?=CURRENT_PATH ?>?action=insert" method="post">
通知内容：<input type="text" name="content" /><br />
<input type="checkbox" name="sticky" />在关注者的个人中心自动置顶
</form>
<?php
echo '</article>';
require modulefile('common', 'footer');
?>
