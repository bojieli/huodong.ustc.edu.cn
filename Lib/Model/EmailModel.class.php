<?php
class EmailModel extends Model {
	public function sendMails($address, $title, $message, $html = false){
		SendMail($address, $title, $message, $html = false);
	}
	public function emailContentLog($title,$content,$uid,$gid){
        $data=[
        	'title'=>$title,
        	'content'=>$content,
        	'uid'=>$uid,
        	'gid'=>$gid,
        	'time'=>$time
        ];
	}
	public function emailLogForTimer($uid,$tid,$pid,$status)
	{
		$data=array(
				'uid'   =>$uid,
				'aid'	=>$id,
				'time'  =>time(),
				'status'=>$status
			   );
		$count = M('timer')->where(['uid'=>$uid,'tid'=>$tid,'pid'=>$pid])->count();
		if($count > 0)
			M('sms')->where(['uid'=>$uid,'tid'=>$tid,'pid'=>$pid])->data(['time'=>time(),'status'=>$status])->save();
		else
			M('sms')->data($data)->add();
	}


	public function sms_status($pid){
		if(M('Sms')->where(['pid'=> $pid,'status'=>'failed'])->count())
			return '发送失败';
		if(M('Sms')->where(['pid'=> $pid,'status'=>'ing'])->count())
			return '正在发送';
		return '成功发出';
	}


	public function sms_md5($msg,$uid,$tids,$gid,$sms_type,$type_id)
	{

		$md5=md5($uid."\t".trim($tids)."\t".trim($gid)."\t".trim($msg));
		//echo $md5;
		$data=array(
				'uid'   =>$uid,
				'msg'   =>$msg,
				'tids'	=>$tids,
				'gid'	=>$gid,
				'time'  =>time(),
				'md5'=>$md5,
				'sms_type'=>$sms_type,
				'type_id'=>$type_id?$type_id:0,
			   );
		M('sms_md5')->data($data)->add();
		$re=M('sms_md5')->field('pid')->where(array('md5'=>$md5))->order('time DESC')->find();
		return $re['pid'];
	}
	public function getUserMobile($uid)
	{
		$re=M('user')->field('telephone')->where(array('uid'=>$uid))->find();
		return $re['telephone'];
	}
	public function getUserName($uid)
	{
		$re=M('user')->field('realname')->where(array('uid'=>$uid))->find();
		return $re['realname'];
	}
	public function getMember($gid)
	{
		$members = M()->query("SELECT ustc_user.uid,student_no,email,realname,telephone,email,title,priv FROM (ustc_user INNER JOIN ustc_user_group ON ustc_user.uid = ustc_user_group.uid) INNER JOIN ustc_priv ON ustc_user_group.priv = ustc_priv.priv_name WHERE ustc_user_group.gid='$gid' ORDER BY ustc_priv.priv_value desc");
		return $members;
	}

	public function getUpdateTime($gid)
	{
		$re=M('club')->field('sms_time')->where(array('gid'=>$gid))->find();
		if($re)
			return $re['sms_time'];
		else
			return 0;
	}
	public function changeUpdateTime($gid)
	{
		$data=array('sms_time'=>$this->updateTime(),'sms_tip'=>0);
		return M('club')->where(array('gid'=>$gid))->data($data)->save();
	}
	public function updateTime()
	{
		$uw=C('update_week');
		$tmp[1]=array(0,6,5,4,3,2,1);
		$tmp[2]=array(1,0,6,5,4,3,2);
		$tmp[3]=array(2,1,0,6,5,4,3);
		$tmp[4]=array(3,2,1,0,6,5,4);
		$tmp[5]=array(4,3,2,1,0,6,5);
		$tmp[6]=array(5,4,3,2,1,0,6);
		$tmp[0]=array(6,5,4,3,2,1,0);
		$date=getdate();
		$last_time=mktime(23,59,59)+24*3600*$tmp[$uw][$date['wday']]-24*3600*7;
		return $last_time;
	}
	public function reSmsNum($gid)
	{
		$data=array('sms_num'=>$this->smsNum($gid),'sms_tip'=>1);
		return M('club')->where(array('gid'=>$gid))->data($data)->save();
	}
	public function smsNum($gid)  //免费短信条数规则
	{
		$weight=C('sms_weight');
		$minimum=C('sms_minimum');
		$re=M('club')->field('member_count')->where(array('gid'=>$gid))->find();
		return $re['member_count']*$weight+$minimum;
	}
	
	public function getSmsNum($gid)
	{
		$re=M('club')->field('sms_num')->where(array('gid'=>$gid))->find();
		return $re['sms_num'];
	}
	public function getSmsTip($gid){
		$re=M('club')->field('sms_tip')->where(array('gid'=>$gid))->find();
		return $re['sms_tip'];
	}
	public function deSmsNum($gid,$de)
	{
		$data=array('sms_num'=>$this->getSmsNum($gid)-$de);
		return M('club')->where(array('gid'=>$gid))->data($data)->save();
	}
	public function canSent($gid,$i,$n)
	{
		if($this->getSmsNum($gid)-$i*$n<0)
			return 0;
		else 
			return 1;
	} 
	public function getPidsByGid($gid){
		return D('Sms_md5')->field('pid')->where(['gid'=> $gid])->select();
	}
	public function getAllSmsNumByGid($gid){
		$pids = $this->getPidsByGid($gid);
		foreach($pids as $pid)
			$count+= $this->getSmsNumByPid($pid['pid']);
		return $count;
	}
	public function getSmsNumByPid($pid)
	{
		return M('Sms')->where(['pid'=> $pid])->count();
	}
	public function getPidNumCount($gid){//社团发送短信总批次
		return M('Sms_md5')->where(array('gid'=>$gid))->count();
	}
	public function getTidsName($pid){
		$re = M('Sms_md5')->where(['pid'=>$pid])->find();
		$tids = $re['tids'];
		$gid = $re['gid'];
		$sms_type = $re['sms_type'];
		$type_id = $re['type_id'];
        //dump($sms_type);
		$tidArray=explode(";",$tids);
		foreach($tidArray as $tid){
			if($sms_type == 'address'){
				//dump($vid);
				$nameString.=A('Club')->getRealname($tid,$type_id,$gid).' ';
			}
			else 
			{
				if ($sms_type == 'activity') {
				    $nameString.=D('Activity')->getRealname($tid,$type_id).' ';
				}
				else{
				       $nameString.=D('User')->getRealname($tid).' ';	
				}
			}
		}
		
		return $nameString;
	}
}
?>
