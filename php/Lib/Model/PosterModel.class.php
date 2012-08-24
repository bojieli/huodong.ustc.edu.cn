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
		return $this->rate * 10 + $this->clicks;
	}

	public function humanDate() {
		return date("Y-m-d H:i", $this->start_time);
	}

	public function schoolName() {
		return D('group')->find($this->gid)->schoolName();
	}
}
