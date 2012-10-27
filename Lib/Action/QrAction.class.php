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
	public function getQR($data,$gid,$level,$size){
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
			//dump($md5);
			$filename = $PNG_TEMP_DIR.'huodongQR_for'.$gid.'_'.$md5.'.png';
			//dump($filename);
			QRcode::png($data, $filename, $errorCorrectionLevel, $matrixPointSize, 2);
			if(file_exists($filename)){
				$da=array('QRcode'=>$md5);
				if($gid!=''){M('Club')->where(array('gid'=>$gid))->data($da)->save();}
			}
		} 
		else {   
			QRcode::png('huodong.ustc.edu.cn', $filename, $errorCorrectionLevel, $matrixPointSize, 2);   
		}
	}
	public function QRpl($gid,$n)
	{
		if($n==0)
		{
			$gids=M('Club')->field('gid')->select();
		}
		else
		{
			$gids=array($gid);
		}
		$i=0;
		$j=0;
		$regex = array(
            'require'=> '/.+/', //匹配任意字符，除了空和断行符
            'email' => '/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/',
            'phone' => '/^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/',
            'mobile' => '/^((\(\d{2,3}\))|(\d{3}\-))?(13|15)\d{9}$/',
            'url' => '/^https?:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/',
            'currency' => '/^\d+(\.\d+)?$/',
            'number' => '/\d+$/',
            'zip' => '/^[1-9]\d{5}$/',
            'qq' => '/^[1-9]\d{4,12}$/',
            'integer' => '/^[-\+]?\d+$/',
            'double' => '/^[-\+]?\d+(\.\d+)?$/',
            'english' => '/^[A-Za-z]+$/',
		);
		foreach($gids as $val)
		{
			$gid=$val['gid'];
			$re=M('Club')->field('QRcode')->where(array('gid'=>$gid))->find()['QRcode'];
			if($gid!=0&&$gid!='')
			{	
				
				$re=D('Club')->getInfo($gid);
				$name=$re['name'];
				$qq_group=$re['qq_group'];
				$contact=$re['contact'];
				$slogan=$re['slogan'];
				$huodong_home='http://huodong.ustc.edu.cn/Club/intro?gid='.$gid;
				//$end="\n"."-- 来自活动平台huodong.ustc.edu.cn"."\n";				
			    if(preg_match($regex['phone'],$contact)||preg_match($regex['mobile'],$contact))
				{$phone=$contact;}
				else
				{
					if(preg_match($regex['email'],$contact))
					{
						$email=$contact;
					}
					else
					   $note=$email;
				}
				if(preg_match($regex['email'],$qq_group))
				{$note.=$qq_group;}
				else
				{$qq=$qq_group;}
				$company=$re['school']['name'];
				$address=$re['homepage'];
				$website=$huodong_home;
				$weibo=$re['weibo'];
				$qq=$re['qq'];
				$ww=$re['ww'];
				$msn=$re['msn'];
				$data=$this->QRforCards($name,$phone,$company,$role,$email,$address,$website,$weibo,$qq,$ww,$msn,$note);
				//dump($data);
				//$data="【".$re['name']."】"."\n"."标语:".$slogan."\n"."学校:".$re['school']['name']."\n"."联系我们:"."\n"."BBS或QQ群:".$qq_group."\n"."邮箱或手机号:".$contact."\n"."活动平台主页:".$huodong_home.$end;
				$this->getQR($data,$gid,$level='L',$size=4);
				//die;
				$i++;
			}
			$j++;
		}
		return array('success'=>$i,'failed'=>$j-$i);
		//die;
		//dump(array('success'=>$i,'failed'=>$j-$i));
		//$QRcode=M('Club')->field('QRcode')->where(array('gid'=>$gid))->find()['QRcode'];
		//$filename='/upload/temp/'.'huodongQR_for'.$gid.'_'.$QRcode.'.png';
		//$this->assign('filename',$filename);
		//$this->display();
		//return $club_info;
	}
	public function QRforCards($name,$phone,$company,$role,$email,$address,$website,$weibo,$qq,$ww,$msn,$note){
	     $tmps=array('NOTE'=>$note,'weibo'=>$weibo,'QQ'=>$qq,'旺旺'=>$ww,'MSN'=>$msn,);
		 foreach($tmps as $tmp => $value)
		 {
			if(!empty($value)){$note1.=$tmp.":".$value.' ';}
		 }
		$note=$note1.'【由活动平台制作 huodong.ustc.edu.cn】';
		//dump($note);
		$cards=array(
				'N'=>$name,
				'TEL'=>$phone,
				'ORG'=>$company,
				'TITLE'=>$role,
				'EMAIL'=>$email,
				'ADR'=>$address,
				'URL'=>$website,
				'NOTE'=>$note,
		 );
		 $begin="BEGIN:VCARD"."\n"."VERSION:3.0"."\n";
		 $end="END:VCARD"."\n";
		 $card=['N','TEL','ORG','TITLE','EMAIL','ADR','URL','NOTE'];
		 foreach($cards as $card => $val)
		 {
			if(!empty($val)){$data.=$card.":".$val."\n";};
		 }
		 $data=$begin.$data.$end;
		 //dump($data);
		 return($data);
	}
	public function QRshow(){
		$gid=$this->_get('gid');
		if(empty($gid)){return 0;}
		$QRcode=M('Club')->field('QRcode')->where(array('gid'=>$gid))->find()['QRcode'];
		$filename='/upload/avatar/Qr/'.'huodongQR_for'.$gid.'_'.$QRcode.'.png';
		$this->assign('filename',$filename);
		$this->display('QRpl');
	}
	public function ajaxUpdateQr()
	{
		$gid=$this->_get('gid');
		if(empty($gid)||$gid==0)
		{
		 $info['status']="非法操作！";
		 $this->error($info);
		}
		if(!D('Club')->isManager($gid))
		{
			$info['status']="抱歉，只有会长和部长级别的会员才能更新二维码！";
		    $this->error($info);
		}
		else
		{
			$this->QRpl($gid,1);
			$QRcode=M('Club')->field('QRcode')->where(array('gid'=>$gid))->find()['QRcode'];
			$info['status']="done";
			$info['QR']=$QRcode;
			$this->success($info);
			//$filename='/upload/avatar/Qr/'.'huodongQR_for'.$gid.'_'.$QRcode.'.png';
		    //$this->assign('filename',$filename);
		}
	}
	public function getQrcode($gid){
		 return $QRcode=M('Club')->field('QRcode')->where(array('gid'=>$gid))->find()['QRcode'];
		}
	public function test()
	{
		$name='林太行';
		$phone='15655170201';
		$phone2='54654654564';
		$company='科大';
		$role='经理';
		$email='ltx@qq.com';
		$address='金寨路';
		$website='huodong.ustc.edu.cn';
		$weibo='weibo';
		$note='note';
		$qq=845552145;
		$ww=7987854654;
		$msn=84555555;
		//$data=$this->QRforCards($name,$phone,$company,$role,$email,$address,$website,$weibo,$qq,$ww,$msn,$note);
		//dump($data);
		//$this->getQR($data);
	}
	
}
?>