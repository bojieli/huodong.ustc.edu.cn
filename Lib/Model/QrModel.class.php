<?php
class QrModel extends Model{
function qrInsertForHuodong($gid,$uid,$name,$content,$md5){
	$PNG_TEMP_DIR = './upload/avatar'.DIRECTORY_SEPARATOR.'Qr'.DIRECTORY_SEPARATOR;
	$filename = $PNG_TEMP_DIR.'huodongQR_for'.$gid.'_'.$md5.'.png';
	if(file_exists($filename)){
	        $time=time();
			$data=array(
				'gid'=>$gid,
				'uid'=>$uid,
				'name'=>$name,
				'content'=>$content,
				'QRcode'=>$md5,
				'time'=>$time,
				'status'=>1,
				'status_time'=>$time
			);
			if($gid!=''){M('Qr')->data($data)->add();}
			return true;
	}
}
function qrInsertForShetuan($gid,$md5){
	$PNG_TEMP_DIR = './upload/avatar'.DIRECTORY_SEPARATOR.'Qr'.DIRECTORY_SEPARATOR;
	$filename = $PNG_TEMP_DIR.'huodongQR_for'.$gid.'_'.$md5.'.png';
	if(file_exists($filename)){
				$da=array('QRcode'=>$md5);
				if($gid!=''){M('Club')->where(array('gid'=>$gid))->data($da)->save();}
			}
}
function qrDelForHuodong($uid,$gid,$md5){
	$time=time();
	$data=array(
		'uid'=>$uid,
		'status_time'=>$time,
		'status'=>0
	);
	M('Qr')->where('gid='.$gid.'&& QRcode = "'.$md5.'"')->data($data)->save();
	return true;
}
function getQrInfo($gid){
return $this->where('gid='.$gid.'&& status!=0')->order("time desc")->select();
}
function status_means($status){
	switch ($status)
	{
	case 0:
	  return "已删除";
	  break;  
	case 1: 
	  return "已生成";
	  break;
	default:
	  return "已修改";	  
	}
}
}
?>