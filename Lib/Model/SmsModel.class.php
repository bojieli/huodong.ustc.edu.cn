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
		foreach($mobiles as  $tid => $mobile)
		{
			
			$client->wsMessageAddReceiver($messageId,'mobile',$mobile,'sms',$messagePriority=1,$sendTime=null);
			$re=$client->wsMessageSend($messageId);
			if($re)
			{
				$i++;
				$status='done';
				$this->smsLog($msg,$uid,$tid,$status);
			}
			else
			{
				$j++;
				$status='failed';
				$this->smsLog($msg,$uid,$tid,$status);
			}
		}
		$client->wsMessageClose($messageId);
		//$re=$client->wsSendSms($msg,$mobile);
		return array('done'=>$i,'failed'=>$j);
	}
	public function smsLog($msg,$uid,$tid,$status)
	{
		$data=array(
			'uid'   =>$uid,
			'msg'   =>$msg,
			'tid'	=>$tid,
			'time'  =>time(),
			'status'=>$status?$status:'done'
		);
		M('sms')->data($data)->add();
	}
	public function getUserMobile($uid)
	{
		$re=M('user')->field('telephone')->where(array('uid'=>$uid))->find();
		return $re['telephone'];
	}
}
public function smsLog($msg,$uid,$tid,$status)
{
	$data=array(
		'uid'   =>$uid,
		'msg'   =>$msg,
		'tid'=>$tid,
		'time'  =>time(),
		'status'=>$status?$status:'done'
	);
	M('sms')->data($data)->add();
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
}
?>
