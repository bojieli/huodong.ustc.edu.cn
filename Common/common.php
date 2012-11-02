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

function SendMail($address, $title, $message, $html = false) {

    vendor('PHPMailer.class#PHPMailer');

    $mail = new PHPMailer();
    // 设置PHPMailer使用SMTP服务器发送Email
    $mail->IsSMTP();

    // 设置邮件的字符编码，若不指定，则为'UTF-8'
    $mail->CharSet='UTF-8';

    // 添加收件人地址，若为数组则为添加多个收件人
    if (is_array($address)) {
    	foreach ($address as $addr)
	    $mail->AddAddress($addr);
    } else {
	$mail->AddAddress($address);
    }

    // 设置邮件正文
    $mail->Body=$message;

    // 设置邮件头的From字段。
    $mail->From=C('MAIL_ADDRESS');

    // 设置发件人名字
    $mail->FromName='校园活动平台';

    // 设置邮件标题
    $mail->Subject=$title;

    // 设置SMTP服务器。
    $mail->Host=C('MAIL_SMTP');

    // 设置为“需要验证”
    $mail->SMTPAuth=true;

    // 设置用户名和密码。
    $mail->Username=C('MAIL_LOGINNAME');
    $mail->Password=C('MAIL_PASSWORD');

    if ($html)
    	$mail->ContentType = 'text/html';
    else
    	$mail->ContentType = 'text/plain';

    // 发送邮件。
    return($mail->Send());
}
function shorturl($url='', $prefix='', $suffix='') {
    $base32 = array (
       'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
       'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p',
       'q', 'r', 's', 't', 'u', 'v', 'w', 'x',
       'y', 'z', '0', '1', '2', '3', '4', '5');
 
    $hex = md5($prefix.$url.$suffix);
    $hexLen = strlen($hex);
    $subHexLen = $hexLen / 8;
    $output = array();
    for ($i = 0; $i < $subHexLen; $i++) {
        $subHex = substr ($hex, $i * 8, 8);
        $int = 0x3FFFFFFF & (1 * ('0x'.$subHex));
        $out = '';
        for ($j = 0; $j < 6; $j++) {
            $val = 0x0000001F & $int;
            $out .= $base32[$val];
            $int = $int >> 5;
        }
        $output[] = $out;
    }
    $len=count($output);
	return $output[rand(0,$len)];
}
?>
