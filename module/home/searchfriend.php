<?php
// module/home/searchfriend.php 2011-08-15

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require modulefile('common', 'header');

echo '<aside>';
require modulefile('home', 'nav');
echo '</aside>';
?>
<article>
<h1>查找好友 (支持模糊查询)</h1>
<form action="/home/searchfriend" method="post">
<table>
<tr><td>姓名</td><td><input type="text" name="realname" value="<?=(isset($_POST['realname']) ? $_POST['realname'] : '') ?>" /></td><td class="comment">例如，输入“张”可以找到“张三”</td></tr>
<tr><td>学号</td><td><input type="type" name="student_id" value="<?=(isset($_POST['student_id']) ? $_POST['student_id'] : '') ?>" /></td><td class="comment">例如，输入"10000"可以找到"PB10000603"</td></tr>
<tr><td>院系</td><td>
<select id="dept" name="dept"><option value="">不限</option><?php require 'static/deptlist' ?></select></td><td class="comment">可以按照系别与班级精确查询，如找到所有的少年班同学</td></tr>
<tr><td>年级</td><td>
<select id="grade" name="grade"><option value="">不限</option><option value="2011">2011级</option><option value="2010">2010级</option><option value="2009">2009级</option><option value="2008">2008级</option><option value="2007">2007级</option><option value="2006">2006级</option><option value="2005">2005级</option></select>&nbsp;&nbsp;班级&nbsp;<select id="class" name="class"><option value="">不限</option><option value="1">1班</option><option value="2">2班</option><option value="3">3班</option><option value="4">4班</option><option value="5">5班</option><option value="6">6班</option><option value="shaonianban">少年班</option><option value="chuangxinban">创新班</option></select></td></tr>
<tr><td></td><td><button class="large">搜索</button></td></tr>
</table>
</form>
<?php // select friends if condition exist
if (!empty($_POST['realname']) || !empty($_POST['student_id']) || !empty($_POST['grade']) || !empty($_POST['dept']) || !empty($_POST['class'])) {
	$friends = user::find_user($_POST['realname'], $_POST['student_id'], $_POST['grade'], $_POST['dept'], $_POST['class']);
	
	// cannot find myself in searching friends
	if (isset($friend[CURRENT_USER])) {
		unset($friend[CURRENT_USER]);
	}

	if (empty($friends)) {
		echo '<h1>没有找到符合条件的用户！很可能是TA还没注册，赶快催TA注册吧！</h1>';
	} else {
?>
<p>&nbsp;</p>
<h1>共找到<?=count($friends) ?>个同学</h1>
<table>
<tr><th>姓名</th><th>学号</th><th>年级</th><th>院系</th><th>班级</th><th>操作</th></tr>
<?php foreach ($friends as $friend) { 
$info = user::getinfo($friend);
?>
<tr><td><a href="/user/<?=$friend ?>"><?=$info['realname'] ?></a></td><td><?=$info['student_id'] ?></td><td><?=$info['grade'] ?></td><td><?=$info['dept'] ?></td><td><?=$info['class'] ?></td><td><a href="/home/addfriend?user=<?=$friend ?>">加为好友</a></td></tr>
<?php } // end foreach ?>
</table>
<?php } // endif noresult
} // endif nocondition

echo '</article>';

require modulefile('common', 'footer');
?>
