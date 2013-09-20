<?php
class AddressModel extends Model {
    protected $tableName = 'user_group';
    public function createAddress($gid)
    {
        $members = M()->query("SELECT * FROM (ustc_user INNER JOIN ustc_user_group ON ustc_user.uid = ustc_user_group.uid) INNER JOIN ustc_priv ON ustc_user_group.priv = ustc_priv.priv_name WHERE ustc_user_group.gid='$gid' ORDER BY ustc_priv.priv_value desc");
        //M('User_group')->field('uid,title')->where($cond)->order('priv asc')->select();
        $members_info = array();
        foreach($members as $m_id)
        {
            $info = $this->addressInfo($m_id[uid]);
            $info['title'] = $m_id[title];
            $members_info[] = $info;
        }
        return $members_info;
    }
	public function createAddressByTid($tid)
	{
		$members = M()->query("SELECT * FROM (ustc_user INNER JOIN ustc_user_team ON ustc_user.uid = ustc_user_team.uid) INNER JOIN ustc_priv ON ustc_user_team.priv = ustc_priv.priv_name WHERE ustc_user_team.tid='$tid' ORDER BY ustc_priv.priv_value desc");
		//M('User_group')->field('uid,title')->where($cond)->order('priv asc')->select();
		$members_info = array();
		foreach($members as $m_id)
		{
			 $info = $this->addressInfo($m_id[uid]);
			 $info['title'] = $m_id['title'];
			 $members_info[] = $info;
		}
		return $members_info;
	}
    public function addressInfo($uid)
    {
        $info = M('User')->field('uid,sid,realname,gender,email,grade,education,student_no,telephone,qq,homepage,avatar')->find($uid);
        $info[student_no] = strtoupper($info[student_no]);
        return $info;
    }
   
}
?>
