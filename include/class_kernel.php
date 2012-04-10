<?php
// include/class_kernel.php 2011-07-08 boj
// The kernel of the system which controls initialization, input/output, global attributes

// Classes are categorized as follows, each stored in a separate file:
//	<filename>	<category>
//	kernel		system kernel (initialize, basic I/O, etc) (*)
//	db		database connections (*)
//	user		operations on users (*)
//	group		operations on groups (*)
//	object		operations on objects (*)
//	message		operations on messages
//	session		session in database (*)
//	event		event dispatching (*)
//	window		control float window (javascript) (*)
//	cache		cache mechanisms, interactions with cache apps
//	search		search indexing, searching
//	file		file upload, download, management
//	network		network connections (http, ftp, socket, etc)
//	protocol	cross-server data transfer
//	error		error handler
//	tree		tree data structures processing
//	xml		XML processing
//	image		image processing
//	js		generate JavaScript
//	css		generate CSS
//
// Core classes which are loaded on every request are marked (*).
// Other classes are dynamicly loaded once required.
//
// Stateless functions are written as functions.

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require './include/function_common.php';
require './include/class_db.php';
require './include/class_session.php';
require './include/class_user.php';
require './include/class_group.php';
require './include/class_object.php';
require './include/class_event.php';
require './include/class_window.php';
require './include/class_error.php';

class kernel {
	
	var $superglobal = array(
		'GLOBALS' => 1,
		'_GET' => 1,
		'_POST' => 1,
		'_REQUEST' => 1,
		'_COOKIE' => 1,
		'_SERVER' => 1,
		'_ENV' => 1,
		'_FILES' => 1,
	);
	
	/*function &instance() {
		static $object;
		if(empty($object)) {
			$object = new kernel();
		}
		return $object;
	}*/
	
	function kernel() {
		$this->_init_env();
		$this->_init_input();
		$this->_init_output();
	}
	
	//========== INITIALIZE ==========
	
	function init() {
		$this->_init_db();
		$this->_init_session();
		$this->_init_user();
		$this->_init_group();
		$this->_init_cron();
		$this->_init_object();
		$this->_init_event();
	}
	
	function _init_env() {
		// this is a debug version, so report all errors
		error_reporting(E_ALL);
		
		if(PHP_VERSION < '5.3.0') {
			set_magic_quotes_runtime(0);
		}
		
		// whether some PHP modules are available
		define('GEWU_ROOT', substr(dirname(__FILE__), 0, -8));
		define('MAGIC_QUOTES_GPC', function_exists('get_magic_quotes_gpc') && get_magic_quotes_gpc());
		define('ICONV_ENABLE', function_exists('iconv'));
		define('MB_ENABLE', function_exists('mb_convert_encoding'));
		define('EXT_OBGZIP', function_exists('ob_gzhandler'));
		
		// fix local time
		define('TIMESTAMP', time() - 8 * 3600);
		
		// drop undefined superglobals to ensure security
		foreach ($GLOBALS as $key => $value) {
			if (!isset($this->superglobal[$key])) {
				$GLOBALS[$key] = null; unset($GLOBALS[$key]);
			}
		}
		
		// define global environment
		global $_G;
		$_G = array(
			'max_message_length' => 500, // message cannot exceed 500 bytes

			'image' => array('thumb_width' => '180', 'thumb_height' => '120'),

			'uid' => 0,
			'username' => '',
			'formhash' => '',
			'timestamp' => TIMESTAMP,
			'useragent' => '',
			'referer' => '',
			'charset' => '',
			'gzipcompress' => '',
			'authkey' => '',
			'timenow' => array(),

			'PHP_SELF' => '',
			'siteurl' => '',
			'siteroot' => '',
			'siteport' => '',

			'config' => array(),
			'setting' => array(),
			'member' => array(),
			'group' => array(),
			'cookie' => array('cookiepre' => 'GwZz_'),
			'style' => array(),
			'cache' => array(),
			'session' => array(),
			'lang' => array(),
			'my_app' => array(),
			'my_userapp' => array(),
			'mobile' => '',
			
			'common_attrnames' => array('name', 'path', 'parent', 'grandparent', 'grandgrandparent', 'author', 'author_name', 'class', 'inherit_class', 'default_child_class', 'referer', 'select_count', 'read_count', 'update_count', 'child_count', 'sub_object_count', 'next_child_id', 'create_time', 'modify_time', 'insert_time', 'access_time', 'priv', 'priv_group', 'admin', 'member', 'whitelist', 'blacklist', 'agent', 'friend', 'listen', 'listener', 'include', 'profile', 'event_handlers', 'template', 'javascript', 'css', 'script', 'credit', 'siteroot', 'note', 'draft', 'inbox', 'title', 'abstract', 'content', 'order', 'settings', 'tag', 'rate', 'listener_inherit', 'invite_code'),
			
			'default_common_attrnames' => array('class', 'inherit_class', 'default_child_class', 'priv', 'priv_group', 'admin', 'member', 'whitelist', 'blacklist', 'agent', 'friend', 'listen', 'listener', 'include', 'profile', 'event_handlers', 'template', 'javascript', 'css', 'script', 'credit', 'siteroot', 'note', 'draft', 'inbox', 'title', 'abstract', 'content', 'order', 'settings', 'tag', 'rate', 'listener_inherit', 'invite_code')
			
		);
		
		$_G['request_uri'] = $_SERVER['REQUEST_URI'];
		
		// hard coding to solve proxy problem
		if ($_SERVER['HTTP_HOST'] != 'localhost') {
			$_SERVER['HTTP_HOST'] = 'gewu.ustc.edu.cn';
		}
		
		$_G['PHP_SELF'] = htmlspecialchars($_SERVER['SCRIPT_NAME'] ? $_SERVER['SCRIPT_NAME'] : $_SERVER['PHP_SELF']);
		$_G['basefilename'] = basename($_G['PHP_SELF']);
		$sitepath = substr($_G['PHP_SELF'], 0, strrpos($_G['PHP_SELF'], '/'));
		$_G['siteurl'] = htmlspecialchars('http://'.$_SERVER['HTTP_HOST'].$sitepath.'/');

		$url = parse_url($_G['siteurl']);
		$_G['siteroot'] = isset($url['path']) ? $url['path'] : '';
		$_G['siteport'] = empty($_SERVER['SERVER_PORT']) || $_SERVER['SERVER_PORT'] == '80' ? '' : ':'.$_SERVER['SERVER_PORT'];

		if(defined('SUB_DIR')) {
			$_G['siteurl'] = str_replace(SUB_DIR, '/', $_G['siteurl']);
			$_G['siteroot'] = str_replace(SUB_DIR, '/', $_G['siteroot']);
		}

		$_G['useragent'] = strtolower($_SERVER['HTTP_USER_AGENT']);
		define('IS_ROBOT', checkrobot());
		define('IS_MOBILE', checkmobile());
		define('CURRENT_IP', $this->_get_client_ip());
		define('CURRENT_TIMESTAMP', TIMESTAMP);
		$microtimes = explode(' ', microtime());
		define('START_MICROTIME', $microtimes[0] + $microtimes[1]);
		
		// this is a bit of hack, for we assume that any integer should NOT be larger than (2<<32 - 1)
		define('INFINITY', 2147483647);

		$this->var = & $_G;
	}
	
	function _get_client_ip() {
		$ip = $_SERVER['REMOTE_ADDR'];
		if (isset($_SERVER['HTTP_X_REAL_IP'])) {
			$ip = $_SERVER['HTTP_X_REAL_IP'];
		} elseif (isset($_SERVER['HTTP_CLIENT_IP'])) {
			$ip = $_SERVER['HTTP_CLIENT_IP'];
		} elseif (isset($_SERVER['HTTP_X_FORWARDED_FOR']) && preg_match_all('#\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}#s', $_SERVER['HTTP_X_FORWARDED_FOR'], $matches)) {
			foreach ($matches[0] as $xip) {
				if (!preg_match('#^(10|172\.16|192\.168)\.#', $xip)) {
					$ip = $xip;
					break;
				}
			}
		}
		return $ip;
	}
	
	function _init_input() {

		if(!MAGIC_QUOTES_GPC) {
			$_GET = gaddslashes($_GET);
			$_POST = gaddslashes($_POST);
			$_COOKIE = gaddslashes($_COOKIE);
			$_FILES = gaddslashes($_FILES);
		}

		// merge POST method with GET to allow CLI users perform POST by GET
		// implementors should notice that there should not be identical attributes in GET and POST
		if($_SERVER['REQUEST_METHOD'] == 'GET' && !empty($_GET)) {
			$_POST = array_merge($_GET, $_POST);
		}
		
		if (ispath($_GET['path'])) {
			$_GET['path'] = strtolower($_GET['path']);
			
			// strip last '/' (/home, not /home/)
			if ($_GET['path'] != '/' && substr($_GET['path'], -1, 1) == '/') {
				$_GET['path'] = substr($_GET['path'], 0, -1);
			}
			
			// major modification 2011-08-25
			// symlink /home to /user, so user operations are unified to module/user, while /home and /user can both be used in path
			if (substr($_GET['path'], 0, 5) == '/home') {
				$_GET['path'] = '/user'.substr($_GET['path'], 5);
			}

			define('CURRENT_PATH', $_GET['path']);
			define('CURRENT_OBJECT', CURRENT_PATH);
		}
		else {
			define('CURRENT_PATH', '/');
			define('CURRENT_OBJECT', '/');
		}
		
		define('OBJECT_URL', 'http://'.$_SERVER['HTTP_HOST'].CURRENT_PATH);
		
		$this->var['page'] = empty($_GET['page']) ? 1 : max(1, intval($_GET['page']));
		
		if (!empty($_GET['event']) && isvarname($_GET['event'])) {
			$this->var['event'] = strtolower($_GET['event']);
		} elseif (!empty($_GET['action']) && isvarname($_GET['action'])) {
			$this->var['event'] = strtolower($_GET['action']);
		} else {
			$this->var['event'] = 'read';
		}
		$this->var['action'] = $this->var['event'];
		
		if (isset($_GET['inajax'])) {
			define('IN_AJAX', true);
			unset($_GET['inajax']);
		}
	}
	
	function _init_output() {

		if($_SERVER['REQUEST_METHOD'] == 'GET' && !empty($_SERVER['REQUEST_URI'])) {
			$this->_xss_check();
		}

		// enable gzip output if possible to decrease network flow
		$allowgzip = empty($_GET['inajax']) && getglobal('event') != 'file' && empty($_SERVER['HTTP_ACCEPT_ENCODING']);
		setglobal('gzipcompress', $allowgzip);
		ob_start($allowgzip ? 'ob_gzhandler' : null);

		if(!defined('CHARSET')) {
			define('CHARSET', 'utf-8');
		}
		setglobal('charset', CHARSET);
	}
	
	function _xss_check() {
		$temp = strtoupper(urldecode(urldecode($_SERVER['REQUEST_URI'])));
		if(strpos($temp, '<') !== false || strpos($temp, '"') !== false || strpos($temp, 'CONTENT-TRANSFER-ENCODING') !== false) {
			system_error('request_tainting');
		}
		return true;
	}
	
	function _init_db() {
		// currently only one database server is supported
		// Note that $db is a global attribute.
		// Using DB connection as a global is extremely DANGEROUS, enabling any unintended users who 
		//     have the privilege to add a PHP script to take full control of the database.
		// However, this PHP version is only a prototype, which will soon be superseded by the C version.
		// Furthermore, addons and plugins are non-PHP script (although seems like PHP), 
		//     disabling possible modifications of PHP source code.
		
		require_once './config/config_db.php';
		global $db;
		$db = new db_mysql($_config_db);
		$db->connect();
		
		DB::init();
	}

	function _init_session() {
		$this->session = new session();
	}
	
	function _init_user() {
		global $user;
		$user = & user::instance();
		$user->init();
	}

	function _init_group() {
		group::init();
	}
	
	function _init_cron() {
		
	}
	
	function _init_object() {
		OBJ::init();
	}
	
	function _init_event() {
		global $_EVENT;
		$_EVENT = event::instance();
		$_EVENT->init();
	}
	
	//========== HANDLE EVENT ==========
	
	// currently event system is not implemented
	function handle_event() {
	/*
		global $_EVENT;
		if (empty($_EVENT)) {
			require_once libfile('class/error');
			error::system_error("event not initialized");
		}
		while (!$_EVENT->is_queue_empty()) {
			$_EVENT->dispatch_next();
		}
	*/
	}
}
?>
