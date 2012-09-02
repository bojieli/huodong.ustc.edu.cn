<?php
class PosterAction extends PublicAction {
	public function index() {
		$this->headnav();
		$this->assign('stat', D('Poster')->get_stat());
		$this->display();
	}

	public function modify() {
	}

	public function reply() {
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
			case 'follow': $cond[] = "EXISTS (SELECT * FROM ustc_follow_org AS f WHERE f.uid = '".CURRENT_USER."' AND gid = f.gid)"; break;
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
		return '<li class="hide"><div class="celldiv"><img id="'.$poster->id().'" class="haibao" height="'.$poster->imgHeight().'" src="'.$poster->url().'"><div class="detail"><div class="hot">热度：'.$poster->getRate().'<span class="ding"><a>顶</a></span></div><p>时间：'.$poster->humanDate().'<br>地点：'.$poster->place.'</p></div><div class="school">'.$poster->schoolName().'</div></div></li>';
	}

	public function loadComments() {
		$m = D('Poster');
		$this->assign('pid', $_GET['pid']);
		$this->display();
	}

	public function singlePage() {
		$m = D('Poster');
		$this->assign('pid', $_GET['pid']);
		$this->display();
	}
}
?>
