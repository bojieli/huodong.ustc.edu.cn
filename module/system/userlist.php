<?php
// module/system/userlist.php 2011-08-15

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}
if (!group::isadmin(CURRENT_USER, '/')) {
	window::error('仅有网站开发团队才能访问此页面！');
}
require modulefile('common', 'header');

echo '<aside>';
require modulefile('system', 'nav');
echo '</aside>';

echo '<article>';

$users = DB::fetch_all("SELECT * FROM common_user"); ?>
<h1>所有用户列表</h1>
<table>
<tr><th>用户ID</th><th>真实姓名</th><th>学号</th><th>入学年份</th><th>院系</th><th>班级</th><th>用户状态</th><th>操作</th></tr>
<?php foreach ($users as $info) { ?>
<tr><td><?=$info['uid'] ?></td><td><a href="/user/<?=$info['uid'] ?>"><?=$info['realname'] ?></a></td><td><?=$info['student_id'] ?></td><td><?=$info['grade'] ?></td><td><?=$info['dept'] ?></td><td><?=$info['class'] ?></td><td>
<?php switch ($info['status']) { case 1: echo '<font color="red">在线</font>';break; case '0': echo '下线';break; case '-1': echo '<strong>锁定</strong>';break; } ?></td><td>
<?php if ($info['status'] != 'locked') {
	echo '<a href="/system/lockuser?lock=true&user='.$info['uid'].'">锁定用户</a>';
} else {
	echo '<a href="/system/lockuser?lock=false&user='.$info['uid'].'">解除锁定</a>';
}
?></td></tr>
<?php } ?>
</table>
</article>
<?php require modulefile('common', 'footer');
?>
