<?php
class SmsAction extends PublicAction {
    public function index()
    {
        $gid=$this->_get('gid');
		$tid=$this->_get('tid');
		$sid=$this->_get('sid');
		$vid=$this->_get('vid');
		$act_id=$this->_get('act_id');
		$huodong_sms = C('huodong_sms');
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
			    if(empty($vid) && empty($act_id)){
					$sms_type='';
				}
				else{

				 if(!empty($vid)){
						$sms_type="address";
						$type_id=$vid;
					}
			        if (!empty($act_id)) {
			        	$sms_type="activity";
			        	$type_id =$act_id;
			        }
		        }
				if($gid)
				{   
					if(!$gid){$this->error('非法操作！');}
					if(!D('User')->checkLogin()){$this->error('未登陆');}
					if(!D('Club')->isManager($gid)) {
                    	$this->error("只有会长和部长才有权限操作此通讯录");}
                    if(!empty($vid) && D('Club')->isVcardOwner($gid,$vid) == 0){
            			$this->error("无权限操作此手机通讯录");
                    }

					$Model = D('Sms');
					$tip=$Model->getSmsTip($gid);
					//触发短信条数更新
					if($Model->getUpdateTime($gid)==$Model->updateTime($gid))
					{
						if(!$tip)$Model->reSmsNum($gid);
					}
					else
					{
						$Model->changeUpdateTime($gid);
						$Model->reSmsNum($gid);
					}
                     
					if($vid){
						$excel=D('Club')->showMember($gid,$vid);
			            if(empty($excel))
			                $this->error("抱歉该通讯录不存在");
			            $re = A('Club')->excel2Sql($excel[0]);
						$members = array();
						foreach($re as $row => $value)
						{
							if($value['priv']!='member')
								$value['info']=$value['realname'].'('.$value['title'].')'.'--'.$value['telephone'];
							else
								$value['info']=$value['realname'].'--'.$value['telephone'];
							$members[] = $value;
						}
						$club=D('Club')->getInfo($gid);
						//dump($gid);
		        		$this->assign('club',$club);
				}
				else
				{
					$members=$Model->getMember($gid);
					$club=D('Club')->getInfo($gid);
					//dump($club);
		        	$this->assign('club',$club);
				}
			}
			if($tid)
			{
				if(!D('User')->checkLogin()){$this->error('未登陆');}
				//if(!D('Team')->isManager($tid)){$this->error('无权限');}
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
			if($act_id)
			{
				if(!D('User')->checkLogin()){$this->error('未登陆');}
				//if(!D('Team')->isManager($tid)){$this->error('无权限');}
				$gid = D('Activity')->getGidByID($act_id);
				if(!D('Club')->isManager($gid)) {
                    	$this->error("只有会长和部长才有权限操作");}

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

				$Activity = D('Activity')->getActivityByID($act_id);
				$re=D('Activity')->getAddress($act_id);
				$members = array();
				foreach($re as $row => $value)
				{
					if($value['priv']!='member')
						$value['info']=$value['realname'].'('.$value['title'].')'.'--'.$value['telephone'];
					else
						$value['info']=$value['realname'].'--'.$value['telephone'];
					$members[] = $value;
				}
				$this->assign('activity',$Activity);
			}
			$this->assign('sms_num',$Model->getSmsNum($gid));
		}

		$this->history($gid);
		$this->assign('huodong_sms',$huodong_sms);
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
		$vid = $this->_post('vid');
		$act_id = $this->_post('act_id');
		
        $huodong_sms = C('huodong_sms');

		if(empty($vid) && empty($act_id)){

			$sms_type='';
		}
		else{

		 if(!empty($vid)){
				$sms_type="address";
				$type_id=$vid;
			}
	        if (!empty($act_id)) {
	        	$sms_type="activity";
	        	$type_id =$act_id;
	        }
        }
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
        $Model = D('Sms');
        $i=0;

        if(empty($sms_type)){
	        foreach ($to_all as $row =>$value)
	        {
	            if($value)
	            {
	                $mobiles[$value]=$Model->getUserMobile($value);
	                $i++;
	            }			
	        }
        }
        else{

          if($sms_type=='address'){
        	$mobiles=$to_all;
        	$i=count($mobiles);
        	}
        	else{
	               foreach ($to_all as $row =>$value)
		        {
		            if($value)
		            {
		                $mobiles[$value]=D("Activity")->getUserMobile($value,$type_id);
		                $i++;
		            }			
		        }
        	}
        }

        if($i==''||$msg==''){
			$info[]="未填写内容或未指明发送对象";
            $info[]=$Model->getSmsNum($gid);
            $this->error($info);
        };
        $msg .= $huodong_sms;

        $n=count(split_sms($msg,'utf8'));
        //dump(split_sms($msg,'utf8'));die;
		if(!$sid){
			if($Model->canSent($gid,$i,$n)==0){
				$info[]="剩余短信条数不足";
				$info[]=$Model->getSmsNum($gid);
				$this->error($info);
			}
			$re=$Model->sentSms($msg,$mobiles,$gid,0,$sms_type,$type_id);
		}
		else{
			$re=$Model->sentSms($msg,$mobiles,$sid,1,$sms_type,$type_id);
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
        $re=M('Sms_md5')->where(array('gid'=>$gid))->order('time desc')->select();
        foreach($re as $row => $value)
        {
            $pid=$value['pid'];
			$re[$row]['status'] = D('Sms')->sms_status($pid);
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
