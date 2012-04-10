<?php
// module/blind/screen.php 2011-08-27

if (!defined('IN_GEWU')) {
	exit(header('HTTP/1.1 403 Forbidden'));
}
$data = OBJ::get_attr(CURRENT_PATH, 'content');

if (isset($_GET['top']) && is_numeric($_GET['top'])) {
	$top = $_GET['top'];
} else {
	$top = 0;
}

$rows = 15;
$cols = 20;
$table = array();
for ($i=0; $i<$rows; $i++) {
	for ($j=0; $j<$cols; $j++) {
		if (!empty($data[($i + $top) * $cols + $j])) {
			$table[$i][$j] = $data[($i + $top) * $cols + $j];
		} else {
			$table[$i][$j] = 0;
		}
	}
}
?>
<head>
<meta http-equiv="refresh" content="1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style>
.blind { border-collapse: collapse; }
.blind td { height: 30px; width: 25px; border: 4px solid #CDCDCD; }
.blind .on { background: #000; }
.blind .off { background: #FFF; }
</style>
</head>
<body>
<table class="blind">
<?php 
echo '<tr><th></th>';
for ($j=1; $j<=$cols; $j++) {
	echo "<th>$j</th>";
}
echo '</tr>';

for ($i=0; $i<$rows; $i++) {
	echo '<tr>';
	echo '<th>'.($i + $top + 1).'</th>';
	for ($j=0; $j<$cols; $j++) {
		echo '<td class="';
		echo ($table[$i][$j] == '1') ? 'on' : 'off';
		echo '">&nbsp;</td>';
	}
	echo "</tr>\n";
} ?>
</table>
</body>
