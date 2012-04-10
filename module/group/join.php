<?php
// module/group/join.php

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require modulefile('common', 'header');

echo '<aside>';
require modulefile('nav', 'read');
echo '</aside>';
?>
<article>
<h2>我有邀请码</h2>
<form action="<?=CURRENT_PATH ?>?action=join_submit" method="post">
邀请码：<input type="text" name="invite" />&nbsp;&nbsp;<button action="submit">提交</button>
</form>
<hr />
<h2>我没有邀请码</h2>
<form action="<?=CURRENT_PATH ?>?action=join_submit" method="post">
<p>请简要陈述你加入此组织的原因，以便通过审核。
<p><textarea name="message" cols="50" rows="10"></textarea>
<p><button type="submit">提交</button>
</form>
</article>
<?php
require modulefile('common', 'footer');
?>
