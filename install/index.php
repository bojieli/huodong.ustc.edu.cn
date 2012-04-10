<?php
include "../config/config_db.php";
function runquery($sql) {
	global $db;

	if(!isset($sql) || empty($sql)) return;

	$sql = str_replace("\r\n", "\n", $sql);
	$ret = array();
	$num = 0;
	foreach(explode(";\n", trim($sql)) as $query) {
		$ret[$num] = $query;
		/*$ret[$num] = '';
		$queries = explode("\n", trim($query));
		foreach($queries as $query) {
			$ret[$num] .= (isset($query[0]) && $query[0] == '#') || (isset($query[1]) && isset($query[1]) && $query[0].$query[1] == '--') ? '' : $query;
		}*/
		$num++;
	}

	foreach($ret as $query) {
		mysql_query($query);
	}

}

function createtable($sql) {

	$type = strtoupper(preg_replace("/^\s*CREATE TABLE\s+.+\s+\(.+?\).*(ENGINE|TYPE)\s*=\s*([a-z]+?).*$/isU", "\\2", $sql));
	$type = in_array($type, array('MYISAM', 'HEAP', 'MEMORY')) ? $type : 'MYISAM';
	return preg_replace("/^\s*(CREATE TABLE\s+.+\s+\(.+?\)).*$/isU", "\\1", $sql).
	(mysql_get_server_info() > '4.1' ? " ENGINE=$type DEFAULT CHARSET=".DBCHARSET : " TYPE=$type");
}

define('DBCHARSET', 'UTF8');

$rs = mysql_connect($_config_db['dbhost'], $_config_db['dbuser'], $_config_db['dbpw']);
if (empty($rs)) {
	exit('Database Connection Failed : '.mysql_error());
}
if (!mysql_select_db($_config_db['dbname'])) {
	exit('Database not exist.');
}

$lockfilename = '../data/install.lock';
if (file_exists($lockfilename)) {
	exit("Gewu has been installed. Please backup data, delete $lockfilename and continue.");
}
fopen($lockfilename, 'w');

$sqlfilename = './install.sql';
$handle = fopen($sqlfilename, 'r');
if (empty($handle)) {
	exit('Cannot open SQL resource file');
}
$content = fread($handle, filesize($sqlfilename));
if (empty($content)) {
	exit('SQL resource file corrupted');
}
runquery($content);

// install initial data
$admin = 'boj';
$salt = '3ud2s092eu';
$password = md5(md5($admin).$salt);
$adminstr = serialize(array(1));
$memberstr = serialize(array('all'));
mysql_query("INSERT INTO common_user SET `login_name`='$admin', `password`='$password', `salt`='$salt'");
mysql_query("INSERT INTO common_object SET `path`='/', `parent`='/', `grandparent`='/', `class`='root', `priv`='755', `priv_group`='755', `admin`='$adminstr', `member`='$memberstr'");

exit('Installation Completed.');
?>
