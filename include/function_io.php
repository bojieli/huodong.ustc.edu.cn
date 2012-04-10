<?php
function redirect($url, $timeout = 0) {
	if ($timeout === '' || !is_numeric($timeout)) {
		$timeout = 2000; // default timeout is 2 seconds
	}

	if ($timeout == 0) {
		echo "<script>window.location.href=\"$url\";</script>";
	} else { ?>
		<script>setTimeout("window.location.href='<?=$url ?>';", <?=$timeout ?>);</script>
<?php	}
}

function redirect2home() {
	redirect('/home');
}

function redirect2object($path = CURRENT_PATH) {
	redirect($path);
}

function link2home($user = CURRENT_USER) {
	return '<a href="/home/'.$user.'">'.user::getrealname($user).'</a>';
}

function alert_error($msg, $halt = true) {
	echo '<script>alert("'.$msg.'");</script>';
	if ($halt) {
		exit();
	}
}

// generate HTML link to a user
function link2user($userid, $username = '') {
	if (empty($username)) {
		$username = user::getrealname($userid);
	}
	return '<a href="/user/'.$userid.'">'.$username.'</a>';
}

function gfsockopen($url, $limit = 0, $post = '', $cookie = '', $bysocket = FALSE, $ip = '', $timeout = 15, $block = TRUE) {
	require_once libfile('function/filesock');
	return _gfsockopen($url, $limit, $post, $cookie, $bysocket, $ip, $timeout, $block);
}

function gexit($message = '') {
	echo $message;
	output();
	exit();
}

function gheader($string, $replace = true, $http_response_code = 0) {
	$islocation = substr(strtolower(trim($string)), 0, 8) == 'location';
	if(defined('IN_MOBILE') && strpos($string, 'mobile') === false && $islocation) {
		if (strpos($string, '?') === false) {
			$string = $string.'?mobile=yes';
		} else {
			if(strpos($string, '#') === false) {
				$string = $string.'&mobile=yes';
			} else {
				$str_arr = explode('#', $string);
				$str_arr[0] = $str_arr[0].'&mobile=yes';
				$string = implode('#', $str_arr);
			}
		}
	}
	$string = str_replace(array("\r", "\n"), array('', ''), $string);
	if(empty($http_response_code) || PHP_VERSION < '4.3' ) {
		@header($string, $replace);
	} else {
		@header($string, $replace, $http_response_code);
	}
	if($islocation) {
		exit();
	}
}

function gsetcookie($var, $value = '', $life = 0, $prefix = 1, $httponly = false) {

	global $_G;

	$_G['cookie'][$var] = $value;

	$var = ($prefix ? $_G['cookie']['cookiepre'] : '').$var;
	$_COOKIE[$var] = $value;

	if($value == '' || $life < 0) {
		$value = '';
		$life = -1;
	}

	$life = $life > 0 ? CURRENT_TIMESTAMP + $life : ($life < 0 ? CURRENT_TIMESTAMP - 31536000 : 0);
	$path = '/';

	setcookie($var, $value, $life, $path);
}

function getcookie($key) {
	global $_G;
	return isset($_G['cookie'][$key]) ? $_G['cookie'][$key] : '';
}

function parse_poke(&$message) {
	global $poke;
	$poke = array();
	$message = preg_replace_callback('|@([^ ]+)[ :]|', "get_poke_name", $message);
	return $poke;
}

function get_poke_name($matches) {
	global $poke;
	$name = $matches[1]; // the subpattern enclosed in ()
	$uid = DB::result_first("SELECT uid FROM common_user WHERE `realname` = '$name'");
	if (!empty($uid)) {
		$poke[] = $uid;
		return '<a href="/user/'.$uid.'">@'.$name.'</a>&nbsp;';
	}
	return "@$name&nbsp;"; // invalid name
}

function output_ajax() {
	global $_G;
	$s = ob_get_contents();
	ob_end_clean();
	$s = preg_replace("/([\\x01-\\x08\\x0b-\\x0c\\x0e-\\x1f])+/", ' ', $s);
	$s = str_replace(array(chr(0), ']]>'), array(' ', ']]&gt;'), $s);
	if(defined('DISCUZ_DEBUG') && DISCUZ_DEBUG && @include(libfile('function/debug'))) {
		function_exists('debugmessage') && $s .= debugmessage(1);
	}
	$havedomain = implode('', $_G['setting']['domain']['app']);
	if($_G['setting']['rewritestatus'] || !empty($havedomain)) {
        $s = output_replace($s);
	}
	return $s;
}

function showmessage($message, $url_forward = '', $values = array(), $extraparam = array(), $custom = 0) {
	require_once libfile('function/message');
	return dshowmessage($message, $url_forward, $values, $extraparam, $custom);
}

function submitcheck($var, $allowget = 0, $seccodecheck = 0, $secqaacheck = 0) {
	if(!getgpc($var)) {
		return FALSE;
	} else {
		global $_G;
		if(!empty($_G['gp_mobiledata'])) {
			require_once libfile('class/mobiledata');
			$mobiledata = new mobiledata();
			if($mobiledata->validator()) {
				return TRUE;
			}
		}
		if($allowget || ($_SERVER['REQUEST_METHOD'] == 'POST' && !empty($_G['gp_formhash']) && $_G['gp_formhash'] == formhash() && empty($_SERVER['HTTP_X_FLASH_VERSION']) && (empty($_SERVER['HTTP_REFERER']) ||
		preg_replace("/https?:\/\/([^\:\/]+).*/i", "\\1", $_SERVER['HTTP_REFERER']) == preg_replace("/([^\:]+).*/", "\\1", $_SERVER['HTTP_HOST'])))) {
			if(checkperm('seccode')) {
				if($secqaacheck && !check_secqaa($_G['gp_secanswer'], $_G['gp_sechash'])) {
					showmessage('submit_secqaa_invalid');
				}
				if($seccodecheck && !check_seccode($_G['gp_seccodeverify'], $_G['gp_sechash'])) {
					showmessage('submit_seccode_invalid');
				}
			}
			return TRUE;
		} else {
			showmessage('submit_invalid');
		}
	}
}

function runlog($file, $message, $halt=0) {
	global $_G;

	$nowurl = $_SERVER['REQUEST_URI']?$_SERVER['REQUEST_URI']:($_SERVER['PHP_SELF']?$_SERVER['PHP_SELF']:$_SERVER['SCRIPT_NAME']);
	$log = ggmdate($_G['timestamp'], 'Y-m-d H:i:s')."\t".$_G['clientip']."\t$_G[uid]\t{$nowurl}\t".str_replace(array("\r", "\n"), array(' ', ' '), trim($message))."\n";
	writelog($file, $log);
	if($halt) {
		exit();
	}
}

function gmkdir($dir, $mode = 0777, $makeindex = TRUE){
	if(!is_dir($dir)) {
		dmkdir(dirname($dir));
		@mkdir($dir, $mode);
		if(!empty($makeindex)) {
			@touch($dir.'/index.html'); @chmod($dir.'/index.html', 0777);
		}
	}
	return true;
}

function greferer($default = '') {
	global $_G;

	$default = empty($default) ? $GLOBALS['_t_curapp'] : '';
	$_G['referer'] = !empty($_G['gp_referer']) ? $_G['gp_referer'] : $_SERVER['HTTP_REFERER'];
	$_G['referer'] = substr($_G['referer'], -1) == '?' ? substr($_G['referer'], 0, -1) : $_G['referer'];

	if(strpos($_G['referer'], 'member.php?mod=logging')) {
		$_G['referer'] = $default;
	}
	$_G['referer'] = htmlspecialchars($_G['referer']);
	$_G['referer'] = str_replace('&amp;', '&', $_G['referer']);
	return strip_tags($_G['referer']);
}

function ftpcmd($cmd, $arg1 = '') {
	static $ftp;
	$ftpon = getglobal('setting/ftp/on');
	if(!$ftpon) {
		return $cmd == 'error' ? -101 : 0;
	} elseif($ftp == null) {
		require_once libfile('class/ftp');
		$ftp = & discuz_ftp::instance();
	}
	if(!$ftp->enabled) {
		return $ftp->error();
	} elseif($ftp->enabled && !$ftp->connectid) {
		$ftp->connect();
	}
	switch ($cmd) {
		case 'upload' : return $ftp->upload(getglobal('setting/attachdir').'/'.$arg1, $arg1); break;
		case 'delete' : return $ftp->ftp_delete($arg1); break;
		case 'close'  : return $ftp->ftp_close(); break;
		case 'error'  : return $ftp->error(); break;
		case 'object' : return $ftp; break;
		default       : return false;
	}

}

function writelog($file, $log) {
	global $_G;
	$yearmonth = dgmdate(TIMESTAMP, 'Ym', $_G['setting']['timeoffset']);
	$logdir = DISCUZ_ROOT.'./data/log/';
	$logfile = $logdir.$yearmonth.'_'.$file.'.php';
	if(@filesize($logfile) > 2048000) {
		$dir = opendir($logdir);
		$length = strlen($file);
		$maxid = $id = 0;
		while($entry = readdir($dir)) {
			if(strpos($entry, $yearmonth.'_'.$file) !== false) {
				$id = intval(substr($entry, $length + 8, -4));
				$id > $maxid && $maxid = $id;
			}
		}
		closedir($dir);

		$logfilebak = $logdir.$yearmonth.'_'.$file.'_'.($maxid + 1).'.php';
		@rename($logfile, $logfilebak);
	}
	if($fp = @fopen($logfile, 'a')) {
		@flock($fp, 2);
		$log = is_array($log) ? $log : array($log);
		foreach($log as $tmp) {
			fwrite($fp, "<?PHP exit;?>\t".str_replace(array('<?', '?>'), '', $tmp)."\n");
		}
		fclose($fp);
	}
}

/**
 * Perform a HTTP HEAD or GET request.
 *
 * If $file_path is a writable filename, this will do a GET request and write
 * the file to that path.
 *
 * @since 2.5.0
 *
 * @param string $url URL to fetch.
 * @param string|bool $file_path Optional. File path to write request to.
 * @param int $red (private) The number of Redirects followed, Upon 5 being hit, returns false.
 * @return bool|string False on failure and string of headers if HEAD request.
 */
function wp_get_http( $url, $file_path = false, $red = 1 ) {
	@set_time_limit( 60 );

	if ( $red > 5 )
		return false;

	$options = array();
	$options['redirection'] = 5;

	if ( false == $file_path )
		$options['method'] = 'HEAD';
	else
		$options['method'] = 'GET';

	$response = wp_remote_request($url, $options);

	if ( is_wp_error( $response ) )
		return false;

	$headers = wp_remote_retrieve_headers( $response );
	$headers['response'] = wp_remote_retrieve_response_code( $response );

	// WP_HTTP no longer follows redirects for HEAD requests.
	if ( 'HEAD' == $options['method'] && in_array($headers['response'], array(301, 302)) && isset( $headers['location'] ) ) {
		return wp_get_http( $headers['location'], $file_path, ++$red );
	}

	if ( false == $file_path )
		return $headers;

	// GET request - write it to the supplied filename
	$out_fp = fopen($file_path, 'w');
	if ( !$out_fp )
		return $headers;

	fwrite( $out_fp,  wp_remote_retrieve_body( $response ) );
	fclose($out_fp);
	clearstatcache();

	return $headers;
}

/**
 * Retrieve HTTP Headers from URL.
 *
 * @since 1.5.1
 *
 * @param string $url
 * @param bool $deprecated Not Used.
 * @return bool|string False on failure, headers on success.
 */
function wp_get_http_headers( $url, $deprecated = false ) {
	if ( !empty( $deprecated ) )
		_deprecated_argument( __FUNCTION__, '2.7' );

	$response = wp_remote_head( $url );

	if ( is_wp_error( $response ) )
		return false;

	return wp_remote_retrieve_headers( $response );
}

/**
 * Build URL query based on an associative and, or indexed array.
 *
 * This is a convenient function for easily building url queries. It sets the
 * separator to '&' and uses _http_build_query() function.
 *
 * @see _http_build_query() Used to build the query
 * @link http://us2.php.net/manual/en/function.http-build-query.php more on what
 *		http_build_query() does.
 *
 * @since 2.3.0
 *
 * @param array $data URL-encode key/value pairs.
 * @return string URL encoded string
 */
function build_query( $data ) {
	return _http_build_query( $data, null, '&', '', false );
}

// from php.net (modified by Mark Jaquith to behave like the native PHP5 function)
function _http_build_query($data, $prefix=null, $sep=null, $key='', $urlencode=true) {
	$ret = array();

	foreach ( (array) $data as $k => $v ) {
		if ( $urlencode)
			$k = urlencode($k);
		if ( is_int($k) && $prefix != null )
			$k = $prefix.$k;
		if ( !empty($key) )
			$k = $key . '%5B' . $k . '%5D';
		if ( $v === NULL )
			continue;
		elseif ( $v === FALSE )
			$v = '0';

		if ( is_array($v) || is_object($v) )
			array_push($ret,_http_build_query($v, '', $sep, $k, $urlencode));
		elseif ( $urlencode )
			array_push($ret, $k.'='.urlencode($v));
		else
			array_push($ret, $k.'='.$v);
	}

	if ( NULL === $sep )
		$sep = ini_get('arg_separator.output');

	return implode($sep, $ret);
}

/**
 * Retrieve a modified URL query string.
 *
 * You can rebuild the URL and append a new query variable to the URL query by
 * using this function. You can also retrieve the full URL with query data.
 *
 * Adding a single key & value or an associative array. Setting a key value to
 * emptystring removes the key. Omitting oldquery_or_uri uses the $_SERVER
 * value.
 *
 * @since 1.5.0
 *
 * @param mixed $param1 Either newkey or an associative_array
 * @param mixed $param2 Either newvalue or oldquery or uri
 * @param mixed $param3 Optional. Old query or uri
 * @return string New URL query string.
 */
function add_query_arg() {
	$ret = '';
	if ( is_array( func_get_arg(0) ) ) {
		if ( @func_num_args() < 2 || false === @func_get_arg( 1 ) )
			$uri = $_SERVER['REQUEST_URI'];
		else
			$uri = @func_get_arg( 1 );
	} else {
		if ( @func_num_args() < 3 || false === @func_get_arg( 2 ) )
			$uri = $_SERVER['REQUEST_URI'];
		else
			$uri = @func_get_arg( 2 );
	}

	if ( $frag = strstr( $uri, '#' ) )
		$uri = substr( $uri, 0, -strlen( $frag ) );
	else
		$frag = '';

	if ( preg_match( '|^https?://|i', $uri, $matches ) ) {
		$protocol = $matches[0];
		$uri = substr( $uri, strlen( $protocol ) );
	} else {
		$protocol = '';
	}

	if ( strpos( $uri, '?' ) !== false ) {
		$parts = explode( '?', $uri, 2 );
		if ( 1 == count( $parts ) ) {
			$base = '?';
			$query = $parts[0];
		} else {
			$base = $parts[0] . '?';
			$query = $parts[1];
		}
	} elseif ( !empty( $protocol ) || strpos( $uri, '=' ) === false ) {
		$base = $uri . '?';
		$query = '';
	} else {
		$base = '';
		$query = $uri;
	}

	wp_parse_str( $query, $qs );
	$qs = urlencode_deep( $qs ); // this re-URL-encodes things that were already in the query string
	if ( is_array( func_get_arg( 0 ) ) ) {
		$kayvees = func_get_arg( 0 );
		$qs = array_merge( $qs, $kayvees );
	} else {
		$qs[func_get_arg( 0 )] = func_get_arg( 1 );
	}

	foreach ( (array) $qs as $k => $v ) {
		if ( $v === false )
			unset( $qs[$k] );
	}

	$ret = build_query( $qs );
	$ret = trim( $ret, '?' );
	$ret = preg_replace( '#=(&|$)#', '$1', $ret );
	$ret = $protocol . $base . $ret . $frag;
	$ret = rtrim( $ret, '?' );
	return $ret;
}

/**
 * Removes an item or list from the query string.
 *
 * @since 1.5.0
 *
 * @param string|array $key Query key or keys to remove.
 * @param bool $query When false uses the $_SERVER value.
 * @return string New URL query string.
 */
function remove_query_arg( $key, $query=false ) {
	if ( is_array( $key ) ) { // removing multiple keys
		foreach ( $key as $k )
			$query = add_query_arg( $k, false, $query );
		return $query;
	}
	return add_query_arg( $key, false, $query );
}

/**
 * Walks the array while sanitizing the contents.
 *
 * @since 0.71
 *
 * @param array $array Array to used to walk while sanitizing contents.
 * @return array Sanitized $array.
 */
function add_magic_quotes( $array ) {
	foreach ( (array) $array as $k => $v ) {
		if ( is_array( $v ) ) {
			$array[$k] = add_magic_quotes( $v );
		} else {
			$array[$k] = addslashes( $v );
		}
	}
	return $array;
}

/**
 * HTTP request for URI to retrieve content.
 *
 * @since 1.5.1
 * @uses wp_remote_get()
 *
 * @param string $uri URI/URL of web page to retrieve.
 * @return bool|string HTTP content. False on failure.
 */
function wp_remote_fopen( $uri ) {
	$parsed_url = @parse_url( $uri );

	if ( !$parsed_url || !is_array( $parsed_url ) )
		return false;

	$options = array();
	$options['timeout'] = 10;

	$response = wp_remote_get( $uri, $options );

	if ( is_wp_error( $response ) )
		return false;

	return wp_remote_retrieve_body( $response );
}

/**
 * Retrieve the description for the HTTP status.
 *
 * @since 2.3.0
 *
 * @param int $code HTTP status code.
 * @return string Empty string if not found, or description if found.
 */
function get_status_header_desc( $code ) {
	global $wp_header_to_desc;

	$code = absint( $code );

	if ( !isset( $wp_header_to_desc ) ) {
		$wp_header_to_desc = array(
			100 => 'Continue',
			101 => 'Switching Protocols',
			102 => 'Processing',

			200 => 'OK',
			201 => 'Created',
			202 => 'Accepted',
			203 => 'Non-Authoritative Information',
			204 => 'No Content',
			205 => 'Reset Content',
			206 => 'Partial Content',
			207 => 'Multi-Status',
			226 => 'IM Used',

			300 => 'Multiple Choices',
			301 => 'Moved Permanently',
			302 => 'Found',
			303 => 'See Other',
			304 => 'Not Modified',
			305 => 'Use Proxy',
			306 => 'Reserved',
			307 => 'Temporary Redirect',

			400 => 'Bad Request',
			401 => 'Unauthorized',
			402 => 'Payment Required',
			403 => 'Forbidden',
			404 => 'Not Found',
			405 => 'Method Not Allowed',
			406 => 'Not Acceptable',
			407 => 'Proxy Authentication Required',
			408 => 'Request Timeout',
			409 => 'Conflict',
			410 => 'Gone',
			411 => 'Length Required',
			412 => 'Precondition Failed',
			413 => 'Request Entity Too Large',
			414 => 'Request-URI Too Long',
			415 => 'Unsupported Media Type',
			416 => 'Requested Range Not Satisfiable',
			417 => 'Expectation Failed',
			422 => 'Unprocessable Entity',
			423 => 'Locked',
			424 => 'Failed Dependency',
			426 => 'Upgrade Required',

			500 => 'Internal Server Error',
			501 => 'Not Implemented',
			502 => 'Bad Gateway',
			503 => 'Service Unavailable',
			504 => 'Gateway Timeout',
			505 => 'HTTP Version Not Supported',
			506 => 'Variant Also Negotiates',
			507 => 'Insufficient Storage',
			510 => 'Not Extended'
		);
	}

	if ( isset( $wp_header_to_desc[$code] ) )
		return $wp_header_to_desc[$code];
	else
		return '';
}

/**
 * Set HTTP status header.
 *
 * @since 2.0.0
 * @uses apply_filters() Calls 'status_header' on status header string, HTTP
 *		HTTP code, HTTP code description, and protocol string as separate
 *		parameters.
 *
 * @param int $header HTTP status code
 * @return unknown
 */
function status_header( $header ) {
	$text = get_status_header_desc( $header );

	if ( empty( $text ) )
		return false;

	$protocol = $_SERVER["SERVER_PROTOCOL"];
	if ( 'HTTP/1.1' != $protocol && 'HTTP/1.0' != $protocol )
		$protocol = 'HTTP/1.0';
	$status_header = "$protocol $header $text";
	if ( function_exists( 'apply_filters' ) )
		$status_header = apply_filters( 'status_header', $status_header, $header, $text, $protocol );

	return @header( $status_header, true, $header );
}

/**
 * Gets the header information to prevent caching.
 *
 * The several different headers cover the different ways cache prevention is handled
 * by different browsers
 *
 * @since 2.8.0
 *
 * @uses apply_filters()
 * @return array The associative array of header names and field values.
 */
function wp_get_nocache_headers() {
	$headers = array(
		'Expires' => 'Wed, 11 Jan 1984 05:00:00 GMT',
		'Last-Modified' => gmdate( 'D, d M Y H:i:s' ) . ' GMT',
		'Cache-Control' => 'no-cache, must-revalidate, max-age=0',
		'Pragma' => 'no-cache',
	);

	if ( function_exists('apply_filters') ) {
		$headers = (array) apply_filters('nocache_headers', $headers);
	}
	return $headers;
}

/**
 * Sets the headers to prevent caching for the different browsers.
 *
 * Different browsers support different nocache headers, so several headers must
 * be sent so that all of them get the point that no caching should occur.
 *
 * @since 2.0.0
 * @uses wp_get_nocache_headers()
 */
function nocache_headers() {
	$headers = wp_get_nocache_headers();
	foreach( $headers as $name => $field_value )
		@header("{$name}: {$field_value}");
}

/**
 * Set the headers for caching for 10 days with JavaScript content type.
 *
 * @since 2.1.0
 */
function cache_javascript_headers() {
	$expiresOffset = 864000; // 10 days
	header( "Content-Type: text/javascript; charset=" . get_bloginfo( 'charset' ) );
	header( "Vary: Accept-Encoding" ); // Handle proxies
	header( "Expires: " . gmdate( "D, d M Y H:i:s", time() + $expiresOffset ) . " GMT" );
}

/**
 * Does the specified module exist in the apache config?
 *
 * @since 2.5.0
 *
 * @param string $mod e.g. mod_rewrite
 * @param bool $default The default return value if the module is not found
 * @return bool
 */
function apache_mod_loaded($mod, $default = false) {
	global $is_apache;

	if ( !$is_apache )
		return false;

	if ( function_exists('apache_get_modules') ) {
		$mods = apache_get_modules();
		if ( in_array($mod, $mods) )
			return true;
	} elseif ( function_exists('phpinfo') ) {
			ob_start();
			phpinfo(8);
			$phpinfo = ob_get_clean();
			if ( false !== strpos($phpinfo, $mod) )
				return true;
	}
	return $default;
}

/**
 * Determine if SSL is used.
 *
 * @since 2.6.0
 *
 * @return bool True if SSL, false if not used.
 */
function is_ssl() {
	if ( isset($_SERVER['HTTPS']) ) {
		if ( 'on' == strtolower($_SERVER['HTTPS']) )
			return true;
		if ( '1' == $_SERVER['HTTPS'] )
			return true;
	} elseif ( isset($_SERVER['SERVER_PORT']) && ( '443' == $_SERVER['SERVER_PORT'] ) ) {
		return true;
	}
	return false;
}

/**
 * Whether SSL login should be forced.
 *
 * @since 2.6.0
 *
 * @param string|bool $force Optional.
 * @return bool True if forced, false if not forced.
 */
function force_ssl_login( $force = null ) {
	static $forced = false;

	if ( !is_null( $force ) ) {
		$old_forced = $forced;
		$forced = $force;
		return $old_forced;
	}

	return $forced;
}

/**
 * Whether to force SSL used for the Administration Screens.
 *
 * @since 2.6.0
 *
 * @param string|bool $force
 * @return bool True if forced, false if not forced.
 */
function force_ssl_admin( $force = null ) {
	static $forced = false;

	if ( !is_null( $force ) ) {
		$old_forced = $forced;
		$forced = $force;
		return $old_forced;
	}

	return $forced;
}

?>
