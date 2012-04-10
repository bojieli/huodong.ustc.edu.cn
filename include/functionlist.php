<?php
// for developers only
// This file lists major functions.
function string {
	function redirect($url, $timeout = 0) {}
	function redirect2home() {}
	function redirect2object($path = CURRENT_PATH) {}
	function link2home($user = CURRENT_USER) {}
	function link2user($userid, $username = '') {}
	function gaddslashes($string) {}
	function ghtmlspecialchars($string) {}
	function gstrpos($string, &$arr, $returnvalue = false) {}
	function strrstr($haystack, $needle) {}
	function isip($ip) {}
	function isemail($email) {}
	function isvarname($varname) {}
	function isattrname($attrname) {}
	function isfuncname($funcname) {}
	function ismethodname($methodname) {}
	function ispath($path) {}
	function random($length, $numeric = 0) {}
	function gstrlen($str) {}
	function cutstr($string, $length, $dot = ' ...') {}
	function gstripslashes($string) {}
	function size_format( $bytes, $decimals = 0 ) {}
	function is_serialized( $data ) {}
	function texturize($pee, $br = 1) {}
	function balance_tags( $text ) {}
}	

function security {
	function init_priv() {}
	function check_priv($object_path, $opreation = PRIV_READ, $user = CURRENT_USER) {}
	function check_inherit_priv($object_path, $operation = PRIV_READ, $user = CURRENT_USER) {}
	function get_priv($priv_value, &$adminlist, &$memberlist, $path = CURRENT_PATH, $user = CURRENT_USER) {}
	function priv_ingroup($user, $group) {}
	function is_valid_priv($priv) {}
	function censor($text) {}
	function replace_bad_tags($text) {}
	function check_bad_word($text) {}
	function authcode($string, $operation = 'DECODE', $key = '', $expiry = 0) {}
}

function template {
	function extract_condition(&$template, $startpos, &$endpos) {}
	function condition2sql($condition) {}
	function sql2condition($sql) {}
	function check_condition($condition = array(), $curr_path) {}
	function parse_tags($tag, &$template, &$condition, $self_closed = false) {}
	function parse_if($template, $curr_path) {}
	function parse_for($template, $curr_path) {}
	function parse_ref($template, $curr_path) {}
	function parse_include($template, $curr_path) {}
	function parse_event($template, $curr_path) {}
	function parse_call($template, $curr_path) {}
	function parse_eval($template, $curr_path) {}
	function parse_set($template, $curr_path) {}
	function find_closed_tag(&$template, $begin_tag, $end_tag, $start) {}
	function parse_template($template, $curr_path = '.') {}
	function old_parse_template($template, $curr_path = '.') {}
}

function io {
	function gsetcookie($var, $value = '', $life = 0, $prefix = 1, $httponly = false) {}
	function output_ajax() {}
}
