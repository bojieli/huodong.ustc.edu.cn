<?php
// module/message/lib_read.php 2011-08-09 boj

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require_once libfile('class/message');

function simple_read($target, $from_time = 0, $to_time = CURRENT_TIMESTAMP, $start = 0, $num = INFINITY) {

	$msgs = message::get($target, $from_time, $to_time, $start, $num);
	
	if (empty($msgs)) {
		return "还没有消息！";
	}
	
	$common_html = '';
	foreach ($msgs as $msg) {
		$common_html .= simple_read_message($msg);
	}
	return '<ul class="msg">'.$common_html.'</ul>'."\n";
}

function read_all($target, $from_time = 0, $to_time = CURRENT_TIMESTAMP, $start = 0, $num = INFINITY) {
	
	$msgs = message::get($target, $from_time, $to_time, $start, $num);
	
	if (empty($msgs)) {
		return "还没有消息，好孤独啊，赶快添加关注吧！";
	}
	
	$sticky_html = '';
	$common_html = '';
	
	$sources = array();
	$count = count($msgs);
	// find and aggregate messages from the same source
	foreach ($msgs as $index => $msg) {
		
		// sticky msgs are not to be aggregated
		if ($msg['sticky']) {
			$sticky_html .= read_message($msg);
		}
		elseif (!isset($sources[$msg['siteroot']])) {
			if (substr($msg['siteroot'], 0, 6) != '/user/') {
				// aggregate all other msgs
				$sources[$msg['siteroot']] = true;
				$this_html = read_message($msg);
			
				$aggregate = false;
				for ($i = $index + 1; $i<$count; $i++) {
					if ($msgs[$i]['siteroot'] == $msg['siteroot']) {
						$this_html .= read_message($msgs[$i]);
					}
					$aggregate = true;
				}
				if ($aggregate) {
					if ($msg['parent'] == '/user/'.$msg['author']) {
						$realname = $msg['author_name'];
					} else {
						$realname = OBJ::getrealname($msg['siteroot']);
					}
					$common_html .= '<div class="msgs"><p class="large">来自'.$realname.'的消息:</p><ul>'.$this_html.'</ul></div>'."\n";
				} else {
					$common_html .= $this_html;
				}
			} else { // message from user are not to be aggregated
				$common_html .= read_message($msg);
			}
		}
		// else it should have been aggregated with previous msgs
	}
	
	if (!empty($sticky_html)) {
		$sticky_html = '<ul class="sticky">'.$sticky_html.'</ul>'."\n";
	}
	if (!empty($common_html)) {
		$common_html = '<ul class="msg">'.$common_html.'</ul>'."\n";
	}
	
	$more_html = '';
	//$more_html = '<a href="/message?source="'.$source.'"&count="'.user::login_count().'"><div class="more">更多消息</div></a>'."\n";
	return $sticky_html.$common_html.$more_html;
}

function read_important($user = CURRENT_USER) {
	
	$msgs = message::get_important($user);
	
	if (empty($msgs)) {
		return "<h1>还没有已存档的消息！</h1><p>存档你认为重要或有趣的消息，可以方便以后查看。";
	}
	
	$common_html = '<h1>已存档消息</h1>'."\n";
	foreach ($msgs as $msg) {
		$common_html .= read_message($msg);
	}
	return $common_html;
}

function simple_read_message($msg) {
	$path = $msg['path'];
	$source = $msg['parent'];
	if (substr($source, 0, 5) == '/user') {
		$source = substr($source, 0, 6);
		$source_name = $msg['author_name'];
	} else {
		$source_name = OBJ::getrealname($source);
	}
	$content = $msg['content'];
	$time = date("m-d H:i", $msg['create_time']);
}

function read_message($msg, $simple = false) {
	$source = $msg['parent'];
	if (substr($source, 0, 5) == '/user') {
		$source = substr($source, 0, 6);
		$source_name = $msg['author_name'];
	} else {
		$source = $msg['siteroot'];
		$source_name = OBJ::getrealname($source);
	}
	$content = $msg['content'];
	$target = empty($msg['target']) ? '' : $msg['target'];
	$path = $msg['path'];
	$time = $msg['create_time'];
	$content = $msg['content'];
	$sticky = empty($msg['sticky']) ? 0 : 1;
	$important = empty($msg['important']) ? 0 : 1;
	$time = date("m-d H:i", $msg['create_time']);
	
	if ($simple) {
		$static_links = '<a href="'.$path.'?action=forward">转发</a>';
	} else {
		$static_links = static_links($path, $source, $target, $important, $sticky);
	}

	$class = $sticky ? 'stickymsg' : 'msg';

	// <li><div class="msg"><a href="path">SOURCE</a>: MESSAGE_CONTENT 
	//	<div class="reply">REPLY</div><div class="replybox">FORM</div>
	//	<div class="bar"><span class="time">TIME</span><span class="link">STATIC_LINKS</span></div>
	// </div></li>
	return '<li><div class="'.$class.'"><a href="'.$msg['parent'].'">'.$source_name.'</a>: '.$content.read_reply($path).'<div class="bar"><span class="time">发表于 '.$time.'</span><span class="link">'.$static_links.'</span></div></div></li>'."\n";
}

function read_reply($path) {
	$str = '';
	$replies = OBJ::select($path, array('author', 'author_name', 'content'));
	if (!empty($replies)) {
		$str .= '<div class="reply"><ul>';
		foreach ($replies as $reply) {
			// <li><a href="user/10000">username</a>: REPLY_CONTENT</li>
			$str .= '<li><a href="/user/'.$reply['author'].'">'.$reply['author_name'].'</a>: '.$reply['content'].'</li>';
		}
		$str .= '</ul></div>';
		$str .= "\n";
	}
	
	// <div class="replybox"><form action="/path?action=insert"><textarea rows="4" cols="30" name="content"></textarea></form></div>
	$str .= '<div class="fastreply"><form action="'.$path.'?action=insert" method="post"><input type="hidden" name="redirect" value="/home" /><textarea name="content" id="content" onfocus="this.style.width=\'400px\';this.style.height=\'80px\';"></textarea>&nbsp;<button type="submit">回复</button></form></div>'."\n";
	return $str;
}

function static_links($path, $source, $target, $important, $sticky) {
	// system messages are not to be opreated
	if (substr($source, 0, 7) == '/system') {
		return '';
	}
	
	$static_links = '<a href="'.$path.'?action=forward">转发</a>';
	
	if ($source == '/user/'.CURRENT_USER) {
		$static_links .= '&nbsp;<a href="'.$path.'?action=delete">取消发送</a>';
	} elseif ($target == '/user/'.CURRENT_USER) {
		if (!$important) {
			$static_links .= '&nbsp;<a href="'.$target.'?action=updatemessage&msgpath='.$path.'&important=1">存档</a>';
		} else {
			$static_links .= '&nbsp;已存档';
		}
		$static_links .= '&nbsp;<a href="'.$target.'?action=deletemessage&msgpath='.$path.'">删除</a>';
	}
	
	if ($sticky) {
		$static_links = '<a href="'.$target.'?action=updatemessage&msgpath='.$path.'&sticky=0">我知道了</a>&nbsp;'.$static_links;
	}
	return $static_links;
}
?>
