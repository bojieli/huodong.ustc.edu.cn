<?php
// module/default/update.php 2011-08-13

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

$object = $_POST;
unset($object['event']);
unset($object['action']);

OBJ::update(CURRENT_PATH, $object);

redirect(CURRENT_PATH);

// the following is not comformant with RFC 2616
// header("HTTP/1.1 301 Moved Permanently\r\nLocation: ".CURRENT_PATH);

?>
