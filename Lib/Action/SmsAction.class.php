<?php
class SmsAction extends PublicAction {
		public function index()
		{
			if(!D('User')->checkLogin()){$this->error('未登陆');}
			$this->display();
		}
		public function selectMember($gid)
		{
			if(!D('User')->checkLogin()){$this->error('未登陆');}
			if(!D('Club')->isManager($gid)){$this->error('无权限');}
			$Model = D('Sms');
			$re=$Model->getMember($gid);
			foreach($re as $row => $value)
			{
				if($value['title']!='会员')
				$member[$value['uid']]=$value['realname'].'('.$value['title'].')'.'-'.$value['telephone'];
				else
				$member[$value['uid']]=$value['realname'].'-'.$value['telephone'];
			}
			$this->assign('member',$member);
			$this->display();
		}
		public function sent(){
		   if(!D('User')->checkLogin()){$this->error('未登陆');}
		   global $_G;
		   $uid= $_G['uid'];
		   $to_tmp = trim($this->_post('tid'));
           $to_all=explode(";",$to_tmp);
		   //dump($to_all);
		   //return 0;
		   $msg = $this->_post('s');
		   $Model = D('Sms');
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
			if(!D('User')->checkLogin()){$this->error('未登陆');}
			$to_tmp = trim($this->_post('tid'));
			$to_all=explode(";",$to_tmp);
			$Model = D('Sms');
			foreach($to_all as $row =>$value)
			{
				$name.=$Model->getUserName($value).';';	
			}
			$this->assign('to_tmp',$to_tmp);
			$this->assign('tid_name',$name);
			$this->display('index');
		}

}
?>