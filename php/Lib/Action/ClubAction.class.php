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
		$club = M('Group')->find($gid);
		$fields = ['name_en','slogan','qq_group','contact','shortdesc','logo','description'];
		foreach ($fields as $field) {
			$club[$field] = $_POST[$field];
		}
		if (strlen($club['shortdesc']) > 420)
			$club['shortdesc'] = substr($club['shortdesc'], 0, 420);
		M('Group')->where(['gid'=>$gid])->save($club);
		echo "<script>window.location='/Club/intro?gid=".$gid."'</script>";
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
		$this->assign('members', $members);
		$inactive_members = M()->query("SELECT * FROM ustc_user AS u, ustc_user_group AS ug WHERE ug.gid='$gid' AND ug.priv = 'inactive' AND ug.uid = u.uid");
		$this->assign('inactive', $inactive_members);
		$this->assign('pageStart', $start);
		$this->display();
	}

	public function join() {
		if (!is_numeric($_GET['gid']))
			exit();
		$gid = $_GET['gid'];
		if ($this->getMyPriv($gid) == null) {
			$record = array(
				'uid' => $uid,
				'gid' => $gid,
				'priv' => 'member',
				'title' => '会员'
			);
			M('user_group')->add($record);
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
			echo "<script>window.location='/Club/manage?gid=$gid'</script>";	
		}
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
			echo "<script>window.location='/Club/manage?gid=$gid'</script>";	
		}
	}

	public function changeTitle() {
		if (!is_numeric($_GET['gid']) || !is_numeric($_GET['uid']))
			exit();
		$gid = $_GET['gid'];
		$uid = $_GET['uid'];
		$priv = addslashes($_GET['title']);
		switch ($priv) {
			case 'admin': $title='会长';break;
			case 'manager': $title='部长';break;
			case 'member': $title='会员';break;
			case 'inactive': $title='待审核';break;
			default: exit();
		}
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
		return M()->result_first("SELECT priv FROM ustc_user_group WHERE `uid`='$uid' AND `gid`='$gid'");
	}
	
	private function inClub($uid, $gid) {
		return (M('user_group')->where(['uid'=>CURRENT_USER, 'gid'=>$gid])->count()) > 0;
	}

	private function getData($gid, $join = false) {
		if (!is_numeric($gid))
			return null;
		$club = M('Group')->find($gid);
		if (empty($club))
			return null;
		$club['school'] = M('School')->find($club['sid']);
		
		$club['admin'] = M('User')->find($club['owner']);
		$club['isadmin'] = ($club['owner'] == CURRENT_USER);
		
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
		'<div class="intro">'.$club->shortdesc().'</div>'.
		'<img id="'.$club->gid().'" class="haibao" height="'.$club->logoHeight().'" src="'.$club->logoUrl().'" />'.
		'<div class="detail"><div class="hot">注册会员：'.$club->memberCount().'人'.
		'<span class="shenqing"><a>申请加入</a></span>'.
		'</div></div>'.
		'<div class="school">'.$club->schoolName().'</div></div></li>';
	}
}
