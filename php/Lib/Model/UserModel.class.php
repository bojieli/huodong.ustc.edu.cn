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
		define('USER_NOT_ACTIVATED', -9);
		
		define('CURRENT_USER', session('uid'));
	}
	
	function login($login_type, $password) {
		
		$user = M('user')->where(['email' => $loginname])->find();
		
		switch ($user['status']) {
		case 'locked':
			return USER_LOCKED;
		case 'inactivated':
			return USER_NOT_ACTIVATED;
		case 'active':
			break;
		default:
			die('Internal Error: Unknown user status');
		}
		
		if ($this->login_too_many_times()) {
			return LOGIN_TOO_MANY_TIMES;
		}
		if (empty($user)) {
			$this->record_login($loginname, false);
			return LOGIN_NAME_NOT_EXIST;
		}
		if (md5(md5($password).$user['salt']) !== $user['password']) {
			$this->record_login($loginname, false);
			return PASSWORD_INCORRECT;
		}
		// login success
		$this->record_login($login_name, true);
		
		$user['status'] = 1;
		$user['last_login_time'] = time();
		$user['last_login_ip'] = get_client_ip();
		$user['login_count']++;
		$user->save();
		
		session('uid', $user['uid']);
		
		return 1;
	}
	
	function login_too_many_times() { // lock this ip for 5 minutes
		$count = Model()->result_first("SELECT COUNT(*) FROM ustc_login_log WHERE `ip` = '".get_client_ip()."' AND `time` > '".(time() - 300)."' AND `result` = 'failed'");
		return ($count >= 5);
	}
	
	function record_login($login_name, $result) {
		if ($result)
			$result = 'success';
		else
			$result = 'failed';
		Model()->execute("INSERT INTO ustc_login_log (`ip`, `time`, `login_name`, `result`) VALUES ('".get_client_ip()."', '".time()."', '$login_name', '$result')");
	}
	
	function logout($uid = CURRENT_USER) {
		Model()->execute("UPDATE common_user SET `isonline` = '0' WHERE `uid` = '$uid'");
		session(null);
	}
	
	function is_loginname_valid($loginname) {
		if (Model()->result_first("SELECT COUNT(*) FROM common_user WHERE `login_name` = '$loginname'")) {
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
		
		$found = Model()->result_first("SELECT COUNT(*) FROM common_user WHERE `login_name` = '$login_name'");
		if ($found) {
			return LOGIN_NAME_EXISTS;
		}
		
		Model()->execute("INSERT INTO common_user (`login_name`, `password`, `salt`, `realname`, `type`, `school`, `grade`, `dept`, `class`, `email`) VALUES ('$login_name', '$md5_password', '$salt', '$realname', '$type', '$school', '$grade', '$dept', '$class', '$email')");

		return $this->login($login_name, $password);
	}
	
	// update a user's profile
	function update($user = CURRENT_USER, $data) {
		$row = M('user')->find($user);

		if (!empty($data['login_name'])) {
			$current_login_name = $row['login_name'];
			if ($data['login_name'] != $current_login_name) { // changing login name
				if (!$this->is_loginname_valid($data['login_name'])) {
					return LOGIN_NAME_EXISTS;
				}
			}
		}
		
		if (!empty($data['password'])) { // reset password
			$salt = $row['salt'];
			if (empty($salt)) {
				return false; // unknown error
			}
			$data['password'] = md5(md5($data['password']).$salt);
		} else {
			unset($data['password']); // not update
		}
		
		foreach ($row as $key => $value) {
			if (isset($data[$key]))
				$row[$key] = $data[$key];
		}
		$this->save($row);
		return 1;
	}
	
	function getrealname($user = CURRENT_USER) {
		return Model()->result_first("SELECT realname FROM common_user WHERE `uid` = '$user'");
	}
	
	function getloginname($user = CURRENT_USER) {
		return Model()->result_first("SELECT login_name FROM common_user WHERE `uid` = '$user'");
	}	
	
	function getinfo($user = CURRENT_USER) {
		return Model()->fetch_first("SELECT * FROM common_user WHERE `uid` = '$user'");
	}
	
	function last_login_time() { // current user
		return Model()->result_first("SELECT last_login_time FROM common_user WHERE `uid` = '$user'");
	}
	
	function login_count() { // current user
		return Model()->result_first("SELECT login_count FROM common_user WHERE `uid` = '$user'");
	}
}
?>
