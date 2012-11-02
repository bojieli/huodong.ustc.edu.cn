<?php
class MapAction extends PublicAction{
	public function index(){
		  $this->assign('poster',M('Poster')->field('name,aid')->select());
		  $this->assign('club',M('Club')->field('name,gid')->select());
		  $this->display();
	}
}
?>