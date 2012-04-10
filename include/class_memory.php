<?php
// include/class_memory.php 2011-07-10 boj
// memory cache

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

class memory
{
	var $config;
	var $extension = array();
	var $memory;
	var $prefix;
	var $type;
	var $keys;
	var $enable = false;

	function memory() {
		$this->extension['eaccelerator'] = function_exists('eaccelerator_get');
		$this->extension['apc'] = function_exists('apc_fetch');
		$this->extension['xcache'] = function_exists('xcache_get');
		$this->extension['memcache'] = extension_loaded('memcache');
	}

	function init($config) {

		$this->config = $config;
		$this->prefix = empty($config['prefix']) ? substr(md5($_SERVER['HTTP_HOST']), 0, 6).'_' : $config['prefix'];
		$this->keys = array();

		if($this->extension['memcache'] && !empty($config['memcache']['server'])) {
			require_once libfile('class/memcache');
			$this->memory = new discuz_memcache();
			$this->memory->init($this->config['memcache']);
			if(!$this->memory->enable) {
				$this->memory = null;
			}
		}

		if(!is_object($this->memory) && $this->extension['eaccelerator'] && $this->config['eaccelerator']) {
			require_once libfile('class/eaccelerator');
			$this->memory = new discuz_eaccelerator();
			$this->memory->init(null);
		}

		if(!is_object($this->memory) && $this->extension['xcache'] && $this->config['xcache']) {
			require_once libfile('class/xcache');
			$this->memory = new discuz_xcache();
			$this->memory->init(null);
		}

		if(!is_object($this->memory) && $this->extension['apc'] && $this->config['apc']) {
			require_once libfile('class/apc');
			$this->memory = new discuz_apc();
			$this->memory->init(null);
		}

		if(is_object($this->memory)) {
			$this->enable = true;
			$this->type = str_replace('discuz_', '', get_class($this->memory));
			$this->keys = $this->get('memory_system_keys');
			$this->keys = !is_array($this->keys) ? array() : $this->keys;
		}

	}

	function get($key) {
		$ret = null;
		if($this->enable) {
			$ret = $this->memory->get($this->_key($key));
			if(!is_array($ret)) {
				$ret = null;
				if(array_key_exists($key, $this->keys)) {
					unset($this->keys[$key]);
					$this->memory->set($this->_key('memory_system_keys'), array($this->keys));
				}
			} else {
				return $ret[0];
			}
		}
		return $ret;
	}

	function set($key, $value, $ttl = 0) {

		$ret = null;
		if($this->enable) {
			$ret = $this->memory->set($this->_key($key), array($value), $ttl);
			if($ret) {
				$this->keys[$key] = true;
				$this->memory->set($this->_key('memory_system_keys'), array($this->keys));
			}
		}
		return $ret;
	}

	function rm($key) {
		$ret = null;
		if($this->enable) {
			$ret = $this->memory->rm($this->_key($key));
			unset($this->keys[$key]);
			$this->memory->set($this->_key('memory_system_keys'), array($this->keys));
		}
		return $ret;
	}

	function clear() {
		if($this->enable && is_array($this->keys)) {
			if(method_exists($this->memory, 'clear')) {
				$this->memory->clear();
			} else {
				$this->keys['memory_system_keys'] = true;
				foreach ($this->keys as $k => $v) {
					$this->memory->rm($this->_key($k));
				}
			}
		}
		$this->keys = array();
		return true;
	}

	function _key($str) {
		return ($this->prefix).$str;
	}

}
?>
