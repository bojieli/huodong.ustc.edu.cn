<?php
class ClubModel extends Model {
	public function getClub($start, $num) {
		return M('Club')->limit("$start,$num")->cast(__CLASS__)->select();
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

	public function logoHeight() {
	}

	public function memberCount() {
		return M('user_group')->where(['gid' => $this->gid])->count();
	}

	public function schoolName($gid) {
		$group = M('Club')->find($gid);
		$school = M('school')->field('name')->find($group['sid']);
		return $school['name'];
	}
}
