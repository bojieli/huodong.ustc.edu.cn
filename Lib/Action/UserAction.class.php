<?php
class UserAction extends PublicAction {
	public function home() {
		global $_G;
		$uid = is_numeric($_GET['uid']) ? $_GET['uid'] : CURRENT_USER;
		$user = D("User");
		$user_info = $user->getInfo($uid);
		if (empty($user_info[uid])) {
			$this->error("该用户不存在");
		}
		$this->assign('avatar_path', C("AVATAR_PATH"));
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

	public function myClubs() {
	}

	public function register() {
		$this->display();
	}
	public function addUser() {
		session_start();

		$User = D("User");
		
		$_POST[salt] = substr(uniqid(rand()), -6);
		$_POST['email']=trim($_POST['email'])."@mail.ustc.edu.cn";
		$_POST['register_time']=time();
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
		if(empty($_POST[email]))
		{
			$this->error("邮箱不能为空");
		}
		if($User->is_loginname_existed($_POST['email']))
		{
			//echo "ol";  ???
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
		$_POST[password] = md5(md5($_POST[password]).$_POST[salt]);

		// currently force USTC
		$_POST['sid'] = 1;
		
		$User->create();
		$User->add();

		$this->assign('jumpUrl', '/User/login');
		$this->success('注册成功，现在跳转到登录页面……');
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

	public function registerRenren() {
		$this->display();
	}

	public function registerLocal() {
		$this->display();
	}

	public function registerEmail() {
		$this->display();
	}

	public function registerInfo() {
		$this->display();
	}

	public function registerAvatar() {
		$this->display();
	}

	public function notify() {
		// call NotifyAction
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
