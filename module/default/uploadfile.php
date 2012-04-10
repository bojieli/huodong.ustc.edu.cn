<?php
// module/default/uploadfile.php 2011-08-19

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}
if (empty($_FILES['file'])) {
	echo '<script>alert("您没有选择文件！");</script>';
	exit();
}
if ($_FILES['file']['error'] > 0) {
	echo '<script>alert("服务器内部错误，上传失败！(文件大小限制为100MB)\n错误信息：'.$_FILES['file']['error'].'");</script>';
	exit();
}
else {
	require_once libfile('class/upload');
	$path = upload::save($_FILES['file'], CURRENT_PATH, (isset($_GET['name']) ? $_GET['name'] : ''));
	if (!ispath($path)) {
		switch ($path) {
			case NOT_ALLOWED: alert_error("您没有权限在此创建文件！");
			case FAILED: alert_error("抱歉，由于内部错误，上传失败！");
		}
	}
	if (!empty($_GET['inputid'])) {
		$name = $_GET['inputid'];
	} else {
		$name = 'uploadfile';
	}
	echo '<script>parent.document.getElementById("'.$name.'").value = "'.$path.'";</script>';
	echo '<script>alert("上传成功！");</script>';
}
?>
