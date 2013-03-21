<?php
class ClubModel extends Model {
    public function getClub($start, $num, $filter, $keyword,$sid) {
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
        if(!empty($sid)&&!empty($filterSql))
        {
            $filterSql .= " and sid = $sid ";
        }
        elseif(!empty($sid))
        {
            $filterSql .= " sid = $sid ";
        }
        return M('Club')->where($filterSql)->order("total_rate DESC")->limit("$start,$num")->cast(__CLASS__)->select();
    }

    public function addMember($gid, $uid) {
        if (!is_numeric($gid) || !is_numeric($uid) || $gid <= 0 || $uid <= 0)
            return;
        $sid = $this->getSidByGid($gid);
		$record['priv'] = 'member';
        $record['title'] = '会员';
        //dump($record);
		if(M('user_group')->where(['uid'=>$uid, 'gid'=>$gid])->count())
			M('user_group')->where(['uid'=>$uid, 'gid'=>$gid])->save($record);
		$record['sid'] = $sid;
		$record['uid'] = $uid;
		$record['gid'] = $gid;
		M('user_group')->add($record);
        //echo M('user_group')->getLastSql();die;
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
        return $this->member_count;//M('user_group')->where(['gid' => $this->gid])->count();
    }

    public function schoolName($gid) {
        $group = M('Club')->find($gid);
        $school = M('School')->field('name')->find($group['sid']);
        return $school['name'];
    }

    public function get_stat($condition='') {
        if(empty($condition))
        {
            $condition1 = "";
            $condition2= "";
        }
        else
        {
            $condition1 = " where ".$condition;
            $condition2= " and ".$condition;
        }
        $stat['total'] = $this->result_first("SELECT COUNT(*) FROM ustc_club".$condition1);
        $stat['club'] = $this->result_first("SELECT COUNT(*) FROM ustc_club WHERE `type`='club' ".$condition2);
        $stat['gradUnion'] = $this->result_first("SELECT COUNT(*) FROM ustc_club WHERE `type`='gradUnion'".$condition2);
        $stat['studentUnion'] = $this->result_first("SELECT COUNT(*) FROM ustc_club WHERE `type`='studentUnion'".$condition2);
        $stat['other'] = $stat['total'] - $stat['club'] - $stat['gradUnion'] - $stat['studentUnion'];
        return $stat;
    }

    public function getSidByGid($gid)
    {
        return M('Club')->result_first("select sid from ustc_club where gid = $gid");
    }
    public function getClubAdminApply($condition)
    {
        $applies = array();
        $applies_tmp = M('Club_apply')->where($condition)->order('ishandled asc,time desc')->select();
        foreach($applies_tmp as $apply){
            $apply['applier'] = D('User')->getInfo($apply['uid']);
            $apply['club'] = M('Club')->find($apply['gid']);
            $applies[] = $apply;
        }
        return $applies;
    }
    public function getClubsByCondition($condition)
    {
        $clubs = array();
        $clubs_tmp = M('Club')->where($condition)->select();
        foreach($clubs_tmp as $club)
        {
            if ($club['owner'] != NULL) {
                $club['admin'] = M('User')->find($club['owner']);
            }
            $club['school'] = M('School')->find($club['sid']);
            $clubs[] = $club;
        }
        return $clubs;
    }
    private function getPrivValue($gid,$uid = CURRENT_USER)
    {
        return M()->result_first("SELECT up.priv_value FROM ustc_user_group As ug, ustc_priv As up WHERE ug.priv = up.priv_name AND ug.uid='$uid' AND ug.gid='$gid'");
    }
	public function isAdmins($gid,$uid = CURRENT_USER)//副主席以上
	{
		return D('User')->isDeveloper($uid)||$this->getPrivValue($gid)>7;
	}
	public function isCorer($gid, $uid = CURRENT_USER)//副部长及以上
	{
		return D('User')->isDeveloper($uid)||$this->getPrivValue($gid)>5;
	}
    public function isManager($gid, $uid = CURRENT_USER) {
        return $this->isSchoolAdmin($uid,$gid) || $this->getPrivValue($gid,$uid)>1;
    }
    public function isSchoolAdmin($uid,$gid) {
        $info = M('User')->field(array('isdeveloper', 'isschooladm'))->find($uid);
        if (empty($info))
            return false;
        if ($info['isdeveloper'])
            return true;
        if ($info['isschooladm']) { // is it in the same school?
            $user = M('User')->field('sid')->find($uid);
            if(isset($gid))
                $club = M('Club')->field('sid')->find($gid);
            else // cannot determine what school
                return false;


            if ($user['sid'] == $club['sid'])
                return true;
        }
        return false;
    }
    public function isMember($uid,$gid)
    {
        return $this->getPrivValue($gid,$uid)>=1;
    }
    public function getInfo($gid) {
        if (!is_numeric($gid))
            return null;
        $club = M('Club')->find($gid);
        if (empty($club))
            return null;
        $club['school'] = M('School')->find($club['sid']);
        $club['memberCount'] = $club['member_count'];
        $club['posterCount'] = $club['poster_count'];
        //dump($club);
        return $club;
    }

    public function getClubName($gid) {
        if (!is_numeric($gid))
            return null;
        $club = $this->field('name')->find($gid);
        if (empty($club))
            return null;
        return $club['name'];
    }
	public function showMember($gid){//导入的成员
	  $info=M('club_address')->where(['gid'=>$gid])->select();
	  foreach($info as $key => $val){
		   $info[$key]['content']=json_decode($val['content'],true);
	  }
	  return $info;
	}
	public function UserKind($gid,$email,$telephone){
	    $User=D('User');
		if(!$User->is_user_existed($email,$telephone)) return 0;
		$uid=$User->getUidWithMail($email)?$User->getUidWithMail($email):$User->getUidWithTel($telephone);
		if(!$this->isMember($uid,$gid)) return 1;
		return 2;
	}
}
