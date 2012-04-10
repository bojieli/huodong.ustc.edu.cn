<?php
// include/class_error.php 2011-07-25 boj
// system error processing

if(!defined('IN_GEWU')) {
	exit(header('403 Forbidden'));
}

class error {

	function system_error($message, $show = true, $save = true, $halt = true) {
		if(!empty($message)) {
			$message = 'Gewu Error : '. $message;
		} else {
			$message = 'Gewu Unknown Error';
		}

		list($showtrace, $logtrace) = error::debug_backtrace();

		if($save) {
			$messagesave = '<b>'.$message.'</b><br><b>PHP:</b>'.$logtrace;
			error::write_error_log($messagesave);
		}

		if($show) {
			if(!defined('IN_MOBILE')) {
				error::show_error('system', "<li>$message</li>", $showtrace, error::query_log());
			} else {
				error::mobile_show_error('system', "<li>$message</li>", $showtrace, 0);
			}
		}

		if($halt) {
			exit();
		} else {
			return $message;
		}
	}

	function template_error($message, $tplname) {
		$message = 'Template Not Found';
		$tplname = str_replace(GEWU_ROOT, '', $tplname);
		$message = $message.': '.$tplname;
		error::system_error($message);
	}

	function debug_backtrace() {
		$skipfunc[] = 'error->debug_backtrace';
		$skipfunc[] = 'error->db_error';
		$skipfunc[] = 'error->template_error';
		$skipfunc[] = 'error->system_error';
		$skipfunc[] = 'db_mysql->halt';
		$skipfunc[] = 'db_mysql->query';
		$skipfunc[] = 'DB::_execute';

		$show = $log = '';
		$debug_backtrace = debug_backtrace();
		krsort($debug_backtrace);
		foreach ($debug_backtrace as $k => $error) {
			$file = str_replace(GEWU_ROOT, '', $error['file']);
			$func = isset($error['class']) ? $error['class'] : '';
			$func .= isset($error['type']) ? $error['type'] : '';
			$func .= isset($error['function']) ? $error['function'] : '';
			if(in_array($func, $skipfunc)) {
				break;
			}
			$error['line'] = sprintf('%04d', $error['line']);

			$show .= "<li>[Line: ".$error['line']."] ".$file." ($func)</li>";
			$log .= !empty($log) ? ' -> ' : '';$file.':'.$error['line'];
			$log .= $file.':'.$error['line'];
		}
		return array($show, $log);
	}
	
	function query_log() {
		global $db;
		$querylog = '';
		$queries = $db->query_log();
		foreach ($queries as $query) {
			$querylog .= '<li>'.$query.'</li>';
		}
		return $querylog;
	}	
	
	function db_error($message, $sql) {
		global $_G;
		global $db;

		list($showtrace, $logtrace) = error::debug_backtrace();

		$title = 'Gewu Database Error';
		$title_msg = 'Error Message';
		$title_sql = 'Database Query SQL';
		$title_backtrace = '<b>Backtrace</b>: $backtrace<br />';
		$title_help = 'Click Here to find help';

		global $db;
		$dberrno = $db->errno();
		$dberror = str_replace($db->tablepre,  '', $db->error());
		$sql = htmlspecialchars(str_replace($db->tablepre,  '', $sql));

		$msg = '<li>[Type] '.$title.'</li>';
		$msg .= $dberrno ? '<li>['.$dberrno.'] '.$dberror.'</li>' : '';
		$msg .= $sql ? '<li>[Query] '.$sql.'</li>' : '';

		error::show_error('db', $msg, $showtrace, error::query_log());
		unset($msg, $phperror);

		$errormsg = '<b>'.$title.'</b>';
		$errormsg .= "[$dberrno]<br /><b>ERR:</b> $dberror<br />";
		if($sql) {
			$errormsg .= '<b>SQL:</b> '.$sql;
		}
		$errormsg .= "<br />";
		$errormsg .= '<b>PHP:</b> '.$logtrace;

		error::write_error_log($errormsg);
		exit();

	}

	function show_error($type, $errormsg, $phpmsg = '', $querylog = '') {
		global $_G;

		ob_end_clean();
		$gzip = getglobal('gzipcompress');
		ob_start($gzip ? 'ob_gzhandler' : null);

		$host = $_SERVER['HTTP_HOST'];
		$phpmsg = trim($phpmsg);
		$title = $type == 'db' ? 'Database' : 'System';
		echo <<<EOT
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>$host - $title Error</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="ROBOTS" content="NOINDEX,NOFOLLOW,NOARCHIVE" />
	<style type="text/css">
	<!--
	body { background-color: white; color: black; }
	#container { width: 650px; }
	#message   { width: 650px; color: black; background-color: #FFFFCC; }
	#bodytitle { font: 24px verdana, arial, sans-serif; height: 35px; vertical-align: top; }
	.bodytext  { font: 14px verdana, arial, sans-serif; }
	.help  { font: 16px verdana, arial, sans-serif; color: red;}
	.red  {color: red;}
	a:link     { font: 14px verdana, arial, sans-serif; color: red; }
	a:visited  { font: 14px verdana, arial, sans-serif; color: #4e4e4e; }
	-->
	</style>
</head>
<body>
<table cellpadding="1" cellspacing="5" id="container">
<tr>
	<td id="bodytitle" width="100%">Gewu $title Error </td>
</tr>
EOT;

		if($type == 'db') {
			echo <<<EOT
<tr>
	<td class="bodytext">The database has encountered a problem.</td>
</tr>
EOT;
		} else {
			echo <<<EOT
<tr>
	<td class="bodytext">Your request has encountered a problem. </td>
</tr>
EOT;
		}

		echo <<<EOT
<tr><td><hr size="1"/></td></tr>
<tr><td class="bodytext">Error messages: </td></tr>
<tr>
	<td class="bodytext" id="message">
		<ul> $errormsg</ul>
	</td>
</tr>
EOT;

		if(!empty($phpmsg)) {
			echo <<<EOT
<tr><td class="bodytext">&nbsp;</td></tr>
<tr><td class="bodytext">Program messages: </td></tr>
<tr>
	<td class="bodytext">
		<ul> $phpmsg </ul>
	</td>
</tr>
EOT;
		}

		if(!empty($querylog)) {
			echo <<<EOT
<tr><td class="bodytext">&nbsp;</td></tr>
<tr><td class="bodytext">Database Query Log: </td></tr>

<tr>
	<td class="bodytext">
		<ul> $querylog </ul>
	</td>
</tr>

EOT;
		}
		
		$endmsg = "<a href=\"http://$host\">$host</a>";
		echo <<<EOT
<tr>
	<td class="help"><br /><br />$endmsg</td>
</tr>
</table>
</body>
</html>
EOT;
		exit();

	}

	function mobile_show_error($type, $errormsg, $phpmsg) {
		global $_G;

		ob_end_clean();
		ob_start();

		$host = $_SERVER['HTTP_HOST'];
		$phpmsg = trim($phpmsg);
		$title = 'Mobile '.($type == 'db' ? 'Database' : 'System');
		echo <<<EOT
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html>
<head>
	<title>$host - $title Error</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="ROBOTS" content="NOINDEX,NOFOLLOW,NOARCHIVE" />
	<style type="text/css">
	<!--
	body { background-color: white; color: black; }
	UL, LI { margin: 0; padding: 2px; list-style: none; }
	#message   { color: black; background-color: #FFFFCC; }
	#bodytitle { font: 11pt/13pt verdana, arial, sans-serif; height: 20px; vertical-align: top; }
	.bodytext  { font: 8pt/11pt verdana, arial, sans-serif; }
	.help  { font: 12px verdana, arial, sans-serif; color: red;}
	.red  {color: red;}
	a:link     { font: 8pt/11pt verdana, arial, sans-serif; color: red; }
	a:visited  { font: 8pt/11pt verdana, arial, sans-serif; color: #4e4e4e; }
	-->
	</style>
</head>
<body>
<table cellpadding="1" cellspacing="1" id="container">
<tr>
	<td id="bodytitle" width="100%">GEWU! $title Error </td>
</tr>
EOT;

		echo <<<EOT
<tr><td><hr size="1"/></td></tr>
<tr><td class="bodytext">Error messages: </td></tr>
<tr>
	<td class="bodytext" id="message">
		<ul> $errormsg</ul>
	</td>
</tr>
EOT;
		if(!empty($phpmsg)  && $type == 'db') {
			echo <<<EOT
<tr><td class="bodytext">&nbsp;</td></tr>
<tr><td class="bodytext">Program messages: </td></tr>
<tr>
	<td class="bodytext">
		<ul> $phpmsg </ul>
	</td>
</tr>
EOT;
		}
		$endmsg = "<a href=\"http://$host\">$host</a>";
		echo <<<EOT
<tr>
	<td class="help"><br />$endmsg</td>
</tr>
</table>
</body>
</html>
EOT;
		exit();
	}

	function clear($message) {
		return str_replace(array("\t", "\r", "\n"), " ", $message);
	}

	function write_error_log($message) {

		$message = error::clear($message);
		$time = time();
		$file = GEWU_ROOT.'/data/log/'.date("Ym").'_errorlog.php';
		$hash = md5($message);

		$uid = getglobal('uid');
		$ip = getglobal('clientip');

		$user = '<b>User:</b> uid='.intval($uid).'; IP='.$ip.'; RIP:'.$_SERVER['REMOTE_ADDR'];
		$uri = 'Request: '.htmlspecialchars(error::clear($_SERVER['REQUEST_URI']));
		$message = "<?PHP exit;?>\t{$time}\t$message\t$hash\t$user $uri\n";
		if($fp = @fopen($file, 'rb')) {
			$lastlen = 10000;
			$maxtime = 60 * 10;
			$offset = filesize($file) - $lastlen;
			if($offset > 0) {
				fseek($fp, $offset);
			}
			if($data = fread($fp, $lastlen)) {
				$array = explode("\n", $data);
				if(is_array($array)) foreach($array as $key => $val) {
					$row = explode("\t", $val);
					if($row[0] != '<?PHP exit;?>') continue;
					if($row[3] == $hash && ($row[1] > $time - $maxtime)) {
						return;
					}
				}
			}
		}
		error_log($message, 3, $file);
	}

}
?>
