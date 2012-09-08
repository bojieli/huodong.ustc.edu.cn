<?php
class PosterAction extends PublicAction {
	public function index() {
		$this->headnav();
		$this->assign('stat', D('Poster')->get_stat());
		$this->display();
	}

	public function add() {
		$gid = $this->getInputGid();
		if (A('Club')->isManager(CURRENT_USER, $gid)) {
			$this->assign('gid', $gid);
			$this->display();
		} else {
			$this->assign('jumpUrl', "/");
			$this->error("抱歉，只有会长和部长级别的会员才能发布海报");
		}
	}

	public function insert() {
		$gid = $this->getInputGid();

		if (!(A('Club')->isManager(CURRENT_USER, $gid))) {
			$this->assign('jumpUrl', "/");
			$this->error("抱歉，只有会长和部长级别的会员才能发布海报");
		}

		import("ORG.Net.UploadFile");
		$upload = new UploadFile();
		$upload->maxSize = 8 * 1024 * 1024;
		$upload->allowExts = ['jpg', 'gif', 'png', 'jpeg'];
		$upload->savePath = './upload/poster/';
		$upload->saveRule = 'uniqid';
		
		import("ORG.Util.Image");
		$upload->thumb = true;
		$upload->thumbPath = './upload/poster/thumb/';
		$upload->thumbMaxWidth = 250;
		$upload->thumbMaxHeight = 1000;

		if (!$upload->upload()) {
			$this->error($upload->getErrorMsg());
		} else {
			$info = $upload->getUploadFileInfo();
		}
		$poster['poster'] = $info[0]["savename"];

		$poster['gid'] = $gid;
		$poster['author'] = CURRENT_USER;
		$poster['publish_time'] = time();

		$fields = ['name','start_time','end_time','place','description'];
		foreach ($fields as $field) {
			$poster[$field] = htmlspecialchars($_POST[$field]);
		}

		$obj = M('Poster');
		$obj->create($poster);
		$obj->add();

		$this->assign('jumpUrl', "/");
		$this->success("海报发布成功！");
	}

	public function modify() {
		$aid = $this->getInputAid();
		$poster = $this->getPoster($aid);
		if (A('Club')->isManager(CURRENT_USER, $poster['gid'])) {
			$this->assign('poster', $poster);
			$this->display();
		} else {
			$this->assign('jumpUrl', "/");
			$this->error("抱歉，只有会长和部长级别的会员才能修改海报");
		}
	}

	public function update() {
		$aid = $this->getInputAid();
		$poster = $this->getPoster($aid);
		if (!(A('Club')->isManager(CURRENT_USER, $poster['gid']))) {
			$this->assign('jumpUrl', "/");
			$this->error("抱歉，只有会长和部长级别的会员才能修改海报");
		}

		import("ORG.Net.UploadFile");
		$upload = new UploadFile();
		$upload->maxSize = 8 * 1024 * 1024;
		$upload->allowExts = ['jpg', 'gif', 'png', 'jpeg'];
		$upload->savePath = './upload/poster/';
		$upload->saveRule = 'uniqid';
		
		import("ORG.Util.Image");
		$upload->thumb = true;
		$upload->thumbPath = './upload/poster/thumb/';
		$upload->thumbMaxWidth = 250;
		$upload->thumbMaxHeight = 1000;

		if ($upload->upload()) { // reupload poster
			$info = $upload->getUploadFileInfo();
			$poster['poster'] = $info[0]["savename"];
		}

		$fields = ['name','start_time','end_time','place','description'];
		foreach ($fields as $field) {
			$poster[$field] = htmlspecialchars($_POST[$field]);
		}
		M('Poster')->where(['aid'=>$aid])->save($poster);

		$this->assign('jumpUrl', "/Poster/singlePage?aid=$aid");
		$this->success("海报修改成功！");
	}

	public function delete() {
		$aid = $this->getInputAid();
		$poster = $this->getPoster($aid);
		if (A('Club')->isManager(CURRENT_USER, $poster['gid'])) {
			M('Poster')->where(['aid'=>$aid])->delete();
			$this->assign('jumpUrl', "/");
			$this->success("海报删除成功！");
		} else {
			$this->assign('jumpUrl', "/");
			$this->error("抱歉，只有会长和部长级别的会员才能删除海报");
		}
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
			case 'new': $order = 'publish_time'; break;
			case 'near': $order = 'start_time DESC'; $cond[] = 'start_time > '.time(); break;
			case 'follow': $cond[] = "EXISTS (SELECT * FROM ustc_user_group AS ug WHERE ug.uid = '".CURRENT_USER."' AND gid = ug.gid)"; break;
			}
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
		return '<li class="hide"><div class="celldiv">'.
		'<p class="heading" style="text-align:center">['.$poster->clubName().']&nbsp;'.$poster->name().'</p>'.
		($poster->thumbUrl() ? '<img class="haibao" height="'.$poster->thumbHeight().'" id="poster-'.$poster->id().'" src="'.$poster->thumbUrl().'" onclick="loadComments('.$poster->id().')" />' : '').
		'<div class="detail"><div class="hot">热度：<span class="rate">'.$poster->getRate().'</span>'.
		'<span class="ding" id="ding-'.$poster->id().'">顶</span></div>'.
		'<p>时间: '.$poster->humanDate().'<br>'.
		'地点: '.$poster->place().'</p></div>'.
		'<div class="school">'.$poster->schoolName().
		'</div></div></li>';
	}

	public function loadComments() {
		$aid = $this->getInputAid();
		$poster['clicks']++;
		M('Poster')->where(['aid'=>$aid])->save($poster);
		$poster = D('Poster')->getPosterById($aid);
		$poster->rate = $poster->getRate();
		$poster->school = $poster->schoolName();
		$poster->name = $poster->name();
		$poster->humanDate = $poster->humanDate();
		$poster->poster = $poster->posterUrl();
		$poster->canModify = $poster->canModify();
		$poster->clubName = $poster->clubName();
		$this->assign('poster', $poster->toArray());
		$comments = M('poster_comment')->where(['aid'=>$aid])->order("time DESC")->select();
		foreach ($comments as &$comment) {
			$comment['author'] = D('User')->getInfo($comment['author']);
		}
		unset($comment);
		$this->assign('comments', $comments);
		$this->display();
	}

	public function reply() {
		$aid = $this->getInputAid();
		if (CURRENT_USER == 0) {
			$this->assign('jumpUrl', "/User/login");
			$this->error("抱歉，您需要登录后才能评论。现在跳转到登录页面……");
		}
		$poster = $this->getPoster($aid);
		$poster['comment_count']++;
		M('Poster')->where(['aid'=>$aid])->save($poster);
		
		$comment = array(
			'aid' => $aid,
			'author' => CURRENT_USER,
			'time' => time(),
			'content' => nl2br(htmlspecialchars($_POST['content'])),
		);
		$obj = M('poster_comment');
		$obj->create($comment);
		$obj->add();
	}

	public function like() {
		$aid = $this->getInputAid();
		$poster = $this->getPoster($aid);
		$poster['likes']++;
		M('Poster')->where(['aid'=>$aid])->save($poster);
	}

	public function singlePage() {
		$m = D('Poster');
		$this->loadComments();
	}

	private function getInputGid() {
		if (!is_numeric($_GET['gid'])) {
			$this->error("您所查找的社团不存在");
		}
		return $_GET['gid'];
	}

	private function getInputUid() {
		if (!is_numeric($_GET['uid'])) {
			$this->error("您所查找的用户不存在");
		}
		return $_GET['uid'];
	}

	private function getInputAid() {
		if (!is_numeric($_GET['aid'])) {
			$this->error("您所查找的海报不存在");
		}
		return $_GET['aid'];
	}

	private function getPoster($aid) {
		$poster = M('Poster')->find($aid);
		if (empty($poster))
			$this->error("您所查找的海报不存在");
		return $poster;
	}
}
?>
