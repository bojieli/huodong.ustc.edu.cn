<?php
class UserAction extends PublicAction {
    public function home() {
        global $_G;
        $uid = is_numeric($_GET['uid']) ? $_GET['uid'] : CURRENT_USER;
        $user = D("User");
        $user_info = $user->getInfo($uid);

        if (empty($_G['uid'])) {
            $this->assign('jumpUrl', '/User/login');
            $this->assign('waitSecond', 1);
            $this->error("您尚未登录请先登录");
        }

        if (empty($user_info['uid'])) {
            $this->assign('jumpUrl', '/User/home');
            $this->assign('waitSecond', 1);
            $this->error("该用户不存在");
        }

        $this->assign('user_info', $user_info);
        $this->assign('avatar_path', C("AVATAR_PATH"));
        $this->assign('clubs', D('User')->getClubs($uid));
        $this->assign('applies', D('User')->getApplies($uid));
		$this->assign('msg_num',D('Msg')->getUnreadMsgNum());
        $this->headnav();
        $this->display();


    }
    public function test()
    {
        if(isset($_SERVER["HTTP_X_REAL_IP"]))
        {
            $realip   =   $_SERVER["HTTP_X_REAL_IP"];   
        }
        elseif(isset($_SERVER["HTTP_X_FORWARDED_FOR"]))     
        {
            $realip   =   $_SERVER["HTTP_X_FORWARDED_FOR"];   
        }   
        elseif(isset($_SERVER["HTTP_CLIENT_IP"]))     
        {   
            $realip   =   $_SERVER["HTTP_CLIENT_IP"];   
        }   
        else     
        {   
            $realip   =   $_SERVER["REMOTE_ADDR"];   
        }   
        echo $realip."***";
        die;
    }
    public function login()
    {
        $this->display();
    }
    public function voice_login(){
            require_once 'Common/GoogleAuthenticator.php';
            $ga = new PHPGangsta_GoogleAuthenticator();
            $secret =  "YFQLAM5X3V7N75ZC";
            $oneCode= $this->_post("code");
            if(empty($oneCode)){
                return "voice_login";
            }
            $checkResult = $ga->verifyCode($secret, $oneCode, 2);    // 2 = 2*30sec clock tolerance
            if ($checkResult) {
                  $this->loginInByUid(3284);
                $this->success(array('uid' => 3284));
            } else{
                 $this->error(0);
            }
    }
    public function do_login() {
        global $_G;
        //die;
        if($_POST[submit]){
            $username=$_POST[email];
            $pw=$_POST[password];
            if(empty($username)||empty($pw)){
                $this->error('密码或用户名不能为空');
            }
            $is_md5=0;
			if(preg_match('/^\w{32}$/', $this->_post('is_md5')))
			$is_md5=1;
			$post=array(
                    'username'=>$username,
                    'password'=>$pw,
                    );
            $user=D('User');
            $passport=$user->getpassport($post[username],$post[password],'email',$is_md5);
            if(!is_array($passport)){
                $this->error('登录失败，请检查用户名和密码');
            }

            $info = D('User')->getInfo($passport['uid']);
            if ($info['status'] == 'locked')
                $this->error("您的帐号已被锁定，请联系管理员解锁");
            else if ($info['status'] == 'inactive')
                $this->error("您还没有激活，请首先点击邮件中的链接激活");
            else if ($info['status'] != 'active')
                $this->error("账户状态发生未知错误，请联系管理员");

            global $_G;

            $_G[timestamp]=empty($_G[timestamp])? time():$_G[timestamp];
            $setarr = array(
                    'uid' => $passport['uid'],
                    'username' => addslashes($passport['username']),
                    'password' => md5("$passport[uid]|$_G[timestamp]"),//本地密码随机生成

                    );         
            $user->insertsession($setarr);
            cookie('auth', $user->authcode("$setarr[password]\t$setarr[uid]", 'ENCODE'), C('COOKIE_EXPIRE'));
            cookie('loginuser', $passport['username'], C('COOKIE_EXPIRE'));
            if (!empty($_POST['referer']) && !strstr($_POST['referer'], '/User/'))
                $this->assign('jumpUrl', $_POST['referer']);
            else
                $this->assign('jumpUrl','/User/home?uid='.$passport['uid']);
            D('User')->loginLog($passport['uid']);
            $this->success('登陆成功');
        }
        else{
            $this->display('User:login');
        }
    }
    private function loginInByUid($uid){
         $user=D('User');
         $info = $user->getInfo($uid);
        if ($info['status'] == 'locked')
                $this->error("您的帐号已被锁定，请联系管理员解锁");
            else if ($info['status'] == 'inactive')
                $this->error("您还没有激活，请首先点击邮件中的链接激活");
            else if ($info['status'] != 'active')
                $this->error("账户状态发生未知错误，请联系管理员");

            global $_G;

            $_G[timestamp]=empty($_G[timestamp])? time():$_G[timestamp];
            $setarr = array(
                    'uid' => $info["uid"],
                    'username' => addslashes($info['username']),
                    'password' => md5("$info[uid]|$_G[timestamp]"),//本地密码随机生成
                    );         
            $user->insertsession($setarr);
            cookie('auth', $user->authcode("$setarr[password]\t$setarr[uid]", 'ENCODE'), C('COOKIE_EXPIRE'));
            cookie('loginuser', $setarr['username'], C('COOKIE_EXPIRE'));         
    }
    public function logout(){
        global $_G;
        if(empty($_G['uid'])) {
            echo json_encode(array('status'=>false, 'msg'=>'没有登录'));
        }
        else{
            $user=D('User');
            $passport=$user->delsession($_G[uid]);//清除session
            cookie(null);//清空cookie
			//D('User')->change_online_status(0);
            // jump to last page
            if (!empty($_SERVER['HTTP_REFERER']) && !strstr($_SERVER['HTTP_REFERER'], '/User/home'))
                $jumpUrl = $_SERVER['HTTP_REFERER'];
            else
                $jumpUrl = '/';
            echo json_encode(array('status'=>true, 'msg'=>'退出成功', 'jumpUrl'=>$jumpUrl));
        }
    }
    public function editInfo(){
        global $_G;
        if(empty($_G['uid'])) {
            $this->error('没有登录');
        }
        if(empty($_POST['realname']))
        {
            $this->error('真实姓名不能为空');
        }

        // sanitize input
        $fields = array('realname', 'gender', 'education','student_no', 'dept', 'grade','qq','telephone');
        foreach ($fields as $field)
            $info[$field] = htmlspecialchars($_POST[$field]);
        if (preg_match("|[a-zA-Z]+://([a-zA-Z0-9_-]+\.)+[\w-]+(:[0-9]+)?(/.*)?|", $_POST['homepage']))
            $info['homepage'] = $_POST['homepage'];
        elseif (preg_match("|([a-zA-Z0-9_-]+\.)+[\w-]+(:[0-9]+)?(/.*)?|", $_POST['homepage']))
            $info['homepage'] = 'http://'.$_POST['homepage'];
        elseif(empty($_POST['homepage']))
        {
            $info['homepage']='';
        }
        $info["uid"] = $_G['uid'];

        $user = D('User');
        $user->save($info);
        $this->assign('jumpUrl','/User/home');
        $this->success('修改信息成功');
    }
    public function GetbackPassword(){
        $this->display();
    }
    public function getBackPassword_do(){
        session_start();
        if($_SESSION['verify'] != md5($_POST['check'])) {
            $this->error('验证码错误');
        }
        $mail=$this->_post('email');
        $User=D('User');
        if(!$User->is_loginname_existed($mail)){$this->error("用户名不存在");}
        $uid=$User->getUidWithMail($mail);
		if($uid!=''&&$uid!=0)
        {
            $status=$User->getBackPassWithEmail($uid);
			if($status==0){$this->error('系统忙，请稍后再试！');}	
            $info['realname']=$User->getRealname($uid);
            $info['email']=$mail;
            $info['mail_md5']=$User->getMailPwInfo($uid)['mail_md5'];			
            $this->sendEmailToGetPassword($info);
            $this->success('验证邮件已发送，请三天内登录注册邮箱验证^_^');
        }
        return false;
    }
    public function changePassword2(){
        $w=$this->_get('w')?$this->_get('w'):$this->_post('w');
        $u=D('User')->getPwByMd5($w);
        if(empty($u)){$this->error('无效链接！');}
        $uid=$u;
        $info=D('User')->getMailPwInfo($uid);
        if(time()-$info['mail_time']>3*24*3600){$this->error('密码重置失效，请重新找回密码！');}
        if($_POST['submit'])
        {  
            if(empty($_POST['password_new']))
            {   
                $this->error('新密码不能为空');
            }   
            if($_POST['password_new2']!=$_POST['password_new'])
            {   
                $this->error('两次密码不一致');
            }   
            $is_md5=0;
			if(preg_match('/^\w{32}$/', $this->_post('is_md5')))
			$is_md5=1;
			$user=D('User');
            $re=$user->changePassword_direct($uid,$_POST['password_new'],$is_md5);
            $user->delPw($uid);//删掉验证成功的邮箱验证码记录
            $user->delsession($uid);//清除session
            cookie(null);//清空cookie
            $this->assign('jumpUrl','/User/login');
            $this->success('修改密码成功，请重新登录');
        }   
        else
        {   
            $this->assign('_G',$_G);
            $this->display();
        }   

    }
    private function sendEmailToGetPassword($info){
        SendMail($info['email'], "大学海报活动平台用户重置登录密码",
                "亲爱的".$info['realname'].",您好!:\n\n".
                "您申请重置活动平台账号，如非本人操作，请忽略此邮件。\n\n".
                "点击下面链接立即重置密码。（如果下面的链接无法点击，您可以将其复制，并粘帖到浏览器的地址栏中访问）\n\n".
                "http://".$_SERVER['HTTP_HOST']."/User/changePassword2?w=".$info['mail_md5']);
    }
    public function changePassword(){
        global $_G;
        $uid=$_G['uid'];
        if(empty($uid)) {
            $this->error('没有登录');
        }   
        if($_POST['submit'])
        {
            $is_md5=0;
			if(preg_match('/^\w{32}$/', $this->_post('is_md5')))
			$is_md5=1;
			$passport=D('User')->getpassport($uid,$_POST['password'],'uid',$is_md5);
            //dump($passport);
            if(!is_array($passport)){
                $this->error('原密码错误');
            }   
            if(empty($_POST['password_new']))
            {   
                $this->error('新密码不能为空');
            }   
            if($_POST['password_new2']!=$_POST['password_new'])
            {   
                $this->error('两次密码不一致');
            }   
            $user=D('User');            
			$user->changepassword($_POST['password_new'],$is_md5);
            $user->delsession($uid);//清除session
            cookie(null);//清空cookie
            $this->assign('jumpUrl','/User/login');
            $this->success('修改密码成功，请重新登录');
        }   
        else
        {   
            $this->assign('_G',$_G);
            $this->display();
        }   
    }

    public function register() {
        $this->display();
    }
	public function register2() {
		$schools = M('School')->select();
		$schools = json_encode($schools);
		$this->assign('schools', $schools);
        $this->display();
    }
    public function addUser() {
        session_start();

        $User = D("User");

        if(empty($_POST[email]))
        {
            $this->error("邮箱不能为空");
        }
        if (!preg_match("/^[a-zA-Z0-9+_.-]+$/", $_POST['email'])) {
            $this->error("请输入有效的邮箱地址");
        }
        $_POST['email']=trim($_POST['email']).'@mail.ustc.edu.cn';

        if(empty($_POST['dept']))
        {
            $this->error("学院不能为空");
        }
        $_POST['dept'] = trim($_POST['dept']);
        if(empty($_POST[student_no]))
        {
            $this->error("学号不能为空");
        }
        $_POST['student_no'] = trim($_POST['student_no']);
        if(empty($_POST[realname]))
        {
            $this->error("真实姓名不能为空");
        }
        $_POST['realname'] = trim($_POST['realname']);
        if (empty($_POST[education]))
        {
            $this->error("学历不能为空");
        }
        $_POST['education'] = trim($_POST['education']);
        if($User->is_loginname_existed($_POST['email']))
        {
            $this->error("该邮件已注册");
        }
        if(empty($_POST[password]))
        {
            $this->error("密码不能为空");
        }
        if($_POST[password]!=$_POST[password2])
        {
            $this->error("前后密码不一致");
        }
        if($_SESSION['verify'] != md5($_POST['check'])) {
            $this->error('验证码错误');
        }
        $is_md5=0;
		if(preg_match('/^\w{32}$/', $this->_post('is_md5')))
		$is_md5=1;
		$_POST[student_no] = strtoupper(trim($_POST[student_no]));
        $_POST['sid'] = 1; // currently force USTC
        $_POST['register_time']=time();
        $_POST['status'] = 'inactive'; // need email activate

        $_POST['salt'] = substr(uniqid(rand()), -6);
		if($is_md5==0) $_POST['password']=md5($_POST['password']);
		$_POST['password'] = md5($_POST['password'].$_POST['salt']);

        $User->create();
        $User->add();

        $info = $User->where(array('email'=>$_POST['email']))->find();
        if (empty($info) || !is_numeric($info['uid'])) {
            $this->error('未知错误，请重新注册');
        }

        $this->sendVerifyEmail($info);

        $this->assign('jumpUrl', '/User/login');
        $this->assign('waitSecond', 10);
        $this->success('注册成功，已经向 '.$_POST['email'].' 发送一封激活信，请点击激活信中的链接以完成注册过程。');
    }

	public function addUser2() {
        session_start();

        $User = D("User");
		$sid = $_POST['school'];
		$telephone=trim($_POST['telephone']);
		if(empty($sid))
		{
			$this->error("请选择学校");
		}
		elseif($sid!=1)
		{
			if(!preg_match('/^[1-9]\d{10}$/', trim($_POST['telephone'])))
			{
				$this->error("请输入合法的手机号");
			}
			if($User->is_telephone_existed($_POST['telephone']))
			{
				$this->error("该手机号已经验证过");
			}

		}
		//dump($_POST['telephone']);
		//die;
        if(empty($_POST['email']))
        {
            $this->error("邮箱不能为空");
        }
        if (!preg_match("/[a-zA-Z0-9+_-]+/", $_POST['email'])) {
            $this->error("请输入有效的邮箱地址");
        }

        if(empty($_POST['dept']))
        {
            $this->error("学院不能为空");
        }
        if(empty($_POST[student_no]))
        {
            $this->error("学号不能为空");
        }
        if(empty($_POST[realname]))
        {
            $this->error("真实姓名不能为空");
        }
        if (empty($_POST[education]))
        {
            $this->error("学历不能为空");
        }
        if($User->is_loginname_existed($_POST['email']))
        {
            $this->error("该邮件已注册");
        }
        if(empty($_POST[password]))
        {
            $this->error("密码不能为空");
        }
        if($_POST[password]!=$_POST[password2])
        {
            $this->error("前后密码不一致");
        }
        if($_SESSION['verify'] != md5($_POST['check'])) {
            $this->error('验证码错误');
        }
        $is_md5=0;
		if(preg_match('/^\w{32}$/', $this->_post('is_md5')))
		$is_md5=1;
		$_POST['student_no'] = strtoupper($_POST['student_no']);
        $_POST['sid'] = $sid; // currently force USTC
        $_POST['register_time']=time();
        $_POST['status'] = 'inactive'; // need email activate

        $_POST['salt'] = substr(uniqid(rand()), -6);
        if($is_md5==0) $_POST['password']=md5($_POST['password']);
		$_POST['password'] = md5($_POST['password'].$_POST['salt']);
		//$_POST['password'] = md5(md5($_POST[password]).$_POST[salt]);
        $User->create();
        $uid = $User->add();

		$info = $User->where(array('email'=>$_POST['email']))->find();
        if (empty($info) || !is_numeric($info['uid'])) {
            $this->error('未知错误，请重新注册');
        }
		if($sid==1)
		{
			$this->sendVerifyEmail($info);
			$this->assign('jumpUrl', '/User/login');
			$this->assign('waitSecond', 10);
			$this->success('注册成功，已经向 '.$_POST['email'].' 发送一封激活信，请点击激活信中的链接以完成注册过程。');
		}
		else
		{
			$verify_msg = substr(uniqid(rand()), -6);
			$data=array(
				'uid'=> $uid,
				'code'=> $verify_msg,
				'address'=>$telephone,
				'type'=>'telephone',
				'time'=>time()
			);
			M('Regist_verify')->create($data);
			M('Regist_verify')->add();
			
			D('Sms')->sentMsg($verify_msg."  注册验证码，请在5分钟内正确输入，过期请重新获取--来自【中科大活动平台】",$telephone);
			$this->assign('jumpUrl', '/User/registerToVerify?uid='.$uid);
			$this->assign('waitSecond', 10);
			$this->success('注册成功，已经向 '.$telephone.' 发送了6位激活码，请在激活页面验证激活码以完成注册过程。');


		}
        
    }
	public function addUsers($info,$gid){ //批量注册会员
		if(empty($info)) return false;
		 if(empty($info['email']))
        {
            $this->error("邮箱不能为空");
        }
		if (!preg_match("/^[\w\-\.\+\_]+@[\w\-\.]+(\.\w+)+$/", $info['email']))
            $this->error("注册邮箱地址格式不对");
		if(empty($info['realname']))
            $this->error("真实姓名不能为空");
		$info['register_time']=time();
		$info['status'] = 'active'; 
		$info['salt'] = substr(uniqid(rand()), -6);
		$pwd = substr(md5(time().$info['salt'].$info['email']), -8);
		$info['password']=md5($pwd);
		$info['password'] = md5($info['password'].$info['salt']);
		D("User")->add($info);
		$info2 = D("User")->where(array('email'=>$info['email'],'password'=>$info['password']))->find();
        if (empty($info2) || !is_numeric($info2['uid'])) {
            $this->error('未知错误');
        }
		$this->sendPasswordEmail($info2,$pwd,$gid);
		return true;
	}
    private function sendVerifyEmail($info) {
        SendMail($info['email'], "欢迎注册校园活动平台",
                $info['realname']."你好:\n\n".
                "请点击下面的链接激活您在校园活动平台的帐号（如果下面的地址不能点击，请将其复制到浏览器地址栏中）:\n\n".
                "http://".$_SERVER['HTTP_HOST']."/User/registerVerify?uid=".$info['uid']."&token=".md5($info['email'].$info['salt'].$info['register_time'])."\n\n".
                "校园活动平台 http://".$_SERVER['HTTP_HOST']
                );
    }
	private function sendPasswordEmail($info,$pwd,$gid) {
        $clubname = D('Club')->getClubName($gid);
		SendMail($info['email'], "欢迎注册校园活动平台",
                $info['realname']."，您好:\n\n".
                "为了方便社团管理和发布活动通知，<strong>".$clubname."</strong>已经将您注册为校园活动平台用户,您可以使用以下信息进行登录
				<div>
					<strong>注册邮箱：</strong>".$info['email']."
				</div>
				<div>
					<strong>密码：</strong>".$pwd."
				</div></ br>".
                "
				<div>登录：<a href='http://".$_SERVER['HTTP_HOST']."/User/login'>http://".$_SERVER['HTTP_HOST']."/User/login</a></div>
				<div>".$clubname."主页：<a href='http://".$_SERVER['HTTP_HOST']."/Club/intro?gid=".$gid."'>http://".$_SERVER['HTTP_HOST']."/Club/intro?gid=".$gid."</a></div>
				"."\n\n".
                "校园活动平台 http://".$_SERVER['HTTP_HOST'],true
                );
    }

	public function registerToVerify()
	{
		$uid = $this->_request('uid');
		
		if (!is_numeric($uid))
		{
			$this->assign('jumpUrl', '/User/register');
            $this->error("您所激活的用户不存在，请重新注册");
		}
        $info = D('User')->getInfo($uid);
        if (empty($info))
		{
			$this->assign('jumpUrl', '/User/register');
            $this->error("您所激活的用户不存在，请重新注册");
		}
        if ($info['status'] == 'active')
		{
			$this->assign('jumpUrl', '/User/login');
            $this->error("您已经激活，不需要再次激活了 :)");
		}
        if ($info['status'] == 'locked')
		{
			$this->assign('jumpUrl', '/User/login');
            $this->error("您的帐号已被锁定，请联系管理员解锁");
		}
		$this->assign('uid', $uid);
		$this->display('verify');
	}

	public function sendCode()
	{
		$uid = $this->_request('uid');
		
        if (!is_numeric($uid))
		{
			$this->assign('jumpUrl', '/User/register');
            $this->error("您所激活的用户不存在，请重新注册");
		}
        $info = D('User')->getInfo($uid);

        if (empty($info))
		{
			$this->assign('jumpUrl', '/User/register');
            $this->error("您所激活的用户不存在，请重新注册");
		}
        if ($info['status'] == 'active')
		{
			$this->assign('jumpUrl', '/User/login');
            $this->error("您已经激活，不需要再次激活了 :)");
		}
        if ($info['status'] == 'locked')
		{
			$this->assign('jumpUrl', '/User/login');
            $this->error("您的帐号已被锁定，请联系管理员解锁");
		}
		if($info['sid']==1)
		{
            $this->error("您的账户不需要通过手机激活");
		}
		else
		{	
			$verify_msg = substr(uniqid(rand()), -6);
			$data=array(
				'uid'=> $uid,
				'code'=> $verify_msg,
				'address'=>$info['telephone'],
				'type'=>'telephone',
				'time'=>time()
			);

			$verify = M('Regist_verify')->where(array('uid'=>$uid))->limit(1)->select();

			if(empty($verify))
			{
				M('Regist_verify')->create($data);
				M('Regist_verify')->add();
				D('Sms')->sentMsg($verify_msg."  注册验证码，请在5分钟内正确输入，过期请重新获取--来自【中科大活动平台】",$info['telephone']);
				$this->success('发送验证码成功，请查收');
			}
			elseif($data['time']-$verify[0]['time']<30)
			{	
				$this->error("发送验证短信太频繁，请30秒后在发送");
			}
			else
			{
				M('Regist_verify')->where(array('uid'=>$uid))->save($data);
				D('Sms')->sentMsg($verify_msg."  注册验证码，请在5分钟内正确输入，过期请重新获取--来自【中科大活动平台】",$info['telephone']);
				$this->success('发送验证码成功，请查收');
			}
		}
	}

    public function registerVerify() {
		$uid = $this->_request('uid');
        if (!is_numeric($uid))
		{
			$this->assign('jumpUrl', '/User/register');
            $this->error("您所激活的用户不存在，请重新注册");
		}
        $info = D('User')->getInfo($uid);

        if (empty($info))
		{
			$this->assign('jumpUrl', '/User/register');
            $this->error("您所激活的用户不存在，请重新注册");
		}
        if ($info['status'] == 'active')
		{
			$this->assign('jumpUrl', '/User/login');
            $this->error("您已经激活，不需要再次激活了 :)");
		}
        if ($info['status'] == 'locked')
		{
			$this->assign('jumpUrl', '/User/login');
            $this->error("您的帐号已被锁定，请联系管理员解锁");
		}
		if($info['sid']==1)
		{
			if (md5($info['email'].$info['salt'].$info['register_time']) !== trim($_GET['token']))
            $this->error("激活链接无效<br>请将激活信中的链接准确复制到浏览器地址栏中，重试一次");
		}
		else
		{
			$code = trim($this->_request('code'));
			$verify = M('Regist_verify')->where(array('uid'=>$uid))->limit(1)->select();
		
			if(empty($verify))
			{
				$this->error("验证码获取失败，请重新通过手机获取验证码");
			}
			elseif($verify[0]['code']!=$code)
			{
				$this->error("您所输入的验证码有误，请重新输入");
			}
			elseif((time()-$verify[0]['time'])>5*60)
			{
				$this->error("验证码已经过期，请重新通过手机获取验证码");
			}
		}

        if ($info['status'] == 'inactive') {
            $record['status'] = 'active';
            M('User')->where(['uid' => $uid])->save($record);
        }
		M('Regist_verify')->where(array('uid'=>$uid))->delete();
        $referer = $info['register_referer'];
        if (empty($referer) || !strstr($referer, $_SERVER['HTTP_HOST'])) {
            $this->assign('jumpUrl', '/User/login');
            $this->success('帐号激活成功，现在跳转到登录页面……');
        } else {
            $this->assign('jumpUrl', $referer);
            $this->success('帐号激活成功，现在跳转到注册前页面……');
        }
    }

    /* public function avatarUpload(){
       global $_G;
       if(empty($_G['uid'])) {
       $this->error('没有登录');
       }
       import("ORG.Net.UploadFile");
       $upload = new UploadFile();// 实例化上传类 
       $upload->maxSize  = 3145728 ;// 设置附件上传大小 
       $upload->allowExts  = array('jpg', 'gif', 'png', 'jpeg');
       $upload->savePath =  './upload/avatar/';// 设置附件
       $upload->saveRule = D("User")->setAvatarName();
       $upload->thumb = true;
       $upload->thumbMaxWidth = "200,50";
       $upload->thumbMaxHeight = "200,50";
       $upload->thumbRemoveOrigin = true;
       $upload->thumbPrefix = 'avatar_,small_avatar_';

       if(!$upload->upload()) {// 上传错误 提示错误信息 
       $this->error($upload->getErrorMsg());
       }else{// 上传成功 获上传文件信息 
       $info =  $upload->getUploadFileInfo();
       $avatar_name = "avatar_".$info[0][savename];

       D('User')->setAvatar($_G[uid],$avatar_name);
       $this->success("$avatar_name");
       }
       }*/
    public function avatarUpload(){
        global $_G;
        if(empty($_G['uid'])) {
            $this->error('没有登录');
        }
        import("ORG.Net.UploadFile");
        $upload = new UploadFile();// 实例化上传类 
        $upload->maxSize  = 3145728 ;// 设置附件上传大小 
        $upload->allowExts  = array('jpg', 'gif', 'png', 'jpeg');
        $upload->savePath =  './upload/avatar/';// 设置附件
        $upload->saveRule = D("User")->setAvatarName();
        $upload->thumb = true;
        $upload->thumbMaxWidth = "400";
        $upload->thumbMaxHeight = "1000";
        $upload->thumbRemoveOrigin = true;
        $upload->thumbPrefix = 'avatar_';

        if(!$upload->upload()) {// 上传错误 提示错误信息 
            $info = array (
                    "status" => 0,
                    "info" => $upload->getErrorMsg()
                    );
            echo json_encode($info);
            //$this->error($upload->getErrorMsg());
        }else{// 上传成功 获上传文件信息 
            $info =  $upload->getUploadFileInfo();
            $avatar_name = "avatar_".$info[0][savename];
            //$avatar_name = $info[0][savename];
            D('User')->setAvatarTmp($_G[uid],$avatar_name);
            $info = array (
                    "status" => 1,
                    "info" => $avatar_name
                    );
            echo json_encode($info);

            //$this->success("$avatar_name");
        }
    }
    public function createAvatar()
    {
        global $_G;
        $x = $_POST['x'];
        $y = $_POST['y'];
        $w = $_POST['w'];
        $h = $_POST['h'];
        $image = D('User')->getAvatarTmpName($_G[uid]);
        $this->assign('jumpUrl','/User/home?uid='.$_G['uid']);
        if(empty($image))
        {
            $this->error('修改头像失败');
        }
        $image_big = C('AVATAR_PATH').'big_'.$image;

        $image_small = C('AVATAR_PATH').'small_'.$image;
        $image_orig = C('AVATAR_PATH').$image;
        D('User')->thumb($image_orig,$image_big,'',$x,$y,$w,$h,200,200,true);
        D('User')->thumb($image_orig,$image_small,'',$x,$y,$w,$h,100,100,true);
        D('User')->setAvatar($_G[uid],$image);
        $this->success('修改头像成功');
    }
    public function createCode()
    {
        session_start();
        for($i=0; $i<4; $i++){
            $rand.= dechex(rand(1,15));
        }
        $_SESSION[check_pic]=$rand;
        //echo $_SESSION[check_pic];
        // 设置图片大小
        $im = imagecreatetruecolor(100,30);
        // 设置颜色
        $bg=imagecolorallocate($im,102,255,0);
        $te=imagecolorallocate($im,255,255,255);
        // 把字符串写在图像左上角
        imagestring($im,rand(5,6),rand(25,30),5,$rand,$te);
        // 输出图像
        header("Content-type:image/jpeg");
        imagejpeg($im);
    }
    public function ajaxCheckCode()
    {
        session_start();

        if($_SESSION['verify'] != md5($_POST['check'])) {
            $this->error('验证码错误');
        }
        else
        {
            $this->success("success",1);
        }

    }
    public function ajaxVerify()
    {
        import("ORG.Util.Image");
        Image::buildImageVerify();
    }
    public function ajaxCheckEmail()
    {
        $email = empty($_POST[email])?$_GET[email]:$_POST[email];
		if(!preg_match("/^[a-zA-Z0-9+_.-]+$/", $email))
			$this->error("邮箱格式错误，无需输入邮箱后缀",0);
		$email .="@mail.ustc.edu.cn";
        //$this->error("邮箱错误",1);
        if(isset($email))
        {
            $User = D('User');
            if($User->is_loginname_existed($email))
            {
                $this->error("邮箱已注册",1);
            }
            else
            {
                $this->success("success",1);
            }

        }
        else
            $this->error("邮箱错误",1);
    }
	public function ajaxCheckEmail2()
    {
        $email = empty($_POST[email])?$_GET[email]:$_POST[email];
        //$this->error("邮箱错误",1);
        if(isset($email))
        {
            $User = D('User');
            if($User->is_loginname_existed($email))
            {
                $this->error("邮箱已注册",1);
            }
            else
            {
                $this->success("success",1);
            }

        }
        else
            $this->error("邮箱错误",1);
    }
	public function ajaxCheckTelephone()
    {
        $telephone = $this->_request('telephone');
        //$this->error("邮箱错误",1);
        if(isset($telephone))
        {
			if(!preg_match('/^[1-9]\d{10}$/', trim($telephone)))
				$this->error("请输入正确的手机号");
            $User = D('User');
            if($User->is_telephone_existed($telephone))
            {
                $this->error("该手机已注册");
            }
            else
            {
                $this->success("success");
            }
        }
		else
		{
			$this->error("请输入正确的手机号");
		}
        
    }
    public function avatar()
    {
        global $_G;
        $user = D("User");
        $user_info = $user->getInfo($_G[uid]);
        if (empty($user_info['uid'])) {
            $this->error("该用户不存在");
        }
        $this->assign('user_info', $user_info);
        $this->assign('avatar_path', C("AVATAR_PATH"));
        $this->display();
    }

    public function setting()
    {
        global $_G;
        if(empty($_G['uid'])) {
            $this->error('没有登录');
        }
        $time_conf = A('Timer')->show_conf();
        $this->assign('time_conf',$time_conf);
        $this->display();
    }
    public function updateSetting(){
         global $_G;
         if(empty($_G['uid'])) {
            $this->error('没有登录');
         }
         $error = 0;
         $checkbox = $_POST['checkbox'];
         $init = array(1=>['email'=>0,'sms'=>0],2=>['email'=>0,'sms'=>0]);
         //dump($init);die;
         foreach ($checkbox as $key => $value) {
             foreach ($value as $key2 => $value2) {
                 if(!empty($value2))
                    $init[$key][$key2]=1;
             }
         }
         //dump($init);die;
         foreach ($init as $aid_type => $conf) {
            $stat = D('Timer')->changeConf($conf,$aid_type,$_G['uid']);
            //dump($conf);
            //echo M('Timer_conf')->getLastSql();die;
            if($stat==false)
                $error = 1;
         }
         if($error == 0)
            $this->success("成功保存");
        else
            $this->error("出现错误");
         
    }
}
