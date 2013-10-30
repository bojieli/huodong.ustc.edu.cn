<?php
class LikesAction extends PublicAction {
	public function add() {
		$arg = $this->getArg();
		global $_G;
		if(empty($_G[uid])) {
			$this->assign('jumpUrl','/User/login');
			$this->error('请先登录！');
		}

		$act_id = $this->getActIDByID($arg[id]);
		$priv = D('Activity')->get_priv($act_id,'like');
		$gid = D('Activity')->getGidByID($act_id);
		$mypriv = D('Club')->getPrivValue($gid);
		
		switch($priv){
			case 0: $st = 'right';break;
		    case 1: $st = ($mypriv>=1) ? 'right':'无权限';break;
            case 2: $st = ($mypriv>=1) ? 'right':'无权限';break;
		    case 3: $st = ($mypriv >1) ? 'right':'无权限';break;
		    case 6: $st = '投票已结束，感谢关注';break;
		    default: $st = '无权限';break;
	    }
		if($st!='right')
				$this->error($st);
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
	private function getActIDByID($id){
		return M('Activity_picture')->field('act_id')->where(['pid'=>$id])->find()['act_id'];		
	}
}
?>
