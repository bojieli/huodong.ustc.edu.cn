<?php
class SmsAction extends PublicAction {
		public function index()
		{
			$this->display();
		}
		public function selectMember(){
		
			$this->display();
		}
		public function sent(){
		   global $_G;
		   $uid= $_G['uid'];
		   $to_tmp = trim($this->_post('tid'));
           $to_all=explode(";",$to_tmp);
		   //dump($to_all);
		   //return 0;
		   $msg = $this->_post('s');
		   $Model = D('Sms');
		   return 0;
		   if($to_all==''||$msg=='')return 0;
		   //dump($to_all);
		   foreach ($to_all as $row =>$value)
		   {
				//echo $value;
				//$Model->getUserMobile($field);
				//dump($Model->getUserMobile($value));
				$mobiles[$value]=$Model->getUserMobile($value);				
		   }
		   //dump($msg);
		   //dump($mobiles);
		   $re=$Model->sentSms($msg,$mobiles);
		   $this->success(print_r($re));
		}
		public function tid()
		{
			$to_tmp = trim($this->_post('tid'));
			$to_all=explode(";",$to_tmp);
			$Model = D('Sms');
			foreach($to_all as $row =>$value)
			{
				$name.=$Model->getUserName($value).';';	
			}
			$this->assign('tid_name',$name);
			$this->display('index');
		}

}
?>