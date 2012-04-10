<?php
// module/default/lib_field.php 2011-08-13

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

$common_attributes = array('class', 'name', 'parent', 'default_child_class', 'priv', 'priv_group', 'siteroot', 'order', 'title', 'abstract', 'content', 'tag', 'css', 'listener_inherit');

$common_attribute_names = array(
	'class' => '类别',
	'name' => '名称',
	'parent' => '挂载点',
	'default_child_class' => '子对象默认类别',
	'priv' => '权限',
	'priv_group' => '用户组管理权限',
	'siteroot' => '站点根位置',
	'order' => '显示顺序',
	'title' => '标题',
	'abstract' => '摘要',
	'content' => '内容',
	'tag' => '标签',
	'css' => 'CSS样式表',
	'listener_inherit' => '是否继承粉丝'
);

$common_attribute_description = array(
	'class' => '添加内容的类别，可使用默认值',
	'name' => '用于路径，只能由字母、数字、下划线组成，首字符不能是数字',
	'parent' => '添加到哪里？一般不需要修改',
	'default_child_class' => '在其中再添加的内容的默认类别',
	'priv' => '权限',
	'priv_group' => '组织权限',
	'order' => '数字越大，表示显示越靠前',
	'siteroot' => '同一个站点中的各页面导航栏一致，这里决定了显示何处的导航栏',
	'title' => '标题',
	'tag' => '标签',
	'css' => '当前页面的自定义样式',
	'listener_inherit' => '只能填0（不继承）或1（继承）。继承上级粉丝，则当前对象中的修改不仅能被当前对象的粉丝收到，也能被上级对象的粉丝收到。例如默认情况下组织的粉丝可以收到组织主页各版块的动态，但不能收到组织讨论区新帖的通知。'
);

function print_form(&$common_attributes, &$default_attribute_values, &$common_attribute_names, &$common_attribute_description, $action = 'update') {
/*
<script>
function check_input() {
<?php foreach ($common_attributes as $attr) { ?>
	if (document.getElementById('<?=$attr ?>').value == '') {
		alert('请将信息填写完整！');
		return false;
	}
<?php } ?>
	return true;
}
</script>
*/
if ($action == 'update') { ?>
<h1>修改<?=CURRENT_PATH?>的内容</h1>
<form action="<?=CURRENT_OBJECT ?>?action=update" onsubmit="handleSubmit(); return check_input();" method="post">
<?php } else { ?>
<h1>向<?=CURRENT_PATH?>中添加新内容</h1>
<form action="<?=CURRENT_OBJECT ?>?action=insert" onsubmit="handleSubmit(); return check_input();" method="post">
<?php } ?>
<table class="form">
<?php	foreach ($common_attributes as $attr) {
		if (!isset($default_attribute_values[$attr])) {
			$default_attribute_values[$attr] = '';
		}
		if ($attr == 'abstract' || $attr == 'css') { ?>
<tr><th><?=$common_attribute_names[$attr] ?></th><td colspan="2"><textarea rows="4" cols="50" id="<?=$attr ?>" name="<?=$attr ?>"><?=$default_attribute_values[$attr] ?></textarea></td></tr>
<?php 		}
		elseif ($attr == 'content') { ?>
<tr><th><?=$common_attribute_names[$attr] ?></th><td colspan="2">
<?php require modulefile('common', 'editor'); ?><br />
<textarea id="<?=$attr ?>" name="<?=$attr ?>" class="editor"><?=$default_attribute_values[$attr] ?></textarea>
<script>sendIframeData();</script>
</td></tr>
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
