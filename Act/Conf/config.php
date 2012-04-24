<?php
if (!defined('THINK_PATH')) exit();

$config = require("../config.php");
$newconfig = array(
	'DEFAULT_MODULE' => 'Info',
	'SESSION_AUTO_START' => true,
	'APP_AUTOLOAD_PATH' => '@.TagLib,@.ORG',
	'SHOW_PAGE_TRACE' => true
);
return array_merge($config, $newconfig);
?>
