<?php
class SmsAction extends PublicAction {
		public function index()
		{
			$this->display();
		}
		public function sent(){
		   global $_G;
		   $uid= $_G['uid'];
		   $to_all = $this->_post('tid');
		   $msg = $this->_post('s');
		   $Model = D('Sms');
		   if($to_all==''||$msg=='')return 0;
		   //dump($to_all);
		   foreach ($to_all as $row =>$value)
		   {
				echo $value;
				//$Model->getUserMobile($field);
				//dump($Model->getUserMobile($value));
				$mobiles[$value]=$Model->getUserMobile($value);				
		   }
		   //dump($msg);
		   //dump($mobiles);
		   $re=$Model->sentSms($msg,$mobiles);
		   $this->success(print_r($re));
		}

}
?>