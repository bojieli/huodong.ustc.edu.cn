<?php
// module/default/modify.php 2011-08-13

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

// not login
if (CURRENT_USER == 0) {
	window::error('只有登录后才能修改内容，请首先 <a href="/">登录</a> 或 <a href="/">立即注册</a>！');
}

require modulefile('common', 'header');

echo '<aside>';
require modulefile('default', 'nav');
echo '</aside>';

echo '<article>';
require modulefile('default', 'lib_field');

$default_attribute_values = OBJ::get(CURRENT_PATH);

print_form($common_attributes, $default_attribute_values, $common_attribute_names, $common_attribute_description); // in module lib_field
echo '</article>';

require modulefile('common', 'footer');
?>
