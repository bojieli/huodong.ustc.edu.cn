<?php
class ClubAction extends PublicAction {
	public function index() {
		$this->headnav();
		$this->assign('stat', D('Poster')->get_stat());
		$this->display();
	}

	public function intro() {
		$this->headnav();
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
			die("Sorry, only the admin of a club can modify the club info page.");
	}

	public function introUpdate() {
		$gid = $_POST['gid'];
		$club = $this->getData($gid);
		if (!$club['isadmin'])
			die("Sorry, only the admin of a club can modify the club info page.");
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

		import("ORG.Net.UploadFile");
		$upload = new UploadFile();
		$upload->maxSize = 8 * 1024 * 1024;
		$upload->allowExts = ['jpg', 'gif', 'png', 'jpeg'];
		$upload->savePath = './upload/clublogo/';
		$upload->saveRule = 'uniqid';
		
		import("ORG.Util.Image");
		$upload->thumb = true;
		$upload->thumbPath = './upload/clublogo/thumb/';
		$upload->thumbMaxWidth = 250;
		$upload->thumbMaxHeight = 400;

		if ($upload->upload()) {
			$info = $upload->getUploadFileInfo();
			$club['logo'] = $info[0]["savename"];
		}

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

		$club['owner'] = $_POST['owner'];
		M('Club')->where(array('gid'=>$_POST['gid']))->save($club);

		M('user_group')->where(array('gid'=>$_POST['gid'], 'uid'=>$_POST['owner']))->delete();
		
		$record['gid'] = $_POST['gid'];
		$record['uid'] = $_POST['owner'];
		$record['priv'] = 'admin';
		$record['title'] = '会长';
		$row = M('user_group');
		$row->create($record);
		$row->add();

		$this->success("添加成功！");
	}

	public function introAdd() {
		$this->display();
	}

	public function introInsert() {
		if (!(D('User')->isSchoolAdmin(CURRENT_USER)))
			$this->error("没有权限！");

		$fields = ['name','owner','name_en','slogan','found_date','teacher','qq_group','contact','homepage','shortdesc'];
		foreach ($fields as $field) {
			$club[$field] = htmlspecialchars($_POST[$field]);
		}
		if (empty($club['name']))
			$this->error("必须有社团名称");
		if (strlen($club['shortdesc']) > 420)
			$club['shortdesc'] = substr($club['shortdesc'], 0, 420);
		$club['description'] = $_POST['description'];

		import("ORG.Net.UploadFile");
		$upload = new UploadFile();
		$upload->maxSize = 8 * 1024 * 1024;
		$upload->allowExts = ['jpg', 'gif', 'png', 'jpeg'];
		$upload->savePath = './upload/clublogo/';
		$upload->saveRule = 'uniqid';
		
		import("ORG.Util.Image");
		$upload->thumb = true;
		$upload->thumbPath = './upload/clublogo/thumb/';
		$upload->thumbMaxWidth = 250;
		$upload->thumbMaxHeight = 400;

		if ($upload->upload()) {
			$info = $upload->getUploadFileInfo();
			$club['logo'] = $info[0]["savename"];
		}

		$club['sid'] = 1; // force USTC
		if (!is_numeric($club['owner']))
			$club['owner'] = 1;

		$model = M('Club');
		$model->create($club);
		$model->add();
		
		$this->success("添加成功！");
	}

	public function manage() {
		if (!is_numeric($_GET['gid']))
			exit();
		$gid = $_GET['gid'];
		$start = isset($_GET['start']) && is_numeric($_GET['start']) ? $_GET['start'] : 0;
		$num = isset($_GET['num']) && is_numeric($_GET['num']) ? $_GET['num'] : 20;
		$club = $this->getData($gid);
		$this->assign('club', $club);
		if (!in_array($this->getMyPriv($gid), ['admin','manager'])) {
			$start = 0;
			$num = 20;
		}
		$members = M()->query("SELECT * FROM ustc_user AS u, ustc_user_group AS ug WHERE ug.gid='$gid' AND ug.uid = u.uid ORDER BY ug.priv LIMIT $start,$num");
		foreach ($members as &$member) {
			if (empty($member['avatar']))
				$member['avatar'] = C('AVATAR_PATH')."noavatar_big.gif";
			else
				$member['avatar'] = C('AVATAR_PATH').$member['avatar'];
		}
		unset($member);
		$this->assign('members', $members);
		$inactive_members = M()->query("SELECT * FROM ustc_user AS u, ustc_user_group AS ug WHERE ug.gid='$gid' AND ug.priv = 'inactive' AND ug.uid = u.uid");
		$this->assign('inactive', $inactive_members);
		$this->assign('pageStart', $start);
		$this->headnav();
		$this->display();
	}

	public function join() {
		if (!is_numeric($_GET['gid']))
			exit();
		$gid = $_GET['gid'];
		if ($this->getMyPriv($gid) == null) {
			$record = array(
				'uid' => CURRENT_USER,
				'gid' => $gid,
				'priv' => 'inactive',
				'title' => '审核中'
			);
			$obj = M('user_group');
			$obj->create($record);
			$obj->add();
		}
		echo "<script>window.location='/Club/intro?gid=$gid'</script>";
	}

	public function joinVerify() {
		if (!is_numeric($_GET['gid']) || !is_numeric($_GET['uid']))
			exit();
		$gid = $_GET['gid'];
		$uid = $_GET['uid'];
		if (in_array($this->getMyPriv($gid), ['admin','manager'])) {
			if ($this->getPriv($uid, $gid) == 'inactive') {
				$record['priv'] = 'member';
				M('user_group')->where(['uid'=>$uid, 'gid'=>$gid])->save($record);
			}
		}
		echo "<script>window.location='/Club/manage?gid=$gid'</script>";	
	}

	public function joinDeny() {
		if (!is_numeric($_GET['gid']) || !is_numeric($_GET['uid']))
			exit();
		$gid = $_GET['gid'];
		$uid = $_GET['uid'];
		if (in_array($this->getMyPriv($gid), ['admin','manager'])) {
			if ($this->getPriv($uid, $gid) == 'inactive') {
				M('user_group')->where(['uid'=>$uid, 'gid'=>$gid])->delete();
			}
		}
		echo "<script>window.location='/Club/manage?gid=$gid'</script>";	
	}

	public function changeTitle() {
		if (!is_numeric($_GET['gid']) || !is_numeric($_GET['uid']))
			exit();
		$gid = $_GET['gid'];
		$uid = $_GET['uid'];
		$title = htmlspecialchars($_GET['title']);
		if (!in_array($_GET['priv'], ['admin', 'manager', 'member', 'inactive'])) {
			exit();
		}
		$priv = $_GET['priv'];
		
		if ($this->getMyPriv($gid) == 'admin') {
			$record['priv'] = $priv;
			$record['title'] = $title;
			M('user_group')->where(['uid'=>$uid, 'gid'=>$gid])->save($record);
		}
	}

	public function removeMember() {
		if (!is_numeric($_GET['gid']) || !is_numeric($_GET['uid']))
			exit();
		$gid = $_GET['gid'];
		$uid = $_GET['uid'];
		if ($this->getMyPriv($gid) == 'admin') {
			M('user_group')->where(['uid'=>$uid, 'gid'=>$gid])->delete();
		}
	}

	public function quit() {
		if (!is_numeric($_GET['gid']))
			exit();
		$gid = $_GET['gid'];
		if ($this->getMyPriv($gid) == 'member')
			M('user_group')->where(['uid'=>CURRENT_USER, 'gid'=>$gid])->delete();
		echo "<script>window.location='/Club/intro?gid=$gid'</script>";
	}

	private function getMyPriv($gid) {
		return $this->getPriv(CURRENT_USER, $gid);
	}

	private function getPriv($uid, $gid) {
		if (D('User')->isSchoolAdmin($uid))
			return true;
		return M()->result_first("SELECT priv FROM ustc_user_group WHERE `uid`='$uid' AND `gid`='$gid'");
	}
	
	public function isAdmin($uid, $gid) {
		return $this->getPriv($uid,$gid) == 'admin';
	}

	public function isManager($uid, $gid) {
		return in_array($this->getPriv($uid,$gid), ['admin','manager']);
	}

	public function inClub($uid, $gid) {
		return $this->getPriv($uid, $gid) != NULL && $this->getPriv($uid, $gid) != 'inactive';
	}

	private function getData($gid, $join = false) {
		if (!is_numeric($gid))
			return null;
		$club = M('Club')->find($gid);
		if (empty($club))
			return null;
		$club['school'] = M('School')->find($club['sid']);
		
		$club['admin'] = M('User')->find($club['owner']);
		
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
		$club['isadmin'] = ($club['mypriv'] == 'admin' || D('User')->isSchoolAdmin(CURRENT_USER));
		$club['ismanager'] = ($club['isadmin'] || $club['mypriv'] == 'manager');
		$club['isin'] = !empty($club['mypriv']);
		$club['memberCount'] = M('user_group')->where(['gid'=>$gid])->count();
		return $club;
	}

	public function work() {
		$list = M('info')->select();
		$this->assign("list", $list);
		$this->display();
	}

	public function ajaxGet() {
		list($start, $num) = $this->parseInput();
		$clubs = D('Club')->getClub($start, $num);
		$elements = [];
		foreach ($clubs as $club)
			$elements[] = $this->club2html($club);
		echo json_encode($elements);
	}

	private function parseInput() {
		$start = isset($_GET['start']) && is_numeric($_GET['start']) ? $_GET['start'] : 0;
		$num = isset($_GET['num']) && is_numeric($_GET['num']) ? $_GET['num'] : 0;
		return array($start, $num);
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
			'class="haibao" '.
			'height="'.$club->logoThumbHeight().'" '.
			'src="'.$club->logoThumbUrl().' "'.
			'/></a>';
		else return '';
	}

	private function apply2html($gid) {
		$priv = $this->getMyPriv($gid);
		$str = '<span id="apply-'.$gid.'" class="shenqing ';
		switch ($priv) {
			case 'admin':
			case 'manager':
			case 'member': $str .= 'isin';break;
			case 'inactive': $str .= 'applying';break;
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
}
