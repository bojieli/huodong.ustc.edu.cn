<?php
class PosterModel extends Model {
	public function getPoster($start, $num, $cond = []) {
		return M('Poster')->where($cond)->limit("$start,$num")->cast(__CLASS__)->select();
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
		return $info['height'];
	}

	public function origPosterUrl() {
		if (empty($this->poster))
			return '';
		return "/upload/poster/".$this->poster;
	}

	public function get_stat() {
		$stat['total'] = $this->result_first("SELECT COUNT(*) FROM ustc_poster");
		$stat['incoming'] = $this->result_first("SELECT COUNT(*) FROM ustc_poster WHERE end_time > '".time()."'");
		$stat['followed'] = $this->result_first("SELECT COUNT(*) FROM ustc_poster AS a, ustc_user_group AS ug WHERE ug.uid = '".CURRENT_USER."' AND ug.gid = a.gid");
		$stat['newmsg'] = 0;
		return $stat;
	}

	public function getRate() {
		return $this->calcRate($this->clicks, $this->likes, $this->comment_count);
	}

	public function calcRate($clicks, $likes, $comment_count) {
		return $likes * 5 + $clicks + $comment_count * 10;
	}

	public function toArray() {
		return (array)($this->data);
	}

	public function canModify() {
		return A('Club')->isManager($this->gid);
	}
}
