<?php
class MsgAction extends PublicAction {

	public function index(){
		if(!D('User')->checkLogin()){$this->error('未登陆');}
		$this->show();
		$this->display();
	}

public function show(){
	if(!D('User')->checkLogin()){$this->error('未登陆');}
	$tid = $this->_get('d');
	$model = D('Msg');
	$show=$model->showMsgFromMe();
	$sys_msg=$model->showSysMsg();
	$show[1][]['to_uid']=$tid;
	foreach($show[1] as $raw => $val)
	{
		$tid_info[$val['to_uid']]=D('User')->getInfo($val['to_uid']);
		$tid_info[$val['to_uid']]['last_dialog'] = $show[0][$val['to_uid']][count($show[0][$val['to_uid']])-1];
	}
	//dump($tid_info);
	$this->assign('info',$show[0]);
	$this->assign('tid',$tid_info);
	}
	public function create(){
   if(!D('User')->checkLogin()){$this->error('未登陆');}
   $model = D('Msg');
   global $_G;
   $_G['timestamp']=time();
   //if(empty($_G['uid'])){$this->error('未登陆');}
   $msg=$this->_post('s')?$this->_post('s'):$this->_get('s');
   $title=$this->_post('title')?$this->_post('sub'):$this->_get('title');
   $to_uid=$this->_post('t')?$this->_post('t'):$this->_get('t');
   //echo $msg;
   //return 0;
   $re=$model->sentMsg($_G['timestamp'],$msg,$to_uid);
    $this->success('yeah!!!');
	}
 }//
 ?>