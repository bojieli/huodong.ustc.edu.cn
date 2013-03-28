<?php
class SmsAction extends PublicAction {
    public function index()
    {
        $gid=$this->_get('gid');
		$tid=$this->_get('tid');
		$sid=$this->_get('sid');
		if($sid)
		{
			 if(!D('User')->checkLogin()){$this->assign('jumpUrl', '/User/login');$this->error('您尚未登陆');}
			$user = D("User");
			$user_info = $user->getInfo(CURRENT_USER);
			if(!$user_info['isschooladm'])
			{	
				$this->error('您没有权限访问该页面');
			}
			if(!$sid){$this->error('非法操作！');}
			$members = A('Admin')->getClubManager($sid);
			//dump($members);die;
			$this->assign('sname_admin', M('school')->field('name')->where(['sid'=>$sid])->find()['name']);
			$this->assign('admin',1);
		}
		else
		{
				if($gid)
				{
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
					$members=$Model->getMember($gid);
					/*dump($re);die;
					$members = array();
					foreach($re as $row => $value)
					{
						if($value['priv']!='member')
							$value['info']=$value['realname'].'('.$value['title'].')'.'--'.$value['telephone'];
						else
							$value['info']=$value['realname'].'--'.$value['telephone'];
						$members[] = $value;
					}*/
					$this->assign('club',$club);
				}
				if($tid)
				{
					if(!D('User')->checkLogin()){$this->error('未登陆');}
					if(!D('Team')->isManager($tid)){$this->error('无权限');}
					$gid = D('Team')->getGidByTid($tid);
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
					$team = D('Team')->getInfo($tid);
					$re=D('Team')->getMembers($tid);
					$members = array();
					foreach($re as $row => $value)
					{
						if($value['priv']!='member')
							$value['info']=$value['realname'].'('.$value['title'].')'.'--'.$value['telephone'];
						else
							$value['info']=$value['realname'].'--'.$value['telephone'];
						$members[] = $value;
					}
					$this->assign('team',$team);
				}
				$this->assign('sms_num',$Model->getSmsNum($gid));
		}
		$this->history($gid);
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
                $member[$value['uid']]=$value['realname'].'('.$value['title'].')'.'——'.$value['telephone'];
            else
                $member[$value['uid']]=$value['realname'].'——'.$value['telephone'];
        }
		$this->assign('member',$member);
        $this->display();
    }
	public function sent(){
        if(!D('User')->checkLogin()){$this->error('未登陆');}
        global $_G;
		$uid= $_G['uid'];
        $gid = $_POST['gid'];
		$sid = $_POST['sid'];
		if($sid)
		{
			$user_info = D('User')->getInfo(CURRENT_USER);
			if(!$user_info['isschooladm'])
			{	
				$this->error('只有学校管理员有权限群发邮件。');
			}
			$to_tmp = trim($this->_post('tid'));
		}
		else
		{
				if(!D('Club')->isManager($gid)){$this->error('无权限');}
		}
        $to_tmp = trim($this->_post('tid'));
        $to_all=explode(";",$to_tmp);
        $msg = $this->_post('s');
		//$msg = iconv('UTF-8','GB2312//IGNORE',$msg);
        //echo $msg;
        //echo 123;
        //die;
        $Model = D('Sms');

        $i=0;
        foreach ($to_all as $row =>$value)
        {
            if($value)
            {
                $mobiles[$value]=$Model->getUserMobile($value);
                $i++;
            }			
        }
        if($i==''||$msg==''){
            $info[1]=$Model->getSmsNum($gid);
            $info[0]="未填写内容或未指明发送对象";
            $this->error($info);
        };
        $n=count(split_sms($msg,'utf8'));
		if(!$sid){
			if(!$Model->canSent($gid,$i,$n)){
				$info[1]=$Model->getSmsNum($gid);
				$info[0]="剩余短信条数不足";
				$this->error($info);
			}
			$re=$Model->sentSms($msg,$mobiles,$gid,0);
		}
		else{
			$re=$Model->sentSms($msg,$mobiles,$sid,1);
		}
        if(!$sid)
			$Model->deSmsNum($gid,$re['done']);
        
		$info[0] = $re['done'].'条发送成功'.' -- '.$re['failed'].'条发送失败。';
        /*if($re['failed'])
        {
            //$info[0].="发送失败的为：".$re['info'];
        }*/
        if(!$sid)
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
    public function history($gid){
        //$gid=$this->_get('gid');
        //if(!$gid){$this->error('非法操作！');}
        //if(!D('User')->checkLogin()){$this->error('未登陆');}
        //if(!D('Club')->isManager($gid)){$this->error('无权限');}
		//$gid=$this->_get('gid');
        $re=M('Sms_md5')->where(array('gid'=>$gid))->order('time desc')->select();
        //dump($re);
        foreach($re as $row => $value)
        {
            $pid=$value['pid'];
            $re[$row]['pid_num']=D('Sms')->getSmsNumByPid($pid);
            $re[$row]['nameString']=D('Sms')->getTidsName($pid);
            $re[$row]['realname']=D('Sms')->getUserName($value['uid']);
            $re[$row]['humanDate']=date("Y年n月j日H:i", $value['time']);
        }
        $club = D('Club')->getInfo($gid);
        $club_name=$club['name'];
        $school_name=$club['school']['name'];
        $this->assign('club_name',$club_name);
        $this->assign('school_name',$school_name);
        $this->assign('allPidNum',D('Sms')->getPidNumCount($gid));
        $this->assign('allSmsNum',D('Sms')->getAllSmsNumByGid($gid));
        $this->assign('history',$re);
        //dump($re);
        //$this->display();

    }
}
?>
