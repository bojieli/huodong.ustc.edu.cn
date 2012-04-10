<?php
// include/function_common.php 2011-07-08 boj
// functions for common uses

// Functions are categorized in following types, each stored in a separate file:
//	<filename>	<category>
//	io		advanced input/output (*)
//	security	authetication and security (*)
//	string		string functions, purify and decorate text (*)
//	datetime	date and time
//	encoding	encoding
//	language	language
//	parse		parsing mini languages syntax
//	template	parser of templates
//	script		parser of scripts
//	file		functions about files
//	code		HTML code
//	common		miscellaneous functions (do not put everything here!)
//
// Core functions which are loaded on every request are marked (*).
// Other classes are dynamicly loaded once required.
//
// When deriving from internal functions, put prefix 'g' before it,
//	for example 'addslashes' => 'gaddslashes' to perform on array.
//
// Non-stateless functions are written as classes.

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require './include/function_io.php';
require './include/function_security.php';
require './include/function_string.php';

// define constant without redefining constant
// return true if success, false if the constant have been defined to another value
function gdefine($key, $value) {
	if (defined($key)) {
		return (constant($key) == $value);
	}
	define($key, $value);
	return true;
}

// this function calls by function name
// In PHP it's a internal syntax, but we reserve this interface for migranting
//	the implementation to other languages.
function call($function, $arguments) {
	if(function_exists($function)) {
		return $function($arguments);
	}
	if(method_exists($function)) {
		return $function($arguments);
	}
	return null; // function or method not exist
}

function system_error($message, $show = true, $save = true, $halt = true) {
	require_once libfile('class/error');
	error::system_error($message, $show, $save, $halt);
}

function setglobal($key, $value, $group = null) {
	global $_G;
	$k = explode('/', $group === null ? $key : $group.'/'.$key);
	switch (count($k)) {
		case 1: $_G[$k[0]] = $value; break;
		case 2: $_G[$k[0]][$k[1]] = $value; break;
		case 3: $_G[$k[0]][$k[1]][$k[2]] = $value; break;
		case 4: $_G[$k[0]][$k[1]][$k[2]][$k[3]] = $value; break;
		case 5: $_G[$k[0]][$k[1]][$k[2]][$k[3]][$k[4]] =$value; break;
	}
	return true;
}

function getglobal($key, $group = null) {
	global $_G;
	$k = explode('/', $group === null ? $key : $group.'/'.$key);
	switch (count($k)) {
		case 1: return isset($_G[$k[0]]) ? $_G[$k[0]] : null; break;
		case 2: return isset($_G[$k[0]][$k[1]]) ? $_G[$k[0]][$k[1]] : null; break;
		case 3: return isset($_G[$k[0]][$k[1]][$k[2]]) ? $_G[$k[0]][$k[1]][$k[2]] : null; break;
		case 4: return isset($_G[$k[0]][$k[1]][$k[2]][$k[3]]) ? $_G[$k[0]][$k[1]][$k[2]][$k[3]] : null; break;
		case 5: return isset($_G[$k[0]][$k[1]][$k[2]][$k[3]][$k[4]]) ? $_G[$k[0]][$k[1]][$k[2]][$k[3]][$k[4]] : null; break;
	}
	return null;
}

function reject_robot() {
	if(IS_ROBOT) {
		exit(header("HTTP/1.1 403 Forbidden"));
	}
}

function checkrobot() {
	global $_G;
	static $spider_list = array('bot', 'crawl', 'spider' ,'slurp', 'sohu-search', 'lycos', 'robozilla');

	if(gstrpos($_G['useragent'], $spider_list)) return true;
	return false;
}

function checkmobile() {
	global $_G;
	$mobile = array();
	static $mobilebrowser_list = array('iphone', 'android', 'phone', 'mobile', 'wap', 'netfront', 'java', 'opera mobi', 'opera mini',
				'ucweb', 'windows ce', 'symbian', 'series', 'webos', 'sony', 'blackberry', 'dopod', 'nokia', 'samsung',
				'palmsource', 'xda', 'pieplus', 'meizu', 'midp', 'cldc', 'motorola', 'foma', 'docomo', 'up.browser',
				'up.link', 'blazer', 'helio', 'hosin', 'huawei', 'novarra', 'coolpad', 'webos', 'techfaith', 'palmsource',
				'alcatel', 'amoi', 'ktouch', 'nexian', 'ericsson', 'philips', 'sagem', 'wellcom', 'bunjalloo', 'maui', 'smartphone',
				'iemobile', 'spice', 'bird', 'zte-', 'longcos', 'pantech', 'gionee', 'portalmmm', 'jig browser', 'hiptop',
				'benq', 'haier', '^lct', '320x320', '240x320', '176x220');

	if(gstrpos($_G['useragent'], $mobilebrowser_list)) {
		return true;
	}
	
	static $browser_list = array('mozilla', 'chrome', 'safari', 'opera', 'm3gate', 'winwap', 'openwave', 'myop');
	if(gstrpos($_G['useragent'], $browser_list)) return false;

	if(isset($_GET['mobile']) && $_GET['mobile'] === 'yes') {
		return true;
	} else {
		return false;
	}
}

function libfile($libname, $folder = '') {
	$libpath = GEWU_ROOT.'/include';
	if (!empty($folder)) {
		$libpath .= '/'.$folder;
	}
	if(strstr($libname, '/')) {
		list($pre, $name) = explode('/', $libname);
		return "{$libpath}/{$pre}_{$name}.php";
	} else {
		return "{$libpath}/{$libname}.php";
	}
}

function modulefile($classname, $event = 'read') {
	$modpath = GEWU_ROOT.'/module';
	return "{$modpath}/{$classname}/{$event}.php";
}

function renum($array) {
	$newnums = $nums = array();
	foreach ($array as $id => $num) {
		$newnums[$num][] = $id;
		$nums[$num] = $num;
	}
	return array($nums, $newnums);
}

function sizecount($size) {
	if($size >= 1073741824) {
		$size = round($size / 1073741824 * 100) / 100 . ' GB';
	} elseif($size >= 1048576) {
		$size = round($size / 1048576 * 100) / 100 . ' MB';
	} elseif($size >= 1024) {
		$size = round($size / 1024 * 100) / 100 . ' KB';
	} else {
		$size = $size . ' Bytes';
	}
	return $size;
}

function swapclass($class1, $class2 = '') {
	static $swapc = null;
	$swapc = isset($swapc) && $swapc != $class1 ? $class1 : $class2;
	return $swapc;
}
?>
