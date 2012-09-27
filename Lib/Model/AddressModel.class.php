<?php
class AddressModel extends Model {
	protected $tableName = 'user_group';
	public function createAddress($gid,$sid)
	{
		$cond=array('gid'=>$gid,'sid'=>$sid);
		$members = M('User_group')->field('uid,title')->where($cond)->order('priv asc')->select();
		echo M('User_group')->getLastSql();
		$members_info = array();
		foreach($members as $m_id)
		{
			 $info = $this->addressInfo($m_id[uid]);
			 $info['title'] = $m_id[title];
			 $members_info[] = $info;
		}
		return $members_info;
	}
	public function addressInfo($uid)
	{
		$info = M('User')->field('uid,sid,realname,email,grade,education,student_no,telephone,homepage,avatar')->find($uid);
		$info[student_no] = strtoupper($info[student_no]);
		return $info;
	}
}
?>