<?php
class PosterAction extends PublicAction {
    public function index() {
        global $_G;
        $this->headnav();
        $keyword = isset($_GET['keyword']) ? addslashes($_GET['keyword']) : '';
        $sid = isset($_GET['sid']) ? addslashes($_GET['sid']) : $_G['sid'];
        $condition = '';
        $url = '';
        if(!empty($keyword))
        {
            $condition = " (name like '%$keyword%' or place like '%$keyword%' or description like '%$keyword%') ";
            if(empty($url))
            {
                $url .= "keyword='$keyword'";
            }
            else
            {
                $url .="&keyword='$keyword'";
            }
        }
        if(!empty($sid))
        {
            if(empty($condition))
            {
                $condition .= " sid = '$sid' ";
            }
            else
            {
                $condition .= " AND sid = '$sid' ";
            }
        }

        $schools = M('School')->select();
        $num = count($schools);
        for($i=0;$i<$num;$i++)
        {
            $school_id = $schools[$i]['sid'];
            if(empty($url))
            {
                $schools[$i]['url']="/Poster/index?sid=$school_id";
            }
            else
            {
                $schools[$i]['url']='/Poster/index?'.$url."&sid=$school_id";
            }

        }
        $school_all[] = array(
                'sid' => 0,
                'url' => empty($url)?'/Poster/index?sid=0':'/Poster/index?'.$url."&sid=0",
                'name' => '全部学校'
                );
        $schools =  array_merge($school_all,$schools);
        $schools = json_encode($schools);
        list($start, $num, $cond, $order) = $this->parseInput();
		$posters = D('Poster')->getPoster(0,8,$cond,$order);
        $elements = [];
        foreach ($posters as $poster)
           $php_poster.= $this->poster2html($poster);
		$this->assign('php_poster',$php_poster);
		$this->assign('schools', $schools);
        $this->assign('sid', $sid);
        $this->assign('keyword', $keyword);
        $this->assign('stat', D('Poster')->get_stat($condition));
		$this->assign('msg_num',D('Msg')->getUnreadMsgNum());
        $this->assign('order', empty($_GET['order']) ? 'new' : $_GET['order']);
        $this->display();
    }

    public function add() {
        $gid = $this->getInputGid();
        if (A('Club')->isManager($gid)) {
            //dump(D('Qr')->getQrByGid($gid));
			$this->assign('qrs',D('Qr')->getQrByGid($gid));
			$this->assign('gid', $gid);
            // init timestamp
            // round to 5 minutes
            $poster['start_time'] = $poster['end_time'] = floor(time() / 300) * 300;
            $this->assign('poster', $poster);
            $this->display();
        } else {
            $this->assign('jumpUrl', "/");
            $this->error("抱歉，只有会长和部长级别的会员才能发布海报");
        }
    }

    public function insert() {
        $gid = $this->getInputGid();

        if (!(A('Club')->isManager($gid))) {
            $this->assign('jumpUrl', "/");
            $this->error("抱歉，只有会长和部长级别的会员才能发布海报");
        }

        $image = $this->uploadPoster();
        if (!$image) {
            $this->error("您必须上传海报图片。请注意图片格式和最大图片大小的限制。");
        }
        $poster['poster'] = $image;

        $poster['gid'] = $gid;
        $poster['author'] = CURRENT_USER;
        $poster['publish_time'] = time();

        $fields = ['name','place','description'];
        foreach ($fields as $field) {
            if($field=='description'){
			$poster[$field]=xss_clean($_POST[$field]);//防止XSS攻击
			}
			else $poster[$field] = htmlspecialchars($_POST[$field]);
        }
        //dump($_POST['description']);
		$poster['start_time'] = $this->parseTime($_POST['start_date'], $_POST['start_hour'], $_POST['start_minute']);
        $poster['end_time'] = $this->parseTime($_POST['end_date'], $_POST['end_hour'], $_POST['end_minute']);
        if ($poster['start_time'] >= $poster['end_time'])
            $this->error("开始时间必须早于结束时间，请返回检查");
		$poster['sid'] = M('Club')->result_first("SELECT sid FROM ustc_club where gid = $gid");
        $obj = M('Poster');
        $re=$obj->create($poster);
		
		$qrid=$this->_post('qrid');
		$obj->add();
        if($qrid!=0){
			$aid=$obj->where($re)->find()['aid'];
			M('Qr')->where(array('id'=>$qrid))->data(array('aid'=>$aid,'status'=>2,'status_time'=>time()))->save();
        }
		D('Club')->incPosterCount($gid);

        $this->assign('jumpUrl', "/");
        $this->success("海报发布成功！");
    }

    public function modify() {
        $aid = $this->getInputAid();
        $poster = $this->getPoster($aid);
        if (A('Club')->isManager($poster['gid'])) {
            $gid=$poster['gid'];
			
			$con['aid']=$aid;
			$con['gid']=$gid;
			$id=M('Qr')->field('id')->where($con)->find()['id'];
			//dump($id);
			$this->assign('qrs',D('Qr')->getQrByGid($gid));
			$this->assign('selected_id',$id);
			$this->assign('poster', $poster);
            //dump($poster);
			$this->display();
        } else {
            $this->assign('jumpUrl', "/");
            $this->error("抱歉，只有会长和部长级别的会员才能修改海报");
        }
    }

    public function update() {
        $aid = $this->getInputAid();
        $poster = $this->getPoster($aid);
        if (!(A('Club')->isManager($poster['gid']))) {
            $this->assign('jumpUrl', "/");
            $this->error("抱歉，只有会长和部长级别的会员才能修改海报");
        }

        $fields = ['name','place','description'];
		foreach ($fields as $field) {
            if($field=='description'){
			$poster[$field]=xss_clean($_POST[$field]);//防止xss攻击
			}
			else $poster[$field] = htmlspecialchars($_POST[$field]);
        }
        $image = $this->uploadPoster();
        if ($image)
            $poster['poster'] = $image;

        $poster['start_time'] = $this->parseTime($_POST['start_date'], $_POST['start_hour'], $_POST['start_minute']);
        $poster['end_time'] = $this->parseTime($_POST['end_date'], $_POST['end_hour'], $_POST['end_minute']);
        if ($poster['start_time'] >= $poster['end_time'])
            $this->error("开始时间必须早于结束时间，请返回检查");
		//For二维码
		$qrid=$this->_post('qrid');
		if($qrid!=0){
			M('Qr')->where(array('id'=>$qrid))->data(array('aid'=>$aid,'status'=>3,'status_time'=>time()))->save();
        }
		else{M('Qr')->where(array('aid'=>$aid))->data(array('aid'=>'','status'=>1,'status_time'=>time()))->save();}
		//For二维码
		M('Poster')->where(['aid'=>$aid])->save($poster);
        $this->assign('jumpUrl', "/Poster/singlePage?aid=$aid");
        $this->success("海报修改成功！");
    }

    private function uploadPoster() {
        import("ORG.Net.UploadFile");
        $upload = new UploadFile();
        $upload->maxSize = 8 * 1024 * 1024;
        $upload->allowExts = ['jpg', 'gif', 'png', 'jpeg'];
        $upload->savePath = './upload/poster/';
        $upload->saveRule = 'uniqid';

        import("ORG.Util.Image");
        $upload->thumb = true;
        $upload->thumbPath = './upload/poster/thumb/';
        $upload->thumbMaxWidth = '500,800';
        $upload->thumbMaxHeight = '2000,3200';
        $upload->thumbPrefix = 'thumb_,large_';

        if ($upload->upload()) {
            $info = $upload->getUploadFileInfo();
            return $info[0]["savename"];
        }
        return null;
    }

    private function parseTime($date, $hour = 0, $minute = 0, $second = 0) {
        $dates = explode('-', $date);
        $year = $dates[0];
        $month = $dates[1];
        $day = $dates[2];
        return mktime($hour, $minute, $second, $month, $day, $year);
    }

    public function delete() {
        $aid = $this->getInputAid();
        $poster = $this->getPoster($aid);
        if (A('Club')->isManager($poster['gid'])) {
            M('poster_comment')->where(['aid'=>$aid])->delete();
            M('Poster')->where(['aid'=>$aid])->delete();
			D('Club')->decPosterCount($poster['gid']);
            M('Qr')->where(array('$aid'=>$aid))->data(array('aid'=>'','status'=>1,'status_time'=>time()))->save();//For二维码
			$this->assign('jumpUrl', "/");
            $this->success("海报删除成功！");
        } else {
            $this->assign('jumpUrl', "/");
            $this->error("抱歉，只有会长和部长级别的会员才能删除海报");
        }
    }

    public function deleteComment() {
        $aid = $this->getInputAid();
        $poster = $this->getPoster($aid);
        $cid = $_REQUEST['cid'];
        if (! A('Club')->isManager($poster['gid'])) {
            $comment = M('poster_comment')->field('author')->find($cid);
            if ($comment['author'] != CURRENT_USER) {
                $this->error("您没有权限删除评论！");
                return;
            }
        }
        M('poster_comment')->where(['cid'=>$cid])->delete();
        $this->success('评论删除成功');
    }

    private function parseInput() {
        $start = is_numeric($_GET['start']) ? $_GET['start'] : 0;
        $num = is_numeric($_GET['num']) ? $_GET['num'] : 0;
        $cond = [];
        if (!empty($_GET['start_time'])) {
            $today_epoch = floor(time()/86400)*86400;
            switch ($_GET['start_time']) {
                case 'today': $cond[] = 'start_time BETWEEN ('.$today_epoch.','.($today_epoch+86400).')';break;
                case 'week': $cond[] = 'start_time BETWEEN ('.$today_epoch.','.($today_epoch+86400*7).')';break;
                case 'month': $cond[] = 'start_time BETWEEN ('.$today_epoch.','.($today_epoch+86400*30).')';break;
            }
        }
        if (!empty($_GET['publish_time'])) {
            $today_epoch = floor(time()/86400)*86400;
            switch ($_GET['publish_time']) {
                case 'today': $cond[] = 'publish_time BETWEEN ('.$today_epoch.','.($today_epoch+86400).')';break;
                case 'week': $cond[] = 'publish_time BETWEEN ('.$today_epoch.','.($today_epoch+86400*7).')';break;
                case 'month': $cond[] = 'publish_time BETWEEN ('.$today_epoch.' '.($today_epoch+86400*30).')';break;
            }
        }
        $order = "publish_time";
        if (!empty($_GET['order'])) {
            switch ($_GET['order']) {
                case 'new': $order = 'publish_time DESC'; break;
                case 'near': $order = 'end_time asc'; $cond[] = "end_time > '".time()."'"; break;
                case 'follow': 
                    $gid_result = M('User_group')->query("SELECT DISTINCT gid FROM ustc_user_group where uid = '".CURRENT_USER."'");
                    $gid_condition = "(";
                    foreach($gid_result as $v)
                    {
                        $gid_condition .=$v['gid'].",";
                    }
                    $gid_condition .= "-1)";
                    $cond[] = "gid IN $gid_condition";$order = 'publish_time DESC'; break;
                    //$cond[] = "EXISTS (SELECT * FROM ustc_user_group AS ug WHERE ug.uid = '".CURRENT_USER."' AND gid = ug.gid)"; break;
                case 'hot': $order = 'rate_total DESC'; $cond[] = "end_time > '".time()."'"; break;
            }
        }
        $keyword = isset($_GET['keyword']) ? $_GET['keyword'] : '';
        if(!empty($keyword))
        {
            $cond[] = "(name like '%$keyword%' or place like '%$keyword%' or description like '%$keyword%')";
        }
        $sid = isset($_GET['sid']) ? $_GET['sid'] : '';
        if(!empty($sid))
        {
            $cond[] = "(sid = $sid)";
        }
        return [$start, $num, implode(' AND ', $cond), $order];
    }

    public function ajaxGet() {
        list($start, $num, $cond, $order) = $this->parseInput();
		$posters = D('Poster')->getPoster($start, $num, $cond, $order);
        $elements = [];
        foreach ($posters as $poster)
            $elements[] = $this->poster2html($poster);
        echo json_encode($elements);
    }

    private function poster2html($poster) {
        return '<li class="hide"><div class="celldiv" itemscope itemtype="http://data-vocabulary.org/Event">'.
            ($poster->thumbUrl() ? '<img class="haibao" itemprop="photo" height="'.$poster->thumbHeight().'" id="poster-'.$poster->id().'" src="'.$poster->thumbUrl().'" onclick="loadComments('.$poster->id().')" />' : '').
            '<div class="detail"><div class="hot">'.
            '<span class="ding" id="ding-'.$poster->id().'"><span class="iconding"></span><span class="rate">'.$poster->getRate().'</span></span></div>'.
			'<meta itemprop="name" content="'.$poster->name().'" />'.
            /*		热度：<span class="rate">'.$poster->getRate().'</span>'.
                    '<span class="ding" id="ding-'.$poster->id().'">顶</span></div>'.
             */		'<p>时间: <time itemprop="startDate" datetime="2012-11-30T19:00-08:00">
                    '.$poster->humanDate().'</time><br>'.
            '<div itemprop="location">地点: '.$poster->place().'</div></p></div>'.
            '<div class="school">'.$poster->schoolName().
            '</div></div></li>';
    }

    public function reloadComments(){
        $this->loadComments();
    }

    public function loadComments() {
        $this->singlePage();
    }

    public function reply() {
        $aid = $this->getInputAid();
        if (CURRENT_USER == 0) {
            $this->assign('jumpUrl', "/User/login");
            $this->error("抱歉，您需要登录后才能评论。现在跳转到登录页面……");
        }
        D('Poster')->addCommentCount($aid);

        $comment = array(
                'aid' => $aid,
                'author' => CURRENT_USER,
                'time' => time(),
                'content' => nl2br(htmlspecialchars($_POST['content'])),
                );
        if ($comment['content'] == '')
            $this->error('评论内容不能为空');
        $obj = M('poster_comment');
        $obj->create($comment);
        $obj->add();
    }

    public function like() {
        $aid = $this->getInputAid();
        D('Poster')->addLike($aid);
    }

    public function singlePage() {
        $aid = $this->getInputAid();
        D('Poster')->addClick($aid);
        $poster = D('Poster')->getPosterById($aid);
        if (empty($poster))
            $this->error("海报不存在！");
		$poster->rate = $poster->getRate();
        $poster->school = $poster->schoolName();
        $poster->name = $poster->name();
        $poster->humanDate = $poster->humanDate();
        $poster->start_time1 = date('c',$poster->start_time);
        $poster->end_time1 = date('c',$poster->end_time);
        $poster->thumbPoster = $poster->thumbUrl();
        $poster->largePoster = $poster->thumbUrl(true);
        $poster->origPoster = $poster->origPosterUrl();
        $poster->canModify = $poster->canModify();
        $poster->clubName = $poster->clubName();
        //dump($poster);
		$this->assign('poster', $poster->toArray());
		//dump($poster->toArray());
        $comments = M('poster_comment')->where(['aid'=>$aid])->order("time DESC")->select();
        foreach ($comments as &$comment) {
            $comment['canModify'] = $poster->canModify || ($comment['author'] == CURRENT_USER);
            // rewrite author!
            $comment['author'] = D('User')->getInfo($comment['author']);
        }
        unset($comment);
        $this->assign('comments', $comments);
        $this->display();
    }

    private function getInputGid() {
        if (!is_numeric($_REQUEST['gid'])) {
            $this->error("您所查找的社团不存在");
        }
        return $_REQUEST['gid'];
    }

    private function getInputUid() {
        if (!is_numeric($_REQUEST['uid'])) {
            $this->error("您所查找的用户不存在");
        }
        return $_REQUEST['uid'];
    }

    private function getInputAid() {
        if (!is_numeric($_REQUEST['aid'])) {
            $this->error("您所查找的海报不存在");
        }
        return $_REQUEST['aid'];
    }

    private function getPoster($aid) {
        $poster = M('Poster')->find($aid);
        if (empty($poster))
            $this->error("您所查找的海报不存在");
        return $poster;
    }
}
?>
