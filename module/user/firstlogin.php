<?php
// /module/user/firstlogin 2011-08-15
// This is used only at first login, to create class and and all members in the class as my friend.

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

$user = user::getinfo();

$dept_path = '/'.$user['dept'];
$grade_path = '/'.$user['dept'].'/'.$user['grade'];
$class_path = '/'.$user['dept'].'/'.$user['grade'].'/'.$user['class'];

// insert class if not exists
if (!OBJ::is_object_exist($dept_path)) {
	OBJ::insert('/', array('path' => $dept_path, 'class' => 'dept'));
}
if (!OBJ::is_object_exist($grade_path)) {
	OBJ::insert($dept_path, array('path' => $grade_path, 'class' => 'grade'));
}
if (!OBJ::is_object_exist($class_path)) {
	OBJ::insert($grade_path, array('path' => $class_path, 'class' => 'class'));
}

// add current user to group
// note that CURRENT_USER = 0, but is login
group::add('member', CURRENT_USER, $dept_path);
group::add('member', CURRENT_USER, $grade_path);
group::add('member', CURRENT_USER, $class_path);

user::add_friend_from_group(CURRENT_USER, $class_path);

require_once libfile('class/message');
message::send('系统提示：看到这些加好友的消息了吗？同一班级的同学会自动加为好友，如果希望添加更多好友，可以在左侧查找更多好友～', '/home', '/user/'.CURRENT_USER, CURRENT_PATH, true);

$adminlist = serialize(array(CURRENT_USER));
OBJ::insert('/user', array('name' => CURRENT_USER, 'class' => 'home', 'admin' => $adminlist, 'priv' => '744', 'priv_group' => '744'));
OBJ::insert('/user/'.CURRENT_USER, array('name' => 'photo', 'class' => 'album', 'admin' => $adminlist, 'priv' => '744', 'priv_group' => '744'));
OBJ::insert('/user/'.CURRENT_USER, array('name' => 'blog', 'class' => 'blog', 'admin' => $adminlist, 'priv' => '744', 'priv_group' => '744'));
OBJ::insert('/user/'.CURRENT_USER, array('name' => 'doing', 'class' => 'messagebox', 'admin' => $adminlist, 'priv' => '744', 'priv_group' => '744', 'default_child_class' => 'message'));
OBJ::insert('/user/'.CURRENT_USER, array('name' => 'message', 'class' => 'messagebox', 'admin' => $adminlist, 'priv' => '744', 'priv_group' => '744', 'default_child_class' => 'message'));

redirect('/home');
?>
