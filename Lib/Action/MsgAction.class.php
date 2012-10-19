<?php
class MsgAction extends Action {

	public function index() {
		global $_G;
		D('Msg')->init();
		//dump(D('User')->getInfo(CURRENT_USER));
		$this->assign('user_info', D('User')->getInfo(CURRENT_USER));
		$this->assign('_G', $_G);
		$this->show();
	}

public function show() {
	$model = D('Msg');
	  global $_G;
	  if(empty($_G['uid'])){$this->error('未登陆');}
	$show=$model->showMsg();
	$this->assign('my', $show);
	//dump($show);
	//$this->assign('from_me', $show[0]);
	//$this->assign('to_me', $show[1]);
	$this->display();
	}
	public function create(){
   $model = D('Msg');
   global $_G;
   $_G['timestamp']=time();
   if(empty($_G['uid'])){$this->error('未登陆');}
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