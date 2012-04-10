<?php
// module/system/add.php 2011-08-13

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require modulefile('common', 'header');

echo '<aside>';
require modulefile('system', 'nav');
echo '</aside>';

echo '<article>';
require modulefile('system', 'lib_field');

$default_attribute_values = array(
	'class' => 'default',
	'name' => '',
	'parent' => '/',
	'default_child_class' => 'default',
	'priv' => '755',
	'priv_group' => '755',
	'title' => '',
	'order' => '0',
	'abstract' => '',
	'content' => '',
	'tag' => '',
	'css' => '',
	'listener_inherit' => '0'
);

print_form($common_attributes, $default_attribute_values, $common_attribute_names, $common_attribute_description, ''); // in module lib_field
echo '</article>';

require modulefile('common', 'footer');
?>
