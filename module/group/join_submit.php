<?php
// module/group/join_submit.php

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

if (!empty($_POST['invite'])) {
	$invite_code = OBJ::get_attr(CURRENT_PATH, 'invite_code');
	if (!empty($invite_code) && $_POST['invite'] === $invite_code) {
		// this stuff should be altered with setuid...
		$member = DB::result_first("SELECT member FROM common_object WHERE `path` = '".CURRENT_PATH."'");
		$members = unserialize($member);
		if (!is_array($members)) {
			$members = array();
		}
		if (!in_array(CURRENT_USER, $members)) {
			$members[] = CURRENT_USER;
			$member = serialize($members);
			DB::query("UPDATE common_object SET `member` = '$member' WHERE `path` = '".CURRENT_PATH."'");
			window::ok('您已经成为此组织的一员了！');
		} else { // already in
			window::info('您已经加入了此组织，不需要再加入！');
		}
	} else {
		window::error('邀请码不正确，请返回检查！');
	}
} else {
	$title = OBJ::get_attr(CURRENT_PATH, 'title');
	require_once libfile('class/message');
	message::send('申请加入'.$title.'<br />申请理由：'.$_POST['message'].'<br /><a href="'.CURRENT_PATH.'?action=adduser&user='.CURRENT_USER.'">批准</a>&nbsp;(不批准无需进行任何操作，直接删除消息即可)', '/user/'.CURRENT_USER, CURRENT_PATH);
	window::ok('申请已经发送，请耐心等待审核...');
}
?>
