<?php
class MsgAction extends PublicAction {

	public function index(){
		global $_G;
		$this->show();
		$this->display();
	}

public function show() {
	$model = D('Msg');
	$show=$model->showMsgFromMe();
	//dump($show[0]);
	$this->assign('info',$show[0]);
	$this->assign('tid',$show[1]);
	}
	public function create(){
   $model = D('Msg');
   global $_G;
   $_G['timestamp']=time();
   //if(empty($_G['uid'])){$this->error('未登陆');}
   $msg=$this->_post('s')?$this->_post('s'):$this->_get('s');
   $sub=$this->_post('sub')?$this->_post('sub'):$this->_get('sub');
   $to_uid=$this->_post('t')?$this->_post('t'):$this->_get('t');
   //echo $msg;
   //return 0;
   $re=$model->sentMsg($_G['timestamp'],$msg,$to_uid,$sub);
    $this->success('yeah!!!');
	}
 }//
 ?>