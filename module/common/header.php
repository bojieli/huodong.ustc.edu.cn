<?php
if (!defined('HEADER')) {
define('HEADER', true); // if this is set, other headers should not be sent
require modulefile('common', 'html_head'); ?>
<body>
<header><a id="sitename" href="/">格物网&nbsp;<span class="small">测试版</span></a>
<nav><ul><li><a href="/gewu/5">找BUG</a></li><li><a href="/gewu/6">提建议</a></li></ul></nav>
<!--<nav><ul><li>首页</li><li>班级</li><li>组织</li><li>百科</li></ul></nav>-->
<nav class="upanel"><ul>
<?php
if (CURRENT_USER == 0) { ?>
<li><a href="/">登录</a></li><li><a href="/">注册</a></li>
<?php } else { ?>
<li><a href="/home" title="返回首页"><?=user::getrealname(CURRENT_USER); ?></a></li>
<?php if (check_priv(CURRENT_PATH, PRIV_WRITE)) { ?>
<li><a href="<?=(substr(CURRENT_PATH, 0, 5) == '/home' ? '/' : CURRENT_PATH) ?>?action=manage">管理中心</a></li>
<?php } ?>
<li><a href="/user/logout">退出登录</a></li>
<?php }
?>
</ul></nav>
</header>
<div class="clearfix">
<?php } // if header is defined, should not send it again
?>
