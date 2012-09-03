<?php
class PosterAction extends PublicAction {
	public function index() {
		$this->headnav();
		$this->assign('stat', D('Poster')->get_stat());
		$this->display();
	}

	public function add() {
		$gid = is_numeric($_GET['gid']) ? $_GET['gid'] : exit();
		if (A('Club')->isManager(CURRENT_USER, $gid)) {
			$this->assign('gid', $gid);
			$this->display();
		} else {
			die("Only manager and admin can upload posters");
		}
	}

	public function insert() {
		$gid = is_numeric($_POST['gid']) ? $_POST['gid'] : exit();
		if (A('Club')->isManager(CURRENT_USER, $gid)) {
			$poster['gid'] = $gid;
			$poster['author'] = CURRENT_USER;
			$poster['publish_time'] = time();

			$fields = ['name','start_time','end_time','place','poster','description'];
			foreach ($fields as $field) {
				$poster[$field] = $_POST[$field];
			}

			$obj = M('Act');
			$obj->create($poster);
			$obj->add();
		}
		echo "<script>window.location='/';</script>";
	}

	public function modify() {
		if (!is_numeric($_GET['aid']))
			exit();
		$aid = $_GET['aid'];
		$poster = M('Act')->find($aid);
		if (A('Club')->isManager(CURRENT_USER, $poster['gid'])) {
			$this->assign('poster', $poster);
			$this->display();
		} else {
			die("Only manager and admin can modify posters");
		}
	}

	public function update() {
		if (!is_numeric($_POST['aid']))
			exit();
		$aid = $_POST['aid'];
		$poster = M('Act')->find($aid);
		if (A('Club')->isManager(CURRENT_USER, $poster['gid'])) {
			$fields = ['name','start_time','end_time','place','poster','description'];
			$poster = array();
			foreach ($fields as $field) {
				$poster[$field] = $_POST[$field];
			}
			M('Act')->where(['aid'=>$aid])->save($poster);
		}
		echo "<script>window.location='/';</script>";
	}

	public function delete() {
		if (!is_numeric($_GET['aid']))
			exit();
		$aid = $_GET['aid'];
		$poster = M('Act')->find($aid);
		if (A('Club')->isManager(CURRENT_USER, $poster['gid'])) {
			M('Act')->where(['aid'=>$aid])->delete();
		}
		echo "<script>window.location='/';</script>";
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
		'<img class="haibao" id="poster-'.$poster->id().'" height="'.$poster->imgHeight().'" src="'.$poster->url().'" onclick="loadComments('.$poster->id().')" />'.
		'<div class="detail"><div class="hot">热度：<span class="rate">'.$poster->getRate().'</span>'.
		'<span class="ding" id="ding-'.$poster->id().'">顶</span></div>'.
		'<p>时间：'.$poster->humanDate().'<br>'.
		'地点：'.$poster->place().'</p></div>'.
		'<div class="school">'.$poster->schoolName().
		'</div></div></li>';
	}

	public function loadComments() {
		$aid = is_numeric($_GET['aid']) ? $_GET['aid'] : exit();
		$poster = M('Act')->find($aid);
		if (empty($poster))
			exit();
		$poster['clicks']++;
		M('Act')->where(['aid'=>$aid])->save($poster);
		$poster = D('Poster')->getPosterById($aid);
		$poster->rate = $poster->getRate();
		$poster->school = $poster->schoolName();
		$poster->name = $poster->name();
		$poster->humanDate = $poster->humanDate();
		$this->assign('poster', $poster->toArray());
		$comments = M('act_comment')->where(['aid'=>$aid])->select();
		foreach ($comments as &$comment) {
			$comment['author'] = M('user')->find($comment['author']);
		}
		unset($comment);
		$this->assign('comments', $comments);
		$this->display();
	}

	public function reply() {
	}

	public function like() {
		$aid = is_numeric($_GET['aid']) ? $_GET['aid'] : exit();
		$poster = M('Act')->find($aid);
		if (empty($poster))
			exit();
		$poster['likes']++;
		M('Act')->where(['aid'=>$aid])->save($poster);
	}

	public function singlePage() {
		$m = D('Poster');
		$this->loadComments();
	}
}
?>
