<?php
// module/portal/block.php 2011-08-16

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

$head = OBJ::get_attr(CURRENT_PATH.'/head', 'content');
if ($head) {
	echo '<div class="head">';
	echo $head;
	echo '</div>';
}

echo '<div class="channels">';
$channels = OBJ::select(CURRENT_PATH, array('title', 'path'), array('class' => 'channel'), '`order` DESC');
foreach ($channels as $channel) { // display 10 latest news
	echo '<div class="channel">';
	echo '<div><a class="title" href="'.$channel['path'].'">'.$channel['title'].'</a>';
	if (check_priv($channel['path'], PRIV_WRITE)) {
		echo '<span class="right"><a href="'.$channel['path'].'?action=manage">管理</a>'.'&nbsp;'.'<a href="'.$channel['path'].'?action=post">发表文章</a></span>';
	}
	echo '</div>';
	
	$articles_per_channel = 10;

	$articles = OBJ::select($channel['path'], array('create_time', 'title', 'path'), array('class' => 'article'), '`order` DESC', '0,'.$articles_per_channel);
	
	echo '<ul>';
	if (empty($articles)) {
		echo '<li>此栏目还没有文章</li>';
	} else {
		foreach ($articles as $article) {
			echo '<li><a href="'.$article['path'].'">'.$article['title'].'</a>&nbsp;&nbsp;<span class="lighttext right">'.date("m-d H:i", $article['create_time']).'</span></li>';
		}
	}

	if (empty($articles)) {
		$fill = $articles_per_channel - 1;
	} else {
		$fill = $articles_per_channel - count($articles);
	}
	for ($i=0; $i<$fill; $i++) {
		echo '<li>&nbsp;</li>';
	}
	echo '</ul>';
	echo '</div>';
}
echo '</div>';
?>
