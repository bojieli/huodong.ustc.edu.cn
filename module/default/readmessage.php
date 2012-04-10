<?php
// module/message/read.php 2011-08-09 boj

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require_once libfile('class/message');

//$from_time = isset($_GET['from']) ? $_GET['from'] : (user::last_login_time());
$from_time = isset($_GET['from']) ? $_GET['from'] : 0;
$to_time = isset($_GET['to']) ? $_GET['to'] : CURRENT_TIMESTAMP;
if (isset($_GET['count']) && is_numeric($_GET['count'])) {
	// get msgs in time interval from login_count-1 to login_count
	$login_count = $_GET['count'];
	$from_time = DB::result_first("SELECT login_time FROM common_login_log WHERE `login_count` = '".($login_count - 1)."'");
	$to_time = DB::result_first("SELECT login_time FROM common_login_log WHERE `login_count` = '$login_count'");
}

require_once modulefile('message', 'lib_read');
echo read_all('/user/'.CURRENT_USER, $from_time, $to_time);
?>
