<?php
//$poster = M('Poster')->find($aid);
//getPosterStartTime($aid)
public function creatConf(){
	creatConf()
	M('Timer_conf')->where('uid'=>$uid)->add();
}
public function getConf(){
	global $_G;
	$uid=$_G['uid'];
	if(empty(M('Timer_conf')->field('uid')->where('uid'=>$uid)->find()['uid']))
	{
		$this->creatConf();
	}
	return M('Timer_conf')->where('uid'=>$uid)->find();
}
public function changeConf($sms,$email){
	global $_G;
	$uid=$_G['uid'];
	$data=array(
		'sms'=>$sms;
		'email'=>$email;
	);
	if($sms!=0&&$sms!=1){
	$data=array('sms'=>$sms);
	};
	if($email!=0&&$email!=1){
	$data=array('email'=>$email);
	};
	M('Timer_conf')->where('uid'=>$uid)->data($data)->save();
}
public function InsertTimer_Poster($aid){
	global $_G;
	$uid=$_G['uid'];
	$start_time=D('Poster')->getPosterStartTime($aid);
	if($start_time<time()){return 0;}
	$conf=$this->getConf();
	foreach($conf as $key => $val){
		if($key!='uid'){
		$conf_type[$key]=$val;
		}
	}
	$type=json_encode($conf_type);
	$data=array(
		'uid'=>$uid;
		'aid'=>$aid;
		'type'=>$type;
		'aid_type'=>1;
		'time'=>$start_time;
	);
	M()->data($data)->add();
}
public function updateTimer_Poster($aid,$time,$type){
	global $_G;
	$uid=$_G['uid'];
	$date=array(
		'aid'=>$aid;
		'time'=>$time;
		'type'=>$type
	);
	M()->where(array('uid'=>$uid))->data($data)->save();
}
public function delTimer_Poster($aid){
	global $_G;
	$uid=$_G['uid'];
	$date=array(
		'aid'=>$aid;
		'uid'=>$uid;
	);
	return M()->data($data)->delete();
}
?>