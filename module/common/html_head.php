<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>格物网 - 科大生活从这里启航</title>
<meta name="keywords" content="格物,格物网,科大,中国科大,USTC,SNS" />
<meta name="author" content="boj @ Gewu Team" />
<base href="http://202.38.70.159/" />
<link rel="stylesheet" type="text/css" href="static/common.css" />
<script src="static/common.js" type="text/javascript"></script>
<?php
// inherit css stylesheet from ancestors
$css = '';
$path = CURRENT_PATH;
while ($path != '/') {
	$css .= OBJ::get_attr($path, 'css');
	$path = OBJ::get_parent($path);
}
if ($css) {
	echo '<style type="text/css">'.$css.'</style>';
}
?>
</head>
