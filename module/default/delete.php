<?php
if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

OBJ::delete(CURRENT_PATH);

redirect(OBJ::get_parent(CURRENT_PATH));
?>

