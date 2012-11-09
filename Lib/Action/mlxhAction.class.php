<?php
class MlxhAction extends PublicAction {
    function isTheDay() {
        date_default_timezone_set('Asia/Chongqing');
        $t = localtime(time(), true);
        return $t['tm_mon']+1 == 10 || ($t['tm_mon']+1 == 11 && $t['tm_mday'] <= 8);
    }

    function index() {
        $this->headnav();
        if (CURRENT_USER > 0) {
            $count = M('mlxh_log')->where(array('uid'=>CURRENT_USER, 'action'=>'miaosha'))->count();
            if ($count > 0)
                $this->assign('miaoshaguole', true);
        }
        $this->assign('theday', $this->isTheDay());
        $this->display();
    }

    private function savelog($action) {
        date_default_timezone_set('Asia/Chongqing');
        $time = time();
        $log['uid'] = CURRENT_USER;
        $log['time'] = $time;
        $log['action'] = $action;
        $o = M('mlxh_log');
        $o->create($log);
        $o->add();
    }

    private function showUserList($members) {
        foreach ($members as $key => $member) {
            $user = M('user')->find($member['uid']);
            if (empty($user))
                unset($members[$key]);
            else
                $members[$key] = array_merge($member, $user);
        }
		$this->assign('members', $members);
        $this->display();
    }

    function miaoshaUsers() {
        $this->headnav();
        if (CURRENT_USER == 0)
            $this->error("为保护隐私，登录用户才能查看秒杀用户列表");
        
        $members = M('mlxh_log')->where(array('action'=>'miaosha'))->select();
        $this->showUserList($members);
    }

    function choujiangUsers() {
        $this->headnav();
        if (CURRENT_USER == 0)
            $this->error("为保护隐私，登录用户才能查看抽奖用户列表");
        
        $members = M('mlxh_log')->where(array('action'=>'choujiang-gotit'))->select();
        $this->showUserList($members);
    }

    function allUsers() {
        $this->headnav();
        if (CURRENT_USER == 0 || ! D('User')->isDeveloper(CURRENT_USER) && $_GET['token'] != 'mlxhlog')
            $this->error("管理员才能查看秒杀日志");

        $members = M('mlxh_log')->where("`action` IN ('miaosha','choujiang')")->select();
        $this->showUserList($members);
    }

    function miaosha() {
        if (CURRENT_USER == 0)
            $this->error("请首先注册或登录");

        date_default_timezone_set('Asia/Chongqing');
        $time = time();
        $t = localtime($time, true);
        $daysec = $t['tm_hour'] * 3600 + $t['tm_min'] * 60 + $t['tm_sec'];

        if ($daysec > 20*3600+60*60) {
            $this->savelog('miaosha-after-end');
            $this->ajaxerror('今天的秒杀已经结束，明天再来吧 :(');
        }
        if ($daysec <= 20*3600+0*60) {
            $this->savelog('miaosha-shuapiao');
            $this->ajaxerror('系统检测到你有刷票嫌疑<br>请联系管理员 bojieli@gmail.com');
        }

        $log = M('mlxh_log');
        $log->startTrans();
        $this->transaction = true;

        $count = $log->lock(true)->where(array('uid'=>CURRENT_USER, 'action'=>'miaosha-shuapiao'))->count();
        if ($count > 0) {
            $this->ajaxerror('系统检测到你有刷票嫌疑<br>请联系管理员 bojieli@gmail.com');
        }
        $count = $log->lock(true)->where(array('uid'=>CURRENT_USER, 'action'=>'miaosha'))->count();
        if ($count > 0) {
            $this->savelog('miaosha-have-succeed');
            $this->ajaxerror('你已经秒杀成功了，请不要重复秒杀');
        }
        $todaybegin = $time - $time % 86400;
        $count = $log->lock(true)->where("time > $todaybegin AND action='miaosha'")->count();
        $everyday_tickets = 10;
        if ($count >= $everyday_tickets) {
            $this->savelog('miaosha-used-up');
            $this->ajaxerror("今天已经有 $everyday_tickets 人秒杀了，明天再来吧 :)");
        }

        $this->savelog('miaosha');
        $this->ajaxsuccess('恭喜你，秒杀成功！');
    }

    function choujiang() {
        if (CURRENT_USER == 0)
            $this->error("请首先注册或登录");

        $log = M('mlxh_log');
        $log->startTrans();
        $this->transaction = true;

        $count = M('mlxh_log')->lock(true)->where(array('uid'=>CURRENT_USER, 'action'=>'miaosha'))->count();
        if ($count > 0) {
            $this->savelog('choujiang-have-miaosha');
            $this->ajaxerror('你已经秒杀成功了，不需要再抽奖啦！');
        }

        $count = M('mlxh_log')->lock(true)->where(array('uid'=>CURRENT_USER, 'action'=>'choujiang'))->count();
        if ($count > 0) {
            $this->savelog('choujiang-have-submit');
            $this->ajaxerror("你已经提交过抽奖<br>请耐心等待11月9日的开奖");
        }

        $this->savelog('choujiang');
        $this->ajaxsuccess('已经加入抽奖池中！<br>我们将在11月9日进行抽奖<br>  并通知到您的注册邮箱');
    }

    function ajaxerror($msg) {
        if ($this->transaction)
            M('mlxh_log')->commit();
        echo json_encode(array('status'=>false, 'msg'=>$msg));
        exit();
    }
    function ajaxsuccess($msg) {
        if ($this->transaction) {
            M('mlxh_log')->commit();
        }
        echo json_encode(array('status'=>true, 'msg'=>$msg));
        exit();
    }

    function doChoujiang() {
        M('mlxh_log')->where(array('action'=>'choujiang-gotit'))->delete();
        $num = 56;
        $count = M('mlxh_log')->where(array('action'=>'choujiang'))->count();
        $uids = array();
        while ($num > 0) {
            $r = rand() % $count;
            $row = M('mlxh_log')->where(array('action'=>'choujiang'))->limit("$r,1")->find();
            if (M('mlxh_log')->where(array('action'=>'choujiang-gotit', 'uid'=>$row['uid']))->count() > 0) {
                continue;
            }
            $uids[] = $row['uid'];
            $num--;
            $row['action'] = 'choujiang-gotit';
            $o = M('mlxh_log');
            $o->create($row);
            $o->add();
            print_r($row);
            flush();
        }
    }
}
