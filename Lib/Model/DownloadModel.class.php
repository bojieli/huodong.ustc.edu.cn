<?php
class DownloadModel extends Model {
      function getInfo(){
		$con['status']=array('neq',6);
		return M()->where($con)->order('id desc')->select();
	  }
	  function delFile($id){
		M()->where(array('id'=>$id))->data(array('status'=>6))->save();
		$filename=$this->getUrlById($id);
		$path = C('AVATAR_PATH').'/'.$uid.'/'.$filename;
		if (!unlink($path))
			alert("链接已不存在！".$path);
		else
			alert("删除成功！");
	
	  }
	  function isUserFile($id){
		global $_G;
		$uid=$_G['uid'];
		if($uid==M()->field('uid')->where(array('id'=>$id))->find()['uid'])
			return 1;
		else 
			return 0;
	  }
	  function getUrlById($id){
	  return M()->field('url')->where(array('id'=>$id))->find()['url'];
	  }
	  function getFilenameById($id){
	  return M()->field('filename')->where(array('id'=>$id))->find()['filename'];
	  }
	  function InsertTask($url,$status,$filename,$size){
	  global $_G;
	  $data=array(
		'url'=>$url;
		'status'=>$status;
		'uid'=>$_G['uid'];
		'filename'=>$filename;
		'size'=>$size;
	  );
	  M()->data($data)->add();
	  }
}
?>