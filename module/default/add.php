<?php
// module/default/add.php 2011-08-13

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require modulefile('common', 'header');

echo '<aside>';
require modulefile('default', 'nav');
echo '</aside>';

echo '<article>';
require modulefile('default', 'lib_field');

$class = OBJ::get_default_child_class(CURRENT_PATH);
if (empty($class)) {
	$class = 'default';
}
$default_attribute_values = OBJ::get_default($class);
$default_attribute_values['name'] = '';
$default_attribute_values['parent'] = CURRENT_PATH;

$siteroot = OBJ::get_attr(CURRENT_PATH, 'siteroot');
if (!empty($siteroot)) {
	$default_attribute_values['siteroot'] = $siteroot;
}

print_form($common_attributes, $default_attribute_values, $common_attribute_names, $common_attribute_description, 'insert'); // in module lib_field
echo '</article>';

require modulefile('common', 'footer');
?>
