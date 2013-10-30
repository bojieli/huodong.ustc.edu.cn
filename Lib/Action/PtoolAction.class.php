<?php
class PtoolAction extends Action {
 public function all(){
	header("Content-type: text/html; charset=utf-8"); 
	$file = "Web/application/jPushApplicationList.xml";
	$xmlDoc = new DOMDocument(); 
	$xmlDoc->load($file);
	//$x=$xmlDoc->documentElement;
	//dump($xmlDoc->saveXML());
    //$channel = $xmlDoc->getElementsByTagName("shortcut"); 
	//foreach ($channel as $item){  //Ñ­»·Êä³öÄÚÈÝ 
    $apps=$xmlDoc->getElementsByTagName("app");
	$i=0;
	foreach($apps as $app){
	$ico=$app->getAttribute("ico");
	if (!preg_match("/^data:image/",$ico))
	{
		$url='./Web/'.$ico;
		$base64=picToBase64($url);
		//dump($base64);
		$app->setAttribute("ico",$base64);
	}
       $i++;
 }
 $xmlDoc->save($file);
 echo $i;
} 
}