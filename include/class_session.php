<?php
// include/class_session.php 2011-07-10 boj
// an alternative for $_SESSION superglobals (stored in database)

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

class session {

	function session($sid = '', $ip = '', $uid = 0) {
		global $_G;
		
		$var = $_G['cookie']['cookiepre'].'sid';
		if (isset($_COOKIE[$var])) {
			$session = session::get($_COOKIE[$var], CURRENT_IP);
			if (empty($session)) { // invalid session: regenerate
				define('CURRENT_USER', 0);
				define('CURRENT_EUID', 0);
				session::create(0);
			} else {
				$user = $session['uid'];
				$euid = $session['euid'];

				// su
				if (!empty($_GET['su']) && is_numeric($_GET['su'])) {
					if (group::isadmin($euid, '/')) {
						define('CURRENT_USER', $_GET['su']);
						define('CURRENT_EUID', $euid);
						session::setuid($_COOKIE[$var], CURRENT_IP, $_GET['su']);
					}
				}
				// sudo
				elseif (!empty($_GET['sudo']) && is_numeric($_GET['sudo'])) {
					if (group::isadmin($euid, '/')) {
						define('CURRENT_USER', $_GET['sudo']);
						define('CURRENT_EUID', $euid);
					}
				}

				// common
				if (!defined('CURRENT_USER')) {
					define('CURRENT_USER', $user);
					define('CURRENT_EUID', $euid);
				}
			}
			session::update($_COOKIE[$var], CURRENT_IP);
		} 
		else { // first access, create a guest session
			define('CURRENT_USER', 0);
			define('CURRENT_EUID', 0);
			session::create(0);
		} 
	}
	
	function get($sid, $ip) {
		return DB::fetch_first("SELECT `uid`,`euid` FROM common_session WHERE `sid` = '$sid' AND `ip` = '$ip'");
	}

	function getuid($sid, $ip) {
		return DB::result_first("SELECT `uid` FROM common_session WHERE `sid` = '$sid' AND `ip` = '$ip'");
	}
	
	function geteuid($sid, $ip) {
		return DB::result_first("SELECT `euid` FROM common_session WHERE `sid` = '$sid' AND `ip` = '$ip'");
	}

	function setuid($sid, $ip, $setuid) {
		return DB::query("UPDATE common_session SET `uid` = '$setuid' WHERE `sid` = '$sid' AND `ip` = '$ip'");
	}

	// update online activity
	function update($sid, $ip) {
		DB::query("UPDATE common_session SET `last_activity` = '".CURRENT_TIMESTAMP."' WHERE `sid` = '$sid' AND `ip` = '$ip'");
	}
	
	// create a new session
	function create($uid) {
		$sid = random(10);
		$ip = CURRENT_IP;
		$time = CURRENT_TIMESTAMP;
		DB::query("INSERT INTO common_session (`sid`, `ip`, `uid`, `euid`, `last_activity`) VALUES ('$sid', '$ip', '$uid', '$uid', '$time')");
		gsetcookie('sid', $sid, 86400);
		session::clean(); // while creating new session, clean unused sessions
	}
	
	// destroy current session
	function destroy() {
		global $_G;
		$sid = $_COOKIE[$_G['cookie']['cookiepre'].'sid'];
		$ip = CURRENT_IP;
		DB::query("DELETE FROM common_session WHERE `sid` = '$sid' AND `ip` = '$ip'");
	}
	
	// clean unused session
	function clean() {
		$expiry_time = 1800;
		$min_last_activity = CURRENT_TIMESTAMP - $expiry_time;
		
		// update user login status
		$users = DB::fetch_all("SELECT uid FROM common_session WHERE `last_activity` < '$min_last_activity' AND `uid` > '0'");
		foreach ($users as $user) {
			DB::query("UPDATE common_user SET `status` = '0' WHERE `uid` = '$user' AND `status` = '1'");
		}
		
		// delete session
		DB::query("DELETE FROM common_session WHERE `last_activity` < '$min_last_activity'");
	}
	
	function onlinecount($type = 0) {
		$condition = $type == 1 ? ' WHERE uid>0 ' : ($type == 2 ? ' WHERE invisible=1 ' : '');
		return DB::result_first("SELECT count(*) FROM common_session".$condition);
	}

}
?>
