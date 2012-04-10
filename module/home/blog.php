<?php
// module/home/blog.php 2011-08-14 boj

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require modulefile('common', 'header');

echo '<aside>';
require modulefile('home', 'nav');
echo '</aside>';

echo '<article><h1>博客功能正在紧张开发中，敬请期待……</h1></article>';

require modulefile('common', 'footer');
?>
