<?php
D('User')->init();
D('Group');

class PublicAction extends Action {

	public function headnav() {
		$clubs = M()->query("SELECT g.gid, g.name FROM ustc_user_group AS ug, ustc_group AS g WHERE ug.uid = ".CURRENT_USER." AND ug.gid = g.gid");
		$this->assign('clublist', $clubs);
	}
}
