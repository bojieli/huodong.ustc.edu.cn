<?php
class MlxhAction extends PublicAction {
    function index() {
        $this->display();
    }

    function miaosha() {
        if (CURRENT_USER == 0)
            $this->error("请首先注册或登录");

        date_default_timezone_set('Asia/Chongqing');
        $time = time();
        $t = localtime($time, true);
        $daysec = $t['tm_hour'] * 3600 + $t['tm_min'] * 60 + $t['tm_sec'];
        // 11:11 ~ 12:30
        if ($daysec < 11*3600+11*60)
            $this->error('今天的秒杀尚未开始');
        if ($daysec > 12*3600+30*60)
            $this->error('今天的秒杀已于12:30结束');

        $count = M('mlxh_log')->where(array('uid'=>CURRENT_USER))->count();
        if ($count > 0)
            $this->error('你已经参与过秒杀或抽奖了，每人只有一次机会哦~');

        $todaybegin = $time - $time % 86400;
        $count = M('mlxh_log')->where("time > $todaybegin AND action='miaosha'")->count();
        $everyday_tickets = 10;
        if ($count >= $everyday_tickets)
            $this->error("抱歉，今天已经有 $everyday_tickets 人秒杀了……");

        $log['uid'] = CURRENT_USER;
        $log['time'] = $time;
        $log['action'] = 'miaosha';
        $o = M('mlxh_log');
        $o->create($log);
        $o->add();
        $this->success('恭喜你，秒杀成功！');
    }

    function choujiang() {
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
