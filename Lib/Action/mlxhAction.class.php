<?php
class MlxhAction extends PublicAction {
    function isTheDay() {
        date_default_timezone_set('Asia/Chongqing');
        $t = localtime(time(), true);
        return ($t['tm_mon']+1 == 10 && $t['tm_mday'] >= 27) || ($t['tm_mon']+1 == 11 && $t['tm_mday'] <= 5);
    }

    function index() {
        $this->headnav();
        if (CURRENT_USER > 0) {
            $count = M('mlxh_log')->where(array('uid'=>CURRENT_USER, 'action'=>'miaosha'))->count();
            if ($count > 0)
                $this->assign('miaoshaguole', true);
            $count = M('mlxh_log')->where(array('uid'=>CURRENT_USER, 'action'=>'choujiang-gotit'))->count();
            if ($count > 0)
                $this->assign('choujiangguole', true);
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

    function getTicketUsers() {
        $this->headnav();
        if (CURRENT_USER == 0)
            $this->error("为保护隐私，登录用户才能查看获票用户列表");
        
        $members = M('mlxh_log')->where("action='choujiang-gotit' OR action='miaosha'")->select();
        $this->showUserList($members);
    }

    function sendEmail() {
        if (CURRENT_USER != 1)
            $this->error("不允许的操作");
        $members = M('mlxh_log')->where(array('action'=>'choujiang-gotit'))->select();
        $members = array_merge($members, M('mlxh_log')->where(array('action'=>'miaosha'))->select());

        foreach ($members as $key => $member) {
            $user = M('user')->find($member['uid']);
            if (!empty($user)) {
                  doSendEmail($user['email'], $user['realname']);
            }
        }
    }

    function doSendEmail($email='', $realname='') {
        if (empty($email))
            $email = $_GET['email'];
        if (empty($realname))
            $realname = $_GET['realname'];
        $HOST = $_SERVER['HTTP_HOST'];
        $msg = "$realname 您好:

  恭喜您在美丽邂逅抢票网站抢票成功！非常感谢您对我们活动的支持，现通知您领取门票，具体事项如下：

  【时间】2012年11月10日中午12:30--13:30
  【地点】中国科学技术大学东区团委楼一楼（人文学院西边）
  【领票方式】科大同学凭本人校园一卡通领取，一人一票，不得代领，不得重复领票。请在规定时间内领票，过期不候。

  注：领票时请自觉排队、遵守秩序。您的配合是对我们工作的最大支持。
                     
  秒杀和抽奖成功名单（需登录后访问）： http://$HOST/mlxh/choujiangUsers

                                                                    美丽邂逅项目组
";
               SendMail($email, "美丽邂逅取票通知", $msg);
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

        $starttime = 20*3600; // 20:00:00
        $duration = 60*60;    // 60 mins

        if ($daysec > $starttime + $duration) {
            $this->savelog('miaosha-after-end');
            $this->ajaxerror('今天的秒杀已经结束，明天再来吧 :(');
        }
        if ($daysec <= $starttime) {
            $this->savelog('miaosha-shuapiao');
            $this->ajaxerror('今天的秒杀还没有开始，请稍候');
        }

        $log = M('mlxh_log');
        $log->startTrans();
        $this->transaction = true;

        $count = $log->lock(true)->where(array('uid'=>CURRENT_USER, 'action'=>'miaosha'))->count();
        if ($count > 0) {
            $this->savelog('miaosha-have-succeed');
            $this->ajaxerror('你已经秒杀成功了，请不要重复秒杀');
        }

        // check miaosha attempts
        $todaybegin = $time - $time % 86400;
        $miaosha_attempt = $log->lock(true)->field('time')->where("uid='".CURRENT_USER."' AND action='miaosha-attempt' AND time>'$todaybegin'")->order('time DESC')->limit(1)->select();
        $min_wait_time = 4;
        if (count($miaosha_attempt) == 1 && $miaosha_attempt[0]['time'] + $min_wait_time > $time) {
            $this->savelog('miaosha-attempt');
            $this->ajaxerror('retry '. ($miaosha_attempt[0]['time'] + $min_wait_time - $time));
        }

        // check today's total number
        $count = $log->lock(true)->where("time > $todaybegin AND action='miaosha'")->count();
        $everyday_tickets = 8;
        if ($count >= $everyday_tickets) {
            $this->savelog('miaosha-used-up');
            $this->ajaxerror("今天已经有 $everyday_tickets 人秒杀了，明天再来吧 :)");
        } else {
            if (mt_rand(0,19) == 0) {
                $this->savelog('miaosha');
                $this->ajaxsuccess('恭喜你，秒杀成功！');
            } else {
                $this->savelog('miaosha-attempt');
                $this->ajaxerror('retry '.$min_wait_time);
            }
	    }
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
            $this->ajaxerror("你已经提交过抽奖，我们每天将在抽奖池中抽取中奖者，请耐心等待");
        }

        $this->savelog('choujiang');
        $this->ajaxsuccess('已经加入抽奖池中！我们每天将在抽奖池中抽取中奖者，请耐心等待');
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
        if ($_POST['token'] != 'k4r9Jewo12Nwej') {
            echo "token error";
            return;
        }

        $day_quota = array(2,4,2,2,2,2,1,1,1,1);

        date_default_timezone_set('Asia/Chongqing');
        $time = time();
        $t = localtime($time, true);
        $day = $t['tm_mon']+1 == 10 ? ($t['tm_mday'] - 27) : (31-27 + $t['tm_mday']);
        if ($day >= 10 || $day < 0) {
            echo "not the day";
            return;
        }
        $num = $day_quota[$day];

        M('mlxh_log')->startTrans();

        $count = M('mlxh_log')->where(array('action'=>'choujiang'))->count();
        $uids = array();
        while ($num > 0 && $count > 0) {
            $r = mt_rand(0, $count-1);
            $row = M('mlxh_log')->where(array('action'=>'choujiang'))->limit("$r,1")->select();
            $row = $row[0];
            if (M('mlxh_log')->where(array('action'=>'choujiang-gotit', 'uid'=>$row['uid']))->count() > 0) {
                continue;
            }
            if (M('mlxh_log')->where(array('action'=>'miaosha', 'uid'=>$row['uid']))->count() > 0) {
                continue;
            }
            $user = M('User')->find($row['uid']);
            if (strlen($user['student_no']) != strlen("PB10000000"))
                continue;
            $uids[] = $row['uid'];
            $num--;
            $count--;
            $newrow = array(
                'action' => 'choujiang-gotit',
                'uid' => $row['uid'],
                'time' => $time
            );
            $o = M('mlxh_log');
            $o->create($newrow);
            $o->add();
        }

        M('mlxh_log')->commit();
        echo "OK";
    }

    function clearMiaoshaDB() {
        if ($_POST['token'] != 'k4r9Jewo12Nwej') {
            echo "token error";
            return;
        }
        M('mlxh_log')->startTrans();
        M('mlxh_log')->where("action != 'persistent'")->delete();
        M('mlxh_log')->commit();
        echo "OK";
    }
}
