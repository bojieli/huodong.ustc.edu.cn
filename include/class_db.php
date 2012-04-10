<?php
// include/class_db.php 2011-07-08 boj
// Database connections (for MySQL)

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

class db_mysql
{
	var $querynum = 0;
	var $curlink;
	var $link;
	var $config = array();
	var $querylog = array();

	// provide configurations on creating instance
	function db_mysql($config = array()) {
		$this->config = $config;
	}

	function connect() {

		if(empty($this->config)) {
			$this->halt('config_db_not_found');
		}

		$this->link = $this->_dbconnect(
			$this->config['dbhost'],
			$this->config['dbuser'],
			$this->config['dbpw'],
			$this->config['dbcharset'],
			$this->config['dbname'],
			$this->config['pconnect']
			);
		$this->curlink = $this->link;

	}

	function _dbconnect($dbhost, $dbuser, $dbpw, $dbcharset, $dbname, $pconnect) {
		$link = null;
		$func = empty($pconnect) ? 'mysql_connect' : 'mysql_pconnect';
		if(!$link = @$func($dbhost, $dbuser, $dbpw, 1)) {
			$this->halt('notconnect');
		} else {
			$this->curlink = $link;
			/*if($this->version() > '4.1') {
				$dbcharset = $dbcharset ? $dbcharset : $this->config['dbcharset'];
				$serverset = $dbcharset ? 'character_set_connection='.$dbcharset.', character_set_results='.$dbcharset.', character_set_client=binary' : '';
				$serverset .= $this->version() > '5.0.1' ? ((empty($serverset) ? '' : ',').'sql_mode=\'\'') : '';
				$serverset && mysql_query("SET $serverset", $link);
			}*/
			mysql_select_db($dbname, $link);
		}
		return $link;
	}

	function select_db($dbname) {
		return mysql_select_db($dbname, $this->curlink);
	}

	function fetch_array($query) {
		return mysql_fetch_array($query, MYSQL_ASSOC);
	}

	function fetch_first($sql) {
		return $this->fetch_array($this->query($sql));
	}
	
	function fetch_all($sql) {
		$result = array();
		$resource = $this->query($sql);
		while( $tmp = $this->fetch_array($resource) ) {
			$result[] = $tmp;
		}
		return $result;
	}
	
	function result_first($sql) {
		return $this->result($this->query($sql), 0);
	}

	function query($sql, $type = '') {

		$this->querylog[] = $sql;
		
		$func = $type == 'UNBUFFERED' && @function_exists('mysql_unbuffered_query') ?
		'mysql_unbuffered_query' : 'mysql_query';
		if(!($query = $func($sql, $this->curlink))) {
			if(in_array($this->errno(), array(2006, 2013)) && substr($type, 0, 5) != 'RETRY') {
				$this->connect();
				return $this->query($sql, 'RETRY'.$type);
			}
			if($type != 'SILENT' && substr($type, 5) != 'SILENT') {
				$this->halt('query_error', $sql);
			}
		}

		$this->querynum++;
		return $query;
	}

	function query_log() {
		return $this->querylog;
	}

	function query_num() {
		return $this->querynum;
	}

	function affected_rows() {
		return mysql_affected_rows($this->curlink);
	}

	function error() {
		return (($this->curlink) ? mysql_error($this->curlink) : mysql_error());
	}

	function errno() {
		return intval(($this->curlink) ? mysql_errno($this->curlink) : mysql_errno());
	}

	function result($query, $row = 0) {
		$query = @mysql_result($query, $row);
		return $query;
	}

	function num_rows($query) {
		$query = mysql_num_rows($query);
		return $query;
	}

	function num_fields($query) {
		return mysql_num_fields($query);
	}

	function free_result($query) {
		return mysql_free_result($query);
	}

	function insert_id() {
		return ($id = mysql_insert_id($this->curlink)) >= 0 ? $id : $this->result($this->query("SELECT last_insert_id()"), 0);
	}

	function fetch_row($query) {
		$query = mysql_fetch_row($query);
		return $query;
	}

	function fetch_fields($query) {
		return mysql_fetch_field($query);
	}

	function version() {
		if(empty($this->version)) {
			$this->version = mysql_get_server_info($this->curlink);
		}
		return $this->version;
	}

	function close() {
		return mysql_close($this->curlink);
	}

	function halt($message = '', $sql = '') {
		error::db_error($message, $sql);
	}

} // end class db_mysql

class DB
{
	// It seems that efficiency and functionality are to some extent in contradictory.
	// The original process is 
	//	DB::cmd -> DB::table, DB::query
	//	DB::table -> DB::execute
	//	DB::query -> DB::checkquery, DB::execute
	//	DB::execute -> $db->cmd($args) (class db_mysql)
	//	$db->cmd -> mysql_query()
	//
	// Since database query is a commonly used function, we reduce the process to
	//	DB::cmd -> $db->privilege, $db->cmd($args), where $db is a global db_mysql instance
	//      $db->cmd -> mysql_query()
	// with some loss of extensibility (tablename), security (checkquery) and gracefulness (single entry point of DB connection).
	//
	// In order to enforce privilege control (the core mechanism), direct SQL access is strictly prohibited.
	// Implementors should use delete, update, insert, select (fetch, fetch_first, result, result_first) instead.
	
	function init() {
		gdefine('NOT_ALLOWED', -1);
		gdefine('OBJECT_EXISTS', -2);
		gdefine('NOT_FOUND', -3);
		gdefine('QUERY_ERROR', -5);
		gdefine('SUCCESS', 1);
		gdefine('PARENT_UNDEFINED', -4);
	}
	
	function select($attributes = array(), $condition, $order = '', $limit = 0) {
		global $db;
		
		if (!empty($attributes)) { // prefetch privilege
			$attributes = array_merge($attributes, array('path', 'priv', 'admin', 'member'));
		}
		
		$common_attributes = array();
		$diy_attributes = array();
		DB::common_attribute_names($attributes, $common_attributes, $diy_attributes); // by reference
		
		if (empty($attributes)) {
			$attr = '*';
		} else {
			$attr = DB::implode_field($common_attributes);
		}
	
		$where = DB::cond2where($condition);

		if (!empty($order)) {
			$where .= ' ORDER BY '.$order;
		}
		if (!empty($limit)) {
			$where .= ' LIMIT '.$limit;
		}

		$result = $db->fetch_all("SELECT $attr FROM common_object WHERE $where");

		foreach ($result as $index => $rs) {
			unset($result[$index]['deleted']); // this is an internal sign

			$user_priv = get_priv($rs['priv'], $rs['admin'], $rs['member'], $rs['path']);
			if (!($user_priv & PRIV_READ)) {
				unset($result[$index]);
			} else {
				$curr_path = $result[$index]['path'];
				foreach ($diy_attributes as $attr) {
					$value = $db->result_first("SELECT value FROM common_attribute WHERE `path` = '$curr_path' AND `name` = '$attr'");
					if (!empty($value)) {
						$result[$index][$attr] = $value;
					}
				}
			}
		}
		return $result;
	}

	function cond2where($condition) {
		// lazy delete
		if(empty($condition)) {
			$where = '1';
		} elseif(is_array($condition)) {
			$where = DB::implode_field_value($condition, ' AND ');
		} else {
			$where = $condition;
		}
		$where .= " AND `deleted` = '0'";
		return $where;
	}

	function count($condition) {
		global $db;
		
		$where = DB::cond2where($condition);
		return $db->result_first("SELECT COUNT(*) FROM common_object WHERE $where");
	}
	
	function delete($path, $limit = 0, $unbuffered = true) {
		global $db;
		
		/*if(empty($condition)) {
			$where = '1';
		} elseif(is_array($condition)) {
			$where = DB::implode_field_value($condition, ' AND ');
		} else {
			$where = $condition;
		}
		$paths = $db->fetch_all("SELECT path FROM common_object WHERE $where ".($limit ? "LIMIT $limit" : '');
		foreach($paths as $path) {*/
			if (check_priv($path, PRIV_WRITE)) {
				$sql = "UPDATE common_object SET `deleted` = '1' WHERE `path` = '$path'";				
				$found = $db->query($sql, ($unbuffered ? 'UNBUFFERED' : ''));
				if (!$found) { return NOT_FOUND; }
				$sql = "DELETE FROM common_attribute WHERE `path` = '$path'";
				return $db->query($sql, ($unbuffered ? 'UNBUFFERED' : ''));
			}
			return false;
		/*}*/
	}

	function insert($data, $silent = false) {
		global $db;
		
		// path = parent/name
		if (!isset($data['parent'])) { // try to generate parent from path
			if (isset($data['path'])) {
				$data['parent'] = OBJ::get_parent($data['path']);
				$len = strlen($data['parent']);
				$data['name'] = substr($data['path'], $len+1);
			} else {
				return PARENT_UNDEFINED; // parent undefined
			}
		}
	
		// if parent object does not exist, try to create parent
		if (DB::count(array('path' => $data['parent'])) == 0) {
			DB::insert(array('path' => $data['parent']));
		}

		// check parent privilege
		if (!check_priv($data['parent'], PRIV_INSERT)) {
			return NOT_ALLOWED;
		}

		// if path undefined or illegal, generate it
		if (!isset($data['path'])) {
			if (empty($data['name']) || !isvarname($data['name'])) { // assign an auto-increment id as name
				$data['name'] = DB::get_next_child_id($data['parent']);
			}

			if ($data['parent'] != '/') {
				$data['path'] = $data['parent'].'/'.$data['name'];
			} else {
				$data['path'] = '/'.$data['name'];
			}
		}
		
		// if siteroot not set, inherit it from parent; if parent is not set, siteroot is itself
		if (empty($data['siteroot']) || $data['siteroot'] == '/') {
			$data['siteroot'] = DB::result_first("SELECT siteroot FROM common_object WHERE `path` = '".$data['parent']."'");
			if (empty($data['siteroot'])) {
				$data['siteroot'] = CURRENT_PATH;
			}
		}
		
		// if referer not set, set it to current path
		if (empty($data['referer'])) {
			$data['referer'] = CURRENT_PATH;
		}

		unset($data['deleted']); // this is an internal sign

		$count = $db->result_first("SELECT COUNT(*) FROM common_object WHERE `path` = '".$data['path']."' AND `deleted` = '0'");
		if ($count > 0) {
			return OBJECT_EXISTS;
		}
		
		// set grandparent and grandgrandparent
		$grandparents = DB::fetch_first("SELECT parent, grandparent FROM common_object WHERE `path` = '".$data['parent']."'");
		$data['grandparent'] = $grandparents['parent'];
		$data['grandgrandparent'] = $grandparents['grandparent'];
		
		// update parent insert time
		DB::query("UPDATE common_object SET `insert_time` = '".CURRENT_TIMESTAMP."' WHERE `path` = '".$data['parent']."'");
		
		// all times are set to current time
		$data['author'] = CURRENT_USER;
		$data['author_name'] = user::getrealname();
		$data['create_time'] = CURRENT_TIMESTAMP;
		$data['modify_time'] = CURRENT_TIMESTAMP;
		$data['insert_time'] = CURRENT_TIMESTAMP;
		// access_time is currently unused
	
		// privilege cannot be 000...
		if (empty($data['priv'])) {
			$data['priv'] = 755;
		}
		if (empty($data['priv_group'])) {
			$data['priv_group'] = 755;
		}

		$common_data = array();
		$diy_data = array();
		DB::common_attribute_values($data, $common_data, $diy_data); // by reference
		
		$sql = DB::implode_field_value($common_data);

		$silent = $silent ? 'SILENT' : '';		
		
		$success = $db->query("INSERT INTO common_object SET $sql", $silent);
		if (!$success) return QUERY_ERROR;
		
		$path = $data['path'];
		foreach ($diy_data as $key => $value) {
			$success = $db->query("INSERT INTO common_attribute (`path`, `name`, `value`) VALUES ('$path', '$key', '$value')");
			if (!$success) return QUERY_ERROR;
		}

		// send message to listeners
		OBJ::notify($path, 'insert');

		return $path; // return new path for further handling
	}

	function update($path, $data, $unbuffered = false, $low_priority = false) {
		global $db;
		
		if (isset($data['parent']) && OBJ::get_parent($path) != $data['parent']) { // changing path (moving object). Original path not needed.
				// delete from original parent, insert into new path
				if (check_priv($data['parent'], PRIV_INSERT) && check_priv(OBJ::get_parent($path), PRIV_DELETE)) {
					$data['id'] = 1 + $db->result_first("SELECT max_child_id FROM common_object WHERE `path` = '".$data['parent']."'");
					$db->query("UPDATE common_object SET max_child_id = '".$data['id']."' WHERE `path` = '".$data['parent']."'");
					$data['path'] = $data['parent'].'/'.$data['id'];
				}
				else return NOT_ALLOWED; // do not have privilege
		}
		elseif (isset($data['path'])) { // moving object can be done only by setting new parent
			unset($data['path']);
		}
		
		if (!check_priv($path, PRIV_WRITE)) { // normal update
			return NOT_ALLOWED;
		}
		
		// only administrators can change privilege
		if (isset($data['priv']) || isset($data['priv_group'])) {
			if( !group::isadmin(CURRENT_USER, $path) ) {
				return NOT_ALLOWED;
			}
		}
		
		unset($data['deleted']); // this is an internal sign

		// these atttibutes are either system-default, or should be modified by certain interface
		$nomodify_attrs = array('select_count', 'read_count', 'update_count', 'child_count', 'sub_object_count', 'next_child_id', 'create_time', 'modify_time', 'access_time', 'admin', 'member');
		foreach ($nomodify_attrs as $attr) {
			if (isset($data[$attr])) {
				unset($data[$attr]);
			}
		}
		
		$data['modify_time'] = CURRENT_TIMESTAMP;
		
		$common_data = array();
		$diy_data = array();
		DB::common_attribute_values($data, $common_data, $diy_data); // by reference
		
		$sql = DB::implode_field_value($common_data);
		$cmd = "UPDATE ".($low_priority ? 'LOW_PRIORITY' : '');
		
		$success = $db->query("$cmd common_object SET $sql WHERE `path` = '$path'", $unbuffered ? 'UNBUFFERED' : '');
		if (!$success) return QUERY_ERROR;
		
		foreach ($diy_data as $key => $value) {
			// use REPLACE INTO to replace existing (path, attribute) pairs			
			$success = $db->query("REPLACE INTO common_attribute (`path`, `name`, `value`) VALUES ('$path', '$key', '$value')");
			if (!$success) return QUERY_ERROR;
		}

		OBJ::notify($path, 'update');
		return true;
	}

	function implode_field($array, $glue = ',') {
		$sql = $comma = '';
		foreach ($array as $item) {
			$sql .= $comma."`$item`";
			$comma = $glue;
		}
		return $sql;
	}

	function implode_field_value($array, $glue = ',') {
		$sql = $comma = '';
		foreach ($array as $k => $v) {
			$sql .= $comma."`$k`='$v'";
			$comma = $glue;
		}
		return $sql;
	}

	function common_attribute_names(&$attributes, &$common_attributes, &$diy_attributes) {
		global $_G;

		$attrnum = is_array($attributes) ? count($attributes) : 0;
		for ($idx=0; $idx<$attrnum; $idx++) {
			if (in_array($attributes[$idx], $_G['common_attrnames'])) {
				$common_attributes[] = $attributes[$idx];				
			} else {
				$diy_attributes[] = $attributes[$idx];
			}
		}
	}

	function common_attribute_values(&$attributes, &$common_attributes, &$diy_attributes) {
		global $_G;
		
		foreach ($attributes as $key => $value) {
			if (in_array($key, $_G['common_attrnames'])) {
				$common_attributes[$key] = $value;				
			} else {
				$diy_attributes[$key] = $value;
			}
		}
	}

	function get_next_child_id($parent) {
		global $db;
		
		$id = $db->result_first("SELECT next_child_id FROM common_object WHERE `path` = '$parent'");
		if ($id > 0) { // parent exist
			$db->query("UPDATE common_object SET next_child_id = next_child_id + 1 WHERE `path` = '$parent'");
		}
		return $id;
	}
	
	function insert_id() {
		global $db;
		return $db->insert_id();
	}

	function fetch($resourceid, $type = MYSQL_ASSOC) {
		global $db;
		return $db->fetch_array($resourceid, $type);
	}

	function fetch_first($sql) {
		global $db;
		//	DB::checkquery($sql);
		return $db->fetch_first($sql);
	}
	
	function fetch_all($sql) {
		global $db;
		//	DB::checkquery($sql);
		return $db->fetch_all($sql);
	}

	function result($resourceid, $row = 0) {
		global $db;
		return $db->result($resourceid, $row);
	}

	function result_first($sql) {
		global $db;
		//	DB::checkquery($sql);
		return $db->result_first($sql);
	}

	function query($sql, $type = '') {
		global $db;
		//	DB::checkquery($sql);
		return $db->query($sql, $type);
	}

	function num_rows($resourceid) {
		global $db;
		return $db->num_rows($resourceid);
	}

	function affected_rows() {
		global $db;
		return $db->affected_rows();
	}

	function free_result($query) {
		global $db;
		return $db->free_result($query);
	}

	function error() {
		global $db;
		return $db->error();
	}

	function errno() {
		global $db;
		return $db->errno();
	}

	// Unused
	function checkquery($sql) {
		static $status = null, $checkcmd = array('SELECT', 'UPDATE', 'INSERT', 'REPLACE', 'DELETE');
		if($status === null) $status = getglobal('config/security/querysafe/status');
		if($status) {
			$cmd = trim(strtoupper(substr($sql, 0, strpos($sql, ' '))));
			if(in_array($cmd, $checkcmd)) {
				$test = DB::_do_query_safe($sql);
				if($test < 1) DB::_execute('halt', 'security_error', $sql);
			}
		}
		return true;
	}

	// This is a highly complicated function which dives deeply into SQL syntax.
	// DEPRECATED
	function _do_query_safe($sql) {
		static $_CONFIG = null;
		if($_CONFIG === null) {
			$_CONFIG = getglobal('config/security/querysafe');
		}

		$sql = str_replace(array('\\\\', '\\\'', '\\"', '\'\''), '', $sql);
		$mark = $clean = '';
		if(strpos($sql, '/') === false && strpos($sql, '#') === false && strpos($sql, '-- ') === false) {
			$clean = preg_replace("/'(.+?)'/s", '', $sql);
		} else {
			$len = strlen($sql);
			$mark = $clean = '';
			for ($i = 0; $i <$len; $i++) {
				$str = $sql[$i];
				switch ($str) {
					case '\'':
						if(!$mark) {
							$mark = '\'';
							$clean .= $str;
						} elseif ($mark == '\'') {
							$mark = '';
						}
						break;
					case '/':
						if(empty($mark) && $sql[$i+1] == '*') {
							$mark = '/*';
							$clean .= $mark;
							$i++;
						} elseif($mark == '/*' && $sql[$i -1] == '*') {
							$mark = '';
							$clean .= '*';
						}
						break;
					case '#':
						if(empty($mark)) {
							$mark = $str;
							$clean .= $str;
						}
						break;
					case "\n":
						if($mark == '#' || $mark == '--') {
							$mark = '';
						}
						break;
					case '-':
						if(empty($mark)&& substr($sql, $i, 3) == '-- ') {
							$mark = '-- ';
							$clean .= $mark;
						}
						break;

					default:

						break;
				}
				$clean .= $mark ? '' : $str;
			}
		}

		$clean = preg_replace("/[^a-z0-9_\-\(\)#\*\/\"]+/is", "", strtolower($clean));

		if($_CONFIG['afullnote']) {
			$clean = str_replace('/**/','',$clean);
		}

		if(is_array($_CONFIG['dfunction'])) {
			foreach($_CONFIG['dfunction'] as $fun) {
				if(strpos($clean, $fun.'(') !== false) return '-1';
			}
		}

		if(is_array($_CONFIG['daction'])) {
			foreach($_CONFIG['daction'] as $action) {
				if(strpos($clean,$action) !== false) return '-3';
			}
		}

		if($_CONFIG['dlikehex'] && strpos($clean, 'like0x')) {
			return '-2';
		}

		if(is_array($_CONFIG['dnote'])) {
			foreach($_CONFIG['dnote'] as $note) {
				if(strpos($clean,$note) !== false) return '-4';
			}
		}

		return 1;

	}

	function query_num() {
		global $db;
		return $db->query_num();
	}

} // end class DB
?>
