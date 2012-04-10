<?php
// module/system/lib_field.php 2011-08-13

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

$common_attributes = array('class', 'default_child_class', 'priv', 'priv_group', 'title', 'order', 'abstract', 'content', 'tag', 'css', 'listener_inherit');

$common_attribute_names = array(
	'class' => '类别',
	'name' => '名称',
	'default_child_class' => '子对象默认类别',
	'priv' => '权限',
	'priv_group' => '用户组管理权限',
	'title' => '标题',
	'order' => '显示顺序',
	'abstract' => '摘要',
	'content' => '内容',
	'tag' => '标签',
	'css' => 'CSS样式表',
	'listener_inherit' => '是否继承粉丝'
);

$common_attribute_description = array(
	'class' => '添加内容的类别',
	'name' => '用于路径，只能由字母、数字、下划线组成，首字符不能是数字',
	'default_child_class' => '在其中再添加的内容的默认类别',
	'priv' => '权限',
	'priv_group' => '组织权限',
	'title' => '标题',
	'order' => '数字越大，表示显示越靠前',
	'tag' => '标签',
	'css' => '当前页面的自定义样式',
	'listener_inherit' => '只能填0（不继承）或1（继承）。继承上级粉丝，则当前对象中的修改不仅能被当前对象的粉丝收到，也能被上级对象的粉丝收到。例如默认情况下组织的粉丝可以收到组织主页各版块的动态，但不能收到组织讨论区新帖的通知。'
);

function print_form(&$common_attributes, &$default_attribute_values, &$common_attribute_names, &$common_attribute_description, $class) {
?>
<h1>添加/修改默认类</h1>
<h2>小心！错误的默认类设置可能危及整个系统的正常运行！</h2>
<h2>不希望设置默认值的选项，请留空。</h2>
<form action="/system?class=<?=$class ?>&action=update" onsubmit="return check_input();" method="post">
<table class="form">
<?php	foreach ($common_attributes as $attr) {

		if ($attr == 'abstract' || $attr == 'css') { ?>
<tr><th><?=$common_attribute_names[$attr] ?></th><td colspan="2"><textarea rows="5" cols="50" id="<?=$attr ?>" name="<?=$attr ?>"><?=$default_attribute_values[$attr] ?></textarea></td></tr>
<?php 		}
		elseif ($attr == 'content') { ?>
<tr><th><?=$common_attribute_names[$attr] ?></th><td colspan="2"><textarea rows="10" cols="50" id="<?=$attr ?>" name="<?=$attr ?>" style="resize:vertical;"><?=$default_attribute_values[$attr] ?></textarea></td></tr>
<?php		}
		else { ?>
<tr><th><?=$common_attribute_names[$attr] ?></th><td><input type="text" id="<?=$attr ?>" name="<?=$attr ?>" value="<?=$default_attribute_values[$attr] ?>" /></td><td class="comment"><?=$common_attribute_description[$attr] ?></td></tr>
<?php		}
	}
?>
<tr><td></td><td><button type="submit">提交更改</button></td><td></td></tr>
</table></form>
<?php
} // end function print_form
?>
