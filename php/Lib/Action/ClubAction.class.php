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

	public function getData($gid) {
		if (!is_numeric($gid))
			return null;
		$club = M('Group')->find($gid);
		if (empty($club))
			return null;
		$club['school'] = M('School')->find($club['sid']);
		
		$club['admin'] = M('User')->find($club['owner']);
		$club['isadmin'] = ($club['owner'] == CURRENT_USER);
		
		$club['managers'] = M()->query("SELECT * FROM ustc_user AS u, ustc_user_group AS g WHERE g.gid = '$gid' AND g.uid = u.uid AND g.priv = 'manager'");
		$club['managerUids'] = [];
		foreach ($club['managers'] as $manager) {
			$club['managerUids'][] = $magager['uid'];
		}
		$club['ismanager'] = in_array(CURRENT_USER, $club['managerUids']);
		
		$club['members'] = M()->query("SELECT * FROM ustc_user AS u, ustc_user_group AS g WHERE g.gid = '$gid' AND g.uid = u.uid AND g.priv = 'member'");
		$club['memberUids'] = [];
		foreach ($club['members'] as $member) {
			$club['memberUids'][] = $member['uid'];
		}
		$club['ismember'] = in_array(CURRENT_USER, $club['memberUids']);

		$club['isin'] = $club['isadmin'] || $club['ismanager'] || $club['ismember'];
		$club['memberCount'] = 1 + count($club['managerUids']) + count($club['memberUids']);
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
