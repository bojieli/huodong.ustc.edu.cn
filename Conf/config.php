<?php
if (!defined('THINK_PATH')) exit();

$config = require("./Conf/dbconfig.php");
$newconfig = array(
	'DEFAULT_MODULE' => 'Poster',
	'SESSION_AUTO_START' => true,
	'APP_AUTOLOAD_PATH' => '@.TagLib,@.ORG',
	'SHOW_PAGE_TRACE' => false,
	'AVATAR_PATH' => 'upload/avatar/',
	'COOKIE_PREFIX' => 'hd_',
	'COOKIE_EXPIRE' => 3600
);
$mailconfig = array(
	'MAIL_ADDRESS' => 'huodong@ustc.edu.cn',
	'MAIL_SMTP' => '202.38.64.8',
	'MAIL_LOGINNAME' => 'huodong@ustc.edu.cn',
	'MAIL_PASSWORD' => 'hzbjlsjr0906'
);
$smsconfig = array(
	'update_week' => 1
	);
return array_merge($config, $newconfig, $mailconfig,$smsconfig);
?>
