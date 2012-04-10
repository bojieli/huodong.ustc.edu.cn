<?php
// module/file/read.php 2011-08-18

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require_once libfile('class/upload');

upload::down(CURRENT_PATH);
?>
