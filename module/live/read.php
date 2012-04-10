<?php
// module/live/read.php 2011-08-13

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require modulefile('common', 'header');
?>
<script>
function checkmessage() {
	msg = document.getElementById('content').value;
	if (msg == '') {
		alert('请输入内容！');
		return false;
	} else if (strlen(msg) > 500) {
		alert('长篇大论请发博客，这里的声音很容易被淹没的～');
		return false;
	}
	return true;
}
</script>
<div style="height:750px;width:600px;float:left"><iframe src="<?=CURRENT_OBJECT ?>?action=message" style="height:70%;width:100%"></iframe>
<form action="<?=CURRENT_PATH ?>?action=insert" method="post">
<textarea cols="40" rows="4" id="content" name="content"></textarea>
<br /><button type="submit" onclick="return checkmessage();">立即发表</button>
<input type="hidden" id="publish" name="publish" value="1" />
</form></div>
<div style="height:750px;width:360px;float:right">
<iframe src="<?=CURRENT_OBJECT ?>/notice" style="height:100%;width:100%"></iframe>
</div>
<?php
require modulefile('common', 'footer');
?>

