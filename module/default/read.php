<?php
// module/default/read.php

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require modulefile('common', 'header');

$object = OBJ::get(CURRENT_PATH);
if (is_array($object)) {
	echo '<aside>';
	require modulefile('default', 'nav');
	echo '</aside>';
	
	echo '<article>';
	echo '<table class="list">';
	foreach ($object as $key => $value) {
		echo "<tr><td>$key</td><td>$value</td></tr>";
	}
	echo "</table>";
	echo '</article>';
} else {
	require GEWU_ROOT.'/static/404.html';
}

require modulefile('common', 'footer');
?>
