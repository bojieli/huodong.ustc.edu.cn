<?php
D("Attachment");

class PosterModel extends AttachmentModel {
	public function getPoster($start, $num, $cond = []) {
		return M('Poster')->where($cond)->limit($start, $num)->select();
	}

	public function id() {
		return $this->aid;
	}

	public function getRate() {
		return $this->rate_total * 10 + $this->clicks;
	}

	public function humanDate() {
		return date("Y-m-d H:i", $this->start_time);
	}

	public function schoolName() {
		return D('group')->find($this->gid)->schoolName();
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
		$stat['total'] = $this->count();
		$stat['followed'] = $this->where("EXISTS (SELECT * FROM ustc_follow_org AS f WHERE f.uid = '".CURRENT_USER."' AND gid = f.gid)")->count();
		$stat['newmsg'] = D('Notify')->msgCount();
	}
}
