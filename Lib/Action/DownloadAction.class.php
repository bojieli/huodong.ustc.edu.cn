<?php
class DownloadAction extends PublicAction{
public function index(){	
	
}
Public function fetch(){
	global $_G;
	$uid=$_G['uid'];
	if(empty($uid)){$this->error('δ��¼')}
	$id=$this->_post('id');
	if(!D()->isUserFile($id)){$this->error('��Ȩ��');}
	$url=D()->getUrlById($id);
	$filename=D()->getFilenameById($id);
	sendFile($url,$filename);
} 
}
?>