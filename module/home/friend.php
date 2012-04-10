<?php
// module/home/friend.php 2011-08-15

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require modulefile('common', 'header');

echo '<aside>';
require modulefile('home', 'nav');
echo '</aside>';

echo '<article>';
$friends = user::get_listen_list(CURRENT_USER);
if (empty($friends)) { ?>
<h1>还没有好友，赶快添加吧！</h1>
<?php } else { ?>
<h1>好友列表</h1>
<table>
<tr><th>姓名</th><th>学号</th><th>年级</th><th>院系</th><th>班级</th><th>操作</th></tr>
<?php foreach ($friends as $friend) { 
$info = user::getinfo($friend);
?>
<tr><td><a href="/user/<?=$friend ?>"><?=$info['realname'] ?></a></td><td><?=$info['student_id'] ?></td><td><?=$info['grade'] ?></td><td><?=$info['dept'] ?></td><td><?=$info['class'] ?></td><td><a href="/home/deletefriend?user=<?=$friend ?>">删除好友</a></td></tr>
<?php } ?>
</table>
<?php } // end else ?>
<p class="large"><a href="/home/searchfriend">查找并添加好友</a></p>
</article>
<?php
require modulefile('common', 'footer');
?>
