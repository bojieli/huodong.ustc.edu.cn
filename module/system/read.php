<?php
// module/system/read.php 2011-08-13

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}
if (!group::isadmin(CURRENT_USER, '/')) {
	window::error('仅有网站开发团队才能访问此页面！');
}
require modulefile('common', 'header');

echo '<aside>';
require modulefile('system', 'nav');
echo '</aside>';

echo '<article>';
require modulefile('system', 'lib_field');

if (!isset($_GET['class'])) {
	echo '<h1>从左侧导航栏中选择需要修改的默认类</h1>';
	echo '<a href="/system/add"><button>添加默认类</button></a>';
}
else {
	$default_attribute_values = OBJ::get_default($_GET['class']);
	print_form($common_attributes, $default_attribute_values, $common_attribute_names, $common_attribute_description, $path = CURRENT_PATH); // in module lib_field
}
echo '</article>';

require modulefile('common', 'footer');
?>
