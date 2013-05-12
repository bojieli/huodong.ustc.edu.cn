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
function xss_clean($data)
{
// Fix &entity\n;
$data = str_replace(array('&amp;','&lt;','&gt;'), array('&amp;amp;','&amp;lt;','&amp;gt;'), $data);
$data = preg_replace('/(&#*\w+)[\x00-\x20]+;/u', '$1;', $data);
$data = preg_replace('/(&#x*[0-9A-F]+);*/iu', '$1;', $data);
$data = html_entity_decode($data, ENT_COMPAT, 'UTF-8');
// Remove any attribute starting with "on" or xmlns
$data = preg_replace('#(<[^>]+?[\x00-\x20"\'])(?:on|xmlns)[^>]*+>#iu', '$1>', $data);
// Remove javascript: and vbscript: protocols
$data = preg_replace('#([a-z]*)[\x00-\x20]*=[\x00-\x20]*([`\'"]*)[\x00-\x20]*j[\x00-\x20]*a[\x00-\x20]*v[\x00-\x20]*a[\x00-\x20]*s[\x00-\x20]*c[\x00-\x20]*r[\x00-\x20]*i[\x00-\x20]*p[\x00-\x20]*t[\x00-\x20]*:#iu', '$1=$2nojavascript...', $data);
$data = preg_replace('#([a-z]*)[\x00-\x20]*=([\'"]*)[\x00-\x20]*v[\x00-\x20]*b[\x00-\x20]*s[\x00-\x20]*c[\x00-\x20]*r[\x00-\x20]*i[\x00-\x20]*p[\x00-\x20]*t[\x00-\x20]*:#iu', '$1=$2novbscript...', $data);
$data = preg_replace('#([a-z]*)[\x00-\x20]*=([\'"]*)[\x00-\x20]*-moz-binding[\x00-\x20]*:#u', '$1=$2nomozbinding...', $data);
// Only works in IE: <span style="width: expression(alert('Ping!'));"></span>
$data = preg_replace('#(<[^>]+?)style[\x00-\x20]*=[\x00-\x20]*[`\'"]*.*?expression[\x00-\x20]*\([^>]*+>#i', '$1>', $data);
$data = preg_replace('#(<[^>]+?)style[\x00-\x20]*=[\x00-\x20]*[`\'"]*.*?behaviour[\x00-\x20]*\([^>]*+>#i', '$1>', $data);
$data = preg_replace('#(<[^>]+?)style[\x00-\x20]*=[\x00-\x20]*[`\'"]*.*?s[\x00-\x20]*c[\x00-\x20]*r[\x00-\x20]*i[\x00-\x20]*p[\x00-\x20]*t[\x00-\x20]*:*[^>]*+>#iu', '$1>', $data);
// Remove namespaced elements (we do not need them)
$data = preg_replace('#</*\w+:\w[^>]*+>#i', '', $data);
do
{
        // Remove really unwanted tags
        $old_data = $data;
        $data = preg_replace('#</*(?:applet|b(?:ase|gsound|link)|embed|frame(?:set)?|i(?:frame|layer)|l(?:ayer|ink)|meta|object|s(?:cript|tyle)|title|xml)[^>]*+>#i', '', $data);
}
while ($old_data !== $data);
// we are done...
return $data;
}
function picToBase64($file){
	//dump($file);
	//$file="../Web/application/Plugin/MyBlog/big.png"; 
	$type=getimagesize($file);//取得图片的大小，类型等
	//dump($type);
	$fp=fopen($file,"r")or die("Can't open file");
	$file_content=chunk_split(base64_encode(fread($fp,filesize($file))));//base64编码 
	//echo $file_content;//输出图片的二进制代码
	switch($type[2]){//判读图片类型  
	case 1:$img_type="gif";break;  
	case 2:$img_type="jpg";break;  
	case 3:$img_type="png";break;  
	}  
	$img='data:image/'.$img_type.';base64,'.$file_content;//合成图片的base64编码 
	fclose($fp);
	return $img;
}
/**
 * 发送文件
 *
 * @author: legend(legendsky@hotmail.com)
 * @link: http://www.ugia.cn/?p=109
 * @description: send file to client
 * @version: 1.0
 *
 * @param string   $fileName      文件名称或路径
 * @param string   $fancyName     自定义的文件名,为空则使用filename
 * @param boolean  $forceDownload 是否强制下载
 * @param integer  $speedLimit    速度限制,单位为字节,0为不限制,不支持windows服务器
 * @param string   $$contentType  文件类型,默认为application/octet-stream
 *
 * @return boolean
 */
function sendFile($fileName, $fancyName = '', $forceDownload = true, $speedLimit = 0, $contentType = '')
{
    if (!is_readable($fileName))
    {
        header("HTTP/1.1 404 Not Found");
        return false;
    }

    $fileStat = stat($fileName);
    $lastModified = $fileStat['mtime'];
    
    $md5 = md5($fileStat['mtime'] .'='. $fileStat['ino'] .'='. $fileStat['size']);
    $etag = '"' . $md5 . '-' . crc32($md5) . '"';

    header('Last-Modified: ' . gmdate("D, d M Y H:i:s", $lastModified) . ' GMT');
    header("ETag: $etag");
    
    if (isset($_SERVER['HTTP_IF_MODIFIED_SINCE']) && strtotime($_SERVER['HTTP_IF_MODIFIED_SINCE']) >= $lastModified)
    {
        header("HTTP/1.1 304 Not Modified");
        return true;
    }

    if (isset($_SERVER['HTTP_IF_UNMODIFIED_SINCE']) && strtotime($_SERVER['HTTP_IF_UNMODIFIED_SINCE']) < $lastModified)
    {
        header("HTTP/1.1 304 Not Modified");
        return true;
    }

    if (isset($_SERVER['HTTP_IF_NONE_MATCH']) &&  $_SERVER['HTTP_IF_NONE_MATCH'] == $etag)
    {
        header("HTTP/1.1 304 Not Modified");
        return true;
    }

    if ($fancyName == '')
    {
        $fancyName = basename($fileName);
    }
    
    if ($contentType == '')
    {
        $contentType = 'application/octet-stream';
    }

    $fileSize = $fileStat['size'];   
    
    $contentLength = $fileSize;
    $isPartial = false;

    if (isset($_SERVER['HTTP_RANGE']))
    {
        if (preg_match('/^bytes=(\d*)-(\d*)$/', $_SERVER['HTTP_RANGE'], $matches))
        {    
            $startPos = $matches[1];
            $endPos = $matches[2];

            if ($startPos == '' && $endPos == '')
            {
                return false;
            }
            
            if ($startPos == '')
            {
                $startPos = $fileSize - $endPos;
                $endPos = $fileSize - 1;
            }
            else if ($endPos == '')
            {
                $endPos = $fileSize - 1;
            }

            $startPos = $startPos < 0 ? 0 : $startPos;
            $endPos = $endPos > $fileSize - 1 ? $fileSize - 1 : $endPos;

            $length = $endPos - $startPos + 1;

            if ($length < 0)
            {
                return false;
            }

            $contentLength = $length;
            $isPartial = true;
        }
    }
    
    // send headers
    if ($isPartial)
    {
        header('HTTP/1.1 206 Partial Content');
        header("Content-Range: bytes $startPos-$endPos/$fileSize");
        
    }
    else
    {
        header("HTTP/1.1 200 OK");
        $startPos = 0;
        $endPos = $contentLength - 1;
    }

    header('Pragma: cache');
    header('Cache-Control: public, must-revalidate, max-age=0');
    header('Accept-Ranges: bytes');
    header('Content-type: ' . $contentType);
    header('Content-Length: ' . $contentLength);
    
    if ($forceDownload)
    {
        header('Content-Disposition: attachment; filename="' . rawurlencode($fancyName). '"');
    }

    header("Content-Transfer-Encoding: binary");
    
    $bufferSize = 2048;

    if ($speedLimit != 0)
    {
        $packetTime = floor($bufferSize * 1000000 / $speedLimit);
    }

    $bytesSent = 0;
    $fp = fopen($fileName, "rb");
    fseek($fp, $startPos);

    //fpassthru($fp);
    
    while ($bytesSent < $contentLength && !feof($fp) && connection_status() == 0 )
    {
        if ($speedLimit != 0)
        {
            list($usec, $sec) = explode(" ", microtime()); 
            $outputTimeStart = ((float)$usec + (float)$sec);
        }

        $readBufferSize = $contentLength - $bytesSent < $bufferSize ? $contentLength - $bytesSent : $bufferSize;
        $buffer = fread($fp, $readBufferSize);        

        echo $buffer;

        ob_flush();
        flush();

        $bytesSent += $readBufferSize;
        
        if ($speedLimit != 0)
        {
            list($usec, $sec) = explode(" ", microtime()); 
            $outputTimeEnd = ((float)$usec + (float)$sec);
            
            $useTime = ((float) $outputTimeEnd - (float) $outputTimeStart) * 1000000;
            $sleepTime = round($packetTime - $useTime);
            if ($sleepTime > 0)
            {
                usleep($sleepTime);
            }
        }
    }
    return true;
}
function split_sms($msg,$type='utf8'){
		$len_re=strlen($msg);
		$i=0;
		$num_re=0;
		while(1){
		$msg_tmp=mb_strcut($msg,$num_re==0?0:($num_re),$len_re-$num_re>200?200:$len_re-$num_re,$type);
		if($msg_tmp=='')break;
		$per_re=strlen($msg_tmp);
		$num_re+=$per_re;
		$tmp[$i]=$msg_tmp;
		$i++;
		if($num_re-$len_re>=0){break;}
		};
		return $tmp;
}
function UserInfoOption($Chinese){
  switch($Chinese){
    case "姓名":return "realname";break;
    case "性别":return "gender";break;
    case "学号":return "student_no";break;
    case "入学年":return "grade";break;
    case "手机":return "telephone";break;
    case "邮箱":return "email";break;
    case "学历":return "education";break;
    case "学院":return "dept";break;
    case "个人网站":return "homepage";break;
    case "个人爱好":return "hobby";break;
    case "QQ":return "QQ";break;
	default:return;
  }
}
function UserGender($Chinese){
	$man = array("男","男人","男生","man","Man","MAN","M","雄性","雄","male","Male","MALE","boy","Boy","BOY","B");
	if (in_array($Chinese,$man))
		return 1;
	return 0;
}
function Tpl($msgType,$fromUsername, $toUsername,$time,$content,$n = 5,$flag=0){
		$head = "<xml>
 <ToUserName><![CDATA[".$fromUsername."]]></ToUserName>
 <FromUserName><![CDATA[".$toUsername."]]></FromUserName>
 <CreateTime>".$time."</CreateTime>
 <MsgType><![CDATA[".$msgType."]]></MsgType>";
		$end = " \n <FuncFlag>".$flag."</FuncFlag>
</xml>";
		switch($msgType){
		case "text":
		$form = '<Content><![CDATA['.$content[0]['text1'].']]></Content>';break;
		case "music":
		$form = '<Music>
				 <Title><![CDATA['.$content[0]['text1'].']]></Title>
				 <Description><![CDATA['.$content[0]['text2'].']]></Description>
				 <MusicUrl><![CDATA['.$content[0]['url1'].']]></MusicUrl>
				 <HQMusicUrl><![CDATA['.$content[0]['url2'].']]></HQMusicUrl>
				 </Music>';break;
		case "news":
		foreach($content as $val){
		$item .= '<item>
				 <Title><![CDATA['.$val['text1'].']]></Title> 
				 <Description><![CDATA['.$val['text2'].']]></Description>
				 <PicUrl><![CDATA['.$val['url1'].']]></PicUrl>
				 <Url><![CDATA['.$val['url2'].']]></Url>
				 </item>';
				 }
		$form='<ArticleCount>'.$n.'</ArticleCount>
				 <Articles>'.$item.'
			     </Articles>';		
				break;
		}
		return $head.$form.$end;
		
	}
/**
* Curl版本
* 使用方法：
* $post_string = "app=request&version=beta";
* request_by_curl('http://facebook.cn/restServer.php',$post_string);
*/
function request_by_curl($remote_server,$type="html",$post_string){
$ch = curl_init();
curl_setopt($ch,CURLOPT_URL,$remote_server);
curl_setopt($ch,CURLOPT_POSTFIELDS,'mypost='.$post_string);
curl_setopt($ch,CURLOPT_RETURNTRANSFER,true);
curl_setopt($ch,CURLOPT_USERAGENT,"Taixing Lin");
$data = curl_exec($ch);
curl_close($ch);
require_once('Common/simple_html_dom.php');
if($type=="html")
	return str_get_html($data);
else 
	return simplexml_load_string($data);
}
function jc_now($time){
    define("WC",0);
	if(!$time) $time=time();
	$jc = ['1,2','3,4','6,7','9,10','11,12'];
	if($time < mktime(9,25,0)-WC)
		return $jc[0];
	if($time < mktime(12,10,0)-WC)
		return $jc[1];
	if($time < mktime(16,25,0)-WC)
		return $jc[2];
	if($time < mktime(18,20,0)-WC)
		return $jc[3];
	if($time < mktime(21,55,0)-WC)
		return $jc[4];
	return '0,0';
}
function xipai($var){
	$n = count($var);
	for($i=0;$i<$n;$i++){
		$rand = mt_rand(0,$n-1);
		if($rand != $i){
			$tmp = $var[$i]; 
			$var[$i] = $var[$rand];
			$var[$rand] = $tmp;
		}
	}
	return $var;
}
function biaoqing($content)
    {
	    if(strstr($content,"/:")){
        if(preg_match("/\/::\)/",$content)){

        $content = "笑话";
          
        }
        elseif(preg_match("/\/::~/",$content)){

        $content = "撇嘴";

        }
        elseif(preg_match("/\/::B/",$content)){

        $content = "色";

        }
        elseif(preg_match("/\/:,@f/",$content)){

        $content = "奋斗";

        }
        elseif(preg_match("/\/:heart/",$content)){

        $content = "爱心";

        }
        elseif(preg_match("/\/:showlove/",$content)){

        $content = "嘴唇";

        }
        elseif(preg_match("/\/:cake/",$content)){

        $content = "蛋糕";

        }
        elseif(preg_match("/\/:gift/",$content)){

        $content = "礼物";

        }
        elseif(preg_match("/\/:handclap/",$content)){

        $content = "鼓掌";

        }
        elseif(preg_match("/\/::\*/",$content)){

        $content = "亲亲";

        }
        elseif(preg_match("/\/:rose/",$content)){

        $content = "玫瑰";

        }
        elseif(preg_match("/\/:kiss/",$content)){

        $content = "献吻";

        }
        elseif(preg_match("/\/:love/",$content)){

        $content = "爱情";

        }
        elseif(preg_match("/\/:ok/",$content)){

        $content = "OK";

        }
        elseif(preg_match("/\/:lvu/",$content)){

        $content = "爱你";

        }
        elseif(preg_match("/\/:jj/",$content)){

        $content = "勾引";

        }
        elseif(preg_match("/\/:@\)/",$content)){

        $content = "抱拳";

        }
        elseif(preg_match("/\/:share/",$content)){

        $content = "握手";

        }
        elseif(preg_match("/\/:hug/",$content)){

        $content = "拥抱";

        }
        elseif(preg_match("/\/::\-O/",$content)){

        $content = "哈欠";

        }
        elseif(preg_match("/\/:xx/",$content)){

        $content = "敲打";

        }
        elseif(preg_match("/\/:\-\-b/",$content)){

        $content = "冷汗";

        }
        elseif(preg_match("/\/::X/",$content)){

        $content = "闭嘴";

        }
        elseif(preg_match("/\/:no/",$content)){

        $content = "NO";

        }
        elseif(preg_match("/\/::@/",$content)){

        $content = "发怒";

        }
        elseif(preg_match("/\/::\(/",$content)){

        $content = "难过";

        }
        elseif(preg_match("/\/::Q/",$content)){

        $content = "抓狂";

        }
        elseif(preg_match("/\/::T/",$content)){

        $content = "吐";

        }
        elseif(preg_match("/\/::d/",$content)){

        $content = "白眼";

        }
        elseif(preg_match("/\/::!/",$content)){

        $content = "惊恐";

        }
        elseif(preg_match("/\/::L/",$content)){

        $content = "流汗";

        }
        elseif(preg_match("/\/::\-S/",$content)){

        $content = "咒骂";

        }
        elseif(preg_match("/\/:,@@/",$content)){

        $content = "晕";

        }
        elseif(preg_match("/\/::8/",$content)){

        $content = "疯了";

        }
        elseif(preg_match("/\/:,@!/",$content)){

        $content = "衰";

        }
        elseif(preg_match("/\/:!!!/",$content)){

        $content = "骷髅";

        }
        elseif(preg_match("/\/:dig/",$content)){

        $content = "抠鼻";

        }
        elseif(preg_match("/\/:pd/",$content)){

        $content = "菜刀";

        }
        elseif(preg_match("/\/:pig/",$content)){

        $content = "猪头";

        }
        elseif(preg_match("/\/:fade/",$content)){

        $content = "凋谢";

        }
        elseif(preg_match("/\/:break/",$content)){

        $content = "心碎";

        }
        elseif(preg_match("/\/:li/",$content)){

        $content = "闪电";

        }
        elseif(preg_match("/\/:bome/",$content)){

        $content = "炸弹";

        }
        elseif(preg_match("/\/:kn/",$content)){

        $content = "刀";

        }
        elseif(preg_match("/\/:shit/",$content)){

        $content = "便便";

        }
        elseif(preg_match("/\/::\+/",$content)){

        $content = "酷";

        }
        elseif(preg_match("/\/:,@o/",$content)){

        $content = "傲慢";

        }
        elseif(preg_match("/\/:X-\)/",$content)){

        $content = "阴险";

        }
        elseif(preg_match("/\/:v/",$content)){

        $content = "胜利";

        }
        elseif(preg_match("/\/:turn/",$content)){

        $content = "回头";

        }
        elseif(preg_match("/\/:ladybug/",$content)){

        $content = "瓢虫";

        }
        elseif(preg_match("/\/:,@x/",$content)){

        $content = "嘘";

        }
        elseif(preg_match("/\/::,@/",$content)){

        $content = "悠闲";

        }
        elseif(preg_match("/\/:8-\)/",$content)){

        $content = "得意";

        }
        elseif(preg_match("/\/:#-0/",$content)){

        $content = "激动";

        }
        elseif(preg_match("/\/:kotow/",$content)){

        $content = "磕头";

        }
        elseif(preg_match("/\/:@x/",$content)){

        $content = "吓";

        }
        elseif(preg_match("/\/:8\*/",$content)){

        $content = "可怜";

        }
        elseif(preg_match("/\/:P-\(/",$content)){

        $content = "委屈";

        }
        elseif(preg_match("/\/:B-\)/",$content)){

        $content = "坏笑";

        }
        elseif(preg_match("/\/:&-\(/",$content)){

        $content = "糗大了";

        }
        elseif(preg_match("/\/:\?/",$content)){

        $content = "疑问";

        }
        elseif(preg_match("/\/::$/",$content)){

        $content = "害羞";

        }
        elseif(preg_match("/\/::P/",$content)){

        $content = "调皮";

        }
        elseif(preg_match("/\/::D/",$content)){

        $content = "呲牙";

        }
        elseif(preg_match("/\/::O/",$content)){

        $content = "惊讶";

        }
        elseif(preg_match("/\/:,@-D/",$content)){

        $content = "愉快";

        }
        elseif(preg_match("/\/:,@P/",$content)){

        $content = "偷笑";

        }
        elseif(preg_match("/\/::</",$content)){

        $content = "流泪";

        }
        elseif(preg_match("/\/:weak/",$content)){

        $content = "弱";

        }
        elseif(preg_match("/\/:<@/",$content)){

        $content = "左哼哼";

        }
        elseif(preg_match("/\/:@>/",$content)){

        $content = "右哼哼";
          
        }
        elseif(preg_match("/\/:wipe/",$content)){

        $content = "擦汗";

        }
        elseif(preg_match("/\/:@@/",$content)){

        $content = "拳头";

        }
        elseif(preg_match("/\/:bad/",$content)){

        $content = "差劲";

        }
        elseif(preg_match("/\/:shake/",$content)){

        $content = "发抖";

        }
        elseif(preg_match("/\/:moon/",$content)){

        $content = "月亮";

        }
        elseif(preg_match("/\/::Z/",$content)){

        $content = "睡";

        }
        elseif(preg_match("/\/:bye/",$content)){

        $content = "再见";

        }
        elseif(preg_match("/\/:beer/",$content)){

        $content = "啤酒";

        }
        elseif(preg_match("/\/::g/",$content)){

        $content = "饥饿";

        }
        elseif(preg_match("/\/:eat/",$content)){

        $content = "吃饭";

        }
        elseif(preg_match("/\/:coffee/",$content)){
        
        $content = "咖啡";

        }
        elseif(preg_match("/\/:sun/",$content)){

        $content = "太阳";

        }
        elseif(preg_match("/\/:hiphot/",$content)){

        $content = "街舞";

        }
        elseif(preg_match("/\/:footb/",$content)){

        $content = "足球";

        }
        elseif(preg_match("/\/:oo/",$content)){

        $content = "乒乓";

        }
        elseif(preg_match("/\/:basketb/",$content)){

        $content = "篮球";

        }
        elseif(preg_match("/\/:jump/",$content)){

        $content = "跳跳";

        }
        elseif(preg_match("/\/:circle/",$content)){

        $content = "转圈";

        }
        elseif(preg_match("/\/:skip/",$content)){

        $content = "跳绳";

        }
        elseif(preg_match("/\/:<&/",$content)){

        $content = "左太极";

        }
        elseif(preg_match("/\/:&>/",$content)){

        $content = "右太极";

        }
        elseif(preg_match("/\/:strong/",$content)){

        $content = "强";

        }
        elseif(preg_match("/\/::>/",$content)){

        $content = "憨笑";

        }
        elseif(preg_match("/\/:<L>/",$content)){

        $content = "飞吻";

        }
        elseif(preg_match("/\/::-\|/",$content)){

        $content = "尴尬";

        }
        elseif(preg_match("/\/:oY/",$content)){

        $content = "投降";

        }
        elseif(preg_match("/\/:>-\|/",$content)){

        $content = "鄙视";

        }
        elseif(preg_match("/\/::\|/",$content)){

        $content = "发呆";

        }
        elseif(preg_match("/\/:\<W\>/",$content)){

        $content = "西瓜";

        }
        elseif(preg_match("/\/:\|\-\)/",$content)){

        $content = "困";

        }
        elseif(preg_match("/\/:/",$content)){

        $content = "怄火";

        }
		}
        
      
	return $content;
    }

?>
