<?php
class InfoAction extends Action {
	public function index() {
		$info = M('Info');
		$this->display();
	}

	public function paged() {
	}

	public function detail() {
		$this->display();
	}

	public function modify() {
	}
}
?>
