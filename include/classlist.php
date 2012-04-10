<?php
// for developers only
// This file lists all functions in major classes. Vendor-specific classes are not listed.
class OBJ {
	function init() {}
	function select($parent_object_path = '.', $attributes = '', $condition = '', $order = '', $limit = '') {}
	function count($parent_object_path = '.', $condition = '') {}
	function is_object_exist($object_path) {}
	function find($root_object_path = '.', $depth_limit = 3, $attributes = array(), $condition = '', $order = '', $limit = '') {}
	function select_class($class) {}
	function get($object_path = '.', $attributes = array()) {}
	function get_attr($object_path, $attribute_name) {}
	function read($object_path = '.') {}
	function output($object_path = '.') {}
	function set_attr($object_path = '.', $attribute = '', $value = '') {}
	function set($object_path = '.', $attributes = array()) {}
	function insert($parent_object_path = '.', $attributes = array()) {}
	function update($object_path = '.', $attributes = array()) {}
	function delete($object_path = '.') {}
	function move($source_object_path = '.', $target_object_path = '.') {}
	function get_class($object_path) {}
	function get_class_list() {}
	function get_default($class) {}
	function get_default_child_class($path = CURRENT_PATH) {}
	function update_default($class, $data) {}
	function default_common_attributes(&$attributes, &$common_attributes, &$diy_attributes) {}
	function check_priv($object_path = CURRENT_PATH, $opreation = PRIV_READ, $user = CURRENT_USER) {}
	function grant($object_path = '.', $user, $opreation = PRIV_ALL) {} // DEPRECATED
	function revoke($object_path = '.', $user, $opreation = PRIV_ALL) {} // DEPRECATED
	function get_parent($path) {}
	function absolute_path($relative_path) {}
	function get_handlers(&$event_handlers) {} // event
	function set_handlers(&$event_handlers) {} // event
	function cache_set($path, $object) {}
	function cache_get($path, $attribute) {}
	function is_cached($path, $attribute = null) {}
	function cache_unset($path) {}
	function implode_attr($attributes) {}
	function implode_key($attributes) {}
	function implode_value($attributes) {}
}

class DB {
	function init() {}
	function select($attributes = array(), $condition, $order = '', $limit = 0) {}
	function count($condition) {}
	function delete($path, $limit = 0, $unbuffered = true) {}
	function insert($data, $silent = false) {}
	function update($path, $data, $unbuffered = false, $low_priority = false) {}
	function implode_field($array, $glue = ',') {}
	function implode_field_value($array, $glue = ',') {}
	function common_attribute_names(&$attributes, &$common_attributes, &$diy_attributes) {}
	function common_attribute_values(&$attributes, &$common_attributes, &$diy_attributes) {}
	function get_next_child_id($parent) {}
	function insert_id() {}
	function fetch($resourceid, $type = MYSQL_ASSOC) {}
	function fetch_first($sql) {}
	function fetch_all($sql) {}
	function result($resourceid, $row = 0) {}
	function result_first($sql) {}
	function query($sql, $type = '') {}
	function num_rows($resourceid) {}
	function affected_rows() {}
	function free_result($query) {}
	function error() {}
	function errno() {}
	function checkquery($sql) {} // DEPRECATED
	function _do_query_safe($sql) {} // DEPRECATED
}

class group {
	function init() {}
	function isinlist($user = CURRENT_USER, $userlist = '', $path = CURRENT_PATH, $list_column = 'user') {}
	function isin($user = CURRENT_USER, $group = CURRENT_PATH) {}
	function ismember($user = CURRENT_USER, $group = CURRENT_PATH) {}
	function isadmin($user = CURRENT_USER, $group = CURRENT_PATH) {}
	function isxxx($list_column, $user = CURRENT_USER, $group = CURRENT_PATH) {}
	function getlist($action, $group = CURRENT_PATH) {}
	function add($action, $user = CURRENT_USER, $group = CURRENT_PATH) {}
	function remove($action, $user = CURRENT_USER, $group = CURRENT_PATH) {}
	function set_priv($group = CURRENT_PATH, $priv = '755') {}
	function set_group_priv($group = CURRENT_PATH, $priv = '755') {}
	function check_priv($group = CURRENT_PATH, $priv = PRIV_READ, $user = CURRENT_USER) {}
	function create($parent, $priv = 755, $priv_group = 755, $admin = CURRENT_USER) {}
	function delete($group) {}
	function _get_list($attribute, $group) {}
	function _set_list($attribute, $group, $list) {}
	function _get_priv($user = CURRENT_USER, $group) {}
}

class user {
	function init() {}
	function login($loginname, $password) {}
	function login_too_many_times() {}
	function record_false_login($login_name, $password) {}
	function logout($uid = CURRENT_USER) {}
	function is_loginname_valid($loginname) {}
	function add($loginname, $password, $realname, $school, $grade, $dept, $class) {}
	function init_home_dir($uid) {}
	function update($user = CURRENT_USER, $data) {}
	function getrealname($user = CURRENT_USER) {}
	function getloginname($user = CURRENT_USER) {}
	function getprofile($user = CURRENT_USER) {}
	function getinfo($user = CURRENT_USER) {}
	function last_login_time() {}
	function login_count() {}
	function fetch_info($user = CURRENT_USER, $setglobal = true) {}
	function get_list($action, $user = CURRENT_USER) {}
	function get_listen_list($user = CURRENT_USER) {}
	function get_listener_list($user = CURRENT_USER) {}
	function set_list($action, $user = CURRENT_USER, $userlist = array()) {}
	function set_listen_list($user = CURRENT_USER, $userlist = array()) {}
	function set_listener_list($user = CURRENT_USER, $userlist = array()) {}
	function add_to_list($action, $user = CURRENT_USER, $new) {}
	function remove_from_list($action, $user = CURRENT_USER, $old) {}
	function add_friend($user = CURRENT_USER, $friend) {}
	function add_friend_from_group($user = CURRENT_USER, $group = CURRENT_PATH) {}
	function remove_listen($user = CURRENT_USER, $listen) {}
	function add_listen($user = CURRENT_USER, $listen) {}
	function find_user($realname, $student_id, $grade, $dept, $class) {}
	function avatar($user = CURRENT_USER) {}
}

class message {
	function get($user = CURRENT_USER, $source = CURRENT_OBJECT, $from_time = 0, $to_time = CURRENT_TIMESTAMP) {}
	function update($id, $content, $source, $target, $path = CURRENT_OBJECT, $sticky = false, $important = false, $auto_forward = false, $system = false) {}
	function delete($id) {}
	function send($content, $source, $target, $path = CURRENT_OBJECT, $sticky = false, $important = false, $auto_forward = false, $system = false) {}
	function msg2sql($action, $content, $source, $target, $path = CURRENT_OBJECT, $sticky = false, $important = false, $auto_forward = false, $system = false) {}
	function forward($content, $user = CURRENT_USER, $path = CURRENT_OBJECT) {}
	function get_reply($path) {}
	function getbyid($id) {}
	function get_important($user = CURRENT_USER) {}
}

class event {
	function init() {}
	function special_class(&$event) {}
	function log_event($event) {}
	function dispatch($event = '', $arguments = array()) {}
	function dispatch_next() {}
	function init_handlers() {}
	function add_handler($event, $handler) {}
	function remove_handler($event, $handler) {}
	function get_handler($event) {}
	function get_handler_count($event) {}
	function is_handler_exist($event, $handler) {}
	function remove_event($event) {}
	function set($event, $event_args) {}
	function get(&$event_args) {}
	function is_queue_empty() {}
	function event_num_in_queue() {}
	function clear() {}
	function call($event, $arguments) {}
}

class window {
	function error($msg, $halt = true) {}
	function warning($msg, $halt = false) {}
	function info($msg, $halt = false) {}
	function ok($msg, $halt = false) {}
	function show($msg) {}
	function _gen_html($class, $msg) {}
	function _display($html) {}
}

class session {
	function session($sid = '', $ip = '', $uid = 0) {}
	function getuid($sid, $ip) {}
	function update($sid, $ip) {}
	function create($uid) {}
	function destroy() {}
	function clean() {}
	function onlinecount($type = 0) {}
}

class kernel {
	function kernel() {}
	function init() {}
	function _init_env() {}
	function _get_client_ip() {}
	function _init_input() {}
	function _init_output() {}
	function _xss_check() {}
	function _init_db() {}
	function _init_session() {}
	function _init_user() {}
	function _init_group() {}
	function _init_cron() {}
	function _init_object() {}
	function _init_event() {}
	function handle_event() {}
}
