<?php
class PosterAction extends Action {
	public function index() {
		$info = D('Poster');
		if (isset($_GET['showhistory'])) {
			$condition = '1=1';
			if (isset($_GET['timeasc']))
				$order = "start_time";
			else // default time desc
				$order = "start_time DESC";
		}
		else { // not show history
			$condition = "act.end_time > UNIX_TIMESTAMP()";
			if (isset($_GET['timedesc']))
				$order = "start_time DESC";
			else // default time asc
				$order = "start_time";
		}
		if (!isset($_GET['showallstatus'])) { // by default not show activities in plans pending approval
			$condition .= " AND plan.status IN ('executing','finished','archived')";	
		}
		$condition .= " AND is_public = 1"; // many activities are internal, posting the posters etc.
		$tmp_list = $info->where($condition)->order($order);
		if (isset($_GET['page']) && is_numeric($_GET['page']))
			$page = $_GET['page'];
		else
			$page = 0;
		$rows_per_page = 10;
		$list = $tmp_list->limit($rows_per_page)->page($page)->select();
		foreach ($list as $key => $act) {
			$tag = M('act_tag');
			$tags = $tag->where(array('aid'=>$list[$key]['aid']))->select();
			foreach ($tags as $count => $tag)
				$list[$key]['tag'][$count] = $tag['tag'];
		}
		$this->assign("list", $list);
		$this->assign("page", $page);
		$this->assign("rows_per_page", $rows_per_page);
		$this->display();
	}

	public function detail() {
		$info = D('Poster');
		if (!is_numeric($_GET['_URL_'][2]))
			throw_exception('请指定活动编号以查看活动详情！');
		else
			$aid = $_GET['_URL_'][2]; // Info/detail/123
		$list = $info->where(array('aid' => $aid))->select();
		if (empty($list))
			throw_exception('您所查找的活动不存在！');
		$act = $list[0];
		if (empty($act['is_public']))
			throw_exception('此活动未发布，只有项目组成员在计划书中才能查看！');

		$tag = M('act_tag');
		$tags = $tag->where(array('aid'=>$act['aid']))->select();
		foreach ($tags as $count => $tag)
			$act['tag'][$count] = $tag['tag'];
		$this->assign('act', $act);

		$comment = D('ActComment');
		$comments = $comment->where(array('aid'=>$act['aid'], 'public'=>1))->select();
		$this->assign('comment', $comments);
		$this->display();
	}

	public function modify($act_id) {
	}

	public function reply($act_id) {
	}
}
?>
