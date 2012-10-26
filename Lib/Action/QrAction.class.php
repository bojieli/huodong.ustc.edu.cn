<?php
set_time_limit(0);
class QrAction extends PublicAction{
	public function index(){
		
		//$level = $this->_post('level');
		//$size = $this->_post('size');
		//$data = $this->_post('data');
		//$this->QRpl($gid);
		 //$this->assign('filename',$filename);
		 //$this->assign('matrixPointSize',$matrixPointSize);
		// $this->assign('errorCorrectionLevel',$errorCorrectionLevel);
		 //$this->display();
		//QRtools::timeBenchmark();
	}
	public function getQR($gid,$data,$level,$size){
		include_once("./phpqrcode/qrlib.php");
		$PNG_TEMP_DIR = './upload/avatar'.DIRECTORY_SEPARATOR.'Qr'.DIRECTORY_SEPARATOR;
		//$PNG_WEB_DIR = './upload/temp'.DIRECTORY_SEPARATOR;
		
		if (!file_exists($PNG_TEMP_DIR))
			mkdir($PNG_TEMP_DIR);
		$filename = $PNG_TEMP_DIR.'test.png';
		$errorCorrectionLevel = 'L';
		if (isset($level) && in_array($level, array('L','M','Q','H')))
			$errorCorrectionLevel = $level;
		$matrixPointSize = 4;
		if (isset($size))
			$matrixPointSize = min(max((int)$size, 1), 10);
		//$Qr=new QRcode();
		if (isset($data)) { 
			if (trim($data) == '')
				die('data cannot be empty! <a href="?">back</a>');
			$md5=md5($data.'|'.$errorCorrectionLevel.'|'.$matrixPointSize);
			$filename = $PNG_TEMP_DIR.'huodongQR_for'.$gid.'_'.$md5.'.png';
			QRcode::png($data, $filename, $errorCorrectionLevel, $matrixPointSize, 2);
			if(file_exists($filename)){
				$da=array('QRcode'=>$md5);
				M('Club')->where(array('gid'=>$gid))->data($da)->save();
			}
		} 
		else {   
			QRcode::png('huodong.ustc.edu.cn', $filename, $errorCorrectionLevel, $matrixPointSize, 2);   
		}
	}
	public function QRpl()
	{
		$gids=M('Club')->field('gid')->select();
		$i=0;
		$j=0;
		foreach($gids as $val)
		{
			$gid=$val['gid'];
			$re=M('Club')->field('QRcode')->where(array('gid'=>$gid))->find()['QRcode'];
			if($gid!=0&&$gid!=''&&$re=='')
			{	
				
				$re=D('Club')->getInfo($gid);
				$qq_group=$re['qq_group']?$re['qq_group']:'暂无';
				$contact=$re['contact']?$re['contact']:'暂无';
				$slogan=$re['slogan']?$re['slogan']:'暂无';
				$huodong_home='http://huodong.ustc.edu.cn/Club/intro?gid='.$gid;
				$end="\n"."-- 来自活动平台huodong.ustc.edu.cn"."\n";
				$data="【".$re['name']."】"."\n"."标语:".$slogan."\n"."学校:".$re['school']['name']."\n"."联系我们:"."\n"."BBS或QQ群:".$qq_group."\n"."邮箱或手机号:".$contact."\n"."活动平台主页:".$huodong_home.$end;
				$this->getQR($gid,$data,$level='L',$size=4);
				$i++;
			}
			$j++;
		}
		dump(array('success'=>$i,'failed'=>$j-$i));
		//$QRcode=M('Club')->field('QRcode')->where(array('gid'=>$gid))->find()['QRcode'];
		//$filename='/upload/temp/'.'huodongQR_for'.$gid.'_'.$QRcode.'.png';
		//$this->assign('filename',$filename);
		//$this->display();
		//return $club_info;
	}
	public function QRshow(){
		$gid=$this->_get('gid');
		if(empty($gid)){return 0;}
		$QRcode=M('Club')->field('QRcode')->where(array('gid'=>$gid))->find()['QRcode'];
		$filename='/upload//avatar/Qr/'.'huodongQR_for'.$gid.'_'.$QRcode.'.png';
		$this->assign('filename',$filename);
		$this->display('QRpl');
	}
	
}
?>