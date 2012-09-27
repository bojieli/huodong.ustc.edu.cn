<?php
class ClubAction extends PublicAction {
	public function index() {
		$this->headnav();
		$keyword = isset($_GET['keyword']) ? $_GET['keyword'] : '';
		$condition = '';
		if(!empty($keyword))
		{
			$condition = " name like '%$keyword%' ";
		}
		$this->assign('keyword', $keyword);
		$this->assign('clubstat', D('Club')->get_stat($condition));
		$this->assign('filter', isset($_GET['filter']) ? $_GET['filter'] : 'all');
		$this->display();
	}

	public function intro() {
		$this->headnav();
		D('Club')->updateClicks($_GET['gid']);
		$club = $this->getData($_GET['gid']);
		$this->assign('club', $club);
		$this->display();
	}

	public function introModify() {
		$club = $this->getData($_GET['gid']);
		$this->assign('club', $club);

		if ($club['isadmin'])
			$this->display();
		else
			$this->error("抱歉，只有社团管理员才能修改社团简介");
	}

	public function introUpdate() {
		$gid = $_POST['gid'];
		$club = $this->getData($gid);
		if (!$club['isadmin'])
			$this->error("抱歉，只有社团管理员才能修改社团简介");
		$club = M('Club')->find($gid);
		// strip HTML in fields
		$fields = ['name_en','slogan','found_date','teacher','qq_group','contact','homepage','shortdesc'];
		foreach ($fields as $field) {
			$club[$field] = htmlspecialchars($_POST[$field]);
		}
		// long desc is allowed to have HTML
		$club['description'] = $_POST['description'];
		if (strlen($club['shortdesc']) > 420)
			$club['shortdesc'] = substr($club['shortdesc'], 0, 420);

		$logo = $this->uploadLogo();
		if (!empty($logo))
			$club['logo'] = $logo;

		M('Club')->where(['gid'=>$gid])->save($club);

		$this->assign('jumpUrl','/Club/intro?gid='.$gid);
		$this->success("修改成功！");
	}

	public function addOwner() {
		$this->display();
	}

	public function addOwnerSubmit() {
		if (!(D('User')->isSchoolAdmin(CURRENT_USER)))
			$this->error("没有权限！");

		$club['owner'] = $_REQUEST['owner'];
		M('Club')->where(array('gid'=>$_REQUEST['gid']))->save($club);

		M('user_group')->where(array('gid'=>$_REQUEST['gid'], 'uid'=>$_REQUEST['owner']))->delete();
		
		$record['gid'] = $_REQUEST['gid'];
		$record['uid'] = $_REQUEST['owner'];
		$record['priv'] = 'admin';
		$record['title'] = '会长';
		$row = M('user_group');
		$row->create($record);
		$row->add();

		$this->success("设置会长成功！");
	}

	public function introAdd() {
		$this->display();
	}
	public function ajaxAutocomplete()
	{

		$condition_info['name']  =array('like',"%".$_GET['term']."%");
		$res = M('Club')->field('name')->where($condition_info)->order("total_rate DESC")->limit(10)->select();
		if($res){$count=count($res);}
		else $count = 0;
		echo '[';
		foreach($res as $key => $val)
		{
			echo "\"$val[name]\"";
			if($i++<$count-1)
			{
				echo ",";
			}
		}
		echo ']';
	}
	public function introInsert() {
		if (!(D('User')->isSchoolAdmin(CURRENT_USER)))
			$this->error("没有权限！");

		$fields = ['type','name','owner','name_en','slogan','found_date','teacher','qq_group','contact','homepage','shortdesc'];
		foreach ($fields as $field) {
			$club[$field] = htmlspecialchars($_POST[$field]);
		}
		if (empty($club['name']))
			$this->error("必须有社团名称");
		if (strlen($club['shortdesc']) > 420)
			$club['shortdesc'] = substr($club['shortdesc'], 0, 420);
		$club['description'] = $_POST['description'];

		$club['logo'] = $this->uploadLogo();

		$club['sid'] = 1; // force USTC

		if (!is_numeric($club['owner']) || $club['owner'] <= 0) // key constraint
			unset($club['owner']);

		$model = M('Club');
		$model->create($club);
		$model->add();
		
		$this->success("添加成功！");
	}

	private function uploadLogo() {
		import("ORG.Net.UploadFile");
		$upload = new UploadFile();
		$upload->maxSize = 2 * 1024 * 1024;
		$upload->allowExts = ['jpg', 'gif', 'png', 'jpeg'];
		$upload->savePath = './upload/clublogo/';
		$upload->saveRule = 'uniqid';
		
		import("ORG.Util.Image");
		$upload->thumb = true;
		$upload->thumbPath = './upload/clublogo/thumb/';
		$upload->thumbMaxWidth = 500; // twice width
		$upload->thumbMaxHeight = 2000;

		if ($upload->upload()) {
			$info = $upload->getUploadFileInfo();
			return $info[0]["savename"];
		}
		return null;
	}

	public function sendEmail() {
		$this->display();
	}

	public function sendEmailSubmit() {
		$gid = $this->getInputGid();
		if (!$this->isManager($gid)) {
			$this->error("只有会长和部长才有权限群发邮件。");
		}
		$members = M()->query("SELECT u.email FROM ustc_user AS u, ustc_user_group AS g WHERE g.gid = '$gid' AND g.uid = u.uid AND g.priv != 'inactive'");
		$emails = array();
		foreach ($members as $member)
			$emails[] = $member['email'];
		if (empty($emails))
			$this->error("您的社团还没有成员 :)");
		
		if (!($title = $_POST['title']))
			$this->error("必须填写邮件标题");
		if (strlen($title) > 200)
			$this->error("邮件标题过长!");
		if (strlen($title) < 5)
			$this->error("邮件标题过短!");
		if (!($message = $_POST['message']))
			$this->error("必须填写邮件内容");
		if (strlen($title) > 10000)
			$this->error("邮件内容过长!");
		if (strlen($title) < 10)
			$this->error("邮件内容过短!");
		sendMail($emails, $title, $message, true);

		$this->assign('jumpUrl', '/Club/manage?gid='.$gid);
		$this->success("成功发送邮件给 ". count($emails) ." 人");
	}

	public function manage() {
		$gid = $this->getInputGid();
		$page = isset($_GET['page']) && is_numeric($_GET['page']) ? $_GET['page'] : 1;
		//$start = isset($_GET['start']) && is_numeric($_GET['start']) ? $_GET['start'] : 0;
		$num = isset($_GET['num']) && is_numeric($_GET['num']) ? $_GET['num'] : 20;
		$start = ($page-1)*$num;
		$club = $this->getData($gid);
		$this->assign('club', $club);
		if (!$this->isManager($gid)) {
			$start = 0;
			$num = 20;
		}
		$members = M()->query("SELECT * FROM ustc_user AS u, ustc_user_group AS ug WHERE ug.gid='$gid' AND ug.uid = u.uid ORDER BY ug.priv LIMIT $start,$num");
		foreach ($members as &$member) {
			$member['avatar'] = D('user')->getAvatar($member[uid],'small');
			/*if (empty($member['avatar']))
				$member['avatar'] = C('AVATAR_PATH')."noavatar_big.gif";
			else
				$member['avatar'] = C('AVATAR_PATH').$member['avatar'];*/
		}
		unset($member);
		$this->assign('members', $members);
		$inactive_members = M()->query("SELECT * FROM ustc_user AS u, ustc_user_group AS ug WHERE ug.gid='$gid' AND ug.priv = 'inactive' AND ug.uid = u.uid");
		$this->assign('inactive', $inactive_members);
		$this->assign('pageStart', $start);
		$this->assign('pageNow', $page);
		$this->headnav();
		$this->display();
	}

	public function join() {
		if (CURRENT_USER == 0) {
			$this->error("您需要注册或登录后才能加入社团");
		}
		$gid = $this->getInputGid();
		if ($this->getPriv($gid) == null) {
			$record = array(
				'uid' => CURRENT_USER,
				'gid' => $gid,
				'sid' => 1,
				'priv' => 'inactive',
				'title' => '审核中'
			);
			$obj = M('user_group');
			$obj->create($record);
			$obj->add();
			$this->assign('jumpUrl', "/Club/intro?gid=$gid");
			$this->success("您的加入申请已经提交");
		} else
			$this->error("您已经是这个社团的成员了，请勿重复提交申请");
	}

	public function joinVerify() {
		list($gid, $uid) = $this->getInputGidUid();
		$this->assign('jumpUrl', "/Club/manage?gid=$gid");
		if ($this->isManager($gid)) {
			if ($this->getPriv($gid, $uid) == 'inactive') {
				D('Club')->addMember($gid, $uid);
				$this->sendJoinClubEmail($uid, $gid, true);
				$this->success("已经通过此加入申请");
			} else
				$this->error("此用户不处于待审核状态");
		} else
			$this->error("只有会长和部长才有权限审核会员");
	}

	public function joinDeny() {
		list($gid, $uid) = $this->getInputGidUid();
		$this->assign('jumpUrl', "/Club/manage?gid=$gid");
		if ($this->isManager($gid)) {
			if ($this->getPriv($gid, $uid) == 'inactive') {
				M('user_group')->where(['uid'=>$uid, 'gid'=>$gid])->delete();
				$this->sendJoinClubEmail($uid, $gid, false);
				$this->success("已经拒绝此加入申请");
			} else
				$this->error("此用户不处于待审核状态");
		} else
			$this->error("只有会长和部长才有权限审核会员");
	}

	// should be only called in ajax
	public function changeTitle() {
		list($gid, $uid) = $this->getInputGidUid();
		$title = htmlspecialchars($_GET['title']);
		if (!in_array($_GET['priv'], ['admin', 'manager', 'member', 'inactive'])) {
			die("Invalid privilege");
		}
		$priv = $_GET['priv'];
		
		if ($this->isAdmin($gid)) {
			$record['priv'] = $priv;
			$record['title'] = $title;
			$record['sid'] = 1;
			$priv_pre = M('User_group')->result_first("SELECT priv FROM ustc_user_group where uid = $uid and gid = $gid and sid = 1");
			if(($priv_pre!='inactive')&&($priv=='inactive'))
			{
				M('Club')->where(['gid'=>$gid, 'sid'=>1])->setDec('member_count'); // 会员数减1 
			}
			if(($priv_pre=='inactive')&&($priv!='inactive'))
			{
				M('Club')->where(['gid'=>$gid, 'sid'=>1])->setInc('member_count'); // 会员数加1 
			}
			M('user_group')->where(['uid'=>$uid, 'gid'=>$gid])->save($record);
			die("OK");
		} else
			die("Not enough privilege");
	}
	public function test()
	{
		$clubs = M('Club')->where("1")->select();
		foreach($clubs as $value)
		{
			$num = M('User_group')->result_first("SELECT count(*) FROM ustc_user_group where gid = $value[gid] and sid = 1 and priv !='inactive'");
			$record['member_count'] = $num;
			M('Club')->where(['gid'=>$value[gid]])->save($record);
		}
	}

	public function removeMember() {
		list($gid, $uid) = $this->getInputGidUid();
		if ($this->isAdmin($gid)) {
			D('Club')->removeMember($gid, $uid);
			die("OK");
		} else
			die("Not enough privilege");
	}

	public function quit() {
		$gid = $this->getInputGid();
		if ($this->getPriv($gid) == 'member') {
			D('Club')->removeMember($gid, CURRENT_USER);
		}
		$this->assign('jumpUrl', "/Club/intro?gid=$gid");
		$this->success("退出社团成功！");
	}

	private function getPriv($gid, $uid = CURRENT_USER) {
		return M()->result_first("SELECT priv FROM ustc_user_group WHERE `uid`='$uid' AND `gid`='$gid'");
	}

	public function isAdmin($gid, $uid = CURRENT_USER) {
		return D('User')->isSchoolAdmin($uid) || $this->getPriv($gid,$uid) == 'admin';
	}

	public function isManager($gid, $uid = CURRENT_USER) {
		return D('User')->isSchoolAdmin($uid) || in_array($this->getPriv($gid,$uid), ['admin','manager']);
	}

	public function inClub($gid, $uid = CURRENT_USER) {
		return $this->getPriv($gid, $uid) != NULL && $this->getPriv($gid, $uid) != 'inactive';
	}

	private function getData($gid, $join = false) {
		if (!is_numeric($gid))
			return null;
		$club = M('Club')->find($gid);
		if (empty($club))
			return null;
		$club['school'] = M('School')->find($club['sid']);
		
		if ($club['owner'] != NULL) {
			$club['admin'] = M('User')->find($club['owner']);
		}

		if ($join) {
			$club['managers'] = M()->query("SELECT * FROM ustc_user AS u, ustc_user_group AS g WHERE g.gid = '$gid' AND g.uid = u.uid AND g.priv = 'manager'");
			$club['managerUids'] = [];
			foreach ($club['managers'] as $manager) {
				$club['managerUids'][] = $magager['uid'];
			}

			$club['members'] = M()->query("SELECT * FROM ustc_user AS u, ustc_user_group AS g WHERE g.gid = '$gid' AND g.uid = u.uid AND g.priv = 'member'");
			$club['memberUids'] = [];
			foreach ($club['members'] as $member) {
				$club['memberUids'][] = $member['uid'];
			}
		}

		$club['mypriv'] = M()->result_first("SELECT priv FROM ustc_user_group WHERE `uid`='".CURRENT_USER."' AND gid='$gid'");
		$club['isSchoolAdmin'] = D('User')->isSchoolAdmin(CURRENT_USER);
		$club['isadmin'] = ($club['isSchoolAdmin'] || $club['mypriv'] == 'admin');
		$club['ismanager'] = ($club['isadmin'] || $club['mypriv'] == 'manager');
		$club['isin'] = in_array($club['mypriv'], ['admin','manager','member']);
		$club['memberCount'] = $club['member_count'];
		$club['posterCount'] = $club['poster_count'];
		return $club;
	}

	public function work() {
		$list = M('info')->select();
		$this->assign("list", $list);
		$this->display();
	}

	public function ajaxGet() {
		list($start, $num, $filter,$keyword) = $this->parseInput();
		$clubs = D('Club')->getClub($start, $num, $filter,$keyword);
		$elements = [];
		foreach ($clubs as $club)
			$elements[] = $this->club2html($club);
		echo json_encode($elements);
	}

	private function parseInput() {
		$start = isset($_GET['start']) && is_numeric($_GET['start']) ? $_GET['start'] : 0;
		$num = isset($_GET['num']) && is_numeric($_GET['num']) ? $_GET['num'] : 0;
		$filter = isset($_GET['filter']) ? $_GET['filter'] : '';
		$keyword = isset($_GET['keyword']) ? $_GET['keyword'] : '';
		return array($start, $num, $filter, $keyword);
	}

	private function club2html($club) {
		return '<li class="hide">'.
		'<div class="celldiv"><a href="/Club/intro?gid='.$club->gid().'">'.
		'<p class="title">'.$club->name().'</p></a>'.
		$this->clubLogoThumbHtml($club).
		'<div class="intro">'.$club->shortdesc().'</div>'.
		'<div class="detail"><div class="hot">注册会员：'.$club->memberCount().'人'.
		$this->apply2html($club->gid()).
		'</div></div>'.
		'<div class="school">'.$club->schoolName().'</div></div></li>';
	}

	private function clubLogoThumbHtml($club) {
		if ($club->logoThumbUrl() != '')
			return '<a href="/Club/intro?gid='.$club->gid().'">'.
			'<img id="club-'.$club->gid().'" '.
			'class="clublogo" '.
			'height="'.$club->logoThumbHeight().'" '.
			'src="'.$club->logoThumbUrl().' "'.
			'/></a>';
		else return '';
	}

	private function apply2html($gid) {
		$priv = $this->getPriv($gid);
		if (CURRENT_USER == 0) // not login
			$priv = 'notlogin';
		$str = '<span id="apply-'.$gid.'" class="shenqing ';
		switch ($priv) {
			case 'admin':
			case 'manager':
			case 'member': $str .= 'isin';break;
			case 'inactive': $str .= 'applying';break;
			case 'notlogin': $str .= 'apply-notlogin';break;
			default: $str .= 'apply';
		}
		$str .= '">';
		switch ($priv) {
			case 'admin':
			case 'manager':
			case 'member': $str .= '已加入';break;
			case 'inactive': $str .= '申请中';break;
			default: $str .= '申请加入';
		}
		$str .= '</span>';
		return $str;
	}

	private function getInputGidUid() {
		if (!is_numeric($_REQUEST['gid']))
			$this->error("您所查找的社团不存在");
		if (!is_numeric($_REQUEST['uid']))
			$this->error("要验证的用户不存在");
		return array($_REQUEST['gid'], $_REQUEST['uid']);
	}

	private function getInputGid() {
		if (!is_numeric($_REQUEST['gid']))
			$this->error("您所查找的社团不存在");
		return $_REQUEST['gid'];
	}
	public function search()
	{
		$keyword = $_REQUEST['keyword'];
		if(empty($keyword))
		{
			$this->error("搜索关键词不能为空");
		}
		$this->assign('keyword', $keyword);
		$this->assign('clubstat', D('Club')->get_stat());
		$this->assign('filter', isset($_GET['filter']) ? $_GET['filter'] : 'all');
		$this->display();
	}
	public function address()
	{
		global $_G;
		if(empty($_G[uid]))
		{
			$this->assign('jumpUrl','/User/login');
			$this->error("您尚未登录");
		}
		$gid = $this->getInputGid();
		$sid = 1;
		$club = $this->getData($gid);
		if(!$this->isManager($gid)) {
			$this->error("只有会长和部长才有权限查看通讯录");
		}
		$address = D('Address');
		$members = $address->createAddress($gid,$sid);
		$this->assign("club", $club);
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
		$gid = $this->getInputGid();
		$sid = 1;
		$club = $this->getData($gid);
		if(!$this->isManager($gid)) {
			$this->error("只有会长和部长才有权限查看通讯录");
		}
		$address = D('Address');
		$members = $address->createAddress($gid,$sid);
		$email_all = '';
		foreach($members as $key => $value)
		{
			$email_all.='"'.$value[realname].'"'.htmlspecialchars('<').$value[email].htmlspecialchars('>').', ';
		}
		$this->assign("club", $club);
		$this->assign("email", $email_all);
		$this->display();
	}
	public function createAddressFetion()
	{
		global $_G;
		$gid = $this->getInputGid();
		$sid = 1;
		if(empty($_G[uid]))
		{
			$this->assign('jumpUrl','/User/login');
			$this->error("您尚未登录");
		}
		if(!$this->isManager($gid)) {
			$this->error("只有会长和部长才有权限查看通讯录");
		}
		$address = D('Address');
		$members = $address->createAddress($gid,$sid);
		$filename="./upload/address_fetion".$gid.".csv";
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
		$gid = $this->getInputGid();
		$sid = 1;
		if(empty($_G[uid]))
		{
			$this->assign('jumpUrl','/User/login');
			$this->error("您尚未登录");
		}
		if(!$this->isManager($gid)) {
			$this->error("只有会长和部长才有权限查看通讯录");
		}
		$club = $this->getData($gid);
		$address = D('Address');
		$members = $address->createAddress($gid,$sid);
		$filename="./upload/address_email_ustc".$gid.".csv";
		$file=fopen($filename,"w");
		if($file){
			fwrite($file,iconv( "UTF-8", "gbk" ,"联系组,姓名,Email,手机"));
			fwrite($file,"\r\n");
			foreach($members as $key => $value)
			{
				$content = iconv( "UTF-8", "gbk" , "$club[name],$value[realname],$value[email],$value[telephone]");
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
		$gid = $this->getInputGid();
		$sid = 1;
		if(empty($_G[uid]))
		{
			$this->assign('jumpUrl','/User/login');
			$this->error("您尚未登录");
		}
		if(!$this->isManager($gid)) {
			$this->error("只有会长和部长才有权限查看通讯录");
		}
		$address = D('Address');
		$members = $address->createAddress($gid,$sid);
		$filename="./upload/address".$gid.".csv";
		$file=fopen($filename,"w");
		if($file){
			fwrite($file,iconv( "UTF-8", "gbk" ,"姓名,学号,职务,学历,入学年级,email,手机,主页"));
			fwrite($file,"\r\n");
			foreach($members as $key => $value)
			{
				$value[student_no]=strtoupper($value[student_no]);
				$content = iconv( "UTF-8", "gbk" , "$value[realname],$value[student_no],$value[title],$value[education],$value[grade],$value[email],$value[telephone],$value[homepage]");
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

	private function sendJoinClubEmail($uid, $gid, $status) {
		$user = M('user')->field(array('email', 'realname'))->find($uid);
		extract($user);
		$club = M('club')->field(array('name AS clubname', 'member_count'))->find($gid);
		extract($club);
		SendMail($email,
			$status ? "您已成功加入".$clubname : $clubname."拒绝了您的加入请求",
			$realname."你好:\n\n".
			($status ? 
				"您加入 $clubname 的申请已经审核通过。欢迎第 $member_count 位会员！":
				"抱歉，您加入 $clubname 的申请被拒绝。请联系社团负责人以询问原因。"
			).
			"\n\n点击下面链接可以查看 $clubname 的会员列表\n".
			"http://".$_SERVER['HTTP_HOST']."/Club/manage?gid=$gid\n\n".
			"校园活动平台 http://".$_SERVER['HTTP_HOST']
			);
	}

    public function sendNewMemberEmail() {
        if ($_GET['token'] != 'campusATustc')
            die();
		$groups = array();
		$members = M()->query("SELECT * FROM ustc_user AS u, ustc_user_group AS g WHERE g.uid = u.uid AND g.priv = 'inactive'");
		foreach ($members as $member) {
			$groups[$member['gid']][] = $member;
		}
		foreach ($groups as $gid => $group) {
			$this->__sendNewMemberEmail($gid, $group);
		}
	}

	private function __sendNewMemberEmail($gid, $members) {
		$group = M('club')->field(array('name AS clubname', 'owner'))->find($gid);
		extract($group);
        if (empty($owner))
            return;
		$owner = M('user')->field(array('realname', 'email'))->find($owner);
        extract($owner);
		$title = $clubname.'有'.count($members).'位新成员等待审核';
		foreach ($members as $member) {
			$content .= $member['realname'].' '.$member['dept'].' '.$member['grade'].'级'.$member['education']."\n";
		}
		$header =
			$realname."你好:\n\n".
			$title."。\n\n";
		$footer =
			"\n请点击下面链接以查看会员列表并审核新会员:\n".
			"http://".$_SERVER['HTTP_HOST']."/Club/manage?gid=$gid\n\n".
			"校园活动平台 http://".$_SERVER['HTTP_HOST'];
		echo "To: ".$email."\n";
        echo "Title: ".$title."\n";
        echo $header.$content.$footer."\n\n";
        SendMail($email, $title, $header.$content.$footer);
	}
}
