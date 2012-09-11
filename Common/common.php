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
    $mail->FromName='社团活动信息平台';

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
