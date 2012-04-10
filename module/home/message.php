<?php
// module/home/message.php 2011-08-13

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require_once libfile('class/message');

if (isset($_GET['action'])) {
	if ($_GET['action'] == 'update') {
		require modulefile('message', 'update');
	} elseif ($_GET['action'] == 'forward') {
		require modulefile('message', 'forward');
	}
}

$user = substr(CURRENT_PATH, 6);
if (empty($user) || !is_numeric($user) || $user == 0) {
	$user = CURRENT_USER;
}

if ($user == CURRENT_USER) {
	require modulefile('message', 'statusbox');
} else {
	require modulefile('message', 'messagebox');
}

require_once modulefile('message', 'lib_read');
$name = user::getrealname($user);
if (!empty($name)) {
	echo '<h1>'.$name.'的所有消息</h1>';
	echo simple_read('/user/'.$user, '/user/'.$user);
} else {
	window::error('用户不存在');
}
?>
