<?php
// module/home/nav.php 2011-08-11

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

$listens = DB::result_first("SELECT listen FROM common_user WHERE `uid` = '".CURRENT_USER."'");
$listens = unserialize($listens);
if (!is_array($listens)) {
	$listens = array();
}

$object = array();
$groups = array();
$forums = array();
$classes = array();
//foreach ($listens as $listen) {
	//$result = DB::fetch_first("SELECT path, title, class FROM common_object WHERE `path` = '$listen'");
	// currently show all things
	$objects = DB::fetch_all("SELECT `path`, `title`, `class` FROM common_object WHERE `parent` = '/'");
foreach ($objects as $result) {
	if ($result['class'] == 'group') {
		$groups[] = $result;
	}
	elseif ($result['class'] == 'portal') {
		$forums[] = $result;
	}
}
?>
<nav>
<ul>
<?php if (group::isadmin(CURRENT_USER, '/')) { ?>
<li><a href="/system">系统维护</a></li>
<?php } ?>
<li><a href="/home">个人中心</a>
<ul><li><a href="/user/modify">个人资料</a></li>
<li><a href="/home/friend">我的好友</a></li>
<li><a href="/home/searchfriend">查找好友</a></li>
<li><a href="/home/doing">我的动态</a></li>
<li><a href="/home/blog">我的博客</a></li>
<li><a href="/home/important">我的存档</a></li>
</ul></li>
<li><a href="<?=user::getclasspath(); ?>">我的班级</a>
<ul><li><a href="/home/class">查找班级</a></li>
</ul></li>
<li><a href="/home/group">我的组织</a>
<ul><?php foreach ($groups as $group) { ?>
<li><a href="<?=$group['path'] ?>" target="_blank"><?=$group['title'] ?></a></li>
<?php } ?>
</ul></li>
<li><a href="/home/forum">我的论坛</a>
<ul><?php foreach ($forums as $forum) { ?>
<li><a href="<?=$forum['path'] ?>" target="_blank"><?=$forum['title'] ?></a></li>
<?php } ?>
</ul></li>
<li><a href="/home/app">我的应用</a>
<ul><li><a href="/ustclive" target="_blank">科大直播板</a></li>
</ul></li>
</nav>
