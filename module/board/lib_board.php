<?php
// module/board/lib_read.php

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

$from = isset($_GET['from']) ? $_GET['from'] : 0;
$num = isset($_GET['num']) ? $_GET['num'] : INFINITY;
read_all(CURRENT_PATH, $from, $num);

// this function differs from that of module/message/read
function read_all($path = CURRENT_PATH, $from = 0, $num = INFINITY, $recursive = true) {
	if ($num < INFINITY) {
		$limit = "$from,$num";
	} elseif ($from > 0) {
		$limit = "$from";
	} else {
		$limit = '';
	}
	
	// OBJ::find(parent, depth, attributes, condition, order, limit), can find child,grandchild,grandgrandchild
	$posts = OBJ::find($path, 3, array(), "`class` = 'article'", '`order` DESC, `insert_time` DESC', $limit);
	
	if (!is_array($posts)) { // no result
		if ($from == 0) { // first enter this board
			return '<div class="error">本版面还没有文章，请<a href="'.$path.'?action=add">立即发表</a>或到别处转转～</div>';
		} else { // have reached the last article
			return '<div class="more">没有更多文章了</div>';
		}
	}
	
	$common_html = '';
	foreach ($posts as $post) {
		$common_html .= read_post($post);
	}
	
	if ($num < INFINITY) { // show more messages link
		$common_html .= '<a href="'.$path.'"><div class="more">更多文章</div></a>';
	} else {
		$common_html .= '<div class="more">没有更多文章了</div>';
	}
	
	$header_html = '<a href="'.$path.'?action=add">发表文章</a>';
	require_once modulefile('common', 'editor');
	$footer_html = fastpostbox($path);
	
	return $header_html . "\n" . '<ul>' . $common_html . '</ul>' . "\n" . $footer_html . "\n";
}

// this function differs from that of module/message/read
function read_post($post) {
	$author = $post['author'];
	$author_name = $post['author_name'];
	$time = date("Y-m-d H:i:s", $post['create_time']);
	$title = $post['title'];
	$content = $post['content'];
	
	$static_links = '<a href="/message/'.$id.'?action=update?digest=1">精华</a>';
	
	// <li><div class="post"><a href="path">SOURCE</a>: MESSAGE_CONTENT STATIC_LINKS</div></li>
	return '<li><div class="post"><a href="'.$source.'">'.$source_name.'</a>: '.$content.'<p class="link">'.$static_links.'</p></div>'.read_reply($path).'</li>'."\n";
}

// this function differs from that of module/message/read
function read_reply($path) {
	
	$str = '';
	$replies = DB::select($path, array('path', 'author', 'author_name', 'content'), array('class' => 'reply'));
	if (is_array($replies)) {
		$str .= '<div class="reply"><ul>';
		foreach ($replies as $reply) {
			// <li><a href="user/10000">username</a>: REPLY_CONTENT</li>
			$str .= '<li><a href="/user/'.$reply['author'].'">'.$reply['author_name'].'</a>: '.$reply['content'].'</li>';
		}
		$str .= '</ul></div>';
		$str .= "\n";
	}
	
	// <div class="replybox"><form action="/path?action=insert"><textarea rows="4" cols="30" name="content"></textarea></form></div>
	$str .= '<div class="replybox"><form action="'.$path.'?action=insert"><textarea rows="4" cols="30" name="content"></textarea><br /><button type="submit">回复</button></form></div>'."\n";
	return $str;
}
?>
