<?php
// module/notice/insert.php 2011-08-24

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

$content = $_POST['content'];
if (empty($content)) {
	window::error('请填写内容！');
}
OBJ::insert();
