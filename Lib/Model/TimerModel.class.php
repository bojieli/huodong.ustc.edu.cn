<?php
//$poster = M('Poster')->find($aid);
//getPosterStartTime($aid)
class TimerModel extends Model {
public function creatConf(){
	global $_G;
	$uid=$_G['uid'];
	return M('Timer_conf')->where(['uid'=>$uid])->add(['uid'=>$uid]);
}
public function getConf($uid){
	global $_G;
	if(empty($uid))
		$uid=$_G['uid'];
	$re=M('Timer_conf')->field('uid')->where(['uid'=>$uid])->find()['uid'];
	if(empty($re))
	{
		$this->creatConf();
	}
	return M('Timer_conf')->field('uid',true)->where(['uid'=>$uid])->find();
}
public function changeConf($sms,$email){
	global $_G;
	$uid=$_G['uid'];
	$data=array(
		'sms'=>$sms,
		'email'=>$email
	);
	if($sms!=0&&$sms!=1){
	$data=array('sms'=>$sms);
	};
	if($email!=0&&$email!=1){
	$data=array('email'=>$email);
	};
	M('Timer_conf')->where(['uid'=>$uid])->data($data)->save();
}
public function InsertTimer_Poster($aid,$aid_type){
	global $_G;
	$uid=$_G['uid'];
	$start_time=D('Poster')->getPosterStartTime($aid);
	if($start_time<time()){return 0;}
    
	switch ($aid_type) {
		case 1:
			$uids[] = $uid;
			if($this->isAdd($aid)>=1){return 2;}
			break;
		case 2:
			$gid = D('Poster')->getPosterOwnerByAid($aid);
			$tids = D('Club')->getClubMembers($gid);
			foreach ($tids as $tid) {
    		if($this->isAdd($aid,$tid,$aid_type)==0)
    			$uids[] = $tid;
    		}
			break;
	    default:
	    	return;
	}
	
    unset($uid);
    //dump($uids);die;
	foreach ($uids as $key3 => $uid) {
		//dump($uid);die;
		$type = json_encode($this->getConf($uid));
		if($aid_type == 2)
			$type = json_encode(['email'=>1]);
		$data[]=array(
			'uid'=>$uid,
			'aid'=>$aid,
			'type'=>$type,
			'aid_type'=>$aid_type,
			'time'=>$start_time,
		);
	}
	M('Timer')->addAll($data);
	return 1;
}
public function updateTimer_Poster($aid,$time,$type){
	global $_G;
	$uid=$_G['uid'];
	$date=array(
		'aid'=>$aid,
		'time'=>$time,
		'type'=>$type
	);
	M('Timer')->where(array('uid'=>$uid))->data($data)->save();
}
public function delTimer_Poster($aid){
	global $_G;
	$uid=$_G['uid'];
	$con=array(
		'aid'=>$aid,
		'uid'=>$uid
	);
	return M('Timer')->where($con)->delete();
}
public function checkTimer(){
	$con['time']=array('ELT',time()+C('timer_time'));
	$con['status']=0;
	$con['aid_type']=1;
	$re=M('Timer')->where($con)->select();
	$con2['time']=array('EGT',time());
	$con2['status']=0;
	$con2['aid_type']=2;
	$re2=M('Timer')->where($con2)->select();
	foreach ($re2 as $value) {
		$re[count($re)] = $value; 
	}
	return $re;
}
public function changeStatus($id,$status){
	M('Timer')->where(['id'=>$id])->data(array('status'=>$status))->save();
}
public function isAdd($aid,$uid,$aid_type=1){
	global $_G;
	if(empty($uid))
		$uid=$_G['uid'];
	return M('Timer')->where(['uid'=>$uid,'aid'=>$aid,'aid_type'=>$aid_type])->count();
	
}
public function clockInput($aid){
	if(D('Poster')->isOutOfStartTime($aid)) return 0;
	else if($this->isAdd($aid)) return 2;
		 else return 1;
}
public function startTimeForTimer($aid){
	$start_time=D('Poster')->getPosterStartTime($aid);
	M('Timer')->where(['aid'=>$aid])->data(['time'=>$start_time,'status'=>0])->save();
}
}
?>