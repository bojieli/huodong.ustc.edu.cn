<?php
class PosterModel extends AttachmentModel {
	public function getPoster($start, $num, $cond = []) {
		return M('Act')->where($cond)->limit("$start,$num")->cast(__CLASS__)->select();
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

	public function getRate() {
		return $this->rate_total * 10 + $this->clicks;
	}

	public function humanDate() {
		return date("Y-m-d H:i", $this->start_time). ' ~ '. date("H:i", $this->end_time);
	}

	public function schoolName() {
		return D('group')->schoolName($this->gid);
	}

	public function clubName() {
		$club = M('group')->field('name')->find($this->gid);
		return $club['name'];
	}

	public function url() {
		return 'http://fmn.rrimg.com/fmn061/xiaozhan/20120514/2015/x_large_bbbB_09b000001cee1263.jpg';
	}

	public function updateClick() {
		$this->clicks++;
		$this->save();
	}

	public function updateRate($rate) {
		$this->rate_total += $rate;
		$this->rate_count++;
		$this->save();
	}

	public function get_stat() {
		$stat['total'] = $this->result_first("SELECT COUNT(*) FROM ustc_act");
		$stat['followed'] = $this->result_first("SELECT COUNT(*) FROM ustc_act AS a, ustc_user_group AS ug WHERE ug.uid = '".CURRENT_USER."' AND ug.gid = a.gid");
		$stat['newmsg'] = D('Notify')->msgCount();
		return $stat;
	}
}
