<?php
// include/class_group.php 2011-07-25 boj
// group management and interface

// THIS CLASS SHOULD NOT BE CREATED AN INSTANCE

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}
/*CREATE TABLE common_group (
	`id` varchar(255) NOT NULL DEFAULT '',
	`name` varchar(255) NOT NULL DEFAULT '',
	`parent` varchar(255) NOT NULL DEFAULT '',
	`create_time` int(10) NOT NULL DEFAULT '0',
	`create_user` int(10) NOT NULL DEFAULT '0',
	`priv` smallint(3) NOT NULL DEFAULT '744',
	`admin` text NOT NULL,
	`agent` text NOT NULL,
	`member` text NOT NULL,
	`friend` text NOT NULL,
	`listen` text NOT NULL,
	`listener` text NOT NULL,
	`include` text NOT NULL,
	`profile` text NOT NULL,
	`settings` text NOT NULL,
	`public_object` varchar(255) NOT NULL DEFAULT '',
	`private_object` varchar(255) NOT NULL DEFAULT '',
	PRIMARY KEY (`id`)
);*/

class group {
	
	function init() {
		gdefine('NOT_ALLOWED', -1);
		gdefine('CHILD_NOT_ALLOWED', -1);
		gdefine('PARENT_NOT_ALLOWED', -2);
		gdefine('USER_IN', -2);
		gdefine('USER_NOT_IN', -3);
		gdefine('ACTION_UNDEFINED', -4);
		gdefine('SUCCESS', 1);
		gdefine('FAILED', 0);
	}
	
	function isinlist($user = CURRENT_USER, $userlist = '', $path = CURRENT_PATH, $list_column = 'user') {
		if (empty($userlist)) {
			return false;
		}
		if ($userlist == 'inherit') {
			$path = OBJ::get_parent($path);
			$userlist = group::_get_list($list_column, $path);
			return group::isinlist($user, $userlist, $path, $list_column);
		}
		if ($userlist == 'all') {
			return (CURRENT_USER > 0);
		}
		if (is_array($userlist)) {
			return in_array($user, $userlist);
		} else {
			return in_array($user, unserialize($userlist));
		}
	}
	
	function isin($user = CURRENT_USER, $group = CURRENT_PATH) {
		$list = group::_get_list('member', $group);
		return group::isinlist($user, $list, $group, 'member');
	}
	
	function ismember($user = CURRENT_USER, $group = CURRENT_PATH) {
		$list = group::_get_list('member', $group);
		return group::isinlist($user, $list, $group, 'member');
	}
	
	// check whether a user has admin privilege of a given object
	// note that admin privilege can be inherited
	function isadmin($user = CURRENT_USER, $group = CURRENT_PATH) {
		$list = group::_get_list('admin', $group);
		if (group::isinlist($user, $list, $group, 'admin')) {
			return true;
		} else if ($group != OBJ::get_parent($group)) {
			return group::isadmin($user, OBJ::get_parent($group));
		} else {
			return false;
		}
	}
	/*
	function isadmin($user = CURRENT_USER, $group = CURRENT_PATH) {
		$list = group::_get_list('admin', $group);
		return group::isinlist($user, $list, $group, 'admin');
	}*/
	
	function isxxx($list_column, $user = CURRENT_USER, $group = CURRENT_PATH) {
		$list = group::_get_list($list_column, $group);
		return group::isinlist($user, $list, $group, $list_column);
	}

	function getlist($action, $group = CURRENT_PATH) {
		if (in_array($action, array('admin', 'agent', 'member', 'friend', 'listen', 'listener', 'include'))) {
			if (!(group::_get_priv(CURRENT_USER, $group) & PRIV_READ)) {
				return NOT_ALLOWED;
			}
		} else {
			return ACTION_UNDEFINED;
		}
		
		return group::_get_list($action, $group);
	}
	
	function add($action, $user = CURRENT_USER, $group = CURRENT_PATH) {
		if (in_array($action, array('member', 'friend', 'listen', 'listener', 'include'))) {
			if (!(group::_get_priv(CURRENT_USER, $group) & PRIV_INSERT)) {
				return NOT_ALLOWED;
			}
		} elseif (in_array($action, array('admin', 'agent'))) {
			if (!group::isadmin(CURRENT_USER, $group)) {
				return NOT_ALLOWED;
			}
		} else {
			return ACTION_UNDEFINED;
		}
		
		$userlist = group::_get_list($action, $group);
		if (!in_array($user, $userlist)) {
			$userlist[] = $user;
			return group::_set_list($action, $group, $userlist);
		}
		else return USER_IN; // already in group
	}
	
	function remove($action, $user = CURRENT_USER, $group = CURRENT_PATH) {
		if (in_array($action, array('member', 'friend', 'listen', 'listener', 'include'))) {
			if (!(group::_get_priv(CURRENT_USER, $group) & PRIV_WRITE)) {
				return NOT_ALLOWED;
			}
		} elseif (in_array($action, array('admin', 'agent'))) {
			if (!group::isadmin(CURRENT_USER, $group)) {
				return NOT_ALLOWED;
			}
		} else {
			return ACTION_UNDEFINED;
		}
		
		$userlist = group::_get_list($action, $group);
		
		if (in_array($user, $userlist)) {
			foreach ($userlist as $index => $this_user) {
				if ($this_user == $user) {
					unset($userlist[$index]);
					break;
				}
			}
			return group::_set_list($action, $group, $userlist);
		}
		else return USER_NOT_IN;
	}
	
	function set_priv($group = CURRENT_PATH, $priv = '755') {
		if (!is_valid_priv($priv)) $priv = 755;
		return DB::update(array('priv' => $priv), $group); // privilege control is enforced in DB::update
	}
	
	function set_group_priv($group = CURRENT_PATH, $priv = '755') {
		if (!is_valid_priv($priv)) $priv = 755; 
		return DB::update(array('priv_group' => $priv), $group); // privilege control is enforced in DB::update
	}
	
	function check_priv($group = CURRENT_PATH, $priv = PRIV_READ, $user = CURRENT_USER) {
		return group::_get_priv($user, $group) & $priv;
	}
	
	/* should be moved by moving objects
	 *
	function move($child, $parent = 0) {
		if (get_priv(CURRENT_USER, $child) & PRIV_WRITE) {
			if (get_priv(CURRENT_USER, $parent) & PRIV_INSERT) {
				return DB::query("UPDATE common_group SET `parent` = '$parent' WHERE `id` = '$child'");
			}
			return CHILD_NOT_ALLOWED;
		}
		return PARENT_NOT_ALLOWED;
	}
	*/
	
	function create($parent, $priv = 755, $priv_group = 755, $admin = CURRENT_USER) {
		if (!is_numeric($parent)) {
			$parent = 0; // no parent
		}
		if (empty($priv) || !is_valid_priv($priv)) {
			$priv = 755;
		}
		if (!is_array($admin)) {
			$admin = serialize(array(CURRENT_USER));
		}
		
		if (check_priv($parent, PRIV_INSERT)) {
			DB::insert(array('parent' => $parent, 'priv' => $priv, 'admin' => $admin));
			return DB::insert_id();
		}
		return NOT_ALLOWED;
	}
	
	// WARNING : Deleting the group will also delete the object!!!
	// only administrators can delete the group
	function delete($group) {
		$group = OBJ::absolute_path($group);
		if (group::isadmin(CURRENT_USER, $group)) {
			return DB::query("DELETE FROM common_object WHERE `path` = '$group'");
		}
		return NOT_ALLOWED;
	}
	
	// ===== THE FOLLOWING FUNCTIONS ARE FOR NTERNAL USE ONLY
	
	function _get_list($attribute, $group) {
		$string = DB::result_first("SELECT `$attribute` FROM common_object WHERE `path` = '$group'");
		return empty($string) ? array() : unserialize($string);
	}
	
	function _set_list($attribute, $group, $list) {
		$string = empty($list) ? '' : serialize($list);
		return DB::query("UPDATE common_object SET `$attribute` = '$string' WHERE `path` = '$group'");
	}
	
	function _get_priv($user = CURRENT_USER, $group) {
		$priv = DB::result_first("SELECT priv_group FROM common_object WHERE `path` = '$group'");
		if (group::isadmin($user, $group)) {
			return ($priv / 100);
		}
		elseif (group::isin($user, $group)) {
			return (($priv % 100) / 10);
		}
		else {
			return ($priv % 10);
		}
	}
}
?>
