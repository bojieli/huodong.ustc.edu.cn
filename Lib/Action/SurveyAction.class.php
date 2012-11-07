<?php
class SurveyAction extends PublicAction {
    function index() {
        if (CURRENT_USER == 0)
            $this->error("需要登录才能使用调查问卷");
        $list = M('Survey')->select();
        $this->assign('surveys', $list);
        $this->headnav();
        $this->display();
    }
    
    function create() {
        $this->assertPriv('manager');
        $this->headnav();
        $this->display();
    }

    function do_create() {
        $this->assertPriv('manager');
        D('Survey')->create($_REQUEST['gid'], json_decode($_POST['form']));
    }

    function response() {
        $this->assertPriv();
        $form = D('Survey')->getForm($_REQUEST['survey']);
        $this->headnav();
        $this->display();
    }

    function do_response() {
        $this->assertPriv();
        D('Survey')->response($_REQUEST['survey'], json_decode($_POST['form']));
    }

    function update() {
        $this->assertPriv('manager');
        $this->headnav();
        $this->display();
    }

    function do_update() {
        $this->assertPriv('manager');
        D('Survey')->update($_REQUEST['survey'], json_decode($_POST['form']));
    }

    function result() {
        $this->assertPriv('manager');
        $result = D('Survey')->getResult($_REQUEST['survey']);
        $this->assign('result', $result);
        $this->headnav();
        $this->display();
    }

    private function assertPriv($priv='') {
        if (CURRENT_USER == 0)
            $this->error("需要登录才能使用调查问卷");
        if (empty($_REQUEST['gid']) || !is_numeric($_REQUEST['gid']))
            $this->error("只有学生组织才能发起调查问卷");
        $this->gid = $_REQUEST['gid'];
        switch ($priv) {
            case 'manager': 
                if (! D('Club')->isManager($this->gid))
                    $this->error("组织管理员才有权进行此操作");
                break;
            case 'member':
                if (! D('Club')->isMember(CURRENT_USER, $this->gid))
                    $this->error("组织成员才有权进行此操作");
                break;
            default:
                break;
        }
        if (!empty($_REQUEST['survey']) && is_numeric($_REQUEST['survey'])) {
            $this->sid = $_REQUEST['survey'];
            $this->survey = M('Survey')->find($this->sid);
            if (empty($this->survey))
                $this->error("您所查找的调查问卷不存在");
            if ($this->survey['member_only'] && ! D('Club')->isMember(CURRENT_USER, $this->gid))
                $this->error("组织成员才有权进行此操作");
        }
    }
}