<?php
		$url="http://umess.ustc.edu.cn/uMessApi.php?wsdl";//�ӿڵ�ַ
		$client=new SoapClient($url,array('encoding'=>'GBK'));
		$mobile = 15655170201;
		$msg = '���';
		$msg1 = '����';
		//$msg = $_GET['s'];
		//echo $msg;
		//$msg=urlencode($msg);
		//dump($client);
		//die;
		//Զ�̵���
		$client->wsClientSetCharset('UTF-8');
		$client->wsCsLogin('huodong','hzbjlsjr2012');
		$messageId=$client->wsCreateMessage($messageTitle='',$msg,$messageFromAddress="",$messageFromName="",$messageContentFormat="plaintext");
		$messageId1=$client->wsCreateMessage($messageTitle='',$msg1,$messageFromAddress="",$messageFromName="",$messageContentFormat="plaintext");
		$client->wsMessageAddReceiver($messageId,'mobile',$mobile,'sms',$messagePriority=1,$sendTime=null);
		$client->wsMessageAddReceiver($messageId1,'mobile',$mobile,'sms',$messagePriority=1,$sendTime=null);
		$re=$client->wsMessageSend($messageId);
		$re1=$client->wsMessageSend($messageId1);
		echo $re;
		echo $re1;
		$client->wsMessageClose($messageId);
		$client->wsMessageClose($messageId1);
?>