<?php
// module/portal/nav.php 2011-08-24

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}
?>
<nav>
<ul><li><a href="<?=CURRENT_PATH ?>"><?=OBJ::get_attr(CURRENT_PATH, 'title') ?></a></li>
<li><a href="<?=CURRENT_PATH ?>?action=manage">主页管理</a>
<ul><li><a href="<?=CURRENT_PATH ?>?action=modify">修改主页</a></li>
<li><a href="<?=CURRENT_PATH ?>?action=listchannel">频道列表</a></li>
<li><a href="<?=CURRENT_PATH ?>?action=addchannel">添加频道</a></li>
<li><a href="<?=CURRENT_PATH ?>?action=listener">粉丝列表</a></li>
</ul></li>
<li><a href="<?=CURRENT_PATH ?>?action=manage">组织管理</a>
<ul><li><a href="<?=CURRENT_PATH ?>?action=admin">管理员组</a></li>
<li><a href="<?=CURRENT_PATH ?>?action=member">成员列表</a></li>
<li><a href="<?=CURRENT_PATH ?>?action=invite_manage">邀请设置</a></li>
</ul></li>
<li><a href="<?=CURRENT_PATH ?>?action=manage">论坛管理</a>
<ul><li><a href="<?=CURRENT_PATH ?>?action=listboard">讨论板列表</a></li>
<li><a href="<?=CURRENT_PATH ?>?action=addboard">添加讨论板</a></li>
</ul></li>
<li><a href="<?=CURRENT_PATH ?>?action=manage">问答管理</a>
<ul><li><a href="<?=CURRENT_PATH ?>?action=listwenda">问答版块列表</a></li>
<li><a href="<?=CURRENT_PATH ?>?action=addwenda">添加问答版块</a></li>
</ul></li>
<li><a href="<?=CURRENT_PATH ?>?action=message">消息管理</a>
<ul><li><a href="<?=CURRENT_PATH ?>?action=message">查看消息</a></li>
<li><a href="<?=CURRENT_PATH ?>?action=message&important">消息存档</a></li>
<li><a href="<?=CURRENT_PATH ?>?action=postmessage">发送消息</a></li>
</ul></li>
<li><a href="<?=CURRENT_PATH ?>?action=manage">高级管理</a>
<ul><li><a href="<?=CURRENT_PATH ?>?action=list">列出内容</a></li>
<li><a href="<?=CURRENT_PATH ?>?action=find">查找内容</a></li>
<li><a href="<?=CURRENT_PATH ?>?action=modify">修改内容</a></li>
<li><a href="<?=CURRENT_PATH ?>?action=add">添加内容</a></li>
</ul></li>
<li><a href="<?=CURRENT_PATH ?>">返回主页</a></li>
</ul>
</nav>
