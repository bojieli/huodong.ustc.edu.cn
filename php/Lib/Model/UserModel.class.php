<?php
// first written 2011-07-10 boj

class UserModel extends Model {
	
	function init() {
		define('SUCCESS', 1);
		define('FAILED', 0);
		define('LOGIN_NAME_EXISTS', -1);
		define('LOGIN_TOO_MANY_TIMES', -1);
		define('LOGIN_NAME_NOT_EXIST', -2);
		define('PASSWORD_INCORRECT', -3);
		define('USER_NOT_EXIST', -4);
		define('CANNOT_ADD_SELF_AS_FRIEND', -5);
		define('HAVE_BEEN_FRIEND', -6);
		define('NOT_HAVE_BEEN_FRIEND', -7);
		define('USER_LOCKED', -8);
		
		$this->fetch_info();
	}
	
	function login($login_type, $password) {
		
		$user = DB::fetch_first("SELECT uid, status, realname, password, salt, login_count FROM common_user WHERE `login_name` = '$loginname'");
		
		if ($user['status'] == -1) {
			return USER_LOCKED;
		} elseif ($user['status'] == 1) {
			// currently allow multiple logins of one user
		}
		
		if ($this->login_too_many_times()) {
			return LOGIN_TOO_MANY_TIMES;
		}
		if (empty($user)) {
			$this->record_false_login($loginname, $password);			
			return LOGIN_NAME_NOT_EXIST;		
		}
		if (md5(md5($password).$user['salt']) !== $user['password']) {
			$this->record_false_login($loginname, md5($password));			
			return PASSWORD_INCORRECT;
		}
		// login success
		$_G['last_login_time'] = DB::fetch_first("SELECT last_login_time FROM common_user WHERE `uid` = '".$user['uid']."'");
		$_G['login_count'] = $user['login_count'];
		DB::query("INSERT INTO common_login_log (`uid`, `ip`, `time`, `count`) VALUES ('".$user['uid']."', '".CURRENT_IP."', '".CURRENT_TIMESTAMP."', '".$user['login_count']."')");
		DB::query("UPDATE common_user SET `status` = '1', `last_login_time` = '".CURRENT_TIMESTAMP."', `last_login_ip` = '".CURRENT_IP."', login_count = login_count + 1 WHERE `uid` = '".$user['uid']."'");
		
		user::fetch_info(CURRENT_USER);
		
		session::create($user['uid']);
		
		return 1;
	}
	
	function login_too_many_times() { // lock this ip for 5 minutes
		$count = DB::result_first("SELECT COUNT(*) FROM common_false_login_log WHERE `ip` = '".CURRENT_IP."' AND `time` > '".(CURRENT_TIMESTAMP - 300)."'");
		return ($count >= 5);
	}
	
	function record_false_login($login_name, $password) {
		DB::query("INSERT INTO common_false_login_log (`ip`, `time`, `login_name`, `password`) VALUES ('".CURRENT_IP."', '".CURRENT_TIMESTAMP."', '$login_name', '$password')");
	}
	
	function logout($uid = CURRENT_USER) {
		DB::query("UPDATE common_user SET `status` = '0' WHERE `uid` = '$uid' AND `status` = '1'");
		// if admin locked a user while his login... Logout should not reactivate it
		session::destroy();
	}
	
	function is_loginname_valid($loginname) {
		if (DB::result_first("SELECT COUNT(*) FROM common_user WHERE `login_name` = '$loginname'")) {
			return false;
		}
		return true;
	}
	
	function add($profile) {
	
		$fields = array('login_name', 'password', 'realname', 'type', 'school', 'grade', 'dept', 'class', 'email');
		foreach ($fields as $field) {
			$$field = $profile[$field];
		}

		$salt = random(10);
		$md5_password = md5(md5($password).$salt);
		
		$found = DB::result_first("SELECT COUNT(*) FROM common_user WHERE `login_name` = '$login_name'");
		if ($found) {
			return LOGIN_NAME_EXISTS;
		}
		
		$success = DB::query("INSERT INTO common_user (`login_name`, `password`, `salt`, `realname`, `type`, `school`, `grade`, `dept`, `class`, `email`) VALUES ('$login_name', '$md5_password', '$salt', '$realname', '$type', '$school', '$grade', '$dept', '$class', '$email')");

		return user::login($login_name, $password);
	}
	
	// update a user's profile
	function update($user = CURRENT_USER, $data) {
		
		if (!empty($data['login_name'])) {
			$current_login_name = user::getloginname(CURRENT_USER);
			if ($data['login_name'] != $current_login_name) { // changing login name
				if (!user::is_loginname_valid($data['login_name'])) {
					return LOGIN_NAME_EXISTS;
				}
			}
		}
		
		if (!empty($data['password'])) {
			$salt = DB::result_first("SELECT salt FROM common_user WHERE `uid` = '$user'");
			if (empty($salt)) {
				return false; // unknown error
			}
			$data['password'] = md5(md5($data['password']).$salt);
		} else {
			unset($data['password']); // not update
		}
		
		// common attrs
		$sql = '';
		$common_attrs = array('login_name', 'password', 'realname', 'student_id', 'grade', 'dept', 'class');
		$glue = '';
		foreach ($common_attrs as $attr) {
			if (isset($data[$attr])) {
				$sql .= $glue."`$attr`='$data[$attr]'";
				$glue = ',';
				unset($data[$attr]);
			}
		}
		
		// profile
		if (!empty($data)) {
			$profile = serialize($data);
			$sql .= ",`profile`='$profile'";
		}
		
		return DB::query("UPDATE common_user SET $sql WHERE `uid` = '$user'");
	}
	
	function getrealname($user = CURRENT_USER) {
		global $_G;
		if ($user == CURRENT_USER) {
			return $_G['realname'];
		} else {
			return DB::result_first("SELECT realname FROM common_user WHERE `uid` = '$user'");
		}
	}
	
	function getloginname($user = CURRENT_USER) {
		global $_G;
		if ($user == CURRENT_USER) {
			return $_G['login_name'];
		} else {
			return DB::result_first("SELECT login_name FROM common_user WHERE `uid` = '$user'");
		}
	}	
	
	function getprofile($user = CURRENT_USER) {
		return unserialize(DB::result_first("SELECT profile FROM common_user WHERE `uid` = '$user'"));
	}
	
	function getinfo($user = CURRENT_USER) {
		return DB::fetch_first("SELECT * FROM common_user WHERE `uid` = '$user'");
	}
	
	function last_login_time() { // current user
		global $_G;
		return $_G['last_login_time'];
	}
	
	function login_count() { // current user
		global $_G;
		return $_G['login_count'];
	}
	
	function fetch_info($user = CURRENT_USER, $setglobal = true) {
		
		if (!is_numeric($user) || $user <= 0) {
			$info = array();
		} else {
			$sql = "SELECT `uid`, `login_name`, `realname`, `last_login_time`, `last_login_ip`, `login_count` FROM common_user WHERE `uid` = '$user'";
			$info = DB::fetch_first($sql);
		}
		
		if (empty($info)) {
			$info = array('uid' => '0', 'login_name' => '', 'realname' => '', 'last_login_time' => '0', 'last_login_ip' => '', 'login_count' => '0');
		}
		
		if ($setglobal) {
			global $_G;
			$_G = array_merge($_G, $info);
		}
		else return $info;
	}
	
	function get_list($action, $user = CURRENT_USER) {
		$liststr = DB::result_first("SELECT $action FROM common_user WHERE `uid` = '$user'");
		if (!empty($liststr)) {
			return unserialize($liststr);
		}
		return array(); // empty
	}
	
	function get_listen_list($user = CURRENT_USER) {
		return user::get_list('listen', $user);
	}
	
	function get_listener_list($user = CURRENT_USER) {
		return user::get_list('listener', $user);
	}

	function set_list($action, $user = CURRENT_USER, $userlist = array()) {
		if (empty($userlist)) {
			$userlist = array();
		}
		$userlist = serialize($userlist);
		return DB::query("UPDATE common_user SET `$action` = '$userlist' WHERE `uid` = '$user'");
	}
	
	function set_listen_list($user = CURRENT_USER, $userlist = array()) {
		return user::set_list('listen', $user, $userlist);
	}
	
	function set_listener_list($user = CURRENT_USER, $userlist = array()) {
		return user::set_list('listener', $user, $userlist);
	}
	
	function add_to_list($action, $user = CURRENT_USER, $new) {
		$list = user::get_list($action, $user);
		if (!in_array($new, $list)) {
			$list[] = $new;
			user::set_list($action, $user, $list);
			return true;
		}
		return false;
	}
	
	function remove_from_list($action, $user = CURRENT_USER, $old) {
		$list = user::get_list($action, $user);
		if (in_array($old, $list)) {
			foreach ($list as $index => $this_user) {
				if ($this_user == $old) {
					unset($list[$index]);
					user::set_list($action, $user, $list);
					return true;
				}
			}
		}
		return false;
	}
	
	function add_friend($user = CURRENT_USER, $friend) {
	
		if (!is_numeric($friend) || $friend == 0 || !is_numeric($user) || $user == 0) {
			return USER_NOT_EXIST;
		}
		if ($friend == $user) {
			return CANNOT_ADD_SELF_AS_FRIEND;
		}
		user::add_to_list('listen', $user, $friend);
		user::add_to_list('listener', $user, $friend);
		user::add_to_list('listen', $friend, $user);
		user::add_to_list('listener', $friend, $user);

		require_once libfile('class/message');
		$message = '我现在成为你的好友了，以后可以收到我的动态，也可以在好友列表中看到我。';
		message::send($message, '/user/'.$user, '/user/'.$friend);	
		message::send($message, '/user/'.$friend, '/user/'.$user);
		
		return 1;
	}
	
	function add_friend_from_group($user = CURRENT_USER, $group = CURRENT_PATH) {
		$members = group::getlist('member', $group);
		foreach ($members as $member) {
			user::add_friend($user, $member);
		}
	}
	
	function remove_listen($user = CURRENT_USER, $listen) {
		
		if (!is_numeric($friend) || $friend == 0 || !is_numeric($user) || $user == 0) {
			return USER_NOT_EXIST;
		}
		
		user::remove_from_list('listen', $user, $listen);
		user::remove_from_list('listener', $listen, $user);
		return 1;
	}
	
	function add_listen($user = CURRENT_USER, $listen) {
	
		if (!is_numeric($friend) || $friend == 0 || !is_numeric($user) || $user == 0) {
			return USER_NOT_EXIST;
		}
		
		user::add_to_list('listen', $user, $listen);
		user::add_to_list('listener', $listen, $user);
		return 1;
	}
	
	function find_user($realname, $student_id, $grade, $dept, $class) {
		$sql = '1';
		if (!empty($grade)) {
			$sql .= " AND `grade` = '$grade'";
		}
		if (!empty($dept)) {
			$sql .= " AND `dept` = '$dept'";
		}
		if (!empty($class)) {
			$sql .= " AND `class` = '$class'";
		}
		if (!empty($realname)) {
			$sql .= " AND `realname` LIKE '%$realname%'";
		}
		if (!empty($student_id)) {
			$sql .= " AND `student_id` LIKE '%$student_id%'";
		}
		$result = DB::fetch_all("SELECT `uid` FROM common_user WHERE $sql");
		
		$friends = array();
		foreach ($result as $user) {
			$friends[] = $user['uid'];
		}
		return $friends;
	}
	
	// get avatar link
	function avatar($user = CURRENT_USER) {
		$link = DB::result_first("SELECT avatar FROM common_user WHERE `uid` = '$user'");
		if (empty($link)) {
			return '/static/images/noavatar.gif';
		}
	}

	// get class path of a given user
	function getclasspath($user = CURRENT_USER) {
		$user = DB::fetch_first("SELECT `dept`,`grade`,`class` FROM common_user WHERE `uid` = '".CURRENT_USER."'");
		if (empty($user)) {
			return '/';
		}
		return '/'.$user['dept'].'/'.$user['grade'].'/'.$user['class'];
	}
}
?>
