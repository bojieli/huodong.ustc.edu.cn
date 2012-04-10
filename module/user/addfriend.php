<?php
// module/home/addfriend.php 2011-08-15

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

if (empty($_GET['user'])) {
	$_GET['user'] = $_POST['user'];
}

require_once libfile('class/message');

// to get id and generate link including message id, we have to do this
$path = message::send('&nbsp', '/user/'.CURRENT_USER, '/user/'.$_GET['user'], CURRENT_PATH, true, false, false);
$message = link2user(CURRENT_USER).' 申请添加你为好友<br /><a href="/home/addfriend_verify?msgpath='.$path.'">同意，并加对方为好友</a>&nbsp;&nbsp;<a href="'.$path.'?action=delete">拒绝</a>';
OBJ::update($path, array('content' => $message));
window::ok('添加好友申请已经发送，请耐心等待对方审核……<br />页面将在3秒后自动跳转');
redirect('/home', 3000);
?>
