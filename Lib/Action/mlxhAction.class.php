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

    function allUsers() {
        $this->headnav();
        // uid 550 yangangyi
        if (CURRENT_USER == 0 || ! D('User')->isDeveloper(CURRENT_USER) && CURRENT_USER != 550)
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
        // 20:00 ~ 21:00
        if ($daysec < 20*3600+00*60) {
            $this->savelog('miaosha-before-start');
            $this->merror('今天的秒杀尚未开始，再等等吧~');
        }
        if ($daysec > 20*3600+15*60) {
            $this->savelog('miaosha-after-end');
            $this->merror('今天的秒杀已于20:15结束 :(');
        }

        $count = M('mlxh_log')->where(array('uid'=>CURRENT_USER, 'action'=>'miaosha'))->count();
        if ($count > 0) {
            $this->savelog('miaosha-have-succeed');
            $this->merror('你已经秒杀成功了，请不要重复秒杀');
        }
        $todaybegin = $time - $time % 86400;
        $count = M('mlxh_log')->where("time > $todaybegin AND action='miaosha'")->count();
        $everyday_tickets = 10;
        if ($count >= $everyday_tickets) {
            $this->savelog('miaosha-used-up');
            $this->merror("今天已经有 $everyday_tickets 人秒杀了，明天再来吧 :)");
        }

        $this->savelog('miaosha');
        $this->success('恭喜你，秒杀成功！');
    }

    private function merror($msg) {
        $this->error($msg);
    }

    function choujiang() {
        if (CURRENT_USER == 0)
            $this->error("请首先注册或登录");

        $count = M('mlxh_log')->where(array('uid'=>CURRENT_USER, 'action'=>'miaosha'))->count();
        if ($count > 0) {
            $this->savelog('choujiang-have-miaosha');
            $this->error('你已经秒杀成功了，不需要再抽奖啦！');
        }

        $count = M('mlxh_log')->where(array('uid'=>CURRENT_USER, 'action'=>'choujiang'))->count();
        if ($count > 0) {
            $this->savelog('choujiang-have-submit');
            $this->error("你已经提交过抽奖<br>请耐心等待11月9日的开奖");
        }

        $this->savelog('choujiang');
        $this->success('已经加入抽奖池中！<br>我们将在11月9日进行抽奖<br>  并通知到您的注册邮箱');
    }

    function error($msg) {
        echo json_encode(array('status'=>false, 'msg'=>$msg));
        exit();
    }
    function success($msg) {
        echo json_encode(array('status'=>true, 'msg'=>$msg));
        exit();
    }
}
