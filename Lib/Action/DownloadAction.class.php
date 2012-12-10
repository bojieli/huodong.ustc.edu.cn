<?php
define("TASK_PENDING",1);
define("TASK_RUNNING",2);
define("TASK_FINISHED",3);
define("TASK_FAILED",4);
define("TASK_CANCELED",5);
define("TASK_DELETED",6);
class DownloadAction extends PublicAction{
public function index(){	
	$info=D('Download')->getInfo();
	$this->assign('info', $info);
	$this->display();
}
Public function fetch(){
	global $_G;
	$uid=$_G['uid'];
	if(empty($uid)){$this->error('未登录');}
	$id=$this->_post('id');
	if(!D('Download')->isUserFile($id)){$this->error('无权限');}
	$url=D('Download')->getUrlById($id);
	$filename=D('Download')->getFilenameById($id);
	sendFile($url,$filename);
}
Public function add(){
	$url=$this->_post('url');
	$status=TASK_PENDING;
	D('Download')->InsertTask($url,$status);
}
Public function del(){
	global $_G;
	$uid=$_G['uid'];
	if(empty($uid)){$this->error('未登录');}
	$id=$this->_get('id');
	$del_msg=D('Download')->delFile($id);
	echo $del_msg;
}
}
?>