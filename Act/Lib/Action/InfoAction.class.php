<?php
class InfoAction extends Action {
	public function index() {
		$info = D('Info');
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

	public function query($condition, $start, $count) {
	}

	public function detail($act_id) {
	}

	public function modify($act_id) {
	}

	public function reply($act_id) {
	}

}
?>
