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

		$sid = $user_info['sid'];
		$condition = array('sid'=>$sid);
		$clubs  = D('Club')->getClubsByCondition($condition);
		$this->assign('clubs', $clubs);
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
		$this->assign('applies', $applies);
		$this->display();
	}
}
?>