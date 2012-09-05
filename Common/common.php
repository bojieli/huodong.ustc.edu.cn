<?php
$_G = array();

// common function routines
function random($length) {
	$s = '';
	for ($i=0; $i<$length; $i++) {
		$ord = rand() % 62;
		if ($ord < 26)
			$c = chr($ord + ord('a'));
		else if ($ord < 52)
			$c = chr($ord - 26 + ord('A'));
		else
			$c = chr($ord - 52 + ord('0'));
		$s .= $c;
	}
	return $s;
}
