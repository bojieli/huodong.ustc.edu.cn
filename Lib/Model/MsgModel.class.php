<?php
class MsgModel extends Model {
	
		 public function showMsgFromMe()
        {   
            global $_G;
			$con['uid']=$_G['uid'];
			$tids=$this->field('to_uid')->where($con)->group('to_uid')->select();
			foreach($tids as $row => $val)
			{
				$msg[$val['to_uid']]=$this->showMsgFt($val['to_uid']);
			}
			//dump($msg);
			return array($msg,$tids);
			//echo 1233;
			//return $msg;
        }
        public function showMsgFt($to_uid)
		{
			global $_G;
			$uid = $_G['uid'];
			//$con['uid']=$_G['uid'];
           // $con['to_uid']=$to_uid;
            //$con['_logic']='AND';
			
			//dump($con);
			return $this->where('(uid='.$uid.'&&to_uid='.$to_uid.')||(uid='.$to_uid.'&&to_uid='.$uid.')')->select();
		}
		public function sentMsg($time,$msg,$to_uid,$sub){
        global $_G;
		$ip=get_client_ip();
		$data=array(
			'uid'=>$_G['uid'],
			'time'=>$time,
			'msg'=>$msg,
			'sub'=>$sub?$sub:'blank',
			'to_uid'=>$to_uid?$to_uid:0,
			'ip'=>$ip,
			'status'=>1
		);
		
		$this->data($data)->add();      
        }
 
}//
?>