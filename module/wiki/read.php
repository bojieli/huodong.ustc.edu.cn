<?php
// module/wiki/read.php

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require modulefile('common', 'header');

echo '<aside>';
require modulefile('nav', 'read');
echo '</aside>';

echo '<article>';
echo 'NOT IMPLEMENTED';
echo '</article>';

require modulefile('common', 'footer');
?>
