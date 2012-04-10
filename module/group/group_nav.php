<?php
// module/group/group_nav.php 2011-08-10

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

// a list of ul-li list (use CSS relative positioning to implement indent)
function read_child($path) {
	$html = '';
	// select childs with class 'board'
	$childs = OBJ::select($path, array('path', 'title'), array('class' => 'group'));
	if (is_array($childs)) {
		$html .= '<ul>';
		foreach ($childs as $child) {
			if ($child['path'] == CURRENT_PATH) {
				$html .= '<li class="at">'; // for special display effect of current board
			} else {
				$html .= '<li>';
			}
			$html .= '<a href="'.$child['path'].'">'.$child['title'].'</a></li>';
			$html .= read_child($child['path']); // recursively get childs
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
<nav>
<?php
$curr_object = OBJ::get($path, array('siteroot', 'title'));
$siteroot = $curr_object['siteroot'];
$title = $curr_object['title']; ?>
<div class="title"><a href="<?php echo $siteroot ?>"><?php echo $title ?></a></div>
<?php echo read_child($siteroot); ?>
</div>
</nav>
<?php } ?>
