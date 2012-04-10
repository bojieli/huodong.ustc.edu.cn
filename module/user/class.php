<?php
// module/home/class.php 2011-08-14

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

require_once modulefile('common', 'header');

echo '<aside>';
require modulefile('user', 'nav');
echo '</aside>';

echo '<article><table class="list"><tr><th>年级</th><th>院系</th><th>班级名称</th></tr>';
$classes = OBJ::select_class('class');
foreach ($classes as $class) {
$paths = explode('/', $class['path']);
$school = $paths[1];
$grade = $paths[2];
$dept = OBJ::get_attr($paths[1].$paths[2].$paths[3], 'title');
$class_name = $class['name'];
?>
<tr><td><?=$grade ?></td><td><?=$dept ?></td><td><a href="<?=$class['path'] ?>"><?=$class_name ?></a></td></tr>
<?php }
echo '</table></article>';

require_once modulefile('common', 'footer');
?>
