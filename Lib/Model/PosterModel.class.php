<?php
class PosterModel extends Model {
	public function getPoster($start, $num, $cond = [], $order = '') {
		return M('Poster')->where($cond)->order($order)->limit("$start,$num")->cast(__CLASS__)->select();
	}

	public function getPosterById($aid) {
		return M('Poster')->cast(__CLASS__)->find($aid);
	}


	public function id() {
		return $this->aid;
	}

	public function name() {
		return $this->name;
	}

	public function place() {
		return $this->place;
	}

	public function humanDate() {
		$str = date("n月j日H:i", $this->start_time);
		$str .= ' - ';
		// if in the same day
		if (date("Y-m-d", $this->start_time) == date("Y-m-d", $this->end_time))
			$str .= date("H:i", $this->end_time);
		else
			$str .= date("n月j日H:i", $this->end_time);
		return $str;
	}

	public function schoolName() {
		return D('Club')->schoolName($this->gid);
	}

	public function clubName() {
		$club = M('Club')->field('name')->find($this->gid);
		return $club['name'];
	}

	public function thumbUrl($large = false) {
		if (empty($this->poster))
			return '';
		if ($large) {
			$url = "/upload/poster/thumb/large_".$this->poster;
			if (file_exists('.'.$url))
				return $url;
		}
		return "/upload/poster/thumb/thumb_".$this->poster;
	}

	public function thumbHeight($large = false) {
		import("ORG.Util.Image");
		$info = Image::getImageInfo('.'.$this->thumbUrl($large));
		if (!$large) {
			// width 250 => width 500
			if ($info['width'] <= 250)
				return $info['height'];
			else if ($info['width'] <= 500)
				return ceil($info['height'] * 250 / $info['width']);
			else
				return ceil($info['height'] / 2);
		}
		else
			return $info['height'];
	}

	public function origPosterUrl() {
		if (empty($this->poster))
			return '';
		return "/upload/poster/".$this->poster;
	}

	public function get_stat($condition='') {
		if(empty($condition))
		{
			$condition1 = "";
			$condition2= "";
		}
		else
		{
			$condition1 = " where ".$condition;
			$condition2= " and ".$condition;
		}
		$stat['total'] = $this->result_first("SELECT COUNT(*) FROM ustc_poster".$condition1);
		$stat['incoming'] = $this->result_first("SELECT COUNT(*) FROM ustc_poster WHERE end_time > '".time()."'".$condition2);
		$stat['followed'] = $this->result_first("SELECT COUNT(*) FROM ustc_poster AS a, ustc_user_group AS ug WHERE ug.uid = '".CURRENT_USER."' AND ug.gid = a.gid".$condition2);
		$stat['newmsg'] = 0;
		return $stat;
	}

	public function getRate($aid = null) {
		if (empty($aid))
			return $this->rate_total;
		else {
			$poster = $this->field('rate_total')->find($aid);
			return $poster['rate_total'];
		}
	}

	public function addCommentCount($aid) {
		if (!is_numeric($aid))
			return;
		M()->execute("UPDATE ustc_poster SET comment_count = comment_count+1 WHERE `aid`='$aid'");
		$this->updateRate($aid, 10);
	}

	public function addLike($aid) {
		if (!is_numeric($aid))
			return;
		M()->execute("UPDATE ustc_poster SET likes = likes+1 WHERE `aid`='$aid'");
		$this->updateRate($aid, 5);
	}

	public function addClick($aid) {
		if (!is_numeric($aid))
			return;
		M()->execute("UPDATE ustc_poster SET clicks = clicks+1 WHERE `aid`='$aid'");
		$this->updateRate($aid, 1);
	}

	private function updateRate($aid, $delta) {
		if (!is_numeric($aid) || !is_numeric($delta))
			return;
		M()->execute("UPDATE ustc_poster SET rate_total = rate_total + ($delta) WHERE `aid`='$aid'");
	}

	public function toArray() {
		return (array)($this->data);
	}

	public function canModify() {
		return A('Club')->isManager($this->gid);
	}
}
