<?php
if (!defined('THINK_PATH')) exit();

$config = require("../config.php");
$newconfig = array(
	'DEFAULT_MODULE' => 'Info'
);
return array_merge($config, $newconfig);
?>
