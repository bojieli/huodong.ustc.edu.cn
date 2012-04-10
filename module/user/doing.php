<?php
// module/home/doing.php 2011-08-14 boj

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require_once modulefile('common', 'header');

echo '<aside>';
require modulefile('user', 'nav');
echo '</aside>';

echo '<article>';
require modulefile('user', 'message');
echo '</article>';

require modulefile('common', 'footer');
?>
