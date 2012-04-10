<?php
// module/user/profile.php

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require modulefile('common', 'header');

echo '<aside>';
require modulefile('user', 'nav');
echo '</aside>';

echo '<article>';

function show_profile($user) {
	$info = user::getinfo($user);
	if (empty($info)) {
		window::error('用户不存在！');
	} ?>
<h1><?=$info['realname'] ?>的个人资料</h1>
<table class="profile">
<tr><td>真实姓名</td><td><?=$info['realname'] ?></td></tr>
<tr><td>学号</td><td><?=$info['student_id'] ?></td></tr>
<tr><td>入学年份</td><td><?=$info['grade'] ?></td></tr>
<tr><td>院系</td><td><?=$info['dept'] ?></td></tr>
<tr><td>班级</td><td><?=$info['class'] ?></td></tr>
</table>
<?php
}

// /user/profile/10000
$user = substr(CURRENT_PATH, 14);
if (!empty($user) && is_numeric($user)) {
	show_profile($user);
} else {
	show_profile(CURRENT_USER);
}

echo '</article>';

require modulefile('common', 'footer');
?>
