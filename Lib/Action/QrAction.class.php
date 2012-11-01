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
			return $md5;
		} 
		else {   
			QRcode::png('huodong.ustc.edu.cn', $filename, $errorCorrectionLevel, $matrixPointSize, 2);   
		}
	}
	public function update()
	{
		$gid=$this->_get('g');
		$n=$this->_get('n','',1);
		$this->QRpl($gid,$n);
	}
	public function QRpl($gid,$n)
	{
		//dump($gid);
		if($n==2)
		{
			$gids=M('Club')->field('gid')->select();
		}
		else
		{
			$gids[]=array('gid'=>$gid);
			
		}
		$i=0;
		$j=0;
		//dump($gids);
		//die;
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
				//dump($qq);
				$company=$re['school']['name'];
				$address=$re['homepage'];
				$website=$huodong_home;
				$weibo=$re['weibo'];
				$ww=$re['ww'];
				$msn=$re['msn'];
				//echo $qq;
				$data=$this->QRforCards($name,$phone,$company,$role,$email,$address,$website,$weibo,$qq,$ww,$msn,$note);
				$name='';
				$phone='';
				$company='';
				$role='';
				$email='';
				$address='';
				$website='';
				$weibo='';
				$qq='';
				$ww='';
				$msn='';
				$note='';
				//dump($data);
				//$data="【".$re['name']."】"."\n"."标语:".$slogan."\n"."学校:".$re['school']['name']."\n"."联系我们:"."\n"."BBS或QQ群:".$qq_group."\n"."邮箱或手机号:".$contact."\n"."活动平台主页:".$huodong_home.$end;
				$md5=$this->getQR($data,$gid,$level='L',$size=4);
				D('Qr')->qrInsertForShetuan($gid,$md5);
				//die;
				$i++;
			}
			$j++;
		}
		dump(array('success'=>$i,'failed'=>$j-$i));
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
		 //dump($tmps);
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
		 //die;
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
	function ajax_qrInsert()//ForHuodong
{
		global $_G;
		$name=$this->_post('name');
		$content=$this->_post('con');
		$gid=$this->_post('gid');
		$uid=$_G['uid'];
		if(!D('Club')->isManager($gid))
		{
			$info['status']="抱歉，只有会长和部长级别的会员才能更新二维码！";
		    $this->error($info);
		}
		if(empty($name)||empty($content))
		{
			$info['status']='活动名称或活动简介为空';
			$this->error($info);
		}
		$re=D('Club')->getInfo($gid);
		$company=$re['name'];
		$website='http://huodong.ustc.edu.cn/Club/intro?gid='.$gid;
		$note=$content;
		$data=$this->QRforCards($name,$phone,$company,$role,$email,$address,$website,$weibo,$qq,$ww,$msn,$note);
		$md5=$this->getQR($data,$gid,$level='L',$size=4);
		D('Qr')->qrInsertForHuodong($gid,$uid,$name,$content,$md5);
		$info['md5']=$md5;
		$info['gid']=$gid;
		$this->success($info);
}
	public function getQrcode($gid){
		 return $QRcode=M('Club')->field('QRcode')->where(array('gid'=>$gid))->find()['QRcode'];
		}
	public function QRapply(){
		$gid=$this->_get('gid');
		if(empty($gid))
		{
			$this->error("非法操作");
		}
		$uid=$_G['uid'];
		if(!D('Club')->isManager($gid))
		{
			$this->error("抱歉，只有会长和部长级别的会员才能申请管理二维码！");
		}
		$res=D('Qr')->getQrInfo($gid);
		foreach($res as $key=>$re)
		{
			$res[$key]['time1']=date("Y/n/j H:i:s",$re['time']);
			$res[$key]['status_time1']=date("Y/n/j H:i:s",$re['status_time']);
			$res[$key]['status1']=D('Qr')->status_means($re['status']);
		}
		//dump($res);
		$this->assign('qr_info',$res);
		$this->assign('gid',$gid);
		$this->display();
	}
	public function ajax_qrDel(){
	    global $_G;
		$md5=$this->_post('md5');
		$gid=$this->_post('gid');
		$uid=$_G['uid'];
		if(!D('Club')->isManager($gid))
		{
			$info['status']="抱歉，只有会长和部长级别的会员才能删除二维码！";
		    $this->error($info);
		}
		if(empty($md5))
		{
			$info['status']='没有指定删除对象';
			$this->error($info);
		}
		
		D('Qr')->qrDelForHuodong($uid,$gid,$md5);
		$info['status']="成功删除";
		$this->success($info);
	}
	public function ltx(){
		$id=$this->_get('i');
		$aid=M('Qr')->field('aid')->where(array('id'=>$id))->find()['aid'];
		$this->redirect('Poster/singlePage',array('aid'=>$aid),1,' ');
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