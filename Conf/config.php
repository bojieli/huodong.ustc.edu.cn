<?php
if (!defined('THINK_PATH')) exit();

$config = require("./Conf/dbconfig.php");
$newconfig = array(
	'DEFAULT_MODULE' => 'Poster',
	'SESSION_AUTO_START' => true,
	'APP_AUTOLOAD_PATH' => '@.TagLib,@.ORG',
	'SHOW_PAGE_TRACE' => false,
	'AVATAR_PATH' => 'upload/avatar/'
);
return array_merge($config, $newconfig);
?>
