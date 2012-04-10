<?php
// module/default/find.php 2011-08-13

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require modulefile('common', 'header');

echo '<aside>';
require modulefile('default', 'nav');
echo '</aside>';

echo '<article>查找功能开发中</article>';

require modulefile('common', 'footer');
?>
