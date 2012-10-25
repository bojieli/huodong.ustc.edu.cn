<?php
class MsgModel extends Model {

    public function showMsgFromMe($mytid)
    {   
        global $_G;
        $con1['uid']=$_G['uid'];
        //dump($_G['uid']);
        $tids1=$this->field('to_uid')->where($con1)->group('to_uid')->select();
        //dump($tids1);
        $i=0;
        $j=0;
        foreach($tids1 as $row1 => $val1)
        {
            $tmp[$i]=$val1['to_uid'];
            $i++;
        }
        $con2['to_uid']=$_G['uid'];
        $tids2=$this->field('uid')->where($con2)->group('uid')->select();
        //dump($tids2);
        foreach($tids2 as $row2 => $val2)
        {
            $tmp[$i+$j]=$val2['uid'];
            $j++;
        }
		//echo $tid;
		 if(!empty($mytid)){
				 D('Msg')->openDialog($_G['uid'],$mytid);
				 $tmp[]=$mytid;
		 }
		$tips=array_unique($tmp);
        //dump($tips);
		$tips=$this->hideSomeTids($tips);
		//dump($tips);
		$tips=$this->addSomeTids($tips);
		//dump($tips);
		$tips=array_unique($tips);
		//dump($tips);
		//die;
		foreach($tips as $k => $v)
        {
            $tids[]['to_uid'] = $v;
        }
        //$tids=array('to_uid'=>$tids);
        //dump($tids);
        $m=0;
        foreach($tids as $row => $val)
        {
            $msg[$val['to_uid']]=$this->showMsgFt($val['to_uid']);
            $co=array(
                    'uid'=>$val['to_uid'],
                    'to_uid'=> $_G['uid'],
                    'status' => 0
                    );
            $m+=$this->where($co)->count();
        }
        //dump($this->getLastsql());
        //die;
        //dump($msg);
        return array($msg,$tids,$m);
        //echo 1233;
        //return $msg;
    }
    public function showMsgFt($to_uid)
    {
        global $_G;
        $uid = $_G['uid'];
        $re=$this->where('(uid='.$uid.'&&to_uid='.$to_uid.')||(uid='.$to_uid.'&&to_uid='.$uid.')')->select();	
                foreach($re as $row =>$val)
                {
                $re[$row]['humanDate']=date("Y年n月j日 H:i", $val['time']);
                }
                //$this->openDialog($uid,$to_uid);
				return $re;
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
                    'status'=>0
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
                    foreach($msg as $row =>$val)
                    {
                        $msg[$row]['humanDate']=date("Y年n月j日 H:i", $val['time']);
                    }



                    $con = array(
                            'tid'=>$uid,
                            'status'=>0
                            );
                    $n = M('Msg_sys')->where($con)->count();
                    //}
                    return array($msg,$n);
                }
                public function ajaxCheck($uid)
                {
                    $co=array(
                            'to_uid'=>$uid,
                            'status' => 0
                            );
                    $m=$this->where($co)->count();
                    $content=$this->where($co)->find();
                    $con = array(
                            'tid'=>$uid,
                            'status'=>0
                            );
                    $id=$content['id'];
                    $n = M('Msg_sys')->where($con)->count();
                    $this->readedMsg($id);
                    return array($m,$n,$content);
                }

                
public function readedMsg($id,$tid){
                    global $_G;
                    $uid=$_G['uid'];
                    $date=array(
                            'status'=>1
                            );
                    if(empty($tid)&&!empty($id)){
                        $this->where(array('id'=>$id))->data($date)->save();
                        return true;
                    };
                    if(empty($id)&&!empty($tid)){
                        $this->where(array('uid='.$tid.'&&to_uid='.$uid))->data($date)->save();
                        return true;
                    };
                    return false;    
                }
public function closeDialog($uid,$tid){
				if(empty($uid)||empty($tid)){return 'uid or tid is empty';};
				$data=array('status'=>0);
				M('Msg_dialog')->where('uid='.$uid.'&&tid='.$tid)->data($data)->save();
}
public function openDialog($uid,$tid){
				if(empty($uid)||empty($tid)){return 'uid or tid is empty';};
				if(M('Msg_dialog')->where('uid='.$uid.'&&tid='.$tid)->find())				
					{
						$data=array('status'=>1);
						M('Msg_dialog')->where('uid='.$uid.'&&tid='.$tid)->data($data)->save();
					}
				else{
						$data=array('uid'=>$uid,'tid'=>$tid,'status'=>1);
						M('Msg_dialog')->data($data)->add();
				}
}
public function hideSomeTids($tips){
				global $_G;
				$uid=$_G['uid'];
				$res=M('Msg_dialog')->field('tid')->where('uid='.$uid.'&&status=0')->select();
				foreach($res as $val)
				{
					$rt[]=$val['tid'];
				}
				foreach($tips as $value)
				{
					if(in_array($value,$rt)==false)
					{
						$re[]=$value;
					}
				}
				//dump($re);
				$res2=M('Msg_dialog')->field('tid')->where('uid='.$uid.'&&status=1')->select();
				//dump($res2);
				foreach($res2 as $val2)
				{
					$re[]=$val2['tid'];
				}
				$re=array_unique($re);
				//dump($re);
				//dump($re+$rt2);
				return $re;
}
public function addSomeTids($rt){
                global $_G;
				$uid=$_G['uid'];
				$res=$this->field('uid')->where('to_uid='.$uid.'&&status=0')->select();
				foreach($res as $val)
				{
					$rt[]=$val['uid'];
				}
				return $rt;
}

}//
?>
