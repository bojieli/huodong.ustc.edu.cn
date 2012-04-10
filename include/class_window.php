<?php
// include/class_window.php 2011-08-09 boj
// control float window (javascript)

class window {
	
	function error($msg, $redirect = '', $timeout = '') {
		window::_display(window::_gen_html('error', $msg));
		if (!empty($redirect)) {
			redirect($redirect, $timeout);
		}
		exit();
	}
	
	function warning($msg, $redirect = '', $timeout = '') {
		window::_display(window::_gen_html('warning', $msg));
		if (!empty($redirect)) {
			redirect($redirect, $timeout);
		}
		exit();
	}
	
	function info($msg, $redirect = '', $timeout = '') {
		window::_display(window::_gen_html('info', $msg));
		if (!empty($redirect)) {
			redirect($redirect, $timeout);
		}
		exit();
	}
	
	function ok($msg, $redirect = '', $timeout = '') {
		window::_display(window::_gen_html('ok', $msg));
		if (!empty($redirect)) {
			redirect($redirect, $timeout);
		}
		exit();
	}
	
	function show($msg) {
	}
	
	function _gen_html($class, $msg) {
		return '<div class="alert"><img src="/static/images/'.$class.'.gif" alt="'.$class.'" /><p>'.$msg.'</p><hr /><button onclick="history.go(-1);">点此返回</button></div>';
	}
	
	function _display($html) {
		if (defined('HEADER')) {
			echo $html;
		} else {
			require modulefile('common', 'header');
			echo $html;
			require modulefile('common', 'footer');
		}
	}
}
