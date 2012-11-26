<?php
class LikesAction extends PublicAction {
	public function add() {
		$arg = $this->getArg();
		global $_G;
		if(empty($_G[uid])) {
			$this->assign('jumpUrl','/User/login');
			$this->error('请先登录！');
		}
		$where=array(
			'uid' =>$_G[uid],
			'type'=>$arg[type],
			'type_id' =>$arg[id],
			
		);
		if(D('Likes')->where($where)->count() != 0) {
					$this->error('不能重复投票！');
		} else {
					$data = $where;
					$data['like_or_dislike']=1;
					D('Likes')->add($data);
		}
		switch($arg[type]) {
			case 'picture':
				D('Activity')->likesPic($arg[id]);
				$this->success('投票成功！');
				
				break;
			default:break;
		}
	}
	
	
	
	private function getArg() {
		$arg = array(
			'type' => $_GET[type],
			'id' => $_GET[id]
		);
		$typeArr=array('picture','activity','poster','article');
		if(!in_array($arg[type],$typeArr) || !is_numeric($arg[id])) {
			$this->error('参数错误');
		}
		return $arg;
	}
}
?>