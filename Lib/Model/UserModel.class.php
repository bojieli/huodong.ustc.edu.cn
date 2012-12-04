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
            $_G['sid'] = $this->getSid($uid);
        } else {
            $_G['uid'] = 0;
            $_G['realname'] = '';
            $_G['sid'] = 0;
        }
        define('CURRENT_USER', $_G['uid']);
    }
    function loginLog($uid)
    {
        $log = array();
        $log['uid'] = $uid;
        $log['ip'] = get_client_ip();
        $log['time'] = time();

        M('Login_log')->add($log);
    }
    function checkLogin()
    {
        global $_G;
        if(empty($_G['uid'])) {
            return false;
        }
        else{
            return true;//已登录
        }
    }
    function getRealname($uid)
    {
        return $this->find($uid)['realname'];
    }
    function getSid($uid)
    {
        return $this->find($uid)['sid'];
    }
	function is_telephone_existed($telephone)
	{
		if (M('User')->where(array('telephone' => $telephone))->count()) {
            return true;
        }
        return false;
	}
    function is_loginname_existed($email)
    {
        if (M('User')->where(array('email' => $email))->count()) {
            return true;
        }
        return false;
    }
    function getUserMail($uid){
		return M('User')->field('email')->where(['uid'=>$uid])->find()['email'];
	}
 	function getUidWithMail($mail)
    {
        return M('User')->field('uid')->where(array('email'=>$mail))->find()['uid'];
    }
    function getBackPassWithEmail($uid)
    {
        //echo 1213;
        $str=$uid.'@'.time().'@'.mt_rand();
        $mail_md5=md5(md5(($str)));
		if(D('User_password')->field('uid')->where(array('uid'=>$uid))->find())
        {
            $data=array(
                    'mail_md5'=>$mail_md5,
                    'mail_time'=>time(),
                    );
            
			return D('User_password')->where(array('uid'=>$uid))->data($data)->save();
        }
        else
        {
            $data=array(
                    'uid'=>$uid,
                    'mail_md5'=>$mail_md5,
                    'mail_time'=>time(),
                    );
            D('User_password')->data($data)->add();
        }
		return 0;
    }
    function getMailPwInfo($uid)	{
        return M('User_password')->find($uid);
    }
    function getPwByMd5($mail_md5){
        return M('User_password')->field('uid')->where(array('mail_md5'=>$mail_md5))->find()['uid'];
    }
    function delPw($uid){
        return M('User_password')->where(array('uid'=>$uid))->delete();
    }
    function changePassword($pw)
    {   
        global $_G;
        $user=$this->find($_G['uid']);
        $password = md5(md5($pw).$user[salt]);
        $cond = array('uid'=>$_G[uid],'password'=>$password);
        $this->save($cond);
        return true;
    }
    function changePassword_direct($uid,$pw)
    {   
        $user=$this->find($uid);
        $password = md5(md5($pw).$user[salt]);
        $cond = array('password'=>$password);
        $this->where(array('uid'=>$uid))->save($cond);
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
            $user = $this->where(array('uid'=>$username))->select();
        else
            $user = $this->where(array('email'=>$username))->select();
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
    public function setAvatarTmp($uid,$avatar_name)
    {
        $info = $this->find($uid);
        if(!empty($info[avatar_tmp]))
        {
            @unlink('./upload/avatar/'.$info[avatar_tmp]);
            $cond = array('uid'=>$uid,'avatar_tmp'=>'');
            $this->save($cond);
        }
        $info = array('uid'=>$uid,'avatar_tmp'=>$avatar_name);
        $this->save($info);
    }
    public function setAvatar($uid,$avatar_name)
    {
        $info = $this->find($uid);
        if(!empty($info[avatar]))
        {
            @unlink('./upload/avatar/'.$info[avatar]);
            @unlink('./upload/avatar/small_'.$info[avatar]);
            @unlink('./upload/avatar/big_'.$info[avatar]);
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
        $size = in_array($size, array('','big','small')) ? $size : 'small';
        if(empty($info[avatar])){
            if(empty($size)||$size=='big')
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
                if(!file_exists($avatar))
                {
                    $avatar = C('AVATAR_PATH').$info[avatar];
                }

            }
        }
        return $avatar;
    }
    public function getAvatarTmpName($uid,$size='')
    {
        $info = $this->find($uid);
        return $info[avatar_tmp];
    }
    public function getInfo($uid){
        $user_info = $this->find($uid);
		if(empty($user_info))
		{
			return false;
		}
        if($user_info['sid'])
        {
            $user_info['school'] = M('School')->result_first("select name from ustc_school where sid = ".$user_info['sid']);
        }
        $user_info['sex']=$user_info['gender']==1?'男':'女';
        $user_info['student_no'] = strtoupper($user_info[student_no]);
        $user_info['avatar'] = $this->getAvatar($uid);
        $user_info['small_avatar'] = $this->getAvatar($uid, "small");
        $user_info['big_avatar'] = $this->getAvatar($uid, "big");
        return $user_info;
    }

    public function isDeveloper($uid) {
        $info = $this->field('isdeveloper')->find($uid);
        return !empty($info) && $info['isdeveloper'];
    }

    public function isSchoolAdmin($uid,$s_id) {
        $info = $this->field(array('isdeveloper', 'isschooladm'))->find($uid);
        $sid = isset($_REQUEST['sid'])?$_REQUEST['sid']:$s_id;
        $gid = $_REQUEST['gid'];
        $aid = $_REQUEST['aid'];
        if (empty($info))
            return false;
        if ($info['isdeveloper'])
            return true;
        if ($info['isschooladm']) { // is it in the same school?
            $user = M('User')->field('sid')->find($uid);
            if(isset($sid))
            {
                $club['sid']=$sid;
            }
            else if(isset($gid))
                $club = M('Club')->field('sid')->find($gid);
            else if (isset($aid)) {
                $poster = M('Poster')->field('gid')->find($aid);
                $club = M('Club')->field('sid')->find($poster['gid']);
            }
            else // cannot determine what school
                return false;

            if ($user['sid'] == $club['sid'])
                return true;
        }
        return false;
    }

    public function getImageInfo($img) {

        $imageInfo = getimagesize($img);
        if ($imageInfo !== false) {
            $imageType = strtolower(substr(image_type_to_extension($imageInfo[2]), 1));
            $imageSize = filesize($img);
            $info = array(
                    "width" => $imageInfo[0],
                    "height" => $imageInfo[1],
                    "type" => $imageType,
                    "size" => $imageSize,
                    "mime" => $imageInfo['mime']
                    );
            return $info;
        } else {
            return false;
        }
    }

    public function thumb($image, $thumbname, $type='',$x,$y,$w,$h, $maxWidth=200, $maxHeight=50, $interlace=true) {
        // 获取原图信息
        $info = $this->getImageInfo($image);
        if ($info !== false) {
            $type = empty($type) ? $info['type'] : $type;
            $type = strtolower($type);
            $interlace = $interlace ? 1 : 0;
            unset($info);


            // 载入原图
            $createFun = 'ImageCreateFrom' . ($type == 'jpg' ? 'jpeg' : $type);
            $srcImg = $createFun($image);

            //创建缩略图
            if ($type != 'gif' && function_exists('imagecreatetruecolor'))
                $thumbImg = imagecreatetruecolor($maxWidth, $maxHeight);
            else
                $thumbImg = imagecreate($maxWidth, $maxHeight);

            // 复制图片
            if (function_exists("ImageCopyResampled"))
                imagecopyresampled($thumbImg, $srcImg, 0, 0, $x, $y, $maxWidth, $maxHeight, $w, $h);
            else
                imagecopyresized($thumbImg, $srcImg, 0, 0, $x, $y, $maxWidth, $maxHeight, $w, $h);

            if ('gif' == $type || 'png' == $type) {
                $trnprt_indx = imagecolortransparent($srcImg);

                // If we have a specific transparent color
                if ($trnprt_indx >= 0) {
                    // Get the original image's transparent color's RGB values
                    $trnprt_color    = imagecolorsforindex($srcImg, $trnprt_indx);
                    // Allocate the same color in the new image resource
                    $trnprt_indx    = imagecolorallocate($thumbImg, $trnprt_color['red'], $trnprt_color['green'], $trnprt_color['blue']);
                    // Completely fill the background of the new image with allocated color.
                    imagefill($thumbImg, 0, 0, $trnprt_indx);
                    // Set the background color for new image to transparent
                    imagecolortransparent($thumbImg, $trnprt_indx);
                }
                // Always make a transparent background color for PNGs that don't have one allocated already
                elseif ('png' == $type) {
                    // Turn off transparency blending (temporarily)
                    imagealphablending($thumbImg, false);
                    // Create a new transparent color for image
                    $color = imagecolorallocatealpha($thumbImg, 0, 0, 0, 127);
                    // Completely fill the background of the new image with allocated color.
                    imagefill($thumbImg, 0, 0, $color);
                    // Restore transparency blending
                    imagesavealpha($thumbImg, true);
                }

                /* ThinkPHP original
                //imagealphablending($thumbImg, false);//取消默认的混色模式
                //imagesavealpha($thumbImg,true);//设定保存完整的 alpha 通道信息
                $background_color = imagecolorallocate($thumbImg, 0, 255, 0);  //  指派一个绿色
                imagecolortransparent($thumbImg, $background_color);  //  设置为透明色，若注释掉该行则输出绿色的图
                 */
            }

            // 对jpeg图形设置隔行扫描
            if ('jpg' == $type || 'jpeg' == $type)
                imageinterlace($thumbImg, $interlace);

            // 生成图片
            $imageFun = 'image' . ($type == 'jpg' ? 'jpeg' : $type);
            $imageFun($thumbImg, $thumbname);
            imagedestroy($thumbImg);
            imagedestroy($srcImg);
            return $thumbname;
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
	/*public function change_online_status($status,$uid){//0->离线;1->在线;2->隐身
			global $_G;
			//dump($uid);
			$uid = empty($_G['uid'])?$uid:$_G['uid'];
			$data['isonline']=$status;
			//dump($data);
			M('User')->where(array('uid'=>$uid))->data($data)->save();
			//dump(M('User')->getLastSql());
			//die;
			
	}
	public function get_online_status(){
		global $_G;
		return M('User')->field('isonline')->where(array('uid'=>$_G['uid']))->find()['isonline'];
	}*/
}
?>
