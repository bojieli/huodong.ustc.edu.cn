<?php
define("TOKEN", "stunionweixin20130404");

class WeixinAction extends PublicAction{
public function index(){
	$this->valid();
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
              		$menu = "���~�������й��ƴ�ѧ����΢�Ź���ƽ̨��Ŀǰ�����ṩ���·��񣬸��๦�����ڿ�����:
					���й��ƴ�ѧ���᡾��顿
					���Ϸʡ�������Ԥ�������в�׼�����ʶ��
					�����ࡾ���ӡ�
					����У����ʱ�̱�
					������ѧ�ڡ���ѧ������
					����΢С�Ž���ίԱ�᡿
					�������ҿ���ʱ�䡿��ѯ
					��ʱ����񣺡�����������ѧ��֪ʶ������׷�ٱ���
					�����һʰ���Ŀʵʱ��ѯ
					����ʱ���񣺡����Ρ�·���Ƽ�
					���������ÿ��һ�顿����Ƭ�ٵݡ�
					��������Ȩ�����⣬��ظ���������СȨ��+��Ҫ˵�����ݡ�
					";
					$text1="�й��ƴ�ѧ�������˹�����ҳ��http://page.renren.com/600756323?id=600756323
							�й��ƴ�ѧ��������΢����http://e.weibo.com/ustcsu/profile
							�й��ƴ�ѧ����΢����http://kan.weibo.com/kan/3527939242049698
							�ۺϽ���ϵͳ��
							http://mis.teach.ustc.edu.cn/userinit.do";
					$text2="��ӭ����΢С�Ž���ίԱ��~΢С��ÿ���׼��5�������ң����Ҳ����ڵ�ͳ���ۼƴ����������С���Ѹ��㾪ϲŶ��
					���ա���һ�⡤��ʫ��
					��б������ˮ���ơ�����һ���ǣ�
					����ʲô�أ���ԵĻ��ڶ���ͻ������Ӵ";
					switch($keyword){
					case "���˵�":
						$msgType= "text";
						$contentStr = $menu;
						$resultStr = sprintf(Tpl($msgType,$fromUsername, $toUsername,$time),$contentStr);
						break;
					case "���":
						$msgType = "news";
						$Title = "�й���ѧ������ѧѧ������";
						$Description = "�й��ƴ�ѧ�������й���ѧ������ѧѧ�����ϻ�ļ�ƣ�������У��ί���쵼����ί��ָ�������շ��ɡ�ѧУ�����ƶȺ��Լ����³̣����������ؿ�չ������ѧ��Ⱥ����֯��ѧ����Ķ�λ�ǣ�����ͬѧ�������֣����ǵ���ּ�ǣ����ҷ������ҹ������ҽ�����";
						$PicUrl = "http://mmsns.qpic.cn/mmsns/sSYjQERK9NM6BMEWUY3j7H82ExC0RL73u2AQK3EyGwgFX5af7xCqZg/0"
						$Url = "http://stunion.ustc.edu.cn/";
						$resultStr = sprintf(Tpl($msgType,$fromUsername, $toUsername,$time),$Title,$Description,$PicUrl,$Url);
						break;
					case "����":
						$msgType= "text";
						$contentStr = "�����ң�����˭��/��Ƥ";
						$resultStr = sprintf(Tpl($msgType,$fromUsername, $toUsername,$time),$contentStr);
						break;
					case "����":
						$msgType= "text";
						$contentStr = $text1;
						$resultStr = sprintf(Tpl($msgType,$fromUsername, $toUsername,$time),$contentStr);
						break;
					case "У��":
						$msgType = "news";
						$Title = "У����ѯ";
						$Description = "�ף�������У��Ŷ";
						$PicUrl = "http://mp.weixin.qq.com/cgi-bin/getimgdata?msgid=10000053&mode=large&source=file&fileId=10000053";
						$Url = "http://www.ustc.edu.cn/ggfw/xxcx/201207/t20120716_138067.html";
						$resultStr = sprintf(Tpl($msgType,$fromUsername, $toUsername,$time),$Title,$Description,$PicUrl,$Url);
						break;
					case "��ѧ����":
						$msgType = "news";
						$Title = "��ѧ����";
						$Description = "��~����Զ��Ľ�ѧ���������Gmail";
						$PicUrl = "http://mp.weixin.qq.com/cgi-bin/getimgdata?msgid=10000038&mode=large&source=file&fileId=10000038";
						$Url = "http://www.teach.ustc.edu.cn/page.asp?post=1134";
						$resultStr = sprintf(Tpl($msgType,$fromUsername, $toUsername,$time),$Title,$Description,$PicUrl,$Url);
						break;						
					case "΢С�Ž���ίԱ��":
						$msgType= "text";
						$contentStr = $text2;
						$resultStr = sprintf(Tpl($msgType,$fromUsername, $toUsername,$time),$contentStr);
						break;
					case "���ҿ���ʱ��":
						$msgType= "text";
						$contentStr = "����΢С����Ҫ��ѯ�Ľ��ҺŰɣ�һ�̡����̡������������λ���Һţ��磺5107�����������������ĸ�Ľ��Һţ��磺3A402��";
						$resultStr = sprintf(Tpl($msgType,$fromUsername, $toUsername,$time),$contentStr);
						break;
					default:
						$msgType= "text";
						$contentStr = "΢С������Ϊ����/��Ƥ�������¿κ�ظ��㡣";
						$resultStr = sprintf(Tpl($msgType,$fromUsername, $toUsername,$time),$contentStr);
					}
                	echo $resultStr;
                }else{
					echo "��~���С����˵����ɣ��й��ƴ�΢С����ܰ��ʾ��/��Ƥ";					
                }

        }else {
        	echo "weixin api";
        	exit;
        }
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
}
?>