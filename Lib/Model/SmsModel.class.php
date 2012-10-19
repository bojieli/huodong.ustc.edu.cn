<?php
class SmsModel extends Model {
	public function sentSms($msg,$mobiles)
	{
		global $_G;
		$uid= $_G['uid'];
		$url="http://umess.ustc.edu.cn/uMessApi.php?wsdl";//接口地址
		$client=new SoapClient($url);
		//远程调用
		//dump($client);
		$client->wsClientSetCharset('UTF-8');
		$client->wsCsLogin('huodong','hzbjlsjr2012');
		$messageId=$client->wsCreateMessage($messageTitle='',$msg,$messageFromAddress="",$messageFromName="",$messageContentFormat="plaintext");
		if ($messageId == 'soap_fault')
			return 'soap_fault';
		$i=0;
		$j=0;
		//dump($mobiles);
		//return 0;
		foreach($mobiles as  $tid1 => $mobile1){
		$tids.=$tid1.';';
		}
		$pid=$this->sms_md5($msg,$uid,$tids);
		$failed_user = "";
		foreach($mobiles as  $tid => $mobile)
		{
			
			$client->wsMessageAddReceiver($messageId,'mobile',$mobile,'sms',$messagePriority=1,$sendTime=null);
			$re=$client->wsMessageSend($messageId);
			if($re)
			{
				$i++;
				$status='done';
				$this->smsLog($uid,$tid,$pid,$status);
			}
			else
			{
				$j++;
				$failed_user.=D('User')->getRealname($tid)." ";
				$status='failed';
				$this->smsLog($uid,$tid,$pid,$status);
			}
		}
		
		$client->wsMessageClose($messageId);
		//$re=$client->wsSendSms($msg,$mobile);
		return array('done'=>$i,'failed'=>$j,'info'=>$failed_user);
	}
	public function smsLog($uid,$tid,$pid,$status)
	{
		$data=array(
			'uid'   =>$uid,
			'tid'	=>$tid,
			'pid'   =>$pid,
			'time'  =>time(),
			'status'=>$status?$status:'done'
		);
		M('sms')->data($data)->add();
	}
	public function sms_md5($msg,$uid,$tids)
	{
		
		$md5=md5($uid."\t".trim($tids)."\t".trim($msg));
		//echo $md5;
		$data=array(
			'uid'   =>$uid,
			'msg'   =>$msg,
			'tids'	=>$tids,
			'time'  =>time(),
			'md5'=>$md5
		);
		M('sms_md5')->data($data)->add();
		$re=M('sms_md5')->field('pid')->where(array('md5'=>$md5))->find();
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
		$members = M()->query("SELECT ustc_user.uid,realname,telephone,title,priv FROM (ustc_user INNER JOIN ustc_user_group ON ustc_user.uid = ustc_user_group.uid) INNER JOIN ustc_priv ON ustc_user_group.priv = ustc_priv.priv_name WHERE ustc_user_group.gid='$gid' ORDER BY ustc_priv.priv_value desc");
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
		$time=time();
		$tmp=array(1,0,6,5,4,3,2);
		$date=getdate();
		$next_time=mktime(0,1,2,$date['mday'],$date['mon'], $date['year'])+24*3600*$tmp[$data['wday']];
		$last_time=$next_time-7*24*3600;
		return $last_time;
	}
	public function reSmsNum($gid)
	{
		$data=array('sms_num'=>$this->smsNum($gid),'sms_tip'=>1);
		return M('club')->where(array('gid'=>$gid))->data($data)->save();
	}
	public function smsNum($gid)
	{
		$re=M('club')->field('member_count')->where(array('gid'=>$gid))->find();
		if($re['member_count']>10)
		return $re['member_count']*2;
		else 
		return 20;
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
}
?>
