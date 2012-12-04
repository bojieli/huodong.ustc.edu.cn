<?php
class TimerAction extends PublicAction{
	public function index(){
		$this->display();
	}
	public function add(){
		global $_G;
		$uid=$_G['uid'];
		if(empty($uid)){$this->error('未登录');}
		$aid=$this->_post('aid')?$this->_post('aid'):$this->_get('aid');
		if(empty($aid)){$this->error('非法操作');}
		$re=D('Timer')->InsertTimer_Poster($aid);
		if($re==0){$this->error('活动时间已过');}
		if($re==2){$this->error('已添加');}
		else{$this->success('提醒成功');}
	}
	public function update(){
		global $_G;
		$uid=$_G['uid'];
		if(empty($uid)){$this->error('未登录');}
		$aid=$this->_post('aid')?$this->_post('aid'):$this->_get('aid');
		if(empty($aid)){$this->error('非法操作');}
		$time=$this->_post('time');
		//$type=$this->_post('type');
		D('Timer')->updateTimer_Poster($aid,$time,$type);
	}
	public function del(){
		global $_G;
		$uid=$_G['uid'];
		if(empty($uid)){$this->error('未登录');}
		$aid=$this->_post('aid')?$this->_post('aid'):$this->_get('aid');
		if(empty($aid)){$this->error('非法操作');}
		$n=D('Timer')->delTimer_Poster($aid);
		if($n==false){$this->error("无此提醒");}
		else{$this->success("成功删除".$n.'条');}
	}
	public function show_conf(){
		$conf=D('Timer')->getConf();
		$this->assign('sms',$conf['sms']);
		$this->assign('email',$conf['email']);
		$this->display();
	}
	public function update_conf(){
		//$type=$this->_post('type');
		D('Timer')->changeConf($sms,$email);
	}
	public function check(){
		$re=D('Timer')->checkTimer();
		if($re){
			foreach($re as $key => $val){
				D('Sms')->sentMsg($this->sms2text($val['aid']),D('Sms')->getUserMobile($val['uid']));
				D('Timer')->changeStatus($val['id'],1);
			}
		}
		return 0;
	}
	public function sms2text($aid){
		$aid=$this->_get('aid');
		$poster = M('Poster')->find($aid);
		$time=$this->humanDate($poster['start_time'],$poster['end_time']);
		$place=$poster['place'];
		$name=$poster['name'];
		$clubname=D('Club')->getClubName($poster['gid']);
		//$link="http://".$_SERVER['HTTP_HOST']."Poster/singlePage?aid=".$poster['aid'];
		$content="亲，".$name."就要开始了，求围观！
时间:".$time."
地点:".$place."
承办:".$clubname."
【活动平台】";
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