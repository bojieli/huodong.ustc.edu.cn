<?php
class AdminAction extends PublicAction {
    public function index()
    {
        global $_G;
        if(!D('User')->checkLogin())
        {
            $this->assign('jumpUrl','/User/login');
            $this->error('您尚未登录');
        }

        $user = D("User");
        $user_info = $user->getInfo($_G['uid']);
        if(!$user_info['isschooladm'])
        {	
            $this->error('您没有权限访问该页面');
        }
		//$this->getClubManager();die;
        $sid = $user_info['sid'];
        $condition = array('sid'=>$sid);
        $clubs  = D('Club')->getClubsByCondition($condition);
        $apply_num = D('Club_apply')->where(array('sid'=>$sid,'ishandled'=>0))->count();
		
		$applies = D('Club')->getClubAdminApply(['sid'=>$sid,'ishandled'=>1]);
		
		$this->assign('applies', $applies);
		$this->assign('clubs', $clubs);
        //dump($club);die;
		$this->assign('apply_num',$apply_num);
        $this->display('manager');

    }

    public function applyManage()
    {
        global $_G;
        if(!D('User')->checkLogin())
        {
            $this->assign('jumpUrl','/User/login');
            $this->error('您尚未登录');
        }

        $user = D("User");
        $user_info = $user->getInfo($_G['uid']);
        if(!$user_info['isschooladm'])
        {	
            $this->error('您没有权限访问该页面');
        }
        $sid = $user_info['sid'];
        $condition = array('sid'=>$sid);
        $applies = D('Club')->getClubAdminApply($condition);
        //dump($applies);die;
		$this->assign('applies', $applies);
        $this->display();
    }
	public function sendEmail() {
        if(!D('User')->checkLogin()){$this->assign('jumpUrl', '/User/login');$this->error('您尚未登陆');}
        $user = D("User");
        $user_info = $user->getInfo(CURRENT_USER);
		if(!$user_info['isschooladm'])
        {	
            $this->error('您没有权限访问该页面');
        }
        $sid = $_REQUEST['sid'];
		
		if(!$sid){$this->error('非法操作！');}
		$members = $this->getClubManager($sid);
		//dump($members);die;
		$this->assign('members', $members);
		$this->assign('school_name', M('school')->field('name')->where(['sid'=>$sid])->find()['name']);
		$this->assign('admin',1);
        $this->display();
    }
	public function getClubManager($sid){
			$clubs = M('Club')->field('owner,gid,type,name')->where(['sid'=>$sid])->select();
			foreach($clubs as $key => $club){
				if($club['owner']!=''){
					$title = M('User_group')->field('title')->where(['uid'=>$club['owner'],'gid'=>$club['gid']])->find();
					$ownerInfo = D('User')->getInfo($club['owner']);					
					$info[] = array_merge($title,$ownerInfo,$club);
				}
			}
			return $info;
	}
	public function sendEmailSubmit() {
        if(!D('User')->checkLogin())
        {
            $this->assign('jumpUrl', '/User/login');
            $this->error('您尚未登陆');
        }
		$sid = $_POST['sid'];
        $user_info = D('User')->getInfo(CURRENT_USER);
		if(!$user_info['isschooladm'])
        {	
            $this->error('只有学校管理员有权限群发邮件。');
        }
        $tid = $_POST['tid'];
		$emails = array();
        if(trim($tid)=="all")
        {
            $members = $this->getClubManager($sid);
            foreach ($members as $member)
                $emails[] = $member['email'];
		}
        elseif(!empty($tid))
        {
            $tid=explode(";",$tid);
            $tid_all = "(";
            foreach($tid as $value)
            {
                if($value)
                {
                    $tid_all .= $value.",";
                }
            }
            $tid_all = substr($tid_all,0,strlen($tid_all)-1).")";
            $members = M()->query("SELECT email FROM ustc_user  WHERE uid in $tid_all");
            foreach ($members as $member)
                $emails[] = $member['email'];
        }
		//dump($emails);die;
        if (empty($emails))
            $this->error("您没有选择成员 :)");

        if (!($title = $_POST['title']))
            $this->error("必须填写邮件标题");
        if (strlen($title) > 200)
            $this->error("邮件标题过长!");
        if (strlen($title) < 5)
            $this->error("邮件标题过短!");
		$message=xss_clean($_POST['message']);//防止XSS攻击
		if (!($message))
            $this->error("必须填写邮件内容");
        if (strlen($message) > 10000)
            $this->error("邮件内容过长!");
        if (strlen($message) < 10)
            $this->error("邮件内容过短!");
        sendMail($emails, $title, $message, true);

        $this->assign('jumpUrl', '/Club/manage?gid='.$gid);
        $this->success("成功发送邮件给 ". count($emails) ." 人");
    }

    public function freeSmsManage(){
        global $_G;
        if(!D('User')->checkLogin())
        {
            $this->assign('jumpUrl','/User/login');
            $this->error('您尚未登录');
        }

        $user = D("User");
        if(!$user->isDeveloper($uid))
        {   
            $this->error('您没有权限访问该页面');
        }
        $gid = $this->_get('gid');
        $type = $this->_get('t',0);
        //unset($gids);
        if($type==0){
            $gids[]['gid']=$gid;
        }
        else
        {
            if($type==1) {
                $gids=M('Club')->field('gid')->select();
                //dump($gids);die;
            }
            else
                return;
        }
        
        $i = 0;
        foreach ($gids as $key => $value) {
          D("Sms")->reSmsNum($value['gid']);
          $i++;
        }
        echo "已更新".$i."个社团的免费短信条数";
        
    }
}
?>
