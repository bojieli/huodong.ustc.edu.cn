<?php
// module/user/checkloginname.php

// should be used by ajax

if (user::is_login_name_valid($_GET['loginname'])) {
	echo '';
} else {
	echo '登录名已经被占用，请换一个';
}
?>
