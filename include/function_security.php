<?php
// include/function_security.php 2011-07-25 boj
// functions for security and privilege control

// Simple privilege is an integer indicating read, write, insert privileges
//	for admin, user, guest, respectively. (similar with UNIX file privilege)

// read: select, get
// write: update, delete
// insert: insert
// Note that moving an object requires both delete privilege of original object, and
//	insert privilege of target parent object.

// admin, user, guest are separately set, each can be a user (exclusive or) a usergroup.
// First determine whether the given user is <admin>, if so, take the admin privilege.
// If not, determine whether the given user is <user>, if so, take the user privilege.
// If not again, the given user is given the guest privilege.

//      admin                user               guest
// read write insert   read write insert   read write insert    (9 bits in total)
//  400  200   100      40    20    10      4     2     1

// initialize privilege constants
function init_priv() {
	
	// basic privileges
	define('PRIV_INSERT', 1);
	define('PRIV_WRITE', 2);
	define('PRIV_READ', 4);
	
	// advanced privileges
	define('PRIV_DELETE', 8);
	define('PRIV_GRANT', 16);
	define('PRIV_REVOKE', 32);
	
	// elements for simple privilege
	define('GUEST_INSERT', 1);
	define('GUEST_WRITE', 2);
	define('GUEST_READ', 4);
	define('MEMBER_INSERT', 10);
	define('MEMBER_WRITE', 20);
	define('MEMBER_READ', 40);
	define('ADMIN_INSERT', 100);
	define('ADMIN_WRITE', 200);
	define('ADMIN_READ', 400);
	
	// common privilege settings
	define('PRIV_DEFAULT', 755);
	define('PRIV_ALL', 777);
	define('PRIV_PRIVATE', 700);
	define('PRIV_READONLY', 744);
	
	// less common privilege settings
	define('PRIV_INTERNAL', 750);
	define('PRIV_PUBLISH', 754);
	define('PRIV_BLACKBOX', 711);
	define('PRIV_FORBIDDEN', 000);
	define('PRIV_BLACKLIST', 007);
}

function check_priv($object_path, $opreation = PRIV_READ, $user = CURRENT_USER) {

	$object_path = OBJ::absolute_path($object_path);
	$priv = DB::fetch_first('SELECT priv, admin, member FROM common_object WHERE `path` = \''.$object_path.'\'');
	$user_priv = get_priv($priv['priv'], $priv['admin'], $priv['member'], $object_path, $user);
	if ($user_priv & $opreation) { // binary and
		return true;
	} else { // inherit priv
		return check_inherit_priv($object_path, $opreation, $user);
	}
}

// for internal use only
function check_inherit_priv($object_path, $operation = PRIV_READ, $user = CURRENT_USER) {
	global $db;
	
	while ($object_path != '/') {
		$object_path = OBJ::get_parent($object_path);
		$priv = DB::fetch_first("SELECT priv, admin, member FROM common_object WHERE `path` = '$object_path'");
		$user_priv = get_priv($priv['priv'], $priv['admin'], $priv['member'], $object_path, $user);
		if ($user_priv & $operation) {
			return true;
		}
	}
	return false;
}

// struct (array) priv:
//	priv_value, priv_admin, priv_user, priv_guest
// return priv:
//	read (4) | write (2) | insert (1)
function get_priv($priv_value, &$adminlist, &$memberlist, $path = CURRENT_PATH, $user = CURRENT_USER) {
	if (group::isinlist($user, $adminlist, $path, 'admin')) {
		return ($priv_value / 100);
	}
	elseif (group::isinlist($user, $memberlist, $path, 'user')) {
		return (($priv_value % 100) / 10);
	}
	else { // guest
		return ($priv_value % 10);
	}
}

// group: (u|g)[0-9]+
//	u: user, g: group
function priv_ingroup($user, $group) {
	$id = substr($group, 1);
	switch($group[0]) {
		case 'u': if ($id == '0') return ($user > 0);
			return ($user == $id);
		case 'g': return (group::isin($id, $user));
		default: return false;
	}
}

function is_valid_priv($priv) {
	if (!is_numeric($priv)) return false;
	if ($priv / 100 > 7 ) return false;
	if (($priv / 10) % 10 > 7) return false;
	if ($priv % 10 > 7) return false;
	return true;
}

// strip HTML tags and bad words
function censor($text) {

	if (is_array($text)) {
		if (!empty($text['content'])) {
		//	$text['content'] = texturize($text['content']);
			$text['content'] = balance_tags($text['content']);
		//	$text['content'] = text2html($text['content']);
		}

		if (!empty($text['title'])) {
			$text['title'] = htmlspecialchars($text['title']);
		}
	}
	
	// str_replace can dive into array
	// $text = filter_html($text);
	
	if (check_bad_word($text)) {
		window::error('对不起，此言论中含有不和谐内容，无法发表');
	}
	
	return $text;
}

function text2html($str) {
	$str = str_replace("\r\n", "\n", $str);
	$str = str_replace("\n", '<p>', $str);
	return $str;
}

/* 过滤危险html */
function filter_html( $str ) {
	/* 过滤style标签 */
	return preg_replace_callback(
			/* 过滤style标签内容 */
			'/(\<\s*style[^\>]*\>)((?:(?!\<\s*\/\s*style\s*\>).)*)(\<\s*\/\s*style\s*\>)?/i',
			create_function('$str', 'return $str[1] . filter_css($str[2]) . $str[3];'),
			preg_replace(
				array(
					/* 删除html注释 */
					'/\<\!\-\-.*?\-\-\>/i',
					/* 删除标签：script、link、object、embed、iframe、frame、frameset */
					'/\<\s*(script|object|embed|link|i?frame(set)?)[^\>]*\>(.*?\<\s*\/\s*\\1\s*\>)?/i'
					/* 删除事件、javascript协议、css表达式 */
				//	I'd like to reserve this for advanced users...
				//	'/\<[^\>]+((on[a-z]+\s*\=|(javascript|vbscript|behavior)\s*\:[^\;\"\\\']|(import|expression)\s*\()[^\>]*)+\>?/i',
				),
				'',
				$str
			)
	);
}
 
/* 过滤样式正文 */
function filter_css( $str ) {
	/* 删除注释、javascript协议、表达式 */
	return preg_replace(array('/(\/\*((?!\*\/).)*\*\/|\/\*|\*\/)/i', '/(expression|import)\s*\((.*?\))?|(javascript|vbscript|behavior)\s*\:/i',), '', $str);
}

function replace_bad_tags($text) {
	$banned_tags = array('iframe', 'script', 'link', 'meta', 'ifr', 'fra', 'html', 'head', 'body');
	
	foreach ($banned_tags as $tag) {
		$text = str_replace('<'.$tag.'>', '&lt;'.$tag.'&gt;', $text);
		$text = str_replace('</'.$tag.'>', '&lt;'.$tag.'&gt;', $text);
		$text = str_replace($tag, '<span>'.$tag.'</span>', $text);
	}
	return $text;
}

function check_bad_word($text) {
	
	if (is_array($text)) {
		foreach ($text as $subtext) {
			if (check_bad_word($subtext)) {
				return true;
			}
		}
		return false;
	}
	else { // single string
	
		$banned_words = array('fuck', '他妈的', '共产党', '中共', '法轮', '民运', '台独', '藏独', '疆独', '六四', '明慧', '大纪元', '九评');
	
		foreach ($banned_words as $word) {
			if (strstr($text, $word)) {
				return true;
			}
		}
		return false;
	}
}

function authcode($string, $operation = 'DECODE', $key = '', $expiry = 0) {
	$ckey_length = 4;
	$key = md5($key != '' ? $key : getglobal('authkey'));
	$keya = md5(substr($key, 0, 16));
	$keyb = md5(substr($key, 16, 16));
	$keyc = $ckey_length ? ($operation == 'DECODE' ? substr($string, 0, $ckey_length): substr(md5(microtime()), -$ckey_length)) : '';

	$cryptkey = $keya.md5($keya.$keyc);
	$key_length = strlen($cryptkey);

	$string = $operation == 'DECODE' ? base64_decode(substr($string, $ckey_length)) : sprintf('%010d', $expiry ? $expiry + time() : 0).substr(md5($string.$keyb), 0, 16).$string;
	$string_length = strlen($string);

	$result = '';
	$box = range(0, 255);

	$rndkey = array();
	for($i = 0; $i <= 255; $i++) {
		$rndkey[$i] = ord($cryptkey[$i % $key_length]);
	}

	for($j = $i = 0; $i < 256; $i++) {
		$j = ($j + $box[$i] + $rndkey[$i]) % 256;
		$tmp = $box[$i];
		$box[$i] = $box[$j];
		$box[$j] = $tmp;
	}

	for($a = $j = $i = 0; $i < $string_length; $i++) {
		$a = ($a + 1) % 256;
		$j = ($j + $box[$a]) % 256;
		$tmp = $box[$a];
		$box[$a] = $box[$j];
		$box[$j] = $tmp;
		$result .= chr(ord($string[$i]) ^ ($box[($box[$a] + $box[$j]) % 256]));
	}

	if($operation == 'DECODE') {
		if((substr($result, 0, 10) == 0 || substr($result, 0, 10) - time() > 0) && substr($result, 10, 16) == substr(md5(substr($result, 26).$keyb), 0, 16)) {
			return substr($result, 26);
		} else {
			return '';
		}
	} else {
		return $keyc.str_replace('=', '', base64_encode($result));
	}

}

function formhash($specialadd = '') {
	global $_G;
	$hashadd = defined('IN_ADMINCP') ? 'Only For Discuz! Admin Control Panel' : '';
	return substr(md5(substr($_G['timestamp'], 0, -7).$_G['username'].$_G['uid'].$_G['authkey'].$hashadd.$specialadd), 8, 8);
}

function modauthkey($id) {
	global $_G;
	return md5($_G['username'].$_G['uid'].$_G['authkey'].substr(TIMESTAMP, 0, -7).$id);
}

function check_seccode($value, $idhash) {
	global $_G;
	if(!$_G['setting']['seccodestatus']) {
		return true;
	}
	if(!isset($_G['cookie']['seccode'.$idhash])) {
		return false;
	}
	list($checkvalue, $checktime, $checkidhash, $checkformhash) = explode("\t", authcode($_G['cookie']['seccode'.$idhash], 'DECODE', $_G['config']['security']['authkey']));
	return $checkvalue == strtoupper($value) && TIMESTAMP - 180 > $checktime && $checkidhash == $idhash && FORMHASH == $checkformhash;
}

function check_secqaa($value, $idhash) {
	global $_G;
	if(!$_G['setting']['secqaa']) {
		return true;
	}
	if(!isset($_G['cookie']['secqaa'.$idhash])) {
		return false;
	}
	loadcache('secqaa');
	list($checkvalue, $checktime, $checkidhash, $checkformhash) = explode("\t", authcode($_G['cookie']['secqaa'.$idhash], 'DECODE', $_G['config']['security']['authkey']));
	return $checkvalue == md5($value) && TIMESTAMP - 180 > $checktime && $checkidhash == $idhash && FORMHASH == $checkformhash;
}

?>
