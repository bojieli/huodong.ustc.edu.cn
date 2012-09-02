<?php
class GroupModel extends Model {
	public function schoolName($gid) {
		$group = $this->find($gid);
		$school = M('school')->field('name')->find($group['sid']);
		return $school['name'];
	}
}
