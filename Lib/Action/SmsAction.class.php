<?php
class SmsAction extends PublicAction {
		public function index()
		{
			if(!D('User')->checkLogin()){$this->error('未登陆');}
			$this->display();
		}
		public function selectMember()
		{
			$gid=$this->_get('gid');
			if(!$gid){$this->error('非法操作！');}
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
		   if($to_all==''||$msg==''){$this->error('未填写内容或未指明发送对象');};
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
		   $this->success('成功发送给'.$re['done'].'人\n'.$re['failed'].'条发送失败。');
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