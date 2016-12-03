<?php
if (!defined('THINK_PATH')) exit();

date_default_timezone_set('Asia/Chongqing');

$config = require("./Conf/dbconfig.php");
$newconfig = array(
	'SITE_ADDRESS' => 'https://huodongweb.com',
	'DEFAULT_MODULE' => 'Poster',
	'SESSION_AUTO_START' => true,
	'APP_AUTOLOAD_PATH' => '@.TagLib,@.ORG',
	'SHOW_PAGE_TRACE' => false,
	'ATTACHMENT_SIZE' => 31457280,
	'AVATAR_PATH' => 'upload/avatar/',
	'COOKIE_PREFIX' => 'hd_',
	'COOKIE_EXPIRE' => 36000,
	'URL_HTML_SUFFIX' => 'html|xml',
	'DEFAULT_FILTER'=>'strip_tags,htmlspecialchars'
);
$mailconfig = array(
	'MAIL_ADDRESS' => 'huodong@ustc.edu.cn',
	'MAIL_SMTP' => '202.38.64.8',
	'MAIL_LOGINNAME' => 'huodong@ustc.edu.cn',
	'MAIL_PASSWORD' => 'hzbjlsjr0906'
);
$smsconfig = array(
	'huodong_sms' => "【huodongweb.com】",
	'update_week' => 1,
	'sms_minimum' => 20,//保底短信条数
	'sms_weight' => 2 //每增加一个会员所拥有的短信条数
	);
$timerconfig = array(
	'timer_time' => 2*3600,//second
	'timer_email'=> 10,
);
$multiLang  = array(
	'LANG_SWITCH_ON' => true,
	'LANG_AUTO_DETECT' => true,
	'DEFAULT_LANG' => 'en-us',
	'LANG_LIST'        => 'en-us,zh-cn,zh-tw,es-es',
);
return array_merge($config, $newconfig, $mailconfig,$smsconfig,$timerconfig,$multiLang);
?>