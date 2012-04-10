<?php
// module/group/init.php 2011-08-24

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

function init($path) {
	OBJ::insert($path, array('class' => 'wenda', 'name' => 'wenda', 'title' => '互动问答'));
	OBJ::insert($path, array('class' => 'channel', 'title' => '最新动态'));
	OBJ::insert($path, array('class' => 'board', 'title' => '内部讨论'));
}
?>
