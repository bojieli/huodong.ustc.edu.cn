<?php

header("Content-type: text/html; charset=utf-8"); 

ini_set('display_errors', 0);

ini_set('date.timezone', 'Asia/Shanghai');

$api = $_GET['api'];

$callback = $_GET['callback'];

$file = file_get_contents($api);

if ($callback != '') {
	
	echo $callback . "($file)";
	
} else {

	echo $file;

}

?>