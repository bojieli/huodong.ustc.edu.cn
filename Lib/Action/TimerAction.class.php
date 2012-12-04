<?php
class TimerAction extends PublicAction{
	public function index(){
		$this->display();
	}
	public function init(){
		global $_G;
		$uid=$_G['uid'];
		if(empty($uid)){$this->error('未登录');}
		$aid=$this->_post('aid');
		if(empty($aid)){$this->error('非法操作');}
	}
	public function add(){
		$this->init();
		D('Timer')->InsertTimer_Poster($aid);
	}
	public function update(){
		$this->init();
		$time=$this->_post('time');
		//$type=$this->_post('type');
		D('Timer')->updateTimer_Poster($aid,$time,$type);
	}
	public function del(){
		$this->init();
		$n=delTimer_Poster($aid);
		if($n!=false){$this->success("成功删除".$n.'条');}
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
	public function sms2text($aid){
		$aid=$this->_get('aid');
		$poster = M('Poster')->find($aid);
		$time=$this->humanDate($poster['start_time'],$poster['end_time']);
		$place=$poster['place'];
		$name=$poster['name'];
		$clubname=D('Club')->getClubName($poster['gid']);
		$link="http://".$_SERVER['HTTP_HOST']."Poster/singlePage?aid=".$poster['aid'];
		$content="亲，".$name."就要开始了，求围观！
		时间:".$time."
		地点:".$place."
		承办:".$clubname."
		详情:".$link;
		//echo $content;
	    D('Sms')->sentMsg($content,15655170201);
		//return $content;
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