<?php
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
		
		global $_G;
		$_G['timestamp']=time();
		list ($password, $uid) = explode("\t", $this->authcode(cookie('auth'), 'DECODE'));
		if (is_numeric($uid) && $uid >= 1) {
			$_G['uid'] = $uid;
			$_G['realname'] = $this->getRealname($uid);
		} else {
			$_G['uid'] = 0;
			$_G['realname'] = '';
		}
		define('CURRENT_USER', $_G['uid']);
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
        function changePassword($pw)
        {   
                global $_G;
                $user=$this->where("uid=".$_G[uid])->select();
                $password = md5(md5($pw).$user[0][salt]);
                $cond = array('uid'=>$_G[uid],'password'=>$password);
                $this->save($cond);
                return true;
        }

	public function getClubs($uid) {
		return $this->__getClub($uid, false);
	}

	public function getApplies($uid) {
		return $this->__getClub($uid, true);
	}

	private function __getClub($uid, $allow_inactive) {
		if (!is_numeric($uid))
			return null;
		$clubs = M()->query("SELECT ug.uid, ug.gid, ug.title, g.name FROM ustc_user_group AS ug, ustc_club AS g WHERE ug.uid = '$uid' AND ug.gid = g.gid AND ug.priv" .($allow_inactive ? '=' : '!='). "'inactive'");
		return $clubs;
	}
	
	public function delsession($uid){
		$session=M('Session');
		$session->where(array('uid'=>$uid))->delete();
	}
	public function insertsession($arr){
		global $_G;
		$session=M('Session');
		$cond="uid='".addslashes($arr[uid])
			."' AND email='".addslashes($arr[username])
			."' OR lastactivity<".($_G[timestamp]-C('ONLINE_HOLD'));
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
	public function getpassport($username,$pw,$type='email'){
		$user = array();
		if ($type == 'uid')
			$user = $this->where("uid='".$username."'")->select();
		else
			$user = $this->where("email='".$username."'")->select();
		// echo $this->getLastSql();
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

        public function setAvatar($uid,$avatar_name)
        {
                $info= $this->where(array('uid',$uid))->limit(1)->select();
                if(!empty($info[0][avatar]))
                {
                        @unlink('./upload/avatar/'.$info[0][avatar]);
                        @unlink('./upload/avatar/small_'.$info[0][avatar]);
                        $cond = array('uid'=>$uid,'avatar'=>'');
                        $this->save($cond);
                }
                $info = array('uid'=>$uid,'avatar'=>$avatar_name);
                $this->save($info);
        }
        public function setAvatarName()
        {
                global $_G;
                return md5(time()).$_G[uid];
        }
        public function getAvatar($uid,$size=''){
                $info = $this->find($uid);
                $size = in_array($size, array('','small')) ? $size : 'small';
                if(empty($info[avatar])){
                        if(empty($size))
                        {
                                $avatar = C('AVATAR_PATH')."noavatar_big.gif";
                        }
                        else
                        {
                                $avatar = C('AVATAR_PATH')."noavatar_small.gif";
                        }
                }else{
                        if(empty($size))
                        {
                                $avatar = C('AVATAR_PATH').$info[avatar];
                        }
                        else
                        {
                                $avatar = C('AVATAR_PATH').$size.'_'.$info[avatar];
                        }
                }
                return $avatar;
        }

	public function getInfo($uid){
		$user_info = $this->find($uid);
		$user_info[avatar] = $this->getAvatar($uid);
		$user_info[small_avatar] = $this->getAvatar($uid, "small");
		return $user_info;
	}

	public function isDeveloper($uid) {
		$info = $this->field('isdeveloper')->find($uid);
		return !empty($info) && $info['isdeveloper'];
	}

	public function isSchoolAdmin($uid) {
		$info = $this->field(array('isdeveloper', 'isschooladm'))->find($uid);
		if (empty($info))
			return false;
		if ($info['isdeveloper'])
			return true;
		if ($info['isschooladm']) { // is it in the same school?
			$user = M('User')->field('sid')->find($uid);
			if (isset($_GET['gid']))
				$club = M('Club')->field('sid')->find($_GET['gid']);
			else if (isset($_GET['aid'])) {
				$poster = M('Poster')->field('gid')->find($_GET['aid']);
				$club = M('Club')->field('sid')->find($poster['gid']);
			}
			else // cannot determine what school
				return false;

			if ($user['sid'] == $club['sid'])
				return true;
		}
		return false;
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
}
?>
