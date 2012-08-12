<?php
class PlanAction extends Action {
	public function index() {
		$model = D('Plan');
		$plan = $model->select();
		$this->assign('plan', $plan);
		$this->display();
	}

	public function status() {
		$model = D('Plan');
		if (!is_numeric($_GET['_URL_'][2]))
			throw_exception('请指定要查看状态的计划书！');
		$plan = $model->relation(true)->where(array('pid'=>$_GET['_URL_'][2]))->find();
		if (empty($plan))
			throw_exception('此计划书不存在！');
		$this->assign('plan', $plan);
		$this->display();
	}

	public function create() {
		$model = D('Plan');
		// assign new plan number
		// write log
		// get plan
		$this->assign('plan', $plan);
		$this->display('edit');
	}

	public function edit() {
		$model = D('Plan');
		if (!is_numeric($_GET['_URL_'][2]))
			throw_exception('需要首先新建计划书才能进入编辑！');
		$plan = $model->relation(true)->where(array('pid'=>$_GET['_URL_'][2]))->find();
		if (empty($plan))
			throw_exception('此计划书不存在！');
		$this->assign('plan', $plan);

		if (is_numeric($_GET['_URL_'][3]))
			$page = $_GET['_URL_'][3];
		else
			$page = 1;
		$this->assign('page', $page);
		$this->display();
	}

	public function save($project_id) {
	}

	public function preview($content) {
		$model = D('Plan');
		if (!is_numeric($_GET['_URL_'][2]))
			throw_exception('您要预览哪份计划书？');
		$plan = $model->relation(true)->where(array('pid'=>$_GET['_URL_'][2]))->find();
		if (empty($plan))
			throw_exception('此计划书不存在！');
		$this->assign('plan', $plan);

		if (is_numeric($_GET['_URL_'][3]))
			$page = $_GET['_URL_'][3];
		else
			$page = 1;
		$this->assign('page', $page);
		$this->display();
	}

	public function submit($project_id) {
	}

	public function writelog($project_id) {
	}

	public function history($project_id, $version) {
	}

	public function rollback($project_id, $version) {
	}

	public function diff($project_id, $version1, $version2) {
	}

	public function review($project_id, $action) {
	}

	public function archive($project_id) {
	}
}
