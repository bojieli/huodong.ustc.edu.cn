<?php
class AddressModel extends Model {
	protected $tableName = 'user_group';
	public function createAddress($gid,$sid)
	{
		$cond=array('gid'=>$gid,'sid'=>$sid);
		$members = M('User_group')->field('uid')->where($cond)->order('priv desc')->select();
		$members_info = array();
		foreach($members as $m_id)
		{
			 $info = $this->addressInfo($m_id);
			 $members_info = $info;
		}
		dump($members_info);
	}
	public function addressInfo($uid)
	{
		$info = M('User')->find($uid);
		return $info;
	}
}
?>