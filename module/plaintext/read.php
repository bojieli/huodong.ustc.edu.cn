<?php
// module/plaintext/read.php 2011-08-14

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

// the only instruction
echo OBJ::get_attr(CURRENT_USER, 'content');
?>
