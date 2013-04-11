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
			$fromUsername = $postObj->FromUserName;
			$toUsername = $postObj->ToUserName;
			$CreateTime = $postObj->CreateTime;
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
			case "text":
				$msgType= "text";
				$response1[0]['text1'] = $response['text1'];
				$resultStr = Tpl($msgType,$fromUsername, $toUsername,$time,$response1);
				break;
			case "news":
				$msgType = "news";
				$resultStr = Tpl($msgType,$fromUsername, $toUsername,$time,$info);
				break;
			case "music":
				$msgType= "music";
				$resultStr = Tpl($msgType,$fromUsername, $toUsername,$time,$info);
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
						$resultStr = Tpl($msgType,$fromUsername, $toUsername,$time,$content);
						break;
					case "text":
						$contentStr[0]['text1']= $call[1];
						$resultStr = Tpl($msgType,$fromUsername, $toUsername,$time,$content);
						break;
					case "music":
						$resultStr = Tpl($msgType,$fromUsername, $toUsername,$time,$content,1);
						break;
				}
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
				$content[0]['text1'] = "微小信无能为力哈/调皮，主人下课后回复你。";
				$resultStr = Tpl($msgType,$fromUsername, $toUsername,$time,$content);
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
	$xml = simplexml_load_file('http://bbs.ustc.edu.cn/cgi/bbsrss?board='.$sn);
	foreach($xml->channel->item as $key=>$value)
		$content[]=array(
			'text1' =>(String)$value->title,
			'text2' =>(String)$value->description,
			'url1' => '',
			'url2' => (String)$value->link
		);
	return array('news',$content);
}
public function findFreeRoom($funcInfo){
	$remote_server = "http://mis.teach.ustc.edu.cn/initkxjscx.do";
	$html = request_by_curl($remote_server);
	if(!$html) return;
	$localtime = $html->find('#dqzc')[0];
	$schoolweek = $localtime->value;
	$build = array('一教'=>11,'二教'=>12,'五教'=>15,'三教'=>33);
	$jxxq = $build[$funcInfo['text2']] ? $build[$funcInfo['text2']] : 11;
	$data =[
		'currentPage' => 1,
		'dqzc'        => $schoolweek,//当前教学周
		//'jc1'		  => ,        //当前节次
		'jxxq'        => $jxxq,         //11->一教,12->二教,15->五教,33->三教,0->all
		'rlbj'        => '',         //教室容量
		'zc'          => $schoolweek, //教学周
		'zr'          => date('N'),          //星期
		'jc'          => jc_now(time()+TIMEADD),       //节次
	];
	$post_string =http_build_query($data);
	$html->clear();
	$html = request_by_curl($remote_server,$post_string);
	if(!$html) return;
	$table = $html->find('table#jcxxtablerq',0);
	foreach($table->find('tr') as $key => $tr)
		foreach($tr->children as $key2 => $td)
			$re[$key][$key2] = $td->innertext;
	$html->clear();
	unset($re[0]);
	foreach($re as $key3 =>$val)
		$add .= "\n".$val[3].'	'.$val[6];
	$content = $add;
	return array('text',$content);
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
	echo jc_now(time()+TIMEADD);
}
}
?>