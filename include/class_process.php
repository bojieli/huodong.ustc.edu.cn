<?php
// include/class_process.php 2011-07-10 boj
// execute process in operating system

// This class should not be created an instance.

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

class process
{
	function islocked($process, $ttl = 0) {
		$ttl = $ttl < 1 ? 600 : intval($ttl);
		if(discuz_process::_status('get', $process)) {
			return true;
		} else {
			return discuz_process::_find($process, $ttl);
		}
	}

	function unlock($process) {
		discuz_process::_status('rm', $process);
		discuz_process::_cmd('rm', $process);
	}

	function _status($action, $process) {
		static $plist = array();
		switch ($action) {
			case 'set' : $plist[$process] = true; break;
			case 'get' : return !empty($plist[$process]); break;
			case 'rm' : $plist[$process] = null; break;
			case 'clear' : $plist = array(); break;
		}
		return true;
	}

	function _find($name, $ttl) {

		if(!discuz_process::_cmd('get', $name)) {
			discuz_process::_cmd('set', $name, $ttl);
			$ret = false;
		} else {
			$ret = true;
		}
		discuz_process::_status('set', $name);
		return $ret;
	}

	function _cmd($cmd, $name, $ttl = 0) {
		static $allowmem;
		if($allowmem === null) {
			$allowmem = memory('check') == 'memcache';
		}
		if($allowmem) {
			return discuz_process::_process_cmd_memory($cmd, $name, $ttl);
		} else {
			return discuz_process::_process_cmd_db($cmd, $name, $ttl);
		}
	}

	function _process_cmd_memory($cmd, $name, $ttl = 0) {
		return memory($cmd, 'process_lock_'.$name, time(), $ttl);
	}

	function _process_cmd_db($cmd, $name, $ttl = 0) {
		$ret = '';
		switch ($cmd) {
			case 'set':
				$ret = DB::insert('common_process', array('processid' => $name, 'expiry' => time() + $ttl), false, true);
				break;
			case 'get':
				$ret = DB::fetch_first("SELECT * FROM ".DB::table('common_process')." WHERE processid='$name'");
				if(empty($ret) || $ret['expiry'] < time()) {
					$ret = false;
				} else {
					$ret = true;
				}
				break;
			case 'rm':
				$ret = DB::delete('common_process', "processid='$name' OR expiry<".time());
				break;
		}
		return $ret;
	}
}
?>
