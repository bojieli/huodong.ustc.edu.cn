<?php
class ClubModel extends Model {
	public function getClub($start, $num, $filter, $keyword) {
		if (empty($filter) || $filter == 'all')
			$filterSql = '';
		else if ($filter == 'other')
		//	$filterSql = array('type', array('NOT IN', "'club','studentUnion','gradUnion'"));
			$filterSql = "`type` NOT IN ('club','studentUnion','gradUnion')";
		else
			$filterSql = "`type` = '$filter'";//array('type' => $filter);
		if(!empty($keyword)&&!empty($filterSql))
		{
			$filterSql .= " and name like '%$keyword%'";
		}
		elseif(!empty($keyword))
		{
			$filterSql = " name like '%$keyword%'";
		}
		return M('Club')->where($filterSql)->order("total_rate DESC")->limit("$start,$num")->cast(__CLASS__)->select();
	}

	public function addMember($gid, $uid) {
		if (!is_numeric($gid) || !is_numeric($uid) || $gid <= 0 || $uid <= 0)
			return;
		$record['priv'] = 'member';
		$record['title'] = '会员';
		M('user_group')->where(['uid'=>$uid, 'gid'=>$gid])->save($record);
		M()->execute("UPDATE ustc_club SET member_count = member_count + 1 WHERE `gid` = '$gid'");
		$this->updateRate($gid, 20);
	}

	public function removeMember($gid, $uid) {
		if (!is_numeric($gid) || !is_numeric($uid) || $gid <= 0 || $uid <= 0)
			return;
		M('user_group')->where(['uid'=>$uid, 'gid'=>$gid])->delete();
		M()->execute("UPDATE ustc_club SET member_count = member_count - 1 WHERE `gid` = '$gid'");
		$this->updateRate($gid, -20);		
	}

	private function updateRate($gid, $delta) {
		if (!is_numeric($gid) || !is_numeric($delta))
			return;
		M()->execute("UPDATE ustc_club SET total_rate = total_rate + ($delta) WHERE `gid` = '$gid'");
	}

	public function incPosterCount($gid) {
		if (!is_numeric($gid))
			return;
		M()->execute("UPDATE ustc_club SET poster_count = poster_count + 1 WHERE `gid` = '$gid'");
		$this->updateRate($gid, 100);
	}

	public function decPosterCount($gid) {
		if (!is_numeric($gid))
			return;
		M()->execute("UPDATE ustc_club SET poster_count = poster_count - 1 WHERE `gid` = '$gid'");
		$this->updateRate($gid, -100);
	}

	public function updateClicks($gid) {
		if (!is_numeric($gid))
			return;
		M()->execute("UPDATE ustc_club SET clicks = clicks + 1 WHERE `gid` = '$gid'");
		$this->updateRate($gid, 1);
	}

	public function gid() {
		return $this->gid;
	}

	public function name() {
		return $this->name;
	}

	public function shortdesc() {
		return $this->shortdesc;
	}
	
	public function logoUrl() {
		if (!empty($this->logo))
			return "/upload/clublogo/".$this->logo;
		return '';
	}

	public function logoThumbUrl() {
		if (!empty($this->logo))
			return "/upload/clublogo/thumb/thumb_".$this->logo;
		return '';
	}

	public function logoThumbHeight() {
		import("ORG.Util.Image");
		$info = Image::getImageInfo('.'.$this->logoThumbUrl());
		// width 250 => width 500
		if ($info['width'] <= 250)
			return $info['height'];
		else if ($info['width'] <= 500)
			return ceil($info['height'] * 250 / $info['width']);
		else
			return ceil($info['height'] / 2);
	}

	public function memberCount() {
		return M('user_group')->where(['gid' => $this->gid])->count();
	}

	public function schoolName($gid) {
		$group = M('Club')->find($gid);
		$school = M('School')->field('name')->find($group->sid);
		return $school['name'];
	}

	public function get_stat($condition='') {
		if(empty($condition))
		{
			$condition = " where 1 ";
		}
		$stat['total'] = $this->result_first("SELECT COUNT(*) FROM ustc_club".$condition);
		$stat['club'] = $this->result_first("SELECT COUNT(*) FROM ustc_club WHERE `type`='club'".$condition);
		$stat['gradUnion'] = $this->result_first("SELECT COUNT(*) FROM ustc_club WHERE `type`='gradUnion'".$condition);
		$stat['studentUnion'] = $this->result_first("SELECT COUNT(*) FROM ustc_club WHERE `type`='studentUnion'".$condition);
		$stat['other'] = $stat['total'] - $stat['club'] - $stat['gradUnion'] - $stat['studentUnion'];
		return $stat;
	}
}
