<?php
class DownloadAction extends PublicAction{
public function index(){	
	
}
Public function fetch(){
	global $_G;
	$uid=$_G['uid'];
	if(empty($uid)){$this->error('н╢╣гб╪')}
	$id=$this->_post('id');
	if(!D()->isUserFile($id)){$this->error('нчх╗оч');}
	$url=D()->getUrlById($id);
	$filename=D()->getFilenameById($id);
	sendFile($url,$filename);
} 
}
?>