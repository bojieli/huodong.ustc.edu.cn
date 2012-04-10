<?php
// module/group/invite_manage.php 2011-09-26

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require modulefile('common', 'header');
echo '<aside>';
require modulefile('portal', 'nav');
echo '</aside>';
?>
<article>
<h1>邀请设置</h1>
<p>用户可以通过输入邀请码加入组织。
<p>将邀请码批量发送给允许加入组织的用户，组织管理员就不必手动将成员加入组织。
<p>如果不希望使用邀请功能，请将邀请码留空。
<h2>邀请码设置</h2>
<form class="large" action="<?=CURRENT_PATH ?>?action=update" method="post">
<input type="text" name="invite_code" value="<?=OBJ::get_attr(CURRENT_PATH, 'invite_code'); ?>" />
<button type="submit">修改邀请码</button>
</form>
</article>
<?php
require modulefile('common', 'footer');
?>
