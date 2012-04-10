<?php
// module/home/read.php 2011-08-10

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

if (CURRENT_USER == 0) {
	redirect('/');
}

require modulefile('common', 'header');

echo '<aside>';
require modulefile('home', 'nav');
echo '</aside>';

echo '<article>';
$user = substr(CURRENT_PATH, 6);
if (!empty($user) && is_numeric($user)) {
	require modulefile('home', 'message');
} else {
	echo '<div class="main">';
	require modulefile('message', 'statusbox');
	require modulefile('message', 'read');
	echo '</div>';
	require modulefile('home', 'aside');
} // end else
echo '</article>';

require modulefile('common', 'footer');
?>
