<?php
// module/user/messagebox.php 2011-08-25

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

if (empty($user)) {
	// /user/10000/doing OR /user/10000
	$paths = explode('/', CURRENT_PATH);
	$user = $paths[2];
}
$name = user::getrealname($user);
?>
<script>
function checkmessage() {
	msg = document.getElementById('content').value;
	if (msg == '') {
		alert('请输入内容！');
		return false;
	} else if (strlen(msg) > 500) {
		alert('这个短消息太长了……');
		return false;
	}
	return true;
}
</script>
<h1>有什么话想对<?=$name ?>说？</h1>
<form action="/user/<?=CURRENT_USER?>?action=insert" method="post">
<input type="hidden" name="class" value="message" />
<input type="hidden" name="redirect" value="/home/<?=CURRENT_USER?>" />
<input type="hidden" name="target" value="/user/<?=$user ?>" />
<textarea cols="40" rows="4" id="content" name="content"></textarea>
<p><button type="submit" onclick="return checkmessage();">留言</button></p>
</form>
<br />
