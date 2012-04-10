<?php
// module/message/messagebox.php
if (empty($user)) {
	$user = substr(CURRENT_USER, 6);
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
<form action="/user/<?=CURRENT_USER ?>?action=insert" method="post">
<input type="hidden" name="target" value="/user/<?=$user ?>" />
<textarea cols="40" rows="4" id="content" name="content"></textarea>
<p><button type="submit" onclick="return checkmessage();">留言</button></p>
</form>
<br />
