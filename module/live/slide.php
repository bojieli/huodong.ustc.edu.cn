<?php
// module/live/read.php 2011-08-13

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require modulefile('common', 'header');
?>
<div style="height:750px;width:600px;float:left"><iframe src="<?=CURRENT_OBJECT ?>?action=slide_message" height="100%" width="100%"></iframe></div>
<div style="height:750px;width:360px;float:right">
<iframe src="<?=CURRENT_OBJECT ?>/notice" height="100%" width="100%" /></iframe>
</div>
<?php
require modulefile('common', 'footer');
?>

