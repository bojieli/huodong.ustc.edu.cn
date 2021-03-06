<?php
class SurveyAction extends PublicAction {
    function index() {
        if (CURRENT_USER == 0)
            $this->error("需要登录才能使用调查问卷");
        $list = M('Survey')->select();
        foreach ($list as &$survey) {
            $survey['clubname'] = D('Club')->getClubName($survey['gid']);
        }
        $this->assign('surveys', $list);
        $this->headnav();
        $this->display();
    }
    
    function create() {
        $this->assertPriv(__METHOD__, 'manager');
        $this->headnav();
        $this->display();
    }

    function do_create() {
        $this->assertPriv(__METHOD__, 'manager');
        $survey = D('Survey')->create($_REQUEST['gid'], json_decode($_POST['form'], true));
        echo json_encode(array('survey'=>$survey, 'status'=>($survey > 0))); 
    }

    function response() {
        $this->assertPriv(__METHOD__);
        if (D('Survey')->isSubmited($_REQUEST['survey']))
            $this->error('您已经参与过此调查，每人只能参与一次');
        $form = D('Survey')->getForm($_REQUEST['survey']);
        $this->assign($form);
        $this->headnav();
        $this->display();
    }

    function do_response() {
        $this->assertPriv(__METHOD__);
        try {
            $num = D('Survey')->response($_REQUEST['survey'], json_decode($_POST['form']));
        } catch(Exception $e) {
            echo json_encode(array('status'=>false, 'info'=>$e->getMessage()));
            exit();
        }
        echo json_encode(array('status'=>true, 'num'=>$num));
    }

    function update() {
        $this->assertPriv(__METHOD__, 'manager');
        $form = D('Survey')->getForm($_REQUEST['survey']);
        $this->assign($form);
        $this->headnav();
        $this->display();
    }

    function do_update() {
        $this->assertPriv(__METHOD__, 'manager');
        $status = D('Survey')->update($_REQUEST['survey'], json_decode($_POST['form']));
        echo json_encode(array('status'=>$status)); 
    }

    function result() {
        $this->assertPriv(__METHOD__, 'manager');
        $result = D('Survey')->getResult($_REQUEST['survey']);
        $this->assign($result);
        $this->headnav();
        $this->display();
    }

    function response_list() {
        $this->assertPriv(__METHOD__, 'manager');
        $result = D('Survey')->getResponseList($_REQUEST['survey']);
        $this->assign('responses', $result);
        $this->headnav();
        $this->display();
    }

    function show_response() {
        $this->assertPriv(__METHOD__, 'manager');
        $result = D('Survey')->getResponse($_REQUEST['response']);
        $this->assign($result);
        $this->headnav();
        $this->display();
    }

    function response_table() {
    	$this->assertPriv(__METHOD__, 'manager');
	$this->assign('info', D('Survey')->getResponseList($_REQUEST['survey']));
	$this->assign('table', D('Survey')->getResponseTable($_REQUEST['survey']));
	$this->display();
    }

    function response_table_inverse() {
    	$this->assertPriv(__METHOD__, 'manager');
	$this->assign('info', D('Survey')->getQuestions($_REQUEST['survey']));
	$this->assign('table', D('Survey')->getResponseTableInverse($_REQUEST['survey']));
	$this->display();
    }

    private function inverse_matrix($m) {
    	$newm = array();
    	foreach ($m as $row) {
		foreach ($row as $key => $value) {
			if (!isset($newm[$key]))
				$newm[$key] = array($value);
			else
				$newm[$key][] = $value;
		}
	}
	return $newm;
    }

    private function assertPriv($goto, $priv='') {
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
            if (!$this->survey)
                $this->error("您所查找的调查问卷不存在");
            if ($this->survey['password'] != '' && $priv != 'manager') {
                if (empty($_REQUEST['password'])) {
                    $this->assign('goto', $goto);
                    $this->display('password');
                    exit();
                }
                if (! $this->checkPassword($this->survey['password']))
                    $this->error("您输入的密码不正确");
            }
            if ($this->survey['need_login'] && CURRENT_USER == 0)
                $this->error("需要登录才能填写调查问卷");
            if ($this->survey['member_only'] && ! D('Club')->isMember(CURRENT_USER, $this->gid))
                $this->error("组织成员才有权进行此操作");
        }
    }

    private function checkPassword($password) {
        $passwords = explode(',', $password);
        foreach ($passwords as $pass) {
            if (trim($pass) == $_REQUEST['password'])
                return true;
        }
        return false;
    }
}
