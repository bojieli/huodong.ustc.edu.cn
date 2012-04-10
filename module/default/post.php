<?php
// module/default/post.php 2011-08-18

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require modulefile('common', 'header');

echo '<aside>';
require modulefile('default', 'nav'); ?>
</aside>
<script>
function check_input() {
	if (document.getElementById('title').value == '') {
		alert('请填写标题！');
		return false;
	}
	if (document.getElementById('content').value == '') {
		alert('请填写内容！');
		return false;
	}
	if (document.getElementById('class').value == '') {
		alert('请填写类别（如不清楚请保留默认值）');
		return false;
	}
	return true;
}
</script>
<article>
<h1>在<?=CURRENT_PATH ?>中发表文章</h1>
<form action="<?=CURRENT_PATH ?>?action=insert" onsubmit="handleSubmit(); return check_input();" method="post">
<table class="form">
<tr><th>标题</th><td colspan="2"><input class="long" id="title" name="title" autofocus="true" /></td></tr>
<tr><th>摘要</th><td colspan="2"><input class="long" id="abstract" name="abstrac
t" /></td></tr>
<tr><th>内容</th><td colspan="2"><?php require modulefile('common', 'editor'); ?>
<br /><textarea class="editor" id="content" name="content" /></textarea></td></tr>
<tr><th>图片</th><td><input type="hidden" id="uploadphoto" name="uploadphoto" /><iframe class="upload" src="<?=CURRENT_PATH ?>?action=upload&inputid=uploadphoto"></iframe></td><td class="comment">上传的图片会自动显示在文章尾部，位置可以在发表后修改</td></tr>
<tr><th>视频</th><td><input type="hidden" id="uploadvideo" name="uploadvideo" /><iframe class="upload" src="<?=CURRENT_PATH ?>?action=upload&inputid=uploadvideo"></iframe></td><td class="comment">上传的视频会在页面内自动播放</td></tr>
<tr><th>附件</th><td><input type="hidden" id="uploadattach" name="uploadattach" /><iframe class="upload" src="<?=CURRENT_PATH ?>?action=upload&inputid=uploadattach"></iframe></td><td class="comment">上传附件的下载链接会自动显示在文章尾部，位置可以在发表后修改</td></tr>
<tr><th>标签</th><td><input name="tag" /></td><td class="comment">用空格隔开</td></tr>
<tr><th>类别</th><td><input id="class" name="class" value="article" /></td><td class="comment">内容的显示样式，一般无需修改</td></tr>
<tr><th>权限设置</th><td><strong>会员</strong> <input type="checkbox" name="priv_member_read" checked="true" />读取内容&nbsp;&nbsp;<input type="checkbox" name="priv_member_write" />完全控制&nbsp;&nbsp;<input type="checkbox" name="priv_member_insert" checked="true" />回复<br /><strong>其他人</strong> <input type="checkbox" name="priv_guest_read" checked="true" />读取内容&nbsp;&nbsp;<input type="checkbox" name="priv_guest_write" />完全控制&nbsp;&nbsp;<input type="checkbox" name="priv_guest_insert" />回复</td><td class="comment"><strong>高级设置，一般无需修改</strong><br />权限分为管理员组、成员组、其他人三种类别，每组有读（访问）、写（完全控制）、插入（添加回复）三种权限，可以分别设置。管理员拥有全部权限。</td></tr>
<tr><th>用户组权限</th><td><strong>会员</strong><input type="checkbox" name="group_member_read" checked="true" />读取成员列表&nbsp;&nbsp;<input type="checkbox" name="priv_member_write" />完全控制&nbsp;&nbsp;<input type="checkbox" name="priv_member_insert" checked="true" />添加新成员<br /><strong>其他人</strong> <input type="checkbox" name="priv_guest_read" checked="true" />读取成员列表&nbsp;&nbsp;<input type="checkbox" name="priv_guest_write" />完全控制&nbsp;&nbsp;<input type="checkbox" name="priv_guest_insert" />加入组织</td><td class="comment"><strong>高级设置，一般无需修改</strong><br />权限分为管理员组、成员组、其他人三种类别，每组有读取成员列表、修改（完全控制）成员列表、添加新成员三种权限，可以分别设置。管理员拥有全部权限。</td></tr>
<tr><td></td><td><button class="large" type="submit">发表文章</button></td></tr>
</table>
</form>
</article>
<?php
require modulefile('common', 'footer');
?>
