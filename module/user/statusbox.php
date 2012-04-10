<?php
// module/user/statusbox.php 2011-08-25

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}
?>
<script>
function checkmessage() {
	msg = document.getElementById('content').value;
	if (msg == '' && document.getElementById('uploadphoto').value == '' && document.getElementById('uploadattach').value == '') {
		alert('请输入内容！');
		return false;
	} else if (strlen(msg) > 500) {
		alert('长篇大论请发博客，这里的声音很容易被淹没的～');
		return false;
	}
	return true;
}
</script>
<h1>让大家尽快了解你</h1>
<form action="/user/<?=CURRENT_USER?>?action=insert" method="post">
<input type="hidden" name="class" value="message" />
<input type="hidden" name="redirect" value="/home" />
<textarea cols="40" rows="4" id="content" name="content"></textarea>
<p>
<button type="submit" onclick="return checkmessage();">发表新鲜事</button>&nbsp;&nbsp;
<button onclick="document.getElementById('uploadphotoframe').style.display = 'block';return false;">上传图片</button>
<button onclick="document.getElementById('uploadattachframe').style.display = 'block';return false;">上传附件</button>
<input type="hidden" name="uploadphoto" id="uploadphoto" />
<input type="hidden" name="uploadattach" id="uploadattach" />
<input type="checkbox" id="publish" name="publish" checked="true" />同时发布到<a href="/ustclive" target="_blank">科大直播板</a>
</p>
</form>
<iframe class="upload" id="uploadphotoframe" style="display:none" src="/home/<?=CURRENT_USER ?>/photo?action=upload&inputid=uploadphoto"></iframe>
<iframe class="upload" id="uploadattachframe" style="display:none" src="/home/<?=CURRENT_USER ?>/file?action=upload&inputid=uploadattach"></iframe>
