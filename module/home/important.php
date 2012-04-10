<?php
// module/home/important.php 2011-08-14 boj

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require modulefile('common', 'header');

echo '<aside>';
require modulefile('home', 'nav');
echo '</aside>';

echo '<article>';
require modulefile('message', 'lib_read');
echo read_important();
echo '</article>';

require modulefile('common', 'footer');
?>
