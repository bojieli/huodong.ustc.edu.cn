<?php
// module/default/upload.php 2011-08-19
// handle insertions of file-type sub objects

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}
?>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<form class="upload" enctype="multipart/form-data" action="<?=CURRENT_PATH ?>?action=uploadfile&name=<?=isset($_GET['name']) ? $_GET['name'] : '' ?>&inputid=<?=isset($_GET['inputid']) ? $_GET['inputid'] : '' ?>" method="post">
<input name="file" type="file" />
<button type="submit">上传</button>
</form>
