<?php
// module/system/upgrade.php 2011-08-26

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

if (!check_priv('/', PRIV_WRITE)) {
	window::error('只有网站开发团队才能访问此页面！');
}

// create user directories
$count = DB::result_first("SELECT COUNT(*) FROM common_user");
for ($user=1; $user<=$count; $user++) {
	$init = DB::result_first("SELECT COUNT(*) FROM common_object WHERE `path` = '/user/$user'");
	if (!$init) {
		$username = user::getrealname($user);
		$adminlist = serialize(array($user));
		$time = CURRENT_TIMESTAMP;
		DB::query("INSERT INTO common_object SET `parent` = '/user', `name` = '$user', `class` = 'home', `path` = '/user/$user', `admin` = '$adminlist', `priv` = '744', `priv_group` = '744', `author` = '$user', `author_name` = '$username', `create_time` = '$time', `modify_time` = '$time', `insert_time` = '$time'");
		echo "<p>User $user init";
	}
}

// migrant messages from common_message to user home
$messages = DB::fetch_all("SELECT * FROM common_message");
foreach ($messages as $message) {
	echo '<p>';
	print_r($message);
	$id = $message['id'];
	$source = $message['source'];
	$author = substr($source, 6); // /user/10000
	$author_name = user::getrealname($author);
	$adminlist = serialize(array($author));
	$target = $message['target'];
	$time = $message['time'];
	$content = addslashes($message['content']);
	$sticky = $message['sticky'];
	$important = $message['important'];
	$name = DB::result_first("SELECT next_child_id FROM common_object WHERE `path` = '$source'");
	DB::query("UPDATE common_object SET next_child_id = next_child_id + 1 WHERE `path` = '$source'");
	$path = $source.'/'.$name;
	
	if (empty($source) || empty($name)) {
		continue; // error, do not proceed
	}
	// sticky message: one to one
	if ($message['sticky'] == 1) {
		DB::query("INSERT INTO common_object SET `parent` = '$source', `name` = '$name', `path` = '$path', `class` = 'message', `content` = '$content', `author` = '$author', `author_name` = '$author_name', `create_time` = '$time', `modify_time` = '$time', `insert_time` = '$time', `priv` = '755', `priv_group` = '755', `admin` = '$adminlist'");
		DB::query("INSERT INTO common_inbox SET `target` = '$target', `path` = '$path', `sticky` = '$sticky', `important` = '$important'");
	}
	// doing message: one to many
	else {
		// status is sent to many, including himself
		if ($source == $target) {
			DB::query("INSERT INTO common_object SET `parent` = '$source', `name` = '$name', `path` = '$path', `class` = 'message', `content` = '$content', `author` = '$author', `author_name` = '$author_name', `create_time` = '$time', `modify_time` = '$time', `insert_time` = '$time', `priv` = '755', `priv_group` = '755', `admin` = '$adminlist'");
			$listeners = user::get_listener_list($author);
			$listeners[] = $author;
			foreach ($listeners as $listener) {
				DB::query("INSERT INTO common_inbox SET `target` = '/user/$listener', `path` = '$path', `sticky` = '$sticky', `important` = '$important'");
			}
		}
	}
}
echo "<h1>Upgrade Finished!</h1>"
?>
