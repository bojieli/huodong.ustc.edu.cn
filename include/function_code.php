<?php
// include/function_code.php 2011-07-24 boj
// generate HTML from internal code

/**
 * Convert smiley code to the icon graphic file equivalent.
 *
 * You can turn off smilies, by going to the write setting screen and unchecking
 * the box, or by setting 'use_smilies' option to false or removing the option.
 *
 * Plugins may override the default smiley list by setting the $wpsmiliestrans
 * to an array, with the key the code the blogger types in and the value the
 * image file.
 *
 * The $wp_smiliessearch global is for the regular expression and is set each
 * time the function is called.
 *
 * The full list of smilies can be found in the function and won't be listed in
 * the description. Probably should create a Codex page for it, so that it is
 * available.
 *
 * @global array $wpsmiliestrans
 * @global array $wp_smiliessearch
 * @since 2.2.0
 */
function smilies_init() {
	global $wpsmiliestrans, $wp_smiliessearch;

	// don't bother setting up smilies if they are disabled
	if ( !get_option( 'use_smilies' ) )
		return;

	if ( !isset( $wpsmiliestrans ) ) {
		$wpsmiliestrans = array(
		':mrgreen:' => 'icon_mrgreen.gif',
		':neutral:' => 'icon_neutral.gif',
		':twisted:' => 'icon_twisted.gif',
		  ':arrow:' => 'icon_arrow.gif',
		  ':shock:' => 'icon_eek.gif',
		  ':smile:' => 'icon_smile.gif',
		    ':???:' => 'icon_confused.gif',
		   ':cool:' => 'icon_cool.gif',
		   ':evil:' => 'icon_evil.gif',
		   ':grin:' => 'icon_biggrin.gif',
		   ':idea:' => 'icon_idea.gif',
		   ':oops:' => 'icon_redface.gif',
		   ':razz:' => 'icon_razz.gif',
		   ':roll:' => 'icon_rolleyes.gif',
		   ':wink:' => 'icon_wink.gif',
		    ':cry:' => 'icon_cry.gif',
		    ':eek:' => 'icon_surprised.gif',
		    ':lol:' => 'icon_lol.gif',
		    ':mad:' => 'icon_mad.gif',
		    ':sad:' => 'icon_sad.gif',
		      '8-)' => 'icon_cool.gif',
		      '8-O' => 'icon_eek.gif',
		      ':-(' => 'icon_sad.gif',
		      ':-)' => 'icon_smile.gif',
		      ':-?' => 'icon_confused.gif',
		      ':-D' => 'icon_biggrin.gif',
		      ':-P' => 'icon_razz.gif',
		      ':-o' => 'icon_surprised.gif',
		      ':-x' => 'icon_mad.gif',
		      ':-|' => 'icon_neutral.gif',
		      ';-)' => 'icon_wink.gif',
		       '8)' => 'icon_cool.gif',
		       '8O' => 'icon_eek.gif',
		       ':(' => 'icon_sad.gif',
		       ':)' => 'icon_smile.gif',
		       ':?' => 'icon_confused.gif',
		       ':D' => 'icon_biggrin.gif',
		       ':P' => 'icon_razz.gif',
		       ':o' => 'icon_surprised.gif',
		       ':x' => 'icon_mad.gif',
		       ':|' => 'icon_neutral.gif',
		       ';)' => 'icon_wink.gif',
		      ':!:' => 'icon_exclaim.gif',
		      ':?:' => 'icon_question.gif',
		);
	}

	if (count($wpsmiliestrans) == 0) {
		return;
	}

	/*
	 * NOTE: we sort the smilies in reverse key order. This is to make sure
	 * we match the longest possible smilie (:???: vs :?) as the regular
	 * expression used below is first-match
	 */
	krsort($wpsmiliestrans);

	$wp_smiliessearch = '/(?:\s|^)';

	$subchar = '';
	foreach ( (array) $wpsmiliestrans as $smiley => $img ) {
		$firstchar = substr($smiley, 0, 1);
		$rest = substr($smiley, 1);

		// new subpattern?
		if ($firstchar != $subchar) {
			if ($subchar != '') {
				$wp_smiliessearch .= ')|(?:\s|^)';
			}
			$subchar = $firstchar;
			$wp_smiliessearch .= preg_quote($firstchar, '/') . '(?:';
		} else {
			$wp_smiliessearch .= '|';
		}
		$wp_smiliessearch .= preg_quote($rest, '/');
	}

	$wp_smiliessearch .= ')(?:\s|$)/m';
}

function bbcode2html($message, $parseurl=0) {
	if(empty($this->search_exp)) {
		$this->search_exp = array(
			"/\s*\[quote\][\n\r]*(.+?)[\n\r]*\[\/quote\]\s*/is",
			"/\[url\]\s*(https?:\/\/|ftp:\/\/|gopher:\/\/|news:\/\/|telnet:\/\/|rtsp:\/\/|mms:\/\/|callto:\/\/|ed2k:\/\/){1}([^\[\"']+?)\s*\[\/url\]/i",
			"/\[em:([0-9]+):\]/i",
		);
		$this->replace_exp = array(
			"<div class=\"quote\"><blockquote>\\1</blockquote></div>",
			"<a href=\"\\1\\2\" target=\"_blank\">\\1\\2</a>",
			" <img src=\"".STATICURL."image/smiley/comcom/\\1.gif\" class=\"vm\"> "
		);
		$this->replace_exp[] = '$this->bb_img(\'\\1\')';
		$this->search_str = array('[b]', '[/b]','[i]', '[/i]', '[u]', '[/u]');
		$this->replace_str = array('<b>', '</b>', '<i>','</i>', '<u>', '</u>');
	}

	if($parseurl==2) {
		$this->search_exp[] = "/\[img\]\s*([^\[\<\r\n]+?)\s*\[\/img\]/ies";
		$this->replace_exp[] = '$this->bb_img(\'\\1\')';
		$message = bbcode::parseurl($message);
	}

	@$message = str_replace($this->search_str, $this->replace_str,preg_replace($this->search_exp, $this->replace_exp, $message, 20));
	return nl2br(str_replace(array("\t", '   ', '  '), array('&nbsp; &nbsp; &nbsp; &nbsp; ', '&nbsp; &nbsp;', '&nbsp;&nbsp;'), $message));
}

function parseurl($message) {
	return preg_replace("/(?<=[^\]a-z0-9-=\"'\\/])((https?|ftp|gopher|news|telnet|mms|rtsp):\/\/)([a-z0-9\/\-_+=.~!%@?#%&;:$\\()|]+)/i", "[url]\\1\\3[/url]", ' '.$message);
}

function html2bbcode($message) {

	if(empty($this->html_s_exp)) {
		$this->html_s_exp = array(
				"/\<div class=\"quote\"\>\<blockquote\>(.*?)\<\/blockquote\>\<\/div\>/is",
				"/\<a href=\"(.+?)\".*?\<\/a\>/is",
				"/(\r\n|\n|\r)/",
				"/<br.*>/siU",
				"/[ \t]*\<img src=\"static\/image\/smiley\/comcom\/(.+?).gif\".*?\>[ \t]*/is",
				"/\s*\<img src=\"(.+?)\".*?\>\s*/is"
			);
			$this->html_r_exp = array(
				"[quote]\\1[/quote]",
				"\\1",
				'',
				"\n",
				"[em:\\1:]",
				"\n[img]\\1[/img]\n"
		);
		$this->html_s_str = array('<b>', '</b>', '<i>','</i>', '<u>', '</u>', '&nbsp; &nbsp; &nbsp; &nbsp; ', '&nbsp; &nbsp;', '&nbsp;&nbsp;', '&lt;', '&gt;', '&amp;');
		$this->html_r_str = array('[b]', '[/b]','[i]', '[/i]', '[u]', '[/u]', "\t", '   ', '  ', '<', '>', '&');
	}

	@$message = str_replace($this->html_s_str, $this->html_r_str,
	preg_replace($this->html_s_exp, $this->html_r_exp, $message));

	$message = dhtmlspecialchars($message);

	return trim($message);
}

function bb_img($url) {
	global $_G;

	if(!in_array(strtolower(substr($url, 0, 6)), array('http:/', 'https:', 'ftp://', 'rtsp:/', 'mms://'))) {
		$url = isset($_G['siteurl']) && !empty($_G['siteurl']) ? $_G['siteurl'].$url : 'http://'.$url;
	}
	$url = addslashes($url);
	return "<img src=\"$url\" class=\"vm\">";
}

function multipage($num, $perpage, $curpage, $mpurl, $maxpages = 0, $page = 10, $autogoto = FALSE, $simple = FALSE) {
	global $_G;
	$ajaxtarget = !empty($_G['gp_ajaxtarget']) ? " ajaxtarget=\"".htmlspecialchars($_G['gp_ajaxtarget'])."\" " : '';

	$a_name = '';
	if(strpos($mpurl, '#') !== FALSE) {
		$a_strs = explode('#', $mpurl);
		$mpurl = $a_strs[0];
		$a_name = '#'.$a_strs[1];
	}

	if(defined('IN_ADMINCP')) {
		$shownum = $showkbd = TRUE;
		$lang['prev'] = '&lsaquo;&lsaquo;';
		$lang['next'] = '&rsaquo;&rsaquo;';
	} else {
		$shownum = $showkbd = FALSE;
		if(defined('IN_MOBILE') && !defined('TPL_DEFAULT')) {
			$lang['prev'] = lang('core', 'prevpage');
			$lang['next'] = lang('core', 'nextpage');
		} else {
			$lang['prev'] = '&nbsp;&nbsp;';
			$lang['next'] = lang('core', 'nextpage');
		}
	}
	if(defined('IN_MOBILE') && !defined('TPL_DEFAULT')) {
		$dot = '..';
		$page = intval($page) < 10 && intval($page) > 0 ? $page : 4 ;
	} else {
		$dot = '...';
	}
	$multipage = '';
	$mpurl .= strpos($mpurl, '?') !== FALSE ? '&amp;' : '?';

	$realpages = 1;
	$_G['page_next'] = 0;
	$page -= strlen($curpage) - 1;
	if($page <= 0) {
		$page = 1;
	}
	if($num > $perpage) {

		$offset = floor($page * 0.5);

		$realpages = @ceil($num / $perpage);
		$pages = $maxpages && $maxpages < $realpages ? $maxpages : $realpages;

		if($page > $pages) {
			$from = 1;
			$to = $pages;
		} else {
			$from = $curpage - $offset;
			$to = $from + $page - 1;
			if($from < 1) {
				$to = $curpage + 1 - $from;
				$from = 1;
				if($to - $from < $page) {
					$to = $page;
				}
			} elseif($to > $pages) {
				$from = $pages - $page + 1;
				$to = $pages;
			}
		}
		$_G['page_next'] = $to;
		$multipage = ($curpage - $offset > 1 && $pages > $page ? '<a href="'.$mpurl.'page=1'.$a_name.'" class="first"'.$ajaxtarget.'>1 '.$dot.'</a>' : '').
		($curpage > 1 && !$simple ? '<a href="'.$mpurl.'page='.($curpage - 1).$a_name.'" class="prev"'.$ajaxtarget.'>'.$lang['prev'].'</a>' : '');
		for($i = $from; $i <= $to; $i++) {
			$multipage .= $i == $curpage ? '<strong>'.$i.'</strong>' :
			'<a href="'.$mpurl.'page='.$i.($ajaxtarget && $i == $pages && $autogoto ? '#' : $a_name).'"'.$ajaxtarget.'>'.$i.'</a>';
		}
		$multipage .= ($to < $pages ? '<a href="'.$mpurl.'page='.$pages.$a_name.'" class="last"'.$ajaxtarget.'>'.$dot.' '.$realpages.'</a>' : '').
		($curpage < $pages && !$simple ? '<a href="'.$mpurl.'page='.($curpage + 1).$a_name.'" class="nxt"'.$ajaxtarget.'>'.$lang['next'].'</a>' : '').
		($showkbd && !$simple && $pages > $page && !$ajaxtarget ? '<kbd><input type="text" name="custompage" size="3" onkeydown="if(event.keyCode==13) {window.location=\''.$mpurl.'page=\'+this.value; doane(event);}" /></kbd>' : '');

		$multipage = $multipage ? '<div class="pg">'.($shownum && !$simple ? '<em>&nbsp;'.$num.'&nbsp;</em>' : '').$multipage.'</div>' : '';
	}
	$maxpage = $realpages;
	return $multipage;
}

function simplepage($num, $perpage, $curpage, $mpurl) {
	$return = '';
	$lang['next'] = lang('core', 'nextpage');
	$lang['prev'] = lang('core', 'prevpage');
	$next = $num == $perpage ? '<a href="'.$mpurl.'&amp;page='.($curpage + 1).'" class="nxt">'.$lang['next'].'</a>' : '';
	$prev = $curpage > 1 ? '<span class="pgb"><a href="'.$mpurl.'&amp;page='.($curpage - 1).'">'.$lang['prev'].'</a></span>' : '';
	if($next || $prev) {
		$return = '<div class="pg">'.$prev.$next.'</div>';
	}
	return $return;
}
?>
