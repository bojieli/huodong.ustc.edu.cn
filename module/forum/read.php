<?php
// module/forum/read.php

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require modulefile('common', 'header');

require modulefile('nav', 'read');

require modulefile('board', 'read');

require modulefile('common', 'footer');
?>
