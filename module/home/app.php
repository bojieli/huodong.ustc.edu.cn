<?php
// module/home/app.php 2011-08-13

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require_once modulefile('common', 'header');

echo '<aside>';
require modulefile('home', 'nav');
echo '</aside>';

echo '<article><h1>应用平台正在开发中</h1></article>';

require_once modulefile('common', 'footer');
?>
