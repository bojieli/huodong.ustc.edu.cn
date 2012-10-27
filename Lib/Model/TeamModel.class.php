<?php
class TeamModel extends Model {
	public function getInfo($tid) {
		if (!is_numeric($tid))
			return null;
		///dump($tid);
		$team = M('Team')->find($tid);
		//echo M("Team")->getLastSql();
		//dump($team);
		$team['club']= M('Club')->result_first("select name from ustc_club where gid = ".$team['gid']);
		if (empty($team))
			return null;
		return $team;
	}
	public function getPrivValue($tid,$uid = CURRENT_USER)
	{
		$priv=M('User_team')->result_first("SELECT up.priv_value FROM ustc_user_team As ut, ustc_priv As up WHERE ut.priv = up.priv_name AND ut.uid='$uid' AND ut.tid='$tid'");
		return $priv==null?-1:$priv;
	}
	public function getPrivName($tid,$uid = CURRENT_USER)
	{
		return M('User_team')->result_first("SELECT priv FROM ustc_user_team WHERE uid='$uid' AND tid='$tid'");
	}
	public function getGidByTid($tid)
	{
		return $this->result_first("select gid from ustc_team where tid = $tid");
	}
	public function getTypeByTid($tid)
	{
		return $this->result_first("select type from ustc_team where tid = $tid");
	}
	public function isAdmin($tid,$uid = CURRENT_USER){
		$gid = $this->getGidByTid($tid);
		$type = $this->getTypeByTid($tid);
		if($type=='department')
		{
			return D('User')->isDeveloper($uid)||(D('Club')->isAdmins($gid))||($this->getPrivName($tid)=='manager');
		}
		else
		{
			return D('User')->isDeveloper($uid)||(D('Club')->isCorer($gid))||($this->getPrivName($tid)=='team-leader');
		}
	}
	
	public function isManager($tid,$uid = CURRENT_USER)
	{
		return $this->isAdmin($tid,$uid)||$this->getPrivValue($tid,$uid)>1;
	}
	public function isMember($tid,$uid = CURRENT_USER)
	{
		return $this->getPrivValue($tid,$uid)>=1;
	}
	public function isApplier($tid,$uid = CURRENT_USER)
	{
		return $this->getPrivName($tid)=='inactive';
	}
	public function removeMember($tid,$uid = CURRENT_USER)
	{
		D('User_team')->where(array('uid'=>$uid,'tid'=>$tid))->delete();
		D('Team')->where(array('tid'=>$tid))->setDec('member_count');
	}
	public function addMember($tid,$uid = CURRENT_USER)
	{
		$member = array(
			'uid'=>$uid,
			'tid'=>$tid,
			'title'=>'会员',
			'priv'=>'member',
			'time'=>time()
		);
		$obj = M('User_team');
		$re = $obj->where(array('uid'=>$uid,'tid'=>$tid))->limit(1)->select();
		if(empty($re))
		{
			$obj->create($member);
			$obj->add();
			D('Team')->where(array('tid'=>$tid))->setInc('member_count');
		}
		elseif($re[0]['priv']=='inactive')
		{
			$obj->where(array('uid'=>$uid,'tid'=>$tid))->save($member);
			D('Team')->where(array('tid'=>$tid))->setInc('member_count');
		}
		
	}
	public function getMembers($tid)
	{
		$members = M()->query("SELECT ustc_user.uid,realname,telephone,email,title,priv FROM (ustc_user INNER JOIN ustc_user_team ON ustc_user.uid = ustc_user_team.uid) INNER JOIN ustc_priv ON ustc_user_team.priv = ustc_priv.priv_name WHERE ustc_user_team.tid='$tid' ORDER BY ustc_priv.priv_value desc");
		return $members;
	}

	public function setFileName()
    {
        global $_G;
        return md5(time().$_G[uid]);
    }

}
