<?php
class DownloadModel extends Model {
      function getInfo(){
		$con['status']=array('neq',6);
		return M('Download')->where($con)->order('id desc')->select();
	  }
	  function delFile($id){
		M('Download')->where(array('id'=>$id))->data(array('status'=>6))->save();
		$filename=$this->getUrlById($id);
		$path = C('AVATAR_PATH').'/'.$uid.'/'.$filename;
		if (!unlink($path))
			return "链接已不存在！".$path;
		else
			return "删除成功！";
	
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
	  return M('Download')->field('url')->where(array('id'=>$id))->find()['url'];
	  }
	  function getFilenameById($id){
	  return M('Download')->field('filename')->where(array('id'=>$id))->find()['filename'];
	  }
	  function InsertTask($url,$status,$filename,$size){
	  global $_G;
	  $data=array(
		'url'=>$url,
		'status'=>$status,
		'uid'=>$_G['uid'],
		'filename'=>$filename,
		'size'=>$size
	  );
	  M('Download')->data($data)->add();
	  }
}
?>