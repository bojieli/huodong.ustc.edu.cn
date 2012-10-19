<?php
class SmsAction extends PublicAction {
		public function index()
		{
			$gid=$this->_get('gid');
			if(!$gid){$this->error('非法操作！');}
			if(!D('User')->checkLogin()){$this->error('未登陆');}
			if(!D('Club')->isManager($gid)){$this->error('无权限');}
			$Model = D('Sms');
			$tip=$Model->getSmsTip($gid);
			if($Model->getUpdateTime($gid)==$Model->updateTime($gid))
			{
				if(!$tip)$Model->reSmsNum($gid);
			}
			else
			{
				$Model->changeUpdateTime($gid);
				$Model->reSmsNum($gid);
			}
			$club = D('Club')->getInfo($gid);
			$re=$Model->getMember($gid);
			$members = array();
			foreach($re as $row => $value)
			{
				if($value['priv']!='member')
					$value['info']=$value['realname'].'('.$value['title'].')'.'-'.$value['telephone'];
				else
					$value['info']=$value['realname'].'-'.$value['telephone'];
				$members[] = $value;
			}
			$this->assign('sms_num',$Model->getSmsNum($gid));
			
			//dump($members);
			$this->assign('club',$club);
			$this->assign('members',$members);
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
		   $gid = $_POST['gid'];
		   if(!D('Club')->isManager($gid)){$this->error('无权限');}
		   $to_tmp = trim($this->_post('tid'));
           $to_all=explode(";",$to_tmp);
		   $msg = $this->_post('s');
		   $Model = D('Sms');
		   if($to_all==''||$msg==''){$this->error('未填写内容或未指明发送对象');};
		   $i=0;
		   foreach ($to_all as $row =>$value)
		   {
				if($value)
					{
						$mobiles[$value]=$Model->getUserMobile($value);
						$i++;
					}			
		   }
		   if(!$Model->canSent($gid,$i)){$this->error('剩余短信条数不足');}
		   $re=$Model->sentSms($msg,$mobiles,$gid);
		   $Model->deSmsNum($gid,$re['done']);
		   $info[0] = '成功发送给'.$re['done'].'人'.'----'.$re['failed'].'条发送失败。';
		   if($re['failed'])
		   {
				$info[0].="发送失败的为：".$re['info'];
		   }
		   $info[1]=$Model->getSmsNum($gid);
		   $this->success($info);
		}
		public function tid()
		{
			if(!D('User')->checkLogin()){$this->error('未登陆');}
			$to_tmp = trim($this->_post('tid'));
			$to_all=explode(";",$to_tmp);
			$Model = D('Sms');
			foreach($to_all as $row =>$value)
			{
				$name[]=$Model->getUserName($value);	
			}
			$this->assign('to_tmp',$to_tmp);
			$this->assign('tid_name',$name);
			$this->display('index');
		}
		public function history(){
			$gid=$this->_get('gid');
			if(!$gid){$this->error('非法操作！');}
			if(!D('User')->checkLogin()){$this->error('未登陆');}
			if(!D('Club')->isManager($gid)){$this->error('无权限');}
			$gid=$this->_get('gid');
			$re=M('Sms_md5')->where(array('gid'=>$gid))->order('time')->select();
			foreach($re as $row => $value)
			{
				$re[$row]['realname']=D('Sms')->getUserName($value['uid']);
				$re[$row]['humanDate']=date("Y年n月j日H:i", $value['time']);
			}
			$club = D('Club')->getInfo($gid);
			$club_name=D('Club')->getInfo($gid)['name'];
			$this->assign('club_name',$club_name);
			$this->assign('history',$re);
			//dump($re);
			$this->display();
			
		}
}
?>