<?php
define("TOKEN", "stunionweixin20130404");
define("TIMEADD",1440);

class WeixinAction extends PublicAction{
public function index(){
	//$this->valid();
	$this->responseMsg();
	//$this->responseMsg();
}
public function valid()
{
        $echoStr = $_GET["echostr"];
        //valid signature , option
        if($this->checkSignature()){
        	echo $echoStr;
			exit;
        }
}
//Model
public function getTidByKeyword($keyword){
	return M('Keyword')->field('rid')->where(['keyword'=>$keyword])->find()['rid'];
}
public function getResponseByRid($rid){
    return M('Response')->where(['rid'=>$rid])->select();
}
public function getResponseByKeyword($keyword){
    return $this->getResponseByRid($this->getTidByKeyword($keyword));
}
//Model::end
public function responseMsg()
   {
		$t = $this->_get('t');
		if(empty($t)){
			$postStr = $GLOBALS["HTTP_RAW_POST_DATA"];
			if(empty($postStr)){
					echo "weixin api";
					return;
					}
			$postObj = simplexml_load_string($postStr, 'SimpleXMLElement', LIBXML_NOCDATA);
			$fromUserName = $postObj->fromUserName;
			$toUserName = $postObj->ToUserName;
			$CreateTime = $postObj->CreateTime;
			$keyword = trim($postObj->Content);
		}
		else {
			$keyword = $this->_get('k');
		}
		$time = time();  
			//dump($keyword);
		/*$msgType= "text";
		$content[0]['text1'] = "亲~呼叫【主菜单】吧，中国科大微小信温馨提示。/调皮";
		//dump($content);
		$resultStr = Tpl($msgType,$fromUserName, $toUserName,$time,$content);
		dump($resultStr);
		return;*/
		if(!empty($keyword))
		{
			$info = $this->getResponseByKeyword($keyword);
			$response = $info[0];
			switch($response['type']){
			case "text":
				$msgType= "text";
				$response1[0]['text1'] = $response['text1'];
				$resultStr = Tpl($msgType,$fromUserName, $toUserName,$time,$response1);
				break;
			case "news":
				$msgType = "news";
				$resultStr = Tpl($msgType,$fromUserName, $toUserName,$time,$info);
				break;
			case "music":
				$msgType= "music";
				$resultStr = Tpl($msgType,$fromUserName, $toUserName,$time,$info);
				break;
			case "func":
				$func = $response['text1'];
				$funcInfo = array(
					'keyword'=>$keyword,
					'CreateTime'=>$CreateTime,
					'text2' =>$response['text2']
				);
				$call = $this->$func($funcInfo);
				$msgType = $call[0];
				$content_tmp = $call[1];
				if(is_string($content_tmp))
					$content[0]['text1'] = $content_tmp;
				else 
					$content = $content_tmp;
					
				//dump($content);die;
				switch($msgType){
					case "news":
						$resultStr = Tpl($msgType,$fromUserName, $toUserName,$time,$content);
						break;
					case "text":
						$contentStr[0]['text1']= $call[1];
						$resultStr = Tpl($msgType,$fromUserName, $toUserName,$time,$content);
						break;
					case "music":
						$resultStr = Tpl($msgType,$fromUserName, $toUserName,$time,$content,1);
						break;
				}
				break;
			default:
				$content = $keyword."^".$CreateTime;//$CreateTime
				//dump($content);
				$content = urldecode($this->xiaojo($content,$fromUserName,$toUserName));
				$msgType= "text";
				if(empty($content))
					$content[0]['text1'] = "微小信无能为力哈/调皮，主人下课后回复你。";
				else 
					$content_xiaojo[0]['text1'] = $content;
				$resultStr = Tpl($msgType,$fromUserName, $toUserName,$time,$content_xiaojo);
			}
			if(empty($t))
				echo $resultStr;
			else
				echo($resultStr);
		}
		else{
			$msgType= "text";
			$content[0]['text1'] = "亲~呼叫【主菜单】吧，中国科大微小信温馨提示。/调皮";
			//dump($content);
			$resultStr = Tpl($msgType,$fromUserName, $toUserName,$time,$content);
			echo $resultStr;
		}
		return;
 
    }

public function findBus($funcInfo){
	$keyword = $funcInfo['keyword'];
	$CreateTime = $funcInfo['CreateTime'];
	$isCircle = array('直线','环线');
	$star = array(' ','*');
	$wayname = array(' ','东区到西区','东区到南区','西区到东区','西区到南区','南区到东区','南区到西区');
	foreach($wayname as $key => $value)
		if($value == $keyword)
			{$way = $key;break;}
	$name = $keyword;
	$con['way'] = $way;
	//if($CreateTime>1000000)
		//$time = date("H:i:s",$CreateTime);
	//else
		$time = date("H:i:s",time()+TIMEADD);
	$con['time']= array('gt',$time);
	$bus = M('Bus')->where($con)->limit('5')->order('time')->select();
	if(!$bus)
		return array("text","小信伤心地告诉你，你错过了".$name."末班车~");
	$next = "最近一班".$name."的校车在".$bus[0]['time']."出发，千万不要错过了哦。";
	foreach($bus as $val)
		$more .= $val['time'].$star[$val['star']]." ".$isCircle[$val['isCircle']]."(".$wayname[$way].")"."\n";
	return array("text",$next."\n"."更多："."\n".$more);
}
public function USTCRSS($funcInfo){
	$sn = $funcInfo['text2'];
	$xml = simplexml_load_file('http://rss.ustc.edu.cn/rssfeed.php?sn='.$sn);
	foreach($xml->channel->item as $key=>$value)
		$content[]=array(
			'text1' =>(String)$value->title,
			'text2' =>(String)$value->description,
			'url1' => '',
			'url2' => (String)$value->guid
		);
	return array('news',$content);
}
public function HanHaiRSS($funcInfo){
	$sn = $funcInfo['text2'];
	$xml = request_by_curl('http://bbs.ustc.edu.cn/cgi/bbsrss?board='.$sn,'xml');
	foreach($xml->channel->item as $key=>$value)
		$content[]=array(
			'text1' =>(String)$value->title,
			'text2' =>(String)$value->description,
			'url1' => '',
			'url2' => (String)$value->guid
		);
	return array('news',$content);
}
public function findFreeRoom($funcInfo){
	$remote_server = "http://mis.teach.ustc.edu.cn/initkxjscx.do";
	$data_tmp =[
		'jxxq'        => 11,         //11->一教,12->二教,15->五教,33->三教,0->all
		'zc'          => 7, //教学周
		'zr'          => 1,          //星期
		'jc'          => '6,7',    //节次
	];
	$post_string_tmp =http_build_query($data_tmp);
	$teachhtml = request_by_curl($remote_server,'html',$post_string_tmp);
	$localtime = $teachhtml->find('#dqzc',0);
	$schoolweek = $localtime->value;
	
	$build = array('一教'=>11,'二教'=>12,'五教'=>15,'三教'=>33);
	$jxxq = $build[$funcInfo['text2']] ? $build[$funcInfo['text2']] : 11;
	$teachhtml->clear();
	$add_time = 0;//
	$i = 0;
do{
	$i++;
	$jc = jc_now(time()+TIMEADD+$add_time);
	$today = date('N');
	$nextday = date('N',mktime(0,0,0)+3600*24);
	if($jc=='0,0'){
		$jc = '1,2';
		$zr = $nextday;
	}
	else 
		$zr = $today;
	$data =[
		'currentPage' => 1,
		'dqzc'        => $schoolweek,//当前教学周
		//'jc1'		  => ,        //当前节次
		'jxxq'        => $jxxq,         //11->一教,12->二教,15->五教,33->三教,0->all
		'rlbj'        => '',         //教室容量
		'zc'          => $schoolweek, //教学周
		'zr'          => $zr,          //星期
		'jc'          => $jc,    //节次
	];
	$post_string =http_build_query($data);
	$html = request_by_curl($remote_server,'html',$post_string);
	if(!$html) return;
	$table = $html->find('table#jcxxtablerq',0);
	foreach($table->find('tr') as $key => $tr)
		foreach($tr->children as $key2 => $td)
			$re[$key][$key2] = $td->innertext;
	$html->clear();
	unset($re[0]);
	if(empty($re))
		$add_time += 2*3600;
   }while(empty($re) && $i <= 5);
	foreach($re as $key3 =>$val)
		$add .= "\n".$val[3].'	'.$val[6];
	$content = $add;
	return array('text',$content);
}
public function xiaojo($yuanwen,$from,$to) //小九接口函数，该函数可通用于其他程序
{
   $yourdb = "";//私有库
   $yourpw = "";
   $yuanwen = $this->get_utf8_string($yuanwen);
   $yuanwen=urlencode($yuanwen);
   //dump($yuanwen);
   $yourdb=urlencode($yourdb);
   $from=urlencode($from);
   $to=urlencode($to);
   $doc = new DOMDocument();
   $doc->load("http://www.xiaojo.com/api3.php?chat=".$yuanwen."&db=".$yourdb."&pw=".$yourpw."&from=".$from."&to=".$to); //读取xml文件
   $youdaos = $doc->getElementsByTagName( "weixen" ); //取得humans标签的对象数组
	foreach( $youdaos as $youdao )
	{
	   $paragraphs = $youdao->getElementsByTagName( "responce" ); //取得name的标签的对象数组
	   $paragraph = $paragraphs->item(0)->nodeValue; //取得node中的值，如<name> </name>
	   $paragraph= $this->get_utf8_string($paragraph);
	}
   return $paragraph;
 
}
public function get_utf8_string($content) 
{    
	//  将一些字符转化成utf8格式   
	$encoding = mb_detect_encoding($content, array('ASCII','UTF-8','GB2312','GBK','BIG5'));  
	return  mb_convert_encoding($content, 'utf-8', $encoding);
}
private function checkSignature()
{
	$signature = $_GET["signature"];
	$timestamp = $_GET["timestamp"];
	$nonce = $_GET["nonce"];	
			
	$token = TOKEN;
	$tmpArr = array($token, $timestamp, $nonce);
	sort($tmpArr);
	$tmpStr = implode( $tmpArr );
	$tmpStr = sha1( $tmpStr );
	
	if( $tmpStr == $signature ){
		return true;
	}else{
		return false;
	}
}
public function test(){
	/*$data =[
		'currentPage' => 1,
		'dqzc'        => 7,
		'jc1'=>'7,8',
		'jxxq'=>15,
		'rlbj'=>'<=100',
		'zc'=>10,
		'zr'=>3,
		'jc'=>'3,4'
	];
	$this->findFreeRoom($data);*/
	//$teachhtml = request_by_curl("http://www.teach.ustc.edu.cn/page.asp?post=1134");
	//$em = $teachhtml->innertext;
	//$em = $body -> children;
	//dump($em);die;
	/*$data_tmp =[
		'jxxq'        => 11,         //11->一教,12->二教,15->五教,33->三教,0->all
		'zc'          => 7, //教学周
		'zr'          => 1,          //星期
		'jc'          => '6,7',    //节次
	];
	$post_string_tmp =http_build_query($data_tmp);
	//$post_string_tmp = '';*/
	$remote_server = "http://mis.teach.ustc.edu.cn/initkxjscx.do";
	$post_string_tmp = '';
	$teachhtml = request_by_curl($remote_server,'html',$post_string_tmp);
	dump($teachhtml);
	echo jc_now(time()+TIMEADD);
}
}
?>