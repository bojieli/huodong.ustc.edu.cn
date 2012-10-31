<?php
class MlxhAction extends PublicAction {
    function isTheDay() {
        date_default_timezone_set('Asia/Chongqing');
        $t = localtime(time(), true);
        return ($t['tm_mon']+1 == 11 && $t['tm_mday'] >= 1 && $t['tm_mday'] <= 8);
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

    function testindex() {
        $this->index();
    }

    function miaosha() {
        if (CURRENT_USER == 0)
            $this->error("请首先注册或登录");

        date_default_timezone_set('Asia/Chongqing');
        $time = time();
        $t = localtime($time, true);
        $daysec = $t['tm_hour'] * 3600 + $t['tm_min'] * 60 + $t['tm_sec'];
        // 20:00 ~ 21:00
        if ($daysec < 20*3600+00*60)
            $this->error('今天的秒杀尚未开始，再等等吧~');
        if ($daysec > 21*3600+00*60)
            $this->error('今天的秒杀已于21:00结束 :(');

        $count = M('mlxh_log')->where(array('uid'=>CURRENT_USER, 'action'=>'miaosha'))->count();
        if ($count > 0)
            $this->error('你已经秒杀成功了，请不要重复秒杀');

        $todaybegin = $time - $time % 86400;
        $count = M('mlxh_log')->where("time > $todaybegin AND action='miaosha'")->count();
        $everyday_tickets = 10;
        if ($count >= $everyday_tickets)
            $this->error("今天已经有 $everyday_tickets 人秒杀了，明天再来吧 :)");

        $log['uid'] = CURRENT_USER;
        $log['time'] = $time;
        $log['action'] = 'miaosha';
        $o = M('mlxh_log');
        $o->create($log);
        $o->add();
        $this->success('恭喜你，秒杀成功！');
    }

    function choujiang() {
        if (CURRENT_USER == 0)
            $this->error("请首先注册或登录");

        $count = M('mlxh_log')->where(array('uid'=>CURRENT_USER, 'action'=>'miaosha'))->count();
        if ($count > 0)
            $this->error('你已经秒杀成功了，不需要再抽奖啦！');

        $count = M('mlxh_log')->where(array('uid'=>CURRENT_USER, 'action'=>'choujiang'))->count();
        if ($count > 0)
            $this->error("你已经提交过抽奖<br>请耐心等待11月9日的开奖");

        date_default_timezone_set('Asia/Chongqing');
        $log['uid'] = CURRENT_USER;
        $log['time'] = time();
        $log['action'] = 'choujiang';
        
        $o = M('mlxh_log');
        $o->create($log);
        $o->add();
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
