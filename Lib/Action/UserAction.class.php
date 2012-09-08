<?php
class UserAction extends PublicAction {
	public function home() {
		global $_G;
		$uid = is_numeric($_GET['uid']) ? $_GET['uid'] : CURRENT_USER;
		$user = D("User");
		$user_info = $user->getInfo($uid);
		if (empty($user_info['uid'])) {
			$this->error("该用户不存在");
		}
		$this->assign('user_info', $user_info);
		$this->assign('avatar_path', C("AVATAR_PATH"));
		$this->assign('clubs', D('User')->getClubs($uid));
		$this->assign('applies', D('User')->getApplies($uid));
		$this->headnav();
		$this->display();
	}
	
	public function login()
	{
		$this->display();
	}
	public function do_login() {
		global $_G;
		
		if($_POST[submit]){
			$username=$_POST[email]."@mail.ustc.edu.cn";
			$pw=$_POST[password];
			if(empty($username)||empty($pw)){
				$this->error('密码或用户名不能为空');
			}
			$post=array(
			'username'=>$username,
			'password'=>$pw,
			);
			$user=D('User');
			$passport=$user->getpassport($post[username],$post[password]);
			//dump($passport);
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
			//dump($setarr);
			$user->insertsession($setarr);
			cookie('auth', $user->authcode("$setarr[password]\t$setarr[uid]", 'ENCODE'), 3600);
			cookie('loginuser', $passport['username'], 3600);
			//dump($_COOKIE);
			$this->assign('jumpUrl','/User/home?uid='.$passport['uid']);
			$this->success('登陆成功');
		}
		else{
			$this->display('User:login');
		}
	}
	
	public function logout(){
		global $_G;
		if(empty($_G['uid'])) {
			$this->error('没有登录');
		}
		else{
			$user=D('User');
			$passport=$user->delsession($_G[uid]);//清除session
			cookie(null);//清空cookie
			$this->assign('jumpUrl','/');
			$this->success('登出成功');
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
		$fields = array('realname', 'gender', 'education', 'dept', 'grade');
		foreach ($fields as $field)
			$info[$field] = htmlspecialchars($_POST[$field]);
		if (preg_match("|[a-zA-Z]+://([a-zA-Z0-9_-]+\.)+[\w-]+(:[0-9]+)?(/.*)?|", $_POST['homepage']))
			$info['homepage'] = $_POST['homepage'];
		elseif (preg_match("|([a-zA-Z0-9_-]+\.)+[\w-]+(:[0-9]+)?(/.*)?|", $_POST['homepage']))
			$info['homepage'] = 'http://'.$_POST['homepage'];
		$info["uid"] = $_G['uid'];
		
		$user = D('User');
		$user->save($info);
		$this->assign('jumpUrl','/User/home');
		$this->success('修改信息成功');
	}

        public function changePassword() {
                global $_G;
                if(empty($_G['uid'])) {
                        $this->error('没有登录');
                }   
                if($_POST[submit]){
                        $passport=D('User')->getpassport($_G[uid],$_POST[password],'uid');
                        //dump($passport);
                        if(!is_array($passport)){
                                $this->error('原密码错误');
                        }   
                        if(empty($_POST[password_new]))
                        {   
                                $this->error('新密码不能为空');
                        }   
                        if($_POST[password_new2]!=$_POST[password_new])
                        {   
                                $this->error('两次密码不一致');
                        }   
                        $user=D('User');
                        $user->changepassword($_POST[password_new]);
                        $user->delsession($_G[uid]);//清除session
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
	public function addUser() {
		session_start();

		$User = D("User");
		
		if(empty($_POST[email]))
		{
			$this->error("邮箱不能为空");
		}
		if (!preg_match("/[a-zA-Z0-9+_-]+/", $_POST['email'])) {
			$this->error("请输入有效的邮箱地址");
		}
		$_POST['email']=trim($_POST['email'])."@mail.ustc.edu.cn";

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

		$_POST['sid'] = 1; // currently force USTC
		$_POST['register_time']=time();
		$_POST['status'] = 'inactive'; // need email activate

		$_POST['salt'] = substr(uniqid(rand()), -6);
		$_POST['password'] = md5(md5($_POST[password]).$_POST[salt]);
		
		$User->create();
		$User->add();

		$info = $User->where(array('email'=>$_POST['email']))->find();
		if (empty($info) || !is_numeric($info['uid'])) {
			$this->error('未知错误，请重新注册');
		}

		$this->sendVerifyEmail($info);

                $this->assign('jumpUrl','/User/login');
		$this->success('注册成功，已经向 '.$_POST['email'].' 发送一封激活信，请点击激活信中的链接以完成注册过程。');
	}

	private function sendVerifyEmail($info) {
		SendMail($info['email'], "欢迎注册大学海报平台",
			$info['realname']."你好:\n\n".
			"请点击下面的链接激活您在大学海报平台的帐号（如果下面的地址不能点击，请将其复制到浏览器地址栏中）:\n\n".
			"http://".$_SERVER['HTTP_HOST']."/User/registerVerify?uid=".$info['uid']."&token=".md5($info['email'].$info['salt'].$info['register_time'])."\n\n".
			$info['email'].$info['salt'].$info['register_time'].
			"大学海报平台 http://".$_SERVER['HTTP_HOST']
			);
	}

	public function registerVerify() {
		if (!is_numeric($_GET['uid']))
			$this->error("您所激活的用户不存在，请重新注册");
		$info = D('User')->getInfo($_GET['uid']);
		if (empty($info))
			$this->error("您所激活的用户不存在，请重新注册");
		if (md5($info['email'].$info['salt'].$info['register_time']) !== trim($_GET['token']))
			$this->error("激活链接无效，请将激活信中的链接准确复制到浏览器地址栏中，重试一次");
		if ($info['status'] == 'active')
			$this->error("您已经激活，不需要再次激活了 :)");
		if ($info['status'] == 'locked')
			$this->error("您的帐号已被锁定，请联系管理员解锁");
		if ($info['status'] == 'inactive') {
			$record['status'] = 'active';
			M('User')->where(['uid' => $_GET['uid']])->save($record);
		}

                $this->assign('jumpUrl','/User/login');
                $this->success('帐号激活成功，现在跳转到登录页面……');
	}

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
}
