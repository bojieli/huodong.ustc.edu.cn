<?php
//$poster = M('Poster')->find($aid);
//getPosterStartTime($aid)
class TimerModel extends Model {
public function creatConf($uid,$aid_types){
	global $_G;
	$uid=$_G['uid'];
	if(count($aid_types) == 0)
		return;
	foreach ($aid_types as $key => $value) {
	    switch ($value) {
	    	case 1:
	    		$data[]=array(
				'uid'=>$uid,
				'sms'=>1,
				'email'=>1,
				'aid_type'=>1
				);
	    		break;
	    	case 2:
	    		$data[]=array(
				'uid'=>$uid,
				'sms'=>0,
				'email'=>1,
				'aid_type'=>2
				);
	    		break;
	    	default:
	    		break;
	    }
		
	}
	return M('Timer_conf')->addAll($data);
}
public function confInit($uid){
	//echo $uid;
	$re=M('Timer_conf')->field('aid_type')->where(['uid'=>$uid])->select();
	$aid_type_init = [1,2];
	foreach ($aid_type_init as $key => $value) {
			if(in_array($re[$key]['aid_type'], $aid_type_init))
				continue;
			$aid_types[]=$value;
	}
	$this->creatConf($uid,$aid_types);
}
public function getConf($uid){
	global $_G;
	if(empty($uid))
		$uid=$_G['uid'];
	$this->confInit($uid);
	$re = M('Timer_conf')->field('uid',true)->where(['uid'=>$uid])->select();
	foreach ($re as $key => $value) {
		$confs[$value['aid_type']] = ['email'=>$value['email'],'sms'=>$value['sms']];
	}
	return $confs;
}

public function changeConf($conf,$aid_type,$uid){
	global $_G;
	$uid=$_G['uid'];
	$error = 0;
	foreach ($conf as $key => $value) {
		if(!in_array($value2,[0,1]))
			$error = 1;
	}
	if($error == 0){
		M('Timer_conf')->where(['uid'=>$uid,'aid_type'=>$aid_type])->data($conf)->save();
		return true;
	}
	else
		return false;
}
public function InsertTimer_Poster($aid,$aid_type){
	global $_G;
	$uid=$_G['uid'];
	$start_time=D('Poster')->getPosterStartTime($aid);
	if($start_time<time()){return 0;}
    //echo 121313;
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
	    	return 4;
	}
	
    unset($uid);
   // $confs = $this->getConf($uid);
	foreach ($uids as $key3 => $uid) {
		$count = 0;
		$confs = $this->getConf($uid);
		//dump($confs);
		foreach ($confs[$aid_type] as $key => $value) {
			$count += $value;
		}
		if($count == 0)
			return 3;
		$type = json_encode($confs[$aid_type]);
		$data[]=array(
			'uid'=>$uid,
			'aid'=>$aid,
			'type'=>$type,
			'aid_type'=>$aid_type,
			'time'=>$start_time,
		);
	}
	//dump($data);die;
	M('Timer')->addAll($data);
	return 1;
}
public function updateTimer_Poster($aid,$time,$type,$aid_type=1){
	global $_G;
	$uid=$_G['uid'];
	$date=array(
		'time'=>$time,
		'type'=>$type,
	);
	M('Timer')->where(array('uid'=>$uid,'aid'=>$aid,'aid_type'=>$aid_type))->data($data)->save();
}
public function delTimer_Poster($aid,$aid_type){
	global $_G;
	$uid=$_G['uid'];
	$con=array(
		'aid'=>$aid,
		'uid'=>$uid,
		'aid_type'=>$aid_type
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