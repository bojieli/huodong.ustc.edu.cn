<?php
define("TOKEN", "stunionweixin20130404");

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
			$fromUsername = $postObj->FromUserName;
			$toUsername = $postObj->ToUserName;
			$keyword = trim($postObj->Content);
		}
		else {
			$keyword = $this->_get('k');
		}
		$time = time();                
		if(!empty($keyword))
		{
			$info = $this->getResponseByKeyword($keyword);
			$response = $info[0];
			switch($response['type']){
			case "func":
				$func = $response['text1'];
				$call = $this->$func($keyword);
				$msgType = $call[0];
				$contentStr = $call[1];
				$resultStr = sprintf(Tpl($msgType,$fromUsername, $toUsername,$time),$contentStr);
				break;
			case "news":
				$msgType = "news";
				$Title = $response['text1'];
				$Description = $response['text2'];
				$PicUrl = $response['url1'];
				$Url = $response['url2'];
				$resultStr = sprintf(Tpl($msgType,$fromUsername, $toUsername,$time),$Title,$Description,$PicUrl,$Url);
				break;
			case "text":
				$msgType= "text";
				$contentStr = $response['text1'];
				$resultStr = sprintf(Tpl($msgType,$fromUsername, $toUsername,$time),$contentStr);
				break;
			case "music":
				$msgType= "music";
				$Title = $response['text1'];
				$Description = $response['text2'];
				$MusicUrl = $response['url1'];
				$HQMusic = $response['url2'];
				$resultStr = sprintf(Tpl($msgType,$fromUsername, $toUsername,$time),$Title,$Description,$MusicUrl,$HQMusic);
				break;
			/*case "教学日历":
				$msgType = "news";
				$Title = "教学日历";
				$Description = "亲~你可以订阅教学日历到你的Gmail";
				$PicUrl = "http://huodong.ustc.edu.cn/static/weixin/jxrl.jpg";
				$Url = "http://www.teach.ustc.edu.cn/page.asp?post=1134";
				$resultStr = sprintf(Tpl($msgType,$fromUsername, $toUsername,$time),$Title,$Description,$PicUrl,$Url);
				break;*/
			default:
				$msgType= "text";
				$contentStr = "微小信无能为力哈/调皮，主人下课后回复你。";
				$resultStr = sprintf(Tpl($msgType,$fromUsername, $toUsername,$time),$contentStr);
			}
			if(empty($t))
				echo $resultStr;
			else
				dump($resultStr);
		}
		else{
			echo "亲~呼叫【主菜单】吧，中国科大微小信温馨提示。/调皮";					
		}      
 
    }

public function findBus($keyword){
	$isCircle = array('直线','环线');
	$star = array(' ','*');
	$wayname = array(' ','东区到西区','东区到南区','西区到东区','西区到南区','南区到东区','南区到西区');
	foreach($wayname as $key => $value)
		if($value == $keyword)
			{$way = $key;break;}
	$name = $keyword;
	$con['way'] = $way;
	$con['time']= array('gt',date("H:i:s"));
	$bus = M('Bus')->where($con)->limit('5')->order('time')->select();
	if(!$bus)
		return array("text","小信伤心地告诉你，你错过了".$name."末班车~");
	$next = "最近一班".$name."的校车在".$bus[0]['time']."出发，千万不要错过了哦。";
	foreach($bus as $val)
		$more .= $val['time'].$star[$val['star']]." ".$isCircle[$val['isCircle']]."(".$wayname[$way].")"."\n";
	return array("text",$next."\n"."更多："."\n".$more);
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
	echo $this->findBus(1);
}
}
?>