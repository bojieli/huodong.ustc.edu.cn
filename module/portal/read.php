<?php
// module/portal/read.php 2011-08-16

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require modulefile('portal', 'header');

echo '<aside>';
require modulefile('nav', 'read');
echo '</aside>';

echo '<article>';
require modulefile('portal', 'block');
echo '</article>';

require modulefile('common', 'footer');
?>
