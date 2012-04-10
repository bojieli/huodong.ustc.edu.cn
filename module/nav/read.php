<?php
// module/nav/read.php 2011-08-09 boj

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

// a list of ul-li list (use CSS relative positioning to implement indent)
function read_child($path, $class) {
	$html = '';
	// select childs with class 'board'
	$childs = OBJ::select($path, array('path', 'title'), array('class' => $class));
	if (is_array($childs) && !empty($childs)) {
		$html .= '<ul>';
		foreach ($childs as $child) {
			if ($child['path'] == CURRENT_PATH) {
				$html .= '<li class="at">'; // for special display effect of current board
			} else {
				$html .= '<li>';
			}
			$html .= '<a href="'.$child['path'].'">'.$child['title'].'</a>';
			$html .= read_child($child['path'], $class); // recursively get childs
			$html .= '</li>';
		}
		$html .= "</ul>\n";
	}
	return $html;
}

// self call
nav_read(CURRENT_PATH);

// should call this
function nav_read($path = CURRENT_PATH) {
?>
<nav><ul>
<?php
$curr_object = OBJ::get($path, array('siteroot', 'title'));
$siteroot = $curr_object['siteroot'];
if (empty($siteroot)) {
	$siteroot = CURRENT_OBJECT;
}
$title = OBJ::get_attr($siteroot, 'title');
?>
<li><a href="<?=$siteroot ?>"><?=$title ?></a>
<?=read_child($siteroot, 'channel') ?></li>
<?php $sections = OBJ::select($siteroot, array('path', 'title'), array('class' => 'section'));
foreach ($sections as $section) { ?>
<li><a href="<?=$section['path'] ?>"><?=$section['title'] ?></a>
<?=read_child($section['path'], 'channel') ?></li>
<?php } ?>
<?php $html = read_child($siteroot, 'board');
if ($html) {
echo "<li><a>内部讨论板</a>$html</li>";
} ?>
<li><a>互动问答</a>
<?=read_child($siteroot, 'wenda') ?></li>
<li><a href="<?=$siteroot ?>?action=addlisten">加关注</a></li>
<?php	if (check_priv(CURRENT_PATH, PRIV_WRITE)) { ?>
<li><a href="<?=$siteroot ?>/notice?action=post">发通知</a></li>
<li><a href="<?=CURRENT_PATH ?>?action=manage">管理中心</a></li>
<?php } ?>
<li><a href="<?=CURRENT_PATH ?>?action=join">申请加入</a></li>
</ul></nav>
<?php } ?>
