<?php
class CrxAction extends PublicAction{
	public function index(){

	$school_all[] = array(
                'type' => "all",
                'url' => "/Crx?type=all&sort=".$this->_get("sort")."&keyword=".$this->_get("keyword"),
                'name' => L('quanbushebei')
                );
	$school_all[] = array(
                'type' => "phone",
                'url' => "/Crx?type=phone&sort=".$this->_get("sort")."&keyword=".$this->_get("keyword"),
                'name' => L('shouji')
                );
	$school_all[] = array(
                'type' => "pad",
                'url' => "/Crx?type=pad&sort=".$this->_get("sort")."&keyword=".$this->_get("keyword"),
                'name' => L('pingban')
                );
        	
        	$schools = json_encode($school_all);
	list($start, $num, $cond, $order,$have_addition) = $this->parseInput();
	$Item = D("Crx");
	$count = $Item->countItem($cond,$have_addition);

	 

	$this->assign('count', $count);
	$this->assign('schools', $schools);
	$this->display("index");
}
	public function create(){
		$this->display();
	}
	public function course(){
		$this->display();
	}
	public function test(){
		$cmd = "/usr/local/bin/checkcrx";
		$info = shell_exec($cmd);
		echo $info;
	}
	public function help(){
		$this->display();
	}
	public function translate(){
		$php  = array("common","crx");
		$basepath = "Lang/en-us/";
		foreach ($php as $key => $name) {
			$url = $basepath.$name.".php";
			if (file_exists($url)) {
			    $info[$name] =  "Last Modified: " . date ("F d Y H:i:s.", filemtime($url));
			}
		}
		$this->assign('file',$info);
		$this->display();
	}
	public function upload() {
		//var_dump($_FILES);die();
        import("ORG.Net.UploadFile");
        $upload = new UploadFile();
        $upload->maxSize = 100 * 1024 * 1024;
        $upload->allowExts = ["apk"];
        $upload->savePath = './upload/apk/';
        $upload->saveRule = 'uniqid';
		 if(!$upload->upload()) {// 上传错误 提示错误信息 
			$this->error($upload->getErrorMsg()); 
		}
		else{
			$info = $upload->getUploadFileInfo();
			return $info[0]["savename"];
        }
    }
    public function uploadTest(){
	dump($_POST);
    }
    public function uploadAPK(){

			$filename = $this->upload();
			//echo "网站正在修复BUG！";
			//var_dump($filename);die();
			if (!$filename) {
				$this->error("您必须上传APK格式文件！");
			}
			$type = $this->_post("type");
			


			$info = $this->apk2crx($filename,$type);
			//var_dump($info);die();
			if(empty($info)){
				$this->error("上传APK不合法！");
			}
			if( is_array($info)){
				$crx = $info["name"];
				$infos = $info;
			}else{
				$info_tmp = explode("#", $info);
				if( empty(trim($info_tmp[1])) || trim($info_tmp[2]) ){
					$this->error("上传APK包名为空");
				}
				$infos  = array(
				'name'=>trim($info_tmp[1]),
				'realname'=>trim($info_tmp[2]),
				'apkHash'=>trim($info_tmp[3]),
				'iconHash'=>trim($info_tmp[4]),
				'versionCode'=>trim($info_tmp[5]),
				'versionName'=>trim($info_tmp[6]),
				'type'=>$type,
				'time'=>time()
				);
				$Item = D("Crx");
				if(!$Item->create($infos)){
					$this->error("存储APK失败！");
				}
				$re = $Item->getItemByHash($infos["apkHash"],$type);
				$infos["id"]=$re["id"];
			}			
			$info_upload["id"] = $infos["id"];
			$this->success($info_upload);
			/*$this->redirect("/Crx/info?id=".$infos["id"]);*/
	}
   public function uploadHash(){
   	$type = $this->_post("type");
	$id = $this->_post("id");


	$Item = D("Crx");
	
	$info_tmp = $Item->getItem($id);
	$hash=$info_tmp["apkHash"];
	$res = $Item->getItemByHash($hash,$type);
	if(empty($res)){
		if($info_tmp["type"]=="pad"){
			$HD="-HD";
		}
		$source = "./upload/apk/bak/".$hash.$HD.".apk";
		$target = "./upload/apk/".$hash.".apk";
		copy($source,$target);
		$filename = $hash.".apk";
		$res_tmp=$this->apk2crx($filename,$type);
		if(empty($res_tmp)){
			$this->error("APK不合法！");
		}
		$infos  = array(
		'name'=>trim($info_tmp["name"]),
		'realname'=>trim($info_tmp["realname"]),
		'apkHash'=>trim($info_tmp["apkHash"]),
		'iconHash'=>trim($info_tmp["iconHash"]),
		'versionCode'=>trim($info_tmp["versionCode"]),
		'versionName'=>trim($info_tmp["versionName"]),
		'type'=>$type,
		'time'=>time()
		);
	if(!$Item->create($infos)){
		$this->error("存储APK失败！");
	}
	$re = $Item->getItemByHash($infos["apkHash"],$type);
	$id=$re["id"];
	}
	
	$info["id"] = $id;
	$this->success($info);
   }
   public function info(){
   	$id = $this->_get("id");
   	$c = $this->_get("c");
   	$Item = D("Crx");
	$info = $Item->getItem($id);
	if(empty($info)){
		$this->error("页面不存在");
	}
	$apk = $info["name"];
	if(empty($info)){
		$this->error("页面不存在");
	}
	$info["htime"]= $this->tranTime($info["time"]);
	$addition = $Item->getItemAddition($info["id"]);
	if(empty($c)){
		if(strtolower(cookie('think_language'))=="zh-cn"){
			$pl = "duoshuo";
		}else{
			$pl = "disqus";
		}
	}else{
		$pl = $c;
	}
	if(!empty($addition)){
		$info = array_merge($info,$addition);
	}
	/*dump($Item->getSameNameApp($info["name"]));*/
	$this->assign('other',$Item->getSameNameApp($info["name"]));
	$this->assign('info',$info);
	$this->assign('pl',$pl);
	$this->display();

   }
   public function convertAllAPK(){
   			$run = $this->_get("run");
   			if(empty($run)){
   				return;
   			}
			$path = "upload/apk";
			$apks = glob($path."/*.apk", GLOB_BRACE);
			foreach ($apks as $key => $apk) {
				$filename = basename($apk);
				$time = filemtime($apk) ? filemtime($apk) : time() ;
				if(stripos($filename,"hd.") || stripos($filename,"pad")){
					$type = "pad";
				}else{
					$type = "phone";
				}
				$info = $this->apk2crx($filename,$type);
				if(empty($info)){
					$this->error("上传APK不合法！");
				}
				if( is_array($info)){
					$crx = $info["name"];
					$infos = $info;
				}else{
					$info_tmp = explode("#", $info);
					$infos  = array(
					'name'=>trim($info_tmp[1]),
					'realname'=>trim($info_tmp[2]),
					'apkHash'=>trim($info_tmp[3]),
					'iconHash'=>trim($info_tmp[4]),
					'versionCode'=>trim($info_tmp[5]),
					'versionName'=>trim($info_tmp[6]),
					'type'=>$type,
					'time'=>$time,
					'download_count'=>0
					);

					$Item = D("Crx");
					if(!$Item->create($infos)){
						$this->error("存储APK失败！");
					}
					$crx =  trim($info_tmp[1]);
				}
				
			}


}
private function apk2crx($filename,$type="phone"){
	//echo $source;die();
	$url = "./upload/apk/".$filename;
	if(!file_exists($url)){
	    echo $filename . " does not exist <br />";
	    return -1;
	}else{
		$hash = md5_file($url );
	}
	$Item = D("Crx");
	$infos = $Item->getItemByHash($hash,$type);
	if(!empty($infos)){
			shell_exec("rm ".$url." 2>&1");
			return $infos;
	}

	if ($type=="phone") {
		$cmd = "cd ./upload/apk/;/usr/local/bin/apk2crx " .$filename. "  2>&1";
	}
	else{
		$cmd = "cd ./upload/apk/;/usr/local/bin/apk2crx " .$filename. "  pad 2>&1";
	}

	//var_dump($filename);die();
	return shell_exec($cmd);
}




 private function parseInput() {
        $start = is_numeric($_GET['start']) ? $_GET['start'] : 0;
        $num = is_numeric($_GET['num']) ? $_GET['num'] : 0;
        $cond = [];
         $keyword = isset($_GET['keyword']) ? addslashes($_GET['keyword']) : '';
        if(!empty($keyword))
            $cond[] = "(name like '%$keyword%' or realname like '%$keyword%' )";

         $type = $_GET['type'] ? $_GET['type'] : "all";
         if(!empty($type) && $type!="all")
            $cond[] = "(type = '$type')";


         switch ($_GET['order']) {
            case 'new': 
                $order = 'time desc,id desc';
                break;
             case 'good': 
            $order = '`likes`-`dislikes` desc';
             $cond[] = '`likes`>`dislikes`';
             $have_addition = true;

            break;
             case 'hot': 
            $order = 'download_count desc,id';
            break;
        default:
            case 'smart':
                $order = 'id desc';
        }

         return [$start, $num, implode(' AND ', $cond), $order,$have_addition];
 }

public function ajaxGet() {
	$elements = [];
	$Item = D("Crx");

	list($start, $num, $cond, $order,$have_addition) = $this->parseInput();
	$infos = $Item->getCrx($start, $num, $cond, $order,$have_addition);
	//$infos = $Item->getAllItem();

	foreach ($infos as $key => $info) {
		$addition =  $Item->getItemAddition($info['id']);
		 $infos[$key]["like"] = (empty($addition['likes'])) ? 0 : $addition['likes'];
		 $infos[$key]["dislike"] =  (empty($addition['dislikes'])) ? 0 :  $addition['dislikes'];
		$elements[] = $this->crx2html( $infos[$key]);
	}
	echo json_encode($elements);
    }
public function filelist(){
	$this->index();
	/*require_once "Common/filelist.php";*/
}

private function crx2html($crx){
	if($crx["type"]=="pad"){
		$HD="HD";
	}
	global $_G;
        $user = D("User");
        $user_info = $user->getInfo($_G['uid']);
        if($user_info['isdeveloper'])
        {	
            $del = '<div style="position: absolute;right: 0.3em;top:0.3em"><a href="/Crx/del?id='.$crx['id'].'">X</a></div>';
        }
        if(empty($crx["versionName"])){
        	$crx["versionName"]=$crx["versionCode"];
        }
        if(empty($crx["iconHash"])){
        	$icon_url='/static/images/icon.png';
        }else{
        	$icon_url='/upload/apk/bak/'.$crx["iconHash"].'.png';
        }
       return'
	<li class="hide animated fadeInUp">	
			<div class="celldiv" align="center" itemscope itemtype="http://data-vocabulary.org/Event">
			'.$del.'
			<a href="/Crx/info?id='.$crx["id"].'"><img src="'.$icon_url.'" style="width:7em" /></a>	

				<div class="detail">					
					<a href="/Crx/info?id='.$crx["id"].'">
						<span itemprop="summary" >'.$crx["realname"].'</span>
					</a>				
					<span itemprop="versionName" class="vname">('.$crx["versionName"].')   '.$HD.'</span>
					 <div class="hot">
						  <span class="cai" id="cai-'.$crx['id'].'">
						  	<span class="iconding" onclick="dislike('.$crx['id'].');return false;"></span>
						  	<span id = "dislike_'.$crx['id'].'"  class="rate">'.$crx['dislike'].'</span>
						</span>
						 
						 <span class="ding2" id="ding-'.$crx['id'].'">
						 	<span class="iconding" onclick="like('.$crx['id'].');return false;"></span>
						 	<span id = "like_'.$crx['id'].'"  class="rate">'.$crx['like'].'</span>
						</span>
					</div>
					<div style="display:none" id="pj-'.$crx['id'].'">'.L("it-work").'<b style="color:#2FA6C8;">'.L("vote-for-it").'</b></div>
					<div class="download_click" style="cursor: pointer;" onclick="download_click('.$crx['id'].');return false;">
						<span>
						<img src="/static/images/download.png" onload="checkDS('.$crx['id'].')">
						</span>
						<span class="download_count">'.$crx["download_count"].'</span>	
					</div>
				</div>
			</div>
	</li>';
}

public function vote(){
	$vote = $this->_get('vote');
	$id = $this->_get('id');
	$Item = D("Crx");
	if($vote=="like"){
		$Item->addLike($id);
	}else{
		$Item->addDisLike($id);
	}
}

   public function downloadCrx(){
      
         $id = $this->_get("id");
        $info = D("Crx")->getItem($id);
        if($info["type"]=="pad")
        	$HD = "-HD";
        $filepath = "./upload/apk/".$info["name"].".android-".$info["versionName"]."-".substr($info["apkHash"], 0,6).$HD.".crx";
        if(!file_exists($filepath))
        {
            $this->error("文件不存在！");
        }
        $filename=realpath($filepath);  //文件名
        $name = $info['realname'].$HD.".crx";
        Header( "Content-type:   application/octet-stream "); 
        Header( "Content-Length: " .filesize($filename));
        Header( "Accept-Ranges:   bytes ");     
        header( "Content-Disposition:   attachment;   filename= {$name}"); 
        readfile($filename); 
        D("Crx")->addDownload($id);
    }
    private function downloadFile($filepath){
     
        if(!file_exists($filepath))
        {
            $this->error("文件不存在！");
        }
        $filename=realpath($filepath);  //文件名
        $name = basename($filename,".php")."-".substr(md5_file($filename), 0,6).".php";
        Header( "Content-type:   application/octet-stream "); 
        Header( "Content-Length: " .filesize($filename));
        Header( "Accept-Ranges:   bytes ");     
        header( "Content-Disposition:   attachment;   filename= {$name}"); 
        readfile($filename);
    }
    public function downloadT(){
    	$php  = array("common.php","crx.php");
    	$name = $this->_get("t");
    	if(in_array($name,$php)){
    		$basepath = "Lang/en-us/";
	    	$url = $basepath.$name;
	    	$this->downloadFile($url); 
    	}
    }
    public function del(){
    	global $_G;
        if(!D('User')->checkLogin())
        {
            $this->assign('jumpUrl','/User/login');
            $this->error('您尚未登录');
        }

        $user = D("User");
        $user_info = $user->getInfo($_G['uid']);
        if(!$user_info['isdeveloper'])
        {	
            $this->error('您没有权限访问该页面');
        }

    	$id = $this->_get("id");
    	$Item = D("Crx");
    	$info = $Item->getItem($id);
    	if(empty($info)){
    		$this->success("文件不存在！","/Crx");
    		return ;
    	}
    	if($info["type"]=="pad")
        	$HD = "-HD";
        	$url["crx"] = "./upload/apk/".$info["name"].".android-".$info["versionName"]."-".substr($info["apkHash"], 0,6).$HD.".crx";
    	$url["apk"]= "./upload/apk/bak/".$info["apkHash"].$HD.".apk";
    	if($Item->countByHash($info["apkHash"]) < 2){
    		$url["image"] = "./upload/apk/bak/".$info["iconHash"].".png";
    	}
    	$url["pem"] = "./upload/apk/bak/".$info["apkHash"].$HD.".pem";
    	foreach ($url as $key => $value) {
    			if(!unlink($value)){
    				echo "删除".$value."失败！"."<br />";  			
    			}
    	}
    	$re = $Item->del($id);
    	if($re !== false){
    		$Item->delItemAddition($id);
    		$this->success("删除".$re."条数据！","/Crx");
    	}else{
    		$this->error("删除数据失败！","/Crx");
    	}
    }
    public function getIdByHash(){
    	$hash = $this->_post("hash");
    	$Item = D("Crx");
    	$info["id"] = $Item->getItemByHash($hash,$type="phone")["id"];

    	if(!empty($info["id"])){
    		$this->success($info);
    	}else{
    		$this->success(["id"=>0]);
    	}
    }
    public function autocomplete(){
    	$keyword = $this->_get("query");
    	$Item = D("Crx");
    	$q = $Item->getKeyword($keyword);
    	$info["query"] = "Unit";
    	foreach ($q as $key => $value) {
	    	$info["suggestions"][] = array(
	    		'value' => $value["name"],
	    		'data' => $value["name"] 
	    		);
	 }
    	echo json_encode($info);
    }
    public function tranTime($time) {  
    $rtime = date("m-d H:i",$time);  
    $htime = date("H:i",$time);  
      
    $time = time() - $time;  
  
    if ($time < 60) {  
        $str = L("ganggang");  
    }  
    elseif ($time < 60 * 60) {  
        $min = floor($time/60);  
        $str = $min." ".L('minutes-ago');  
    }  
    elseif ($time < 60 * 60 * 24) {  
        $h = floor($time/(60*60));  
        $str = $h.L("hours-ago")." ".$htime;  
    }  
    elseif ($time < 60 * 60 * 24 * 3) {  
        $d = floor($time/(60*60*24));  
        if($d==1)  
           $str = L("yesterday")." ".$rtime;  
        else  
           $str = L("the-day-before")." ".$rtime;  
    }  
    else {  
        $str = $rtime;  
    }  
    return $str;  
}

}
?>