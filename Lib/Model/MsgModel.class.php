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
			return $this->where('(uid='.$uid.'&&to_uid='.$to_uid.')||(uid='.$to_uid.'&&to_uid='.$uid.')')->select();
		}
		public function sentMsg($time,$msg,$to_uid){
			global $_G;
			$ip=get_client_ip();
			$data=array(
				'uid'=>$_G['uid'],
				'time'=>$time,
				'msg'=>$msg,
				'to_uid'=>$to_uid?$to_uid:0,
				'ip'=>$ip,
				'status'=>1
				);
		
			$this->data($data)->add();      
        }
		public function sentMsgForSys($time,$title,$msg,$tid,$gid){
			$data=array(
				'time'=>$time,
				'title'=>$title,
				'msg'=>$msg,
				'tid'=>$tid?$tid:0,
				'gid'=>$gid,
				'status'=>0
			);
			M('Msg_sys')->data($data)->add();      
        }
		public function showSysMsg(){
			global $_G;
			$uid = $_G['uid'];
			//$con['tid']=$_G['uid'];
			//$gids=M('Msg_sys')->field('gid')->where($con)->group('gid')->select();
			//foreach($gids as $row => $val)
			//{
				$msg=M('Msg_sys')->where(array('tid'=>$uid))->select();
			//}
			return $msg;
		}
		
 
}//
?>