<?php
// module/group/group_adduser.php 2011-08-10

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

if (isset($_GET['prompt'])) { ?>
<form action="<?=CURRENT_PATH ?>?action=adduser" method="get">
请输入要加入此组织的用户ID：<input type="text" name="user" />
</form>
<?php require modulefile('user', 'search');
}
else {
	$_GET['user'] = $_POST['user'];
	if (isset($_GET['user'])) {
		if (!is_numeric($_GET['user'])) {
			window::error('用户ID必须是数字！');
		}
		if (!group::add('member', $_GET['user'], CURRENT_PATH)) {
			window::error('用户不存在或您没有权限添加用户。');
		}
		// automatically listen to the group
		OBJ::add_listener(CURRENT_PATH, '/user/'.$_GET['user']);
	}
	else {
		window::error('没有指定用户ID！');
	}
}
redirect(CURRENT_PATH);
?>
