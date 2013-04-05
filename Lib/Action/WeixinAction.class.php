<?php
define("TOKEN", "stunionweixin20130404");

class WeixinAction extends PublicAction{
public function index(){
	//$this->valid();
	$this->responseMsg();
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
public function responseMsg()
    {
		$postStr = $GLOBALS["HTTP_RAW_POST_DATA"];
		if (!empty($postStr)){
                
              	$postObj = simplexml_load_string($postStr, 'SimpleXMLElement', LIBXML_NOCDATA);
                $fromUsername = $postObj->FromUserName;
                $toUsername = $postObj->ToUserName;
                $keyword = trim($postObj->Content);
				$time = time();                
				if(!empty( $keyword ))
                {
              		$menu = "你好~这里是中国科大学生会微信公共平台，目前我们提供以下服务，更多功能尚在开发中:
					→中国科大学生会【简介】
					→合肥【天气】预报（如有不准请质问度娘）
					→更多【链接】
					→【校车】时刻表
					→春夏学期【教学日历】
					→【微小信教育委员会】
					→【教室空闲时间】查询
					→时令服务：【巾帼杯】【学科知识竞赛】追踪报道
					→【揭皇榜】题目实时查询
					→限时服务：【春游】路线推荐
					→新增活动【每日一书】【新片速递】
					→若您有权益问题，请回复【“呼叫小权”+你要说的内容】
					";
					$text1="中国科大学生会人人公共主页：http://page.renren.com/600756323?id=600756323
							中国科大学生会新浪微博：http://e.weibo.com/ustcsu/profile
							中国科大学生会微刊：http://kan.weibo.com/kan/3527939242049698
							综合教务系统：
							http://mis.teach.ustc.edu.cn/userinit.do";
					$text2="欢迎来到微小信教育委员会~微小信每天会准备5道题给大家，并且不定期的统计累计答对题数最多的小盆友给你惊喜哦。
					今日【第一题·古诗】
					“斜晖脉脉水悠悠”的上一句是？
					答案是什么呢？答对的话第二题就会出现了哟";
					switch($keyword){
					case "主菜单":
						$msgType= "text";
						$contentStr = $menu;
						$resultStr = sprintf(Tpl($msgType,$fromUsername, $toUsername,$time),$contentStr);
						break;
					case "简介":
						$msgType = "news";
						$Title = "中国科学技术大学学生会简介";
						$Description = "中国科大学生会是中国科学技术大学学生联合会的简称，它接受校党委的领导和团委的指导，依照法律、学校规章制度和自己的章程，独立自主地开展工作的学生群众组织。学生会的定位是：服务同学，服务大局，我们的宗旨是：自我服务，自我管理，自我教育。";
						$PicUrl = "http://huodong.ustc.edu.cn/static/weixin/xsh.jpg";
						$Url = "http://stunion.ustc.edu.cn/";
						$resultStr = sprintf(Tpl($msgType,$fromUsername, $toUsername,$time),$Title,$Description,$PicUrl,$Url);
						break;
					case "天气":
						$msgType= "text";
						$contentStr = "你问我，我问谁？/调皮";
						$resultStr = sprintf(Tpl($msgType,$fromUsername, $toUsername,$time),$contentStr);
						break;
					case "链接":
						$msgType= "text";
						$contentStr = $text1;
						$resultStr = sprintf(Tpl($msgType,$fromUsername, $toUsername,$time),$contentStr);
						break;
					case "校车":
						$msgType= "text";
						$contentStr = "亲~告诉我想要查询校车的始发校区和目地校区啦。"."\n"."例如：东区到西区";
						$resultStr = sprintf(Tpl($msgType,$fromUsername, $toUsername,$time),$contentStr);
						break;
					case "东区到西区":
						$msgType= "text";
						$contentStr = $this->findBus(1);
						$resultStr = sprintf(Tpl($msgType,$fromUsername, $toUsername,$time),$contentStr);
						break;
					case "东区到南区":
						$msgType= "text";
						$contentStr = $this->findBus(2);
						$resultStr = sprintf(Tpl($msgType,$fromUsername, $toUsername,$time),$contentStr);
						break;
					case "西区到东区":
						$msgType= "text";
						$contentStr = $this->findBus(3);
						$resultStr = sprintf(Tpl($msgType,$fromUsername, $toUsername,$time),$contentStr);
						break;
					case "西区到南区":
						$msgType= "text";
						$contentStr = $this->findBus(4);
						$resultStr = sprintf(Tpl($msgType,$fromUsername, $toUsername,$time),$contentStr);
						break;					
					case "南区到东区":
						$msgType= "text";
						$contentStr = $this->findBus(5);
						$resultStr = sprintf(Tpl($msgType,$fromUsername, $toUsername,$time),$contentStr);
						break;
					case "南区到西区":
						$msgType= "text";
						$contentStr = $this->findBus(6);
						$resultStr = sprintf(Tpl($msgType,$fromUsername, $toUsername,$time),$contentStr);
						break;
					case "教学日历":
						$msgType = "news";
						$Title = "教学日历";
						$Description = "亲~你可以订阅教学日历到你的Gmail";
						$PicUrl = "http://huodong.ustc.edu.cn/static/weixin/jxrl.jpg";
						$Url = "http://www.teach.ustc.edu.cn/page.asp?post=1134";
						$resultStr = sprintf(Tpl($msgType,$fromUsername, $toUsername,$time),$Title,$Description,$PicUrl,$Url);
						break;						
					case "微小信教育委员会":
						$msgType= "text";
						$contentStr = $text2;
						$resultStr = sprintf(Tpl($msgType,$fromUsername, $toUsername,$time),$contentStr);
						break;
					case "教室空闲时间":
						$msgType= "text";
						$contentStr = "告诉微小信你要查询的教室号吧（一教、二教、五教请输入四位教室号，如：5107）（三教请输入加字母的教室号，如：3A402）";
						$resultStr = sprintf(Tpl($msgType,$fromUsername, $toUsername,$time),$contentStr);
						break;
					default:
						$msgType= "text";
						$contentStr = "微小信无能为力哈/调皮，主人下课后回复你。";
						$resultStr = sprintf(Tpl($msgType,$fromUsername, $toUsername,$time),$contentStr);
					}
                	echo $resultStr;
                }else{
					echo "亲~呼叫【主菜单】吧，中国科大微小信温馨提示。/调皮";					
                }

        }else {
        	echo "weixin api";
        	exit;
        }
    }
public function findBus($way){
	$isCircle = array('直线','环线');
	$star = array('','*');
	$wayname = array(' ','东区到西区','东区到南区','西区到东区','西区到南区','南区到东区','南区到西区');
	$name = $wayname[$way];
	$con['way'] = $way;
	$con['time']= array('gt',date("H:i:s"));
	$bus = M('Bus')->where($con)->limit('5')->order('time')->select();
	if(!$bus)
		return "小信伤心地告诉你，你错过了".$name."末班车~";
	$next = "最近一班 ".$name."的校车在".$bus[0]['time']."出发，千万不要错过了哦";
	foreach($bus as $val)
		$more .= $val['time'].$star[$val['star']]." ".$isCircle[$val['isCircle']]."(".$wayname[$way].")"."\n";
	return $next."\n"."更多："."\n".$more;
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