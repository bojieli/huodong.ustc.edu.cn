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

	/*非ajax瀑布流*/
	$infos = $Item->getCrx(0, 20, $cond, $order,$have_addition);

	foreach ($infos as $key => $info){
		$addition =  $Item->getItemAddition($info['id']);
		 $infos[$key]["like"] = (empty($addition['likes'])) ? 0 : $addition['likes'];
		 $infos[$key]["dislike"] =  (empty($addition['dislikes'])) ? 0 :  $addition['dislikes'];
		$php_crx.= $this->crx2html( $infos[$key]);
	}
	//var_dump($php_crx);die();
	$this->assign('php_crx',$php_crx);
	
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
		$files  = array("common","crx");
		$langs = explode(",",C('LANG_LIST'));
		$contributor["es-es"] = array(
				"name"=>"Geronimo",
				"website"=>"https://github.com/Vuelos"
			);
		foreach ($langs as $key => $lang) {
			$basepath = "Lang/".$lang."/";
			foreach ($files as $key2 => $file) {
				$url = $basepath.$file.".php";
				if (file_exists($url)) {
				    $info[$lang][$file] =  "Last Modified: " . date ("F d Y H:i:s.", filemtime($url));
				}
			}
			if(!empty($contributor[$lang])){
				$info[$lang]["contributor"]= 'Contributed By : '.'<a href="https://github.com/Vuelos" target="_blank" style="font-weight:bold">'.$contributor[$lang]["name"].'</a>';
			}
		}
		$this->assign('info',$info);
		
		$this->assign('files',$files);
		$this->assign('langs',$langs);
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

    			//$this->error("转化工具正在更新，请稍后再来！");
			$filename = $this->upload();
			if (!$filename) {
				$this->error("您必须上传APK格式文件！");
			}
			$type = $this->_post("type");
			
			$info = $this->apk2crx($filename,$type);	
			if(empty($info)){
				$this->error("上传APK不合法！");
			}
			if( is_array($info)){
				$crx = $info["name"];
				$infos = $info;
			}else{
				
				$id = $this->mycreate($info,$type);
				if(!$id){
					$this->error("存储APK失败！");
				}
				$infos["id"]=$id;
			}			
			$info_upload["id"] = $infos["id"];
			$this->success($info_upload);
			/*$this->redirect("/Crx/info?id=".$infos["id"]);*/
	}
   public function uploadFileSize(){
   	$this->isdeveloper();
   	$Item = D("Crx");
   	$ids = $Item->getAllFileSizeZero();
   	foreach ($ids as $id) {
   		dump($id);
   		$info = $Item->getItem($id);
   		$crxname = $this->getCrxName($info);
   		//dump($crxname);
   		$filepath = "./upload/apk/".$crxname;
   		$size = filesize($filepath);
   		$data["size"]=$size;
   		$Item-> where(array("id"=>$id))->save($data);
   	}
   }
   private function getCrxName($info){
   	if(empty($info)){
   		return null;
   	}
        	if($info["type"]=="pad")
        		$HD = "-HD";
        	return $info["name"].".android-".$info["versionName"]."-".substr($info["apkHash"], 0,6).$HD.".crx";

   }
   public function fixCrxName(){
   	$this->isdeveloper();
   	$Item = D("Crx");
   	$infos = $Item->getAllItem();
   	$basepath = "./upload/apk/";
   	$filenames = glob($basepath."*.crx");
   	$status = 0;
   	foreach ($infos as $info) {
   		$crxname = $this->getCrxName($info);

   		if(!file_exists($basepath.$crxname)){
   			dump($info["id"]);
   			//echo $crxname."<br />";
   			$add = 0;
   			if($info["type"]=="pad"){        				
   				$HD = "-HD";
   				$add = 1;
   			}
        			$keyword = substr($info["apkHash"], 0,6).$HD.".crx";
   			$like_names =array_filter($filenames, create_function('$v', "return strstr(\$v, '$keyword');"));
   			$oldname = basename($like_names[key($like_names)]);
 			if(empty($oldname)){
 				continue;
 			}
   			$res = explode("-", $oldname);
   			$num = count($res);
   			for ($x=1; $x<$num-($add+1); $x++) {
			  	$versionNames[] = $res[$x];
			} 
   			$versionName = implode("-", $versionNames);
   			unset($versionNames);
   			if($versionName){
   				$Item-> where(array("id"=>$info["id"]))->setField('versionName',$versionName);
   			}
   			$status += 1;
   		}
   	}
   	echo "Status : ".$status;
   }
   /*
	如果存在hash一样的apk就无需上传，类型不一样就用bak里的apk转
   */
   public function uploadHash(){
   	$type = $this->_post("type");
	$id = $this->_post("id");
	if(empty($id)){
		$this->error("ID为空！");
	}
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
		$info=$this->apk2crx($filename,$type);
		$id = $this->mycreate($info,$type);
		if(!$id){
			$this->error("存储APK失败！");
		}
	}else{
		$id = $res["id"];
	}
	$info_upload["id"] = $id;
	$this->success($info_upload);
   }
   /*
利用bak里apk重新生成Crx，数据库id不变
   */
   public function createNewCrx(){
   	$this->isdeveloper();
	$id = $this->_get("id");
	if(empty($id)){
		$this->error("ID为空！");
	}
	$Item = D("Crx");
	$info = $Item->getItem($id);
	if(empty($info)){
		return false;
	}
	
	$hash = $info["apkHash"];
	$type = $info["type"];
	if($type=="pad"){
		$HD="-HD";
	}
	$source = "./upload/apk/bak/".$hash.$HD.".apk";
	if(!file_exists($source)){
		$this->error("没有备份的源文件！");
	}
	$target = "./upload/apk/".$hash.$HD.".apk";
	copy($source,$target);
	$filename = basename($target);
	$ltx=$this->apk2crx($filename,$type,/*enforce*/true);
	//dump($ltx);die();
	$res = $this->mycreate($ltx,$type,$id);
	if($res==false){
		$this->error("重新生成APK发生错误");
	}else{
		$this->redirect("/Crx/info?id=".$id);
	}
}
   private function mycreate($ltx,$type,$id){
   	//dump($ltx);die();
   	if(empty($ltx)){
		$this->error("APK不合法！");
	}
	$Item = D("Crx");
	$info_tmp = (array)json_decode($ltx);
	$info_tmp["names"] = (array)$info_tmp["names"];

	if( empty(trim($info_tmp["packageName"])) || empty(trim($info_tmp["names"]["en"])) ){
		$this->error("上传APK包名为空");
	}
	$infos  = array(
	'name'=>trim($info_tmp["packageName"]),
	'realname'=>trim($info_tmp["names"]["en"]),
	'apkHash'=>trim($info_tmp["apkHash"]),
	'iconHash'=>trim($info_tmp["iconHash"]),
	'versionCode'=>trim($info_tmp["versionCode"]),
	'versionName'=>trim($info_tmp["versionName"]),
	'type'=>$type,
	'time'=>time()
	);

	$crxname = $this->getCrxName($infos);
	$filepath = "./upload/apk/".$crxname;
	$infos["size"] = filesize($filepath);
	if(empty($id)){
		$id = $Item->create($infos);
		return $id;
	}else{	
		//$infos["time"]=(int)$Item->getItem($id)["time"];
		//dump($infos);die
		return $Item->update($infos,$id);
	}
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
	$info["hsize"]= modifier_filesize($info["size"]);
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
   			return;
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
					$info_tmp = json_decode($info);
					$infos  = array(
					'name'=>trim($info_tmp["packageName"]),
					'realname'=>trim($info_tmp["names"]["en"]),
					'apkHash'=>trim($info_tmp["apkHash"]),
					'iconHash'=>trim($info_tmp["iconHash"]),
					'versionCode'=>trim($info_tmp["versionCode"]),
					'versionName'=>trim($info_tmp["versionName"]),
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
private function apk2crx($filename,$type="phone",$enforce=false){
	//echo $source;die();
	$url = "./upload/apk/".$filename;
	if(!file_exists($url)){
	    echo $filename . " does not exist <br />";
	    return -1;
	}else{
		$hash = md5_file($url );
	}
	if($enforce==false){
		$Item = D("Crx");
		$infos = $Item->getItemByHash($hash,$type);
		if(!empty($infos)){
			unlink($url);
			return $infos;
		}
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
			<div class="celldiv" align="center" itemscope itemtype="http://schema.org/SoftwareApplication">
			'.$del.'
			<a href="/Crx/info?id='.$crx["id"].'"><img src="'.$icon_url.'" style="width:7em" /></a>	

				<div class="detail">					
					<a href="/Crx/info?id='.$crx["id"].'">
						<span itemprop="name" >'.$crx["realname"].'</span>
					</a>				
					<span itemprop="softwareVersion" class="vname">('.$crx["versionName"].')   '.$HD.'</span>
					 <div class="hot" itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating">
						  <span class="cai" id="cai-'.$crx['id'].'">
						  	<span class="iconding" onclick="dislike('.$crx['id'].');return false;"></span>
						  	<span id = "dislike_'.$crx['id'].'"  class="rate">'.$crx['dislike'].'</span>
						</span>
						 
						 <span class="ding2" id="ding-'.$crx['id'].'">
						 	<span itemprop="reviewCount" class="iconding" onclick="like('.$crx['id'].');return false;"></span>
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
         $Item = D("Crx");
         $info = $Item->getItem($id);
        $crxname = $this->getCrxName($info);
        if($info["type"]=="pad")
        	$HD = "-HD";
        $filepath = "./upload/apk/".$crxname;
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
    private function downloadFile($filepath,$postfix){
     
        if(!file_exists($filepath))
        {
            $this->error("文件不存在！");
        }
        if(!empty($postfix)){
        	$postfix_name="-".$postfix;
        }
        $filename=realpath($filepath);  //文件名
        $name = basename($filename,".php").$postfix_name."-".substr(md5_file($filename), 0,6).".php";
        Header( "Content-type:   application/octet-stream "); 
        Header( "Content-Length: " .filesize($filename));
        Header( "Accept-Ranges:   bytes ");     
        header( "Content-Disposition:   attachment;   filename= {$name}"); 
        readfile($filename);
    }
    public function downloadT(){
    	$php  = array("common.php","crx.php");
    	$name = $this->_get("t");
    	$lang = $this->_get("lang");
    	if(in_array($name,$php)){
    		$basepath = "Lang/".$lang."/";
	    	$url = $basepath.$name;
	    	$this->downloadFile($url,$lang); 
    	}
    }
    private function isdeveloper(){
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
    }
    public function del(){
    
    	$this->isdeveloper();

    	$id = $this->_get("id");
    	$Item = D("Crx");
    	$info = $Item->getItem($id);
    	if(empty($info)){
    		$this->success("文件不存在！","/Crx");
    		return ;
    	}
    	if($info["type"]=="pad")
        	$HD = "-HD";
        	$crxname = $this->getCrxName($info);
        	$url["crx"] = "./upload/apk/".$crxname;
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

public function scanBak(){
	$apks = glob("./upload/apk/bak/*.apk");
	foreach ($apks as $key => $apk) {
		$url = $apk;
		$basename =  basename($apk,".apk");
		$res = explode("-",$basename);
		$hash = $res[0];
		if($res[1]=="HD"){
			$type="pad";
		}else{
			$type="phone";
		}
		$info = D("Crx")->getItemByHash($hash,$type);
		
		if(empty($info["id"])){	
			$del_urls['apk_url']="./upload/apk/bak/".$basename.".apk";
			$del_urls['pem_url']="./upload/apk/bak/".$basename.".pem";
			//$del_urls['crx_url']="./upload/apk/".$this->getCrxName($info);
			foreach ($del_urls as $del_url) {
				if(file_exists($del_url))
					$del[] = $del_url;
			}
		}

	}
	dump($del);
	return $del;
}
public function clean(){
	$this->isdeveloper();
	$enable = 0;
	$enable = $this->_get("ltx","strip_tags",0);
	$del = $this->scanBak();
	if($enable==0 || empty($del)){
		echo "Total :".count($del);
		return;
	}
	foreach ($del as $key => $value) {
		unlink($value);
	}
}
}
?>