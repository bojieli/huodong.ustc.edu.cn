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
		global $_G;
		$_G[timestamp]=time();
		list ($password, $uid) = explode("\t", $this->authcode(cookie('auth'), 'DECODE'));
		$_G['uid']=$uid;
		$_G['realname']=$this->getRealname($uid);

	}
	function getRealname($uid)
	{
		$res= $this->where("uid = $uid")->limit(1)->select();
		return($res[0][realname]);
	}
	function is_loginname_existed($email)
	{
		if (M('User')->where("email = '$email'")->count('uid')) {
			return true;
		}
		return false;
	}
	
	public function delsession($uid){
		$session=M('Session');
		$session->where('uid='.$uid)->delete();
	}
	public function insertsession($arr){
		global $_G;
		$session=M('Session');
		$cond='uid='.$arr[uid]
			." and email='".$arr[username]
			." OR lastactivity<".($_G[timestamp]-C('ONLINE_HOLD'));
		$session->where($cond)->delete();
		$ip = get_client_ip(); 
		$data=array(
			'uid'=>$arr[uid],
			'email'=>$arr[username],
			'password'=>$arr[password],
			'lastactivity'=>$_G[timestamp],
			'ip'=>$ip
		);
		if(empty($data[uid])||empty($data[email])){
			return;
		}
		$session->add($data);
		//echo $session->getLastSql();
	}
	public function getpassport($username,$pw){
		$uc=M('User');
		$user=$uc->where("email='".$username."'")->select();
		if(empty($user)){
			return -1;
		}
		$user=$user[0];
		$passwordmd5=preg_match('/^\w{32}$/', $pw) ? $pw : md5($pw);
		if($user['password'] != md5($passwordmd5.$user['salt'])){
			return -2;
		}
		//dump($res);
		//echo $uc->getLastSql();
		return array('uid'=>$user[uid],'password'=>$pw,'username'=>$username);
	}
	public function getAvatar($uid,$size='middle',$type=''){
		$info= $this->where("uid=".$uid)->limit(1)->select();
		$size = in_array($size, array('big', 'middle', 'small')) ? $size : 'middle';
		if($info[avatar]==0){
			$avatar='../UCenter/upload/images/noavatar_'.$size.'.gif';
		}else{
			$avatar = '../UCenter/upload/data/avatar/'.$this->get_avatar($uid, $size, $type);
		}
		return $avatar;
	}
	public function getInfo($uid,$field='name'){
		$res= $this->where("uid = $uid")->limit(1)->select();
		return($res[0]);
	}
	private function get_avatar($uid, $size = 'middle', $type = '') {
		$size = in_array($size, array('big', 'middle', 'small')) ? $size : 'middle';
		$uid = abs(intval($uid));
		$uid = sprintf("%09d", $uid);
		$dir1 = substr($uid, 0, 3);
		$dir2 = substr($uid, 3, 2);
		$dir3 = substr($uid, 5, 2);
		$typeadd = $type == 'real' ? '_real' : '';
		return $dir1.'/'.$dir2.'/'.$dir3.'/'.substr($uid, -2).$typeadd."_avatar_$size.jpg";
	}
//字符串解密加密
	public function authcode($string, $operation = 'DECODE', $key = '', $expiry = 0) {

		$ckey_length = 4; // 随机密钥长度 取值 0-32;
		// 加入随机密钥，可以令密文无任何规律，即便是原文和密钥完全相同，加密结果也会每次不同，增大破解难度。
		// 取值越大，密文变动规律越大，密文变化 = 16 的 $ckey_length 次方
		// 当此值为 0 时，则不产生随机密钥

		$key = md5($key ? $key : C('UC_KEY'));
		$keya = md5(substr($key, 0, 16));
		$keyb = md5(substr($key, 16, 16));
		$keyc = $ckey_length ? ($operation == 'DECODE' ? substr($string, 0, $ckey_length) : substr(md5(microtime()), - $ckey_length)) : '';

		$cryptkey = $keya . md5($keya . $keyc);
		$key_length = strlen($cryptkey);

		$string = $operation == 'DECODE' ? base64_decode(substr($string, $ckey_length)) : sprintf('%010d', $expiry ? $expiry +time() : 0) . substr(md5($string . $keyb), 0, 16) . $string;
		$string_length = strlen($string);

		$result = '';
		$box = range(0, 255);

		$rndkey = array ();
		for ($i = 0; $i <= 255; $i++) {
			$rndkey[$i] = ord($cryptkey[$i % $key_length]);
		}

		for ($j = $i = 0; $i < 256; $i++) {
			$j = ($j + $box[$i] + $rndkey[$i]) % 256;
			$tmp = $box[$i];
			$box[$i] = $box[$j];
			$box[$j] = $tmp;
		}

		for ($a = $j = $i = 0; $i < $string_length; $i++) {
			$a = ($a +1) % 256;
			$j = ($j + $box[$a]) % 256;
			$tmp = $box[$a];
			$box[$a] = $box[$j];
			$box[$j] = $tmp;
			$result .= chr(ord($string[$i]) ^ ($box[($box[$a] + $box[$j]) % 256]));
		}

		if ($operation == 'DECODE') {
			if ((substr($result, 0, 10) == 0 || substr($result, 0, 10) - time() > 0) && substr($result, 10, 16) == substr(md5(substr($result, 26) . $keyb), 0, 16)) {
				return substr($result, 26);
			} else {
				return '';
			}
		} else {
			return $keyc . str_replace('=', '', base64_encode($result));
		}
	}
	/*
	function login($login_type, $password) {
		
		$user = M('user')->where(array('email' => $loginname))->find();
		
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
	*/
	/*function add($profile) {
	
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
	
	function addUser($data)
	{
	}
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
	}*/
}
?>
