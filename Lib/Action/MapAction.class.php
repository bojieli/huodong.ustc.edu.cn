<?php
class MapAction extends PublicAction{
	public function index(){
		  $this->assign('poster',M('Poster')->field('name,aid')->order('publish_time desc')->select());
		  $this->assign('club',M('Club')->field('name,gid')->order('gid desc')->select());
		  $this->display();
	}
}
?>