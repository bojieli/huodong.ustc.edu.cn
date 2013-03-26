<?php
class SmsModel extends Model {
	public function sentMsg($msg_top,$mobile)//单独发短信
	{
		$msgs=split_sms($msg_top,'utf8');
		$url="http://umess.ustc.edu.cn/uMessApi.php?wsdl";//接口地址
        $client=new SoapClient($url,array('encoding'=>'UTF-8'));
		$client->wsCsLogin('huodong','hzbjlsjr2012');
		foreach($msgs as $msg)
		{
			$client->wsSendSms($msg,$mobile);
		}
	}
	public function sentSms($msg_top,$mobiles,$gid,$isadmin)
    {
        global $_G;
        $uid= $_G['uid'];
		$msgs=split_sms($msg_top,'utf8');
        $url="http://umess.ustc.edu.cn/uMessApi.php?wsdl";//接口地址
        $client=new SoapClient($url,array('encoding'=>'UTF-8'));
        $client->wsClientSetCharset('UTF-8');
        $client->wsCsLogin('huodong','hzbjlsjr2012');
        foreach($msgs as $msg){
		$messageIds[]=$client->wsCreateMessage($messageTitle='',$msg,$messageFromAddress="",$messageFromName="",$messageContentFormat="plaintext");
        }//die;
        $i=0;
        $j=0;
        //dump($mobiles);
        //return 0;
        foreach($mobiles as  $tid1 => $mobile1){
            $tids.=$tid1.';';
        }
	   if($isadmin==0)
			$pid=$this->sms_md5($msg_top,$uid,$tids,$gid);
        
		$failed_user = "";
        foreach($mobiles as  $tid => $mobile)
        {
			foreach($messageIds as $messageId)
			{
				$client->wsMessageAddReceiver($messageId,'mobile',$mobile,'sms',$messagePriority=1,$sendTime=null);
			}
        }
		foreach($messageIds as $messageId){
			$re[]=$client->wsMessageSend($messageId);
			     $client->wsMessageClose($messageId);
			}
		foreach($re as $st)
		{
			if($st)
			{
				if($isadmin==0){
					foreach($mobiles as  $tid2 => $mobile2){
						$this->smsLog($uid,$tid,$pid,$gid,'done');
						$i++;
					}
				}
			}
			else
			{
				if($isadmin==0){
					foreach($mobiles as  $tid3 => $mobile3){
						$failed_user.=D('User')->getRealname($tid3)." ";
						$this->smsLog($uid,$tid,$pid,$gid,'failed');
						$j++;
					}
				}
			}
		}
        return array('done'=>$i,'failed'=>$j,'info'=>$failed_user);
    }
    public function smsLog($uid,$tid,$pid,$gid,$status)
    {
        $data=array(
                'uid'   =>$uid,
                'tid'	=>$tid,
                'pid'   =>$pid,
                'gid'   =>$gid,
                'time'  =>time(),
                'status'=>$status?$status:'done'
                );
        M('sms')->data($data)->add();
    }
    public function sms_md5($msg,$uid,$tids,$gid)
    {

        $md5=md5($uid."\t".trim($tids)."\t".trim($gid)."\t".trim($msg));
        //echo $md5;
        $data=array(
                'uid'   =>$uid,
                'msg'   =>$msg,
                'tids'	=>$tids,
                'gid'	=>$gid,
                'time'  =>time(),
                'md5'=>$md5
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
    public function smsNum($gid)
    {
        $re=M('club')->field('member_count')->where(array('gid'=>$gid))->find();
        return $re['member_count']*2+20;
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
    public function getSmsNumByPid($pid,$gid)
    {
        $con=array(
                'pid'=>$pid,
                'gid'=>$gid
                );
        return D('Sms_md5')->where('pid='.$pid.' and gid = '.$gid)->count();
    }
    public function getSmsNumForAll($gid){
        return M('Sms_md5')->where(array('gid'=>$gid))->count();
    }
}
?>
