<?php
// module/default/listen.php 2011-08-24

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require modulefile('portal', 'header');

echo '<aside>';
require modulefile('nav', 'read');
echo '</aside>';

echo '<article>';
$listeners = OBJ::get_list('listener', CURRENT_PATH);
if (empty($listeners)) { ?>
<h1>还没有粉丝</h1>
<?php } else { ?>
<h1>粉丝列表</h1>
<table class="list">
<tr><th>UID</th><th>真实姓名</th></tr>
<?php foreach ($listeners as $listener) {
$realname = user::getrealname($listener);
?>
<tr><td><a href="/user/<?=$listener ?>"></td><td><a href="/user/<?=$listener ?>"><?=$realname ?></a></td></tr>
<?php } //end foreach
?>
</table>
<?php }
?>
