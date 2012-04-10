<?php
// module/message/update.php 2011-08-09 boj

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

$pos = strrstr(CURRENT_PATH, '/');
$message_id = substr(CURRENT_PATH, $pos+1);

if (!is_numeric($message_id)) {
	window::error('消息ID不合法！');
}

$target = DB::result_first("SELECT target FROM common_message WHERE `id` = '$message_id'");
if (empty($target)) {
	window::error('消息ID不存在！');
}

if (substr($target, 0, 6) == '/user/') {
	if (substr($target, 6) != CURRENT_USER) {
		window::error('您无权操作当前信息！');
	}
} else { // is a message sent to some object
	if (!group::check_priv($target, PRIV_WRITE)) {
		window::error('您无权操作当前信息！');
	}
}

if (isset($_GET['sticky'])) {
	DB::query("UPDATE common_message SET `sticky` = 0 WHERE `id` = '$message_id'");
}

if ($_GET['important'] == 1) {
	DB::query("UPDATE common_message SET `important` = 1 WHERE `id` = '$message_id'");
}

if ($_GET['important'] == 0) {
	DB::query("UPDATE common_message SET `important` = 0 WHERE `id` = '$message_id'");
}

redirect('/home');
?>
