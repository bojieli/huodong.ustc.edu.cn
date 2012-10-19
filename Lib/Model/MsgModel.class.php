<?php
class MsgModel extends Model {
	
	function init() {
		 define('SUCCESS', 1);
		 define('FAILED', 0);
		 global $_G;
		 $_G['timestamp']=time();
		}
		 function showMsg()
        {   
            global $_G;
            
			$con['uid']=$_G[uid];
            $con['to_uid']=$_G[uid];
            $con['_logic']='OR';
			$my_msg=$this->where($con)->select();
			//$from_me=$this->where("uid=".$_G[uid])->select();
			//$to_me=$this->where("to_uid=".$_G[uid])->select();
		    return $my_msg;
        }
        function sentMsg($time,$msg,$to_uid,$sub){
        global $_G;
        $ip=get_client_ip();
        $data=array(
			'uid'=>$_G['uid'],
			'time'=>$_G['timestamp'],
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