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
        $show=$model->showMsgFromMe();//对话消息
        //dump($show[2]);
        //die;
        //$model->sentMsgForSys(time(),'科考学会邀请你加入','1385545465465454684654',3,3);
        $sys_msg=$model->showSysMsg();//系统消息
        //dump($sys_msg);
        //die;
        $show[1][]['to_uid']=$tid;
        foreach($show[1] as $raw => $val)
        {
            $tid_info[$val['to_uid']]=D('User')->getInfo($val['to_uid']);
            $tid_info[$val['to_uid']]['last_dialog'] = $show[0][$val['to_uid']][count($show[0][$val['to_uid']])-1];
        }
        foreach($sys_msg as $raw1 => $val1)
        {
            $sys_msg[0][$raw1]['name']=M('Club')->field('name')->where(array('gid'=>$val1['gid']))->find()['name'];
        }
        //die;
        $this->assign('msg_num',array($sys_msg[1],$show[2],$sys_msg[1]+$show[2]));
        $this->assign('info',$show[0]);
        $this->assign('tid',$tid_info);
        $this->assign('sys',$sys_msg[0]);

        /*foreach($sys_msg[1] as $raw => $val)
          {
          $sys_info[$val['gid']]=D('Club')->getInfo($val['gid']);
          $sys_info[$val['gid']]['last_dialog'] = $sys_msg[0][$val['gid']][count($sys_msg[0][$val['gid']])-1];
          }
        //dump($sys_msg[0]);
        //dump($sys_info);
        $this->assign('sys',$sys_msg[0]);
        $this->assign('gid',$sys_info);*/
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
    public function ajax_sms_num()
    {
        global $_G;
        if(!D('User')->checkLogin()){$this->error('未登陆');}
        $num=$this->_post('num');
        $uid=$_G['uid'];
        $re=D('Msg')->ajaxCheck($uid);
        //dump($re);
        //die;
        //if($num!=$re[0]){
        $info['tid']=$re[2]['uid'];
        $info['name']=D('User')->getRealname($re[2]['uid']);
        $info['msg']=$re[2]['msg'];
        $info['img_url']=D('User')->getAvatar($re[2]['uid'],$size='small');
        //}
        $info['num'] = $re[0];
        $this->success($info);
    }
    public function test()
    {
        $tid=5;
        D('Msg')->readedMsg('',$tid);
    }
    public function ajax_read()
    {
        $tid=$this->_post('tid');
        $info=0;
        if(D('Msg')->readedMsg('',$tid));
        {
            $info=1;
            $this->success($info);
        }
        $this->error($info);
    }
}//
?>
