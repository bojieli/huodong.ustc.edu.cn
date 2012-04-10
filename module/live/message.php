<?php
// module/live/message.php 2011-08-13

if (!defined('IN_GEWU')) {
        exit(header('HTTP/1.1 403 Forbidden'));
}
?>
<head>
<!--<meta http-equiv="refresh" content="10" />-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="static/common.css" />
</head>
<body style="background:#FFF;" onload="scrollTo(0, document.body.scrollHeight);">
<table class="live" style="max-width:600px;">
<?php
// select the latest items
$total = OBJ::count(CURRENT_PATH, array('class' => 'default'));
$num = 30;
$start = $total - $num;
if ($start < 0) $start = 0;
$msgs = OBJ::select(CURRENT_PATH, array('author', 'author_name', 'create_time', 'content'), array('class' => 'default'), '`create_time`', "$start,$num");

foreach ($msgs as $index => $msg) { ?>
<tr class="msg"><td><span><?=($index+$start) ?>#</span></td><td><a href="/user/<?=$msg['author'] ?>" target="_blank"><img src="<?=user::avatar($msg['author']) ?>" /></a></td><td><a href="/user/<?=$msg['author'] ?>" target="_blank"><span class="large" style="width:70px;"><?=$msg['author_name'] ?></span></a><p class="small"><?=date("m-d H:i", $msg['create_time']) ?></p></td>
<td class="larger" style="max-width:380px;"><?=$msg['content'] ?></td></tr>
<?php } ?>
</table>
</body>

