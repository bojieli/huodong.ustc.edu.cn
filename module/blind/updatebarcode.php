<?php
// module/blind/updatebarcode.php 2011-08-27

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}

// EAN-13:00000000000000
$input = explode(':', $_GET['barcode']);
$barcode = $input[1];

if (is_numeric($barcode)) {
	OBJ::insert(CURRENT_PATH, array('class' => 'barcode', 'content' => $barcode));
}

// echo back to screen
echo $barcode."\n";
?>
