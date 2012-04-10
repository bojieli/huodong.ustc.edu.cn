<?php
// module/system/home2user.php 2011-08-26

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

$paths = DB::fetch_all("SELECT path FROM common_object WHERE `path` LIKE '/home/%'");
foreach ($paths as $path) {
	$path = $path['path'];
	// /home/aaa => /user/aaa
	$new_path = '/user/'.substr($path, 6);
	if (0 == DB::result_first("SELECT COUNT(*) FROM common_object WHERE `path` = '$new_path'")) {
		DB::query("UPDATE common_object SET `path` = '$new_path' WHERE `path` = '$path'");
	}
}
echo 'Completed.'
?>
