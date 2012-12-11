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
		//dump($tmp);
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
		///die;
		foreach($tips as $k => $v)
        {
            $tids[]['to_uid'] = $v;
        }
        //$tids=array('to_uid'=>$tids);
        //dump($tids);
        foreach($tids as $row => $val)
        {
            $msg[$val['to_uid']]=$this->showMsgFt($val['to_uid']);
        }
        return array($msg,$tids);
    }
    public function getUnreadMsgNum(){
		global $_G;
		$co['to_uid']=$_G['uid'];
		$co['status']=0;       
        $m=$this->where($co)->count();
		$con['tid']=$_G['uid'];
		$con['status']=0;       
        $n=M('Msg_sys')->where($con)->count();
		return array('total_num'=>$m+$n,'dialog_num'=>$m,'sys_num'=>$n);
	}
	public function showMsgFt($to_uid)
    {
        global $_G;
        $uid = $_G['uid'];
        $re=$this->where('(uid='.$uid.'&&to_uid='.$to_uid.')||(uid='.$to_uid.'&&to_uid='.$uid.')')->order('time')->select();	
                foreach($re as $row =>$val)
                {
                $re[$row]['humanDate']=date("Y年n月j日 H:i:s", $val['time']);
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
                public function sentMsgForSys($time,$title,$msg,$tids,$gid){
                    if($tids=='ALL')
					{
						$tids2=M('User_group')->field('uid')->where(array('gid'=>$gid))->select();
						foreach($tids2 as $ch){
						   $tids_tmp[]=$ch['uid'];
						}
						$tids=$tids_tmp;
					}
					foreach($tids as $val)
					{
						$vals.=$val.';';
					}
					$data=array(
                            'time'=>$time,
                            'title'=>$title,
                            'msg'=>$msg,
                            'tid'=>$vals,
                            'gid'=>$gid,
                            );
                    M('Msg_sys_content')->data($data)->add();
					$pid=M('Msg_sys_content')->field('pid')->where($data)->find()['pid'];
					 foreach($tids as $tid)
					{
						if(!empty($tid)){
						$this->sentMsgForSysToPer($pid,$tid,$gid);
						}
					}
                }
				public function sentMsgForSysToPer($pid,$tid,$gid){
					$data=array(                          
                            'pid'=>$pid,
							'tid'=>$tid,
                            'gid'=>$gid,
                            'status'=>0
                            );
                    M('Msg_sys')->data($data)->add();
				}
				public function showSysMsg(){
                    global $_G;
                    $uid = $_G['uid'];
					$syscon['tid']=$uid;
					$syscon['status']=array('neq',-1);
                    $pids=M('Msg_sys')->field('pid,status')->where($syscon)->select();
                    foreach($pids as $pid_row =>$pid){
					$msg[]=M('Msg_sys_content')->where(array('pid'=>$pid['pid']))->find();
					$msg[$pid_row]['status']=$pid['status'];
					}
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
                    $this->openDialog($uid,$content['uid']);
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
public function readedMsgForSys($pid){
	global $_G;
	$uid=$_G['uid'];
	$date=array(
			'status'=>1
			);
	$con['pid']=$pid;
	$con['tid']=$uid;
	M('Msg_sys')->where($con)->data($date)->save();
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
				//dump($res);
				foreach($res as $val)
				{
					$rt[]=$val['tid'];
				}
				//dump($tips);
				//dump($rt);
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
public function posterMsg($aid){
	$poster = M('Poster')->find($aid);
	$poster['Start_time'] = date('n月j日 H:i:s',$poster['start_time']);
	$poster['End_time'] = date('n月j日 H:i:s',$poster['end_time']);
	$title=$poster['name'];
	$msg='
	<table width="635" cellpadding="0" cellspacing="0" border="0" align="left" style="margin:0px 0px 0px 40px; color:#000;">
        <tbody>
          <tr>
            <td colspan="3" align="center" style="color: #09C; font-size:18px;">'.$title.'</td>
          </tr>
          <tr height="23" valign="bottom">
            <td colspan="2" align="center">
			<img style="width:250px;margin-top:10px" src="/upload/poster/thumb/thumb_'.$poster['poster'].'" alt="海报" class="poster_img" />
			</td>
          </tr>
            <td height="30px" style="font-size:14px">活动链接：</td>
            <td><span style="color: #09F;"><a href="/Poster/singlePage?aid='.$aid.'">http://huodong.ustc.edu.cn/Poster/singlePage?aid='.$aid.'</a></span><div style="float:right;font-size:12px; font-weight:normal;"></div></td>
            <td></td>          
          </tr>
          <tr height="20px">
            <td style="font-size:14px">活动时间：</td>
            <td>'.$poster['Start_time'].'-'.$poster['End_time'].'</td>       
          </tr>
          <tr height="20px">
            <td style="font-size:14px">活动地点：</td>
            <td>'.$poster['place'].'</td>       
          </tr>
        </tbody>
    </table>';
return array($title,$msg);
}
public function commentMsg($cid,$content,$aid){
	if($cid!=0)
	{
		$re=M('Poster_comment')->where(['cid'=>$cid])->find();
		$postername=M('Poster')->field('name')->where(['aid'=>$re['aid']])->find()['name'];
		return 
		$content.'<br>
		<div class="add_msg">
		来自海报:<a href="/Poster/singlePage?aid='.$re['aid'].'">'.$postername.'</a>
		<div class="add_content">
		回复您的评论:<a href="/Poster/singlePage?aid='.$re['aid'].'">'.$re['content'].'</a>
		</div>
		</div>
		';
	}
	else
	{
		$postername=M('Poster')->field('name')->where(['aid'=>$aid])->find()['name'];
		return
		$content.'<br>
		<div class="add_msg">
		来自海报:<a href="/Poster/singlePage?aid='.$aid.'">'.$postername.'</a>
		</div>
		';
	}
	
}
}//
?>
