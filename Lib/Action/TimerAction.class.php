<?php
class TimerAction extends PublicAction{
	public function index(){
		$this->display();
	}
	public function add(){
		global $_G;
		$uid=$_G['uid'];
		if(empty($uid)){$this->error('请登录');}
		$aid=$this->_post('aid')?$this->_post('aid'):$this->_get('aid');
		if(empty($aid)){$this->error('非法操作');}
		$mobile=D('Sms')->getUserMobile($uid);
		$email=D('User')->getUserMail($uid);
		if((empty($mobile)&&empty($email))){
			$this->error('提醒失败，请在个人信息里完善手机号、邮箱号其中任意一种联系方式');
		}	
		else{
		
		$re=D('Timer')->InsertTimer_Poster($aid,1);
		
		if($re==0){$this->error('活动时间已过');}
		
		if($re==2){$this->error('已添加');}
		
		if($re==3){$this->error('请先在防骚扰设置开启活动提醒功能');}
		
		if($re==4){$this->error('未知错误');}
		
		$conf = D('Timer')->getConf($uid)[1];
		
		if( (empty($mobile)&&!empty($email)) && ($conf['email']==1 && $conf['sms']==0) ) 
			$this->success('提醒成功，会提前两个小时会提醒您参加活动。'."\n".'提醒方式：邮件'."\n".'建议:填写手机号即可使用短信提醒');
		
		if((!empty($mobile)&&empty($email)) &&  ($conf['email']==0 && $conf['sms']==1) ) 
			$this->success('提醒成功，会提前两个小时会提醒您参加活动。'."\n".'提醒方式：短信，'."\n".'建议:填写邮箱号即可实现短信、邮件双提醒');
		
		if((!empty($mobile)&&!empty($email)) &&  ($conf['email']==1 && $conf['sms']==1) ) 
			$this->success('提醒成功，会提前两个小时会提醒您参加活动。'."\n".'提醒方式：短信、邮件');
		
		
		if((!empty($mobile)&&!empty($email)) &&  ($conf['email']==1 && $conf['sms']==0) ) 
			$this->success('提醒成功，会提前两个小时会提醒您参加活动。'."\n".'提醒方式：邮件'."\n".'可在防骚扰设置里开启 短信 提醒');
		
		
		if((!empty($mobile)&&!empty($email)) &&  ($conf['email']==0 && $conf['sms']==1) ) 
			$this->success('提醒成功，会提前两个小时会提醒您参加活动。'."\n".'提醒方式：短信'."\n".'可在防骚扰设置里开启 邮件 提醒');
		
		}
	}
	public function addAfterPoster($aid){
		D('Timer')->InsertTimer_Poster($aid,2);
	}
	public function update(){
		global $_G;
		$uid=$_G['uid'];
		if(empty($uid)){$this->error('请登录');}
		$aid=$this->_post('aid')?$this->_post('aid'):$this->_get('aid');
		if(empty($aid)){$this->error('非法操作');}
		$time=$this->_post('time');
		//$type=$this->_post('type');
		D('Timer')->updateTimer_Poster($aid,$time,$type);
	}
	public function show_conf(){
		global $_G;
		$uid=$_G['uid'];
		if(empty($_G['uid'])) {
            $this->error('没有登录');
        }
		$conf=D('Timer')->getConf($uid);
		//dump($conf);
		foreach($conf as $aid_type => $val){
			if($aid_type == 1){
			if($val['email']==1)   $checkstat = 'checked="checked"';
			$emailbox = '<input type="checkbox" name="checkbox['.$aid_type.'][email]" '.$checkstat.'/> 邮件';
            unset($checkstat);
			if($val['sms']==1)     $checkstat = 'checked="checked"';
			$smsbox = '<input type="checkbox" name="checkbox['.$aid_type.'][sms]" '.$checkstat.'/> 短信';
		    $time_conf[$aid_type] = $emailbox."\n".$smsbox;
		   }
		   if($aid_type == 2){
		   	unset($checkstat);
                 if($val['email']==1)
				$checkstat = 'checked="checked"';
			$emailbox2 = '<input type="checkbox" name="checkbox['.$aid_type.'][email]" '.$checkstat.'/> 邮件';
		    //$smsbox2 = '<input type="hidden" name="checkbox['.$aid_type.'][sms]" value=0 />';
		    $time_conf[$aid_type] = $emailbox2."\n".$smsbox2;
		   }
		}
		return $time_conf;
	}
	public function del(){
		global $_G;
		$uid=$_G['uid'];
		if(empty($uid)){$this->error('请登录');}
		$aid=$this->_post('aid')?$this->_post('aid'):$this->_get('aid');
		if(empty($aid)){$this->error('非法操作');}
		$n=D('Timer')->delTimer_Poster($aid,$aid_type=1);
		if($n==false){$this->error("无此提醒");}
		else{$this->success("成功取消".$n.'条提醒');}
	}
	public function check(){
		// only allowed to be accessed by crontab
		/*if ($_SERVER['REMOTE_ADDR'] != $_SERVER['SERVER_ADDR']) {
			echo $_SERVER['REMOTE_ADDR']."\n";
			echo $_SERVER['SERVER_ADDR']."\n";
			echo "<br />".date('c');
			return 0;
		}*/
		$re=D('Timer')->checkTimer();
		$i = 0;
		if($re){
			foreach($re as $key => $val){
				$confs = json_decode($val['type']);
				foreach ($confs as $key => $conf) {
					switch ($key) {
						case 'email':
							if($conf == 1){
								if($val['aid_type']==2)
									$i++;
								if($i > C('timer_email'))
									break;
								$email=D('User')->getUserMail($val['uid']);
								if($email) SendMail($email,"来自活动平台的提醒",$this->email2text($val['aid']), true);
								
							}
							break;
						case 'sms':
							if($conf == 1){
								$mobile=D('Sms')->getUserMobile($val['uid']);
								if($mobile) D('Sms')->sentMsg($this->sms2text($val['aid']),$mobile);
							}
						default:
							break;
					}
				}
				D('Timer')->changeStatus($val['id'],1);
			}
			echo "Timers count: ".count($re)."\n";
			return 1;
		}
		echo "正常运行中...";
		return 1;
	}
	public function sms2text($aid){
		$poster = M('Poster')->find($aid);
		$time=$this->humanDate($poster['start_time'],$poster['end_time']);
		$place=$poster['place'];
		$name=$poster['name'];
		$clubname=D('Club')->getClubName($poster['gid']);
		//$link="http://".$_SERVER['HTTP_HOST']."Poster/singlePage?aid=".$poster['aid'];
		$content="亲，$name 就要开始了，求围观！
时间: $time
地点: $place
承办: $clubname
【活动平台】";
		return $content;
	}
	public function email2text($aid){
		$poster = M('Poster')->find($aid);
		$time=$this->humanDate($poster['start_time'],$poster['end_time']);
		$name=$poster['name'];
		$clubname=D('Club')->getClubName($poster['gid']);
		$content='<div style="margin:0 auto"><table cellpadding="0" cellspacing="0" border="0" align="center" style="margin:0px auto; color:#000;">
        <tbody>
          <tr>
            <td colspan="3" align="center" style="color: #09C; font-size:18px;">'.$name.'</td>
          </tr>
          <tr height="23" valign="bottom">
            <td colspan="2" align="center">
			<p style="text-align:center;">
			<img style="margin-top:10px" src="'.C('SITE_ADDRESS').'/upload/poster/thumb/large_'.$poster['poster'].'" alt="海报" class="poster_img" />
			</p>
			</td>
          </tr>
            <td height="30px" style="font-size:14px">活动链接：</td>
            <td><span style="color: #09F;"><a href="'.C('SITE_ADDRESS').'/Poster/singlePage?aid='.$aid.'"'.C('SITE_ADDRESS').'/Poster/singlePage?aid='.$aid.'</a></span><div style="float:right;font-size:12px; font-weight:normal;"></div></td>
            <td></td>          
          </tr>
          <tr height="20px">
            <td style="font-size:14px">时间：</td>
            <td>'.$time.'</td>       
          </tr>
          <tr height="20px">
            <td style="font-size:14px">地点：</td>
            <td>'.$poster['place'].'</td>       
          </tr>
		  <tr height="20px">
            <td style="font-size:14px">承办：</td>
            <td>'.$clubname.'</td>       
          </tr>
        </tbody>
		</table>
		</div>';
		return $content;
	}
	public function humanDate($start,$end){
        $str = date("n月j日H:i", $start);
        $str .= ' - ';
        // if in the same day
        if (date("Y-m-d", $start) == date("Y-m-d", $end))
            $str .= date("H:i", $end);
        else
            $str .= date("n月j日H:i", $end);
        return $str;
    }
}
?>
