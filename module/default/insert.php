<?php
// module/default/insert.php 2011-08-13

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

// not login
if (CURRENT_USER == 0) {
	window::error('只有登录后才能发表内容，请首先 <a href="/">登录</a> 或 <a href="/">立即注册</a>！');
}

if (isset($_GET['editor'])) { //edit
	require modulefile('common', 'header');
	
	require modulefile('default', 'lib_field');
	
	$default_class = OBJ::get_default_class(CURRENT_PATH);
	$default_attribute_values = OBJ::get_default($default_class);
	
	print_form($common_attributes, $default_attribute_values, $common_attribute_description); // in module lib_field
	
	require modulefile('common', 'footer');
}
else { //submit
	$object = $_POST;

	unset($object['event']);
	unset($object['action']);
	
	if (empty($object['parent'])) {
		$parent_object_path = CURRENT_PATH;
	} else {
		$parent_object_path = $object['parent'];
		unset($object['parent']);
	}

	$privs = array(
		'priv_admin_read' => ADMIN_READ,
		'priv_admin_write' => ADMIN_WRITE,
		'priv_admin_insert' => ADMIN_INSERT,
		'priv_member_read' => MEMBER_READ,
		'priv_member_write' => MEMBER_WRITE,
		'priv_member_insert' => MEMBER_INSERT,
		'priv_guest_read' => GUEST_READ,
		'priv_guest_write' => GUEST_WRITE,
		'priv_guest_insert' => GUEST_INSERT
	);

	$priv_groups = array(
		'group_admin_read' => ADMIN_READ,
		'group_admin_write' => ADMIN_WRITE,
		'group_admin_insert' => ADMIN_INSERT,
		'group_member_read' => MEMBER_READ,
		'group_member_write' => MEMBER_WRITE,
		'group_member_insert' => MEMBER_INSERT,
		'group_guest_read' => GUEST_READ,
		'group_guest_write' => GUEST_WRITE,
		'group_guest_insert' => GUEST_INSERT
	);

	if (!isset($object['priv'])) {
		$object['priv'] = 0;
		foreach ($privs as $priv => $value) {
			if (isset($object[$priv])) {
				$object['priv'] = $object['priv'] | $value;
				unset($object[$priv]);
			}
		}
	}

	if (!isset($object['priv_group'])) {
		$object['priv_group'] = 0;
		foreach ($priv_groups as $priv => $value) {
			if (isset($object[$priv])) {
				$object['priv_group'] = $object['priv_group'] | $value;
				unset($object[$priv]);
			}
		}
	}

	if (!empty($object['uploadattach'])) {
		$path = $object['uploadattach'];
		$filename = OBJ::get_attr($object['uploadattach'], 'title');
		$object['content'] .= '<div class="attach"><a href="'.$path.'">'.$filename.'</a></div>';
		unset($object['uploadattach']);
	}
	if (!empty($object['uploadphoto'])) {
		$path = $object['uploadphoto'];
		$object['content'] .= '<div class="photo"><a href="'.$path.'?inline" target="_blank"><img src="'.$path.'" /></a></div>';
		unset($object['uploadphoto']);
	}
	if (!empty($object['uploadvideo'])) {
		$path = $object['uploadvideo'];
		$object['content'] .= '<object type="application/x-shockwave-flash" width="720" height="576" wmode="transparent" data="/static/flvplayer.swf?file='.$path.'&autostart=true&repeat=true"><param name="movie" value="/static/flvplayer.swf?file='.$path.'&autostart=true&repeat=true" /><param name="wmode" value="transparent" /></object>';
		unset($object['uploadvideo']);
	}

	// `redirect` is not part of data... it only means where to redirect after insert
	if (isset($object['redirect'])) {
		$redirect = $object['redirect'];
		unset($object['redirect']);
	}

	// poke is enabled for all articles...
	$poke = parse_poke($object['content']); // by reference
	
	$status = OBJ::insert($parent_object_path, $object);
	switch ($status) {
		case NOT_ALLOWED: window::error('您没有权限在此发表内容！');
		case QUERY_ERROR: window::error('创建失败，请完整填写所需内容！');
		case PARENT_UNDEFINED: window::error('插入位置不合法，如果不清楚，请使用默认值');
		case OBJECT_EXISTS: window::error('名称已经被占用，请换一个！');
		default: break; //fall through, $status should contain the new path
	}

	// after I have known the object path, notify the guys poked
	foreach ($poke as $user) {
		OBJ::send_notify($status, 'poke', $user);
	}

	// if the object needs to be initialized...
	if (!empty($object['class'])) {
		$initmodule = modulefile($object['class'], 'init');
		if (@file_exists($initmodule)) {
			require $initmodule; // init module should be called by function init
			init($status); // status is the path of the new object
		}
	}

	if (!empty($redirect)) {
		// redirect to new path
		redirect($redirect);
	} else {
		// jump back
		echo '<script>window.location.href="'.$_SERVER['HTTP_REFERER'].'"</script>';
	}
	// the following is not comformant with RFC 2616
	// header("HTTP/1.1 301 Moved Permanently\r\nLocation: ".CURRENT_PATH);
}
?>
