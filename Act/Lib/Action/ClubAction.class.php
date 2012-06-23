<?php
class ClubAction extends Action {
	public function index() {
		$list = M('info')->select();
		$this->assign("list", $list);
		$this->display();
	}
}
