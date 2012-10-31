<?php
class TeamAction extends PublicAction {
	public function index() {
		if(!D('User')->checkLogin())
		{
			$this->assign('jumpUrl', '/User/login');
			$this->error('您尚未登陆');
		}
		$tid = $_REQUEST['tid'];
		$team = D('Team')->getInfo($tid);
		$gid = $team['gid'];
		if($team['flag']==0)
		{
			$this->assign('jumpUrl','/Club/manage?gid='.$gid);
			$this->error("该组织已删除");
		}
		if(!D('Club')->isMember(CURRENT_USER,$team['gid']))
		{
			$this->error("您需要先加入社团");
		}
		
		$team['priv'] = D('Team')->getPrivValue($tid);
		$team['leader_uid'] =D('User_team')->result_first("select uid from ustc_user_team where tid = $tid and ( priv = 'team-leader' or priv = 'manager' )");
		if($team['leader_uid'])
		{
			$team['leader']=D('User')->getInfo($team['leader_uid']);
		}
		$team['found_date']=date("Y-m-d",$team['found_date']);
		$team['isAdmin']=D('Team')->isAdmin($tid);
		$team['isManager']=D('Team')->isManager($tid);
		$team['isMember']=D('Team')->isMember($tid);
		$club = D('Club')->getInfo($team['gid']);

		$page = isset($_GET['page']) && is_numeric($_GET['page']) ? $_GET['page'] : 1;
		//$start = isset($_GET['start']) && is_numeric($_GET['start']) ? $_GET['start'] : 0;
		$num = isset($_GET['num']) && is_numeric($_GET['num']) ? $_GET['num'] : 20;
		$start = ($page-1)*$num;

		$members = M()->query("SELECT * FROM (ustc_user INNER JOIN ustc_user_team ON ustc_user.uid = ustc_user_team.uid) INNER JOIN ustc_priv ON ustc_user_team.priv = ustc_priv.priv_name WHERE ustc_user_team.tid='$tid' ORDER BY ustc_priv.priv_value desc LIMIT $start,$num");
		foreach ($members as &$member) {
			$member['avatar'] = D('user')->getAvatar($member[uid],'small');
			$priv = D('Team')->getPrivName($tid,$member[uid]);
			switch($priv) {
			case 'admin': $member['privlevel']=1;break;
			case 'vice-admin': $member['privlevel']=2;break;
			case 'manager': $member['privlevel']=3;break;
			case 'vice-manager': $member['privlevel']=3;break;
			case 'team-leader': $member['privlevel']=3;break;
			case 'member': $member['privlevel']=4;break;
			default: $member['privlevel']=5;
			}
			
		}
		unset($member);
		if(!empty($team['isAdmin']))
		{
			$members_normal = M()->query("SELECT * FROM (ustc_user INNER JOIN ustc_user_team ON ustc_user.uid = ustc_user_team.uid) INNER JOIN ustc_priv ON ustc_user_team.priv = ustc_priv.priv_name WHERE ustc_user_team.tid='$tid' AND ustc_priv.priv_value > 0 ORDER BY ustc_priv.priv_value desc");
			$condition_member = '';
			if(!empty($members_normal))
			{
				$team_member = "(";
				for($i=0;$i<count($members_normal)-1;$i++)
				{
					$team_member .= $members_normal[$i]['uid'].",";
				}
				$team_member .=$members_normal[count($members_normal)-1]['uid'].")";
				$condition_member = " AND ustc_user.uid NOT IN $team_member ";
			}
			
			$club_members = M()->query("SELECT * FROM (ustc_user INNER JOIN ustc_user_group ON ustc_user.uid = ustc_user_group.uid) INNER JOIN ustc_priv ON ustc_user_group.priv = ustc_priv.priv_name WHERE ustc_user_group.gid='$gid' ".$condition_member." ORDER BY ustc_priv.priv_value desc");
			$this->assign('club_members', $club_members);
		}
		$this->assign('members', $members);
		
		$inactive_members = M()->query("SELECT * FROM ustc_user AS u, ustc_user_team AS ut WHERE ut.tid='$tid' AND ut.priv = 'inactive' AND ut.uid = u.uid");

		$attachments = M("Team_attachment")->where(array("tid"=>$tid))->select();
		$this->assign('inactive', $inactive_members);
		$this->assign('attachments', $attachments);
		$this->assign('pageStart', $start);
		$this->assign('pageNow', $page);
		$this->assign('club', $club);
		$this->assign('team', $team);

		$this->display();
	}
	public function introAdd(){
		if (CURRENT_USER == 0) {
			$this->error("您需要先登录");
		}
		
		global $_G;
		$gid = $this->_request("gid");
		$type = $this->_request("type");
		$club = D('Club')->getInfo($gid);
		if ($type=='team'&&D('Club')->isManager($gid))
		{
			$this->assign('type',$type);
			$this->assign('club',$club);
			$this->display();
			
		}
		elseif($type=='department'&&D('Club')->isCorer($gid))
		{
			$this->assign('type',$type);
			$this->assign('club',$club);
			$this->display();
		}
		else
		{
			$this->error("您没有权限");
		}
	}
	public function introInsert() {
		if (CURRENT_USER == 0) {
			$this->error("您需要先登录");
		}
		
		global $_G;
		$gid = $this->_request("gid");
		
		$fields = ['gid','type','name','shortdesc'];
		foreach ($fields as $field) {
			$team[$field] = htmlspecialchars($_POST[$field]);
		}

		$club = D('Club')->getInfo($gid);
		if($team['type']=='department'&&!(D('Club')->isCorer($gid)))
		{
			$this->error("您没有权限");
		}
		if($team['type']=='team'&&!(D('Club')->isManager($gid)))
		{
			$this->error("您没有权限");
		}
		$team['found_date']=time();
		$team['create_uid']=CURRENT_USER;
		$team['attachment_size']=C('ATTACHMENT_SIZE');
		if (empty($team['name']))
			$this->error("名称不能为空");
		if (strlen($team['shortdesc']) > 420)
			$team['shortdesc'] = substr($team['shortdesc'], 0, 420);

		$model = M('Team');
		$model->create($team);
		$tid = $model->add();
		$user_team = array(
			'uid'=>CURRENT_USER,
			'tid'=>$tid,
			'gid'=>$gid,
			'priv'=>$team['type']=='department'?'manager':'team-leader',
			'title'=>$team['type']=='department'?'部长':'项目组长'
		);
		M("User_team")->create($user_team);
		M("User_team")->add();
		D('Team')->where(array('tid'=>$tid))->setInc('member_count');
		$this->assign('jumpUrl','/Club/manage?gid='.$gid);
		$this->success("添加成功！");
	}
	public function introModify() {
		if (CURRENT_USER == 0) {
			$this->error("您需要先登录");
		}

		$tid = $this->_request("tid");
		$team = D('Team')->getInfo($tid);
		if (!(D('Club')->isManager($team['gid'])))
		{
			$this->error("您没有权限");
		}
		$this->assign('team', $team);
		$this->display();
	}

	public function introUpdate() {
		if (CURRENT_USER == 0) {
			$this->error("您需要先登录");
		}

		$tid = $this->_request("tid");
		$gid = D('Team')->getGidByTid($tid);
		if (!(D('Club')->isManager($team['gid'])))
		{
			$this->error("您没有权限");
		}

		$fields = ['tid','name','shortdesc'];
		foreach ($fields as $field) {
			$team[$field] = htmlspecialchars($_POST[$field]);
		}
		if (strlen($team['shortdesc']) > 420)
			$team['shortdesc'] = substr($team['shortdesc'], 0, 420);

		M('Team')->save($team);

		$this->assign('jumpUrl','/Team/?tid='.$tid);
		$this->success("修改成功！");
	}

	public function join() {
		if (CURRENT_USER == 0) {
			$this->error("您需要注册或登录后才能加入社团");
		}
		$tid = $this->_request("tid");
		$gid = D('Team')->getGidByTid($tid);

		if(!D('Club')->isMember(CURRENT_USER,$gid))
		{
			$this->error("您需要先加入社团");
		}
		if(D('Team')->getPrivValue($tid)== -1)
		{
			$data=array(
				'uid'=>CURRENT_USER,
				'tid'=>$tid,
				'gid'=>$gid,
				'priv'=>'inactive',
				'title'=>'待审核',
				'time'=>time()
			);
			$obj = M('User_team');
			$obj->create($data);
			$obj->add();
			$this->success("申请成功");
		}
		else
		{
			$this->error("请勿重复提交申请");
		}
	}
	public function quit() {
		if (CURRENT_USER == 0) {
			$this->error("您需要注册或登录后才能加入社团");
		}
		$tid = $this->_request("tid");

		if(!D('Team')->isMember($tid))
		{
			$this->error("您已经退出");
		}
		else
		{
			D('Team')->removeMember($tid);
			$this->success("退出成功");
		}
	}
	
	public function changeTitle() {
		if(!D('User')->checkLogin())
		{
			$this->assign('jumpUrl', '/User/login');
			$this->error('您尚未登陆');
		}
		$uid = $this->_request('uid');
		$tid = $this->_request('tid');
		$title = htmlspecialchars($this->_request('title'));
		$priv = $this->_request('priv');
		$type = D('Team')->getTypeByTid($tid);
		if($type=='department')
		{
			if (!in_array($priv, ['manager', 'vice-manager','member', 'inactive'])) {
				$this->error("权限错误");
			}
		}
		else
		{
			if (!in_array($priv, ['team-leader', 'vice-team-leader','member', 'inactive'])) {
				$this->error("权限错误");
			}
		}
		
		
		if (D('Team')->isAdmin($tid)) {
			$record['priv'] = $priv;
			$record['title'] = $title;
			$priv_pre = M('User_team')->result_first("SELECT priv FROM ustc_user_team where uid = $uid and tid = $tid");
			if(($priv_pre!='inactive')&&($priv=='inactive'))
			{
				M('Team')->where(['tid'=>$tid])->setDec('member_count'); // 会员数减1 
			}
			if(($priv_pre=='inactive')&&($priv!='inactive'))
			{
				M('Team')->where(['tid'=>$tid])->setInc('member_count'); // 会员数加1 
			}
			M('User_team')->where(['uid'=>$uid, 'tid'=>$tid])->save($record);
			$this->success("设置权限成功");
		} else
			$this->error("没有足够权限");
	}

	public function changeTitleText() {
		if(!D('User')->checkLogin())
		{
			$this->assign('jumpUrl', '/User/login');
			$this->error('您尚未登陆');
		}
		$uid = $this->_request('uid');
		$tid = $this->_request('tid');
		$title = htmlspecialchars($this->_request('title'));
		
		if (D('Team')->isAdmin($tid)) {
			$record['title'] = $title;
			M('user_team')->where(['uid'=>$uid, 'tid'=>$tid])->save($record);
			$this->success('修改title成功');
		} else
			$this->error('没有足够权限');
	} 
	public function joinVerify() {
		if(!D('User')->checkLogin())
		{
			$this->assign('jumpUrl', '/User/login');
			$this->error('您尚未登陆');
		}
		$uid = $this->_request('uid');
		$tid = $this->_request('tid');
		if (D('Team')->isManager($tid)) {
			if (D('Team')->getPrivName($tid, $uid) == 'inactive') {
				D('Team')->addMember($tid, $uid);
				//$this->sendJoinClubEmail($uid, $gid, true);
				$this->success("已经通过此加入申请");
			} else
				$this->error("此用户不处于待审核状态");
		} else
			$this->error("没有足够权限");
	}

	public function joinDeny() {
		if(!D('User')->checkLogin())
		{
			$this->assign('jumpUrl', '/User/login');
			$this->error('您尚未登陆');
		}
		$uid = $this->_request('uid');
		$tid = $this->_request('tid');
		if (D('Team')->isManager($tid)) {
			if (D('Team')->getPrivName($tid, $uid) == 'inactive') {
				M('User_team')->where(['uid'=>$uid, 'tid'=>$tid])->delete();
				//$this->sendJoinClubEmail($uid, $gid, false);
				$this->success("已经拒绝此加入申请");
			} else
				$this->error("此用户不处于待审核状态");
		} else
			$this->error("没有足够权限");
	}

	public function address()
	{
		global $_G;
		if(empty($_G[uid]))
		{
			$this->assign('jumpUrl','/User/login');
			$this->error("您尚未登录");
		}
		$tid = $this->_request('tid');
		$team = D('Team')->getInfo($tid);
		if(!D('Team')->isManager($tid)) {
			$this->error("没有足够权限");
		}
		$address = D('Address');
		$members = $address->createAddressByTid($tid);
		$this->assign("team", $team);
		$this->assign("members", $members);
		$this->display();
	}
	
	public function emailAddress()
	{
		global $_G;
		if(empty($_G[uid]))
		{
			$this->assign('jumpUrl','/User/login');
			$this->error("您尚未登录");
		}
		$tid = $this->_request('tid');
		$team = D('Team')->getInfo($tid);
		if(!D('Team')->isManager($tid)) {
			$this->error("没有足够权限");
		}
		$address = D('Address');
		$members = $address->createAddressByTid($tid);
		$email_all = '';
		foreach($members as $key => $value)
		{
			$email_all.='"'.$value[realname].'"'.htmlspecialchars('<').$value[email].htmlspecialchars('>').', ';
		}
		$this->assign("team", $team);
		$this->assign("email", $email_all);
		$this->display();
	}
	public function createAddressFetion()
	{
		global $_G;
		if(empty($_G[uid]))
		{
			$this->assign('jumpUrl','/User/login');
			$this->error("您尚未登录");
		}
		$tid = $this->_request('tid');
		
		if(!D('Team')->isManager($tid)) {
			$this->error("没有足够权限");
		}
		$address = D('Address');
		$members = $address->createAddressByTid($tid);
		$filename="./upload/address_fetion_group".$tid.".csv";
		$file=fopen($filename,"w");
		if($file){
			fwrite($file,iconv( "UTF-8", "gbk" ,"MobileNo,Name"));
			fwrite($file,"\r\n");
			foreach($members as $key => $value)
			{
				$content = iconv( "UTF-8", "gbk" , "$value[telephone],$value[realname]");
				fwrite($file,"$content");
				fwrite($file, " \r\n");
			}
		}
		fclose($file);
		header("Cache-Control:must-revalidate,post-check=0,pre-check=0");  
		header("Content-Description:File Transfer");  
		header ("Content-type: application/octet-stream"); //定义数据类型
		header ("Content-Length: " . filesize ($filename));  
		header("Content-Disposition: attachment; filename=".basename($filename)); 
		readfile($filename);
	}
	public function createAddressEmailUSTC()
	{
		global $_G;
		if(empty($_G[uid]))
		{
			$this->assign('jumpUrl','/User/login');
			$this->error("您尚未登录");
		}
		$tid = $this->_request('tid');
		
		if(!D('Team')->isManager($tid)) {
			$this->error("没有足够权限");
		}

		$team = D('Team')->getInfo($tid);
		$address = D('Address');
		$members = $address->createAddressByTid($tid);
		$filename="./upload/address_email_ustc_group".$tid.".csv";
		$file=fopen($filename,"w");
		if($file){
			fwrite($file,iconv( "UTF-8", "gbk" ,"联系组,姓名,Email,手机"));
			fwrite($file,"\r\n");
			foreach($members as $key => $value)
			{
				$content = iconv( "UTF-8", "gbk" , "$team[name],$value[realname],$value[email],$value[telephone]");
				fwrite($file,"$content");
				fwrite($file, " \r\n");
			}
		}
		fclose($file);
		header("Cache-Control:must-revalidate,post-check=0,pre-check=0");  
		header("Content-Description:File Transfer");  
		header ("Content-type: application/octet-stream"); //定义数据类型
		header ("Content-Length: " . filesize ($filename));  
		header("Content-Disposition: attachment; filename=".basename($filename)); 
		readfile($filename);
	}
	public function createAddress()
	{
		global $_G;
		if(empty($_G[uid]))
		{
			$this->assign('jumpUrl','/User/login');
			$this->error("您尚未登录");
		}
		$tid = $this->_request('tid');
		
		if(!D('Team')->isManager($tid)) {
			$this->error("没有足够权限");
		}

		$address = D('Address');
		$members = $address->createAddressByTid($tid);

		$filename="./upload/address_group".$tid.".csv";
		$file=fopen($filename,"w");
		if($file){
			fwrite($file,iconv( "UTF-8", "gbk" ,"姓名,学号,性别,职务,学历,入学年级,email,手机,QQ,主页"));
			fwrite($file,"\r\n");
			foreach($members as $key => $value)
			{
				$value['gender']=$value['gender']?'男':'女';
				$value[student_no]=strtoupper($value[student_no]);
				$content = iconv( "UTF-8", "gbk" , "$value[realname],$value[student_no],$value[gender],$value[title],$value[education],$value[grade],$value[email],$value[telephone],$value[qq],$value[homepage]");
				fwrite($file,"$content");
				fwrite($file, " \r\n");
			}
		}
		fclose($file);
		header("Cache-Control:must-revalidate,post-check=0,pre-check=0");  
		header("Content-Description:File Transfer");  
		header ("Content-type: application/octet-stream"); //定义数据类型
		header ("Content-Length: " . filesize ($filename));  
		header("Content-Disposition: attachment; filename=".basename($filename)); 
		readfile($filename);
	}
	
	public function sendEmail() {
		global $_G;
		if(empty($_G[uid]))
		{
			$this->assign('jumpUrl','/User/login');
			$this->error("您尚未登录");
		}
		$tid = $this->_request('tid');
		
		if(!D('Team')->isManager($tid)) {
			$this->error("没有足够权限");
		}

		$re=D('Team')->getMembers($tid);
		$members = array();
		foreach($re as $row => $value)
		{
			if($value['priv']!='member')
				$value['info']=$value['realname'].'('.$value['title'].')'.'-'.$value['email'];
			else
				$value['info']=$value['realname'].'-'.$value['email'];
			$members[] = $value;
		}
		$team = D('Team')->getInfo($tid);
		$this->assign('team',$team);
		$this->assign('members',$members);
		//dump($club);
		$this->display();
	}

	public function sendEmailSubmit() {
		global $_G;
		if(empty($_G[uid]))
		{
			$this->assign('jumpUrl','/User/login');
			$this->error("您尚未登录");
		}
		$tid = $this->_request('tid');
		
		if(!D('Team')->isManager($tid)) {
			$this->error("没有足够权限");
		}

		$tuid = $_POST['tuid'];
		$emails = array();
		if(trim($tuid)=="all")
		{
			$members = M()->query("SELECT u.email FROM ustc_user AS u, ustc_user_team AS t WHERE t.tid = '$tid' AND t.uid = u.uid AND t.priv != 'inactive'");
			foreach ($members as $member)
				$emails[] = $member['email'];
		}
		elseif(!empty($tuid))
		{
			$tuid=explode(";",$tuid);
			$tuid_all = "(";
			foreach($tuid as $value)
			{
				if($value)
				{
					$tuid_all .= $value.",";
				}
			}
			$tuid_all = substr($tuid_all,0,strlen($tuid_all)-1).")";
			$members = M()->query("SELECT email FROM ustc_user  WHERE uid in $tuid_all");
			foreach ($members as $member)
				$emails[] = $member['email'];
		}
		if (empty($emails))
			$this->error("您没有选择成员 :)");
		
		if (!($title = $_POST['title']))
			$this->error("必须填写邮件标题");
		if (strlen($title) > 200)
			$this->error("邮件标题过长!");
		if (strlen($title) < 5)
			$this->error("邮件标题过短!");
		if (!($message = $_POST['message']))
			$this->error("必须填写邮件内容");
		if (strlen($message) > 10000)
			$this->error("邮件内容过长!");
		if (strlen($message) < 10)
			$this->error("邮件内容过短!");
		sendMail($emails, $title, $message, true);

		$this->success("成功发送邮件给 ". count($emails) ." 人");
	}

	public function upload(){
		global $_G;
		if(empty($_G[uid]))
		{
			$this->assign('jumpUrl','/User/login');
			$this->error("您尚未登录");
		}
		$tid = $this->_request('tid');
		if(!D('Team')->isMember($tid)) {
			$this->error("不是本组会员不能上传");
		}
		$team = D('Team')->getInfo($tid);
		$this->assign('team', $team);
		$this->display();
	}
	public function uploadSubmit(){

		$maxSize =  5 * 1024 * 1024;
		if($_FILES['attachment']["size"]>$maxSize)
		{
			$this->error("上传文件超过5M");
		}
		global $_G;
		if(empty($_G[uid]))
		{
			$this->assign('jumpUrl','/User/login');
			$this->error("您尚未登录");
		}
		$tid = $this->_post('tid');
		$gid = D('Team')->getGidByTid($tid);
		if(!D('Team')->isMember($tid)) {
			$this->error("不是本组会员不能上传");
		}
		$realname = $_FILES['attachment']["name"];
		include("./Common/UploadFile.class.php");
		$upload = new UploadFile();
		$upload->maxSize = $maxSize;
		$upload->saveRule = D("Team")->setFileName();

		if(!is_dir("./upload/team/$gid"))
		{
			if(!mkdir("./upload/team/$gid"))
			{
				$this->error("上传目录出错");
			}
		}
		if(!is_dir("./upload/team/$gid/$tid"))
		{
			if(!mkdir("./upload/team/$gid/$tid"))
			{
				$this->error("上传目录出错");
			}
		}
		$upload->savePath = "./upload/team/$gid/$tid/";

		if ($upload->upload()) {
			$info = $upload->getUploadFileInfo();
			//dump($info);
			$data=array(
				'tid'=>$tid,
				'uid'=>CURRENT_USER,
				'time'=>time(),
				'name'=>$info[0]['savename'],
				'realname'=>$realname,
				'size'=>$info[0]['size']

			);
			$attachment = M('Team_attachment');
			$attachment->create($data);
			$attachment->add();
			M('Team')->where(array('tid'=>$tid))->setDec('attachment_size',$info[0]['size']);
			$this->success('上传成功');

		}
		else
		{
			$this->error($upload->getErrorMsg());
		}
	}

	public function downloadFile()
	{
		global $_G;
		if(empty($_G[uid]))
		{
			$this->assign('jumpUrl','/User/login');
			$this->error("您尚未登录");
		}
		
		$fid = $this->_get("fid");
		$file = M("Team_attachment")->find($fid);
		$gid = D('Team')->getGidByTid($file['tid']);
		if(!D('Team')->isMember($file['tid'])) {
			$this->error("不是本组会员不能下载");
		}
		
		$filepath = "./upload/team/$gid/".$file['tid']."/".$file['name'];
		//$filename=realpath($filepath);
		//dump($filepath);
		//dump($filename);
		if(!file_exists($filepath))
		{
			$this->error("文件不存在！");
		}
		
		$filename=realpath($filepath);  //文件名
		$name = $file['realname'];
		Header( "Content-type:   application/octet-stream "); 
		Header( "Accept-Ranges:   bytes "); 
		Header( "Accept-Length: " .filesize($filename));
		header( "Content-Disposition:   attachment;   filename= {$name}"); 
		echo file_get_contents($filename);
		readfile($filename); 
		
		
	}
	
	public function deleteFile(){
		global $_G;
		if(empty($_G[uid]))
		{
			$this->assign('jumpUrl','/User/login');
			$this->error("您尚未登录");
		}
		$fid = $this->_get("fid");
		$file = M("Team_attachment")->find($fid);
		if(empty($file))
		{
			$this->error("附件不存在或已删除");
		}
		$tid = $file['tid'];
		$gid = D('Team')->getGidByTid($tid);
		if(!D('Team')->isManager($tid)) {
			$this->error("您没有足够权限");
		}
		M("Team_attachment")->where(array('fid'=>$fid))->delete();
		$filepath = "./upload/team/$gid/".$file['tid']."/".$file['name'];
		@unlink($filepath);
		$this->success("删除成功");


		
	}
	
	public function addMembers()
	{
		global $_G;
		if(empty($_G[uid]))
		{
			$this->assign('jumpUrl','/User/login');
			$this->error("您尚未登录");
		}
		$tid = $this->_request("tid");
		if(!D('Team')->isAdmin($tid)){
			$this->error("您没有足够权限");
		}
		$touid = $this->_request("touid");
		
		$uids = explode(";",$touid);
		foreach($uids as $uid)
		{
			if($uid)
			{
				D('Team')->addMember($tid,$uid);
				
			}
		}
		$this->success("添加成功");
	}

	public function deleteTeam()
	{
		global $_G;
		if(empty($_G[uid]))
		{
			$this->assign('jumpUrl','/User/login');
			$this->error("您尚未登录");
		}
		$tid = $this->_request("tid");
		$gid = D('Team')->getGidByTid($tid);
		if(!D('Team')->isAdmin($tid)){
			$this->error("您没有足够权限");
		}
		$team=array('flag'=>0);
		M('Team')->where(array('tid'=>$tid))->save($team);
		$this->assign('jumpUrl','/Club/manage?gid='.$gid);
		$this->success("删除成功");
	}
}
