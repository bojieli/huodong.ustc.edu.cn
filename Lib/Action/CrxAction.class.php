<?php
class CrxAction extends PublicAction{
	public function index(){

	$school_all[] = array(
                'type' => "all",
                'url' => "/Crx?type=all&sort=".$this->_get("sort")."&keyword=".$this->_get("keyword"),
                'name' => '全部设备'
                );
	$school_all[] = array(
                'type' => "phone",
                'url' => "/Crx?type=phone&sort=".$this->_get("sort")."&keyword=".$this->_get("keyword"),
                'name' => '手机'
                );
	$school_all[] = array(
                'type' => "pad",
                'url' => "/Crx?type=pad&sort=".$this->_get("sort")."&keyword=".$this->_get("keyword"),
                'name' => '平板'
                );
        	
        	$schools = json_encode($school_all);
	list($start, $num, $cond, $order,$have_addition) = $this->parseInput();
	$Item = D("Crx");
	$count = $Item->countItem($cond,$have_addition);

	 

	$this->assign('count', $count);
	$this->assign('schools', $schools);
	$this->display();
}
	public function create(){
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
    public function uploadAPK(){

			$filename = $this->upload();
			if (!$filename) {
				$this->error("您必须上传APK格式文件！");
			}
			$type = $this->_post("type");
			$key = $this->_post("key");

			


			$info = $this->apk2crx($filename,$type,$key);
			//var_dump($info);die();
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
				'time'=>time()
				);

				$Item = D("Crx");
				if(!$Item->create($infos)){
					$this->error("存储APK失败！");
				}
				$re = $Item->getItemByHash($infos["apkHash"],$type);
				$infos["id"]=$re["id"];
			}
			
			$url = "/Crx/downloadCrx?id=".$infos["id"];
			$url =  "下载：<a style='border: 1px solid red;padding: 5px;' href=".$url .">".$infos["realname"]."</a>";
			$this->assign('url', $url);
			$this->display();
	}
   public function convertAllAPK(){
   			set_time_limit(0);
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
				$info = $this->apk2crx($filename,$type,$key);
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
private function apk2crx($filename,$type="phone",$key=0){
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
		$cmd = "cd ./upload/apk/;/usr/local/bin/apk2crx " .$filename. " ".$key." 2>&1";
	}
	else{
		$cmd = "cd ./upload/apk/;/usr/local/bin/apk2crx " .$filename. " ".$key." pad 2>&1";
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
                $order = 'id';
                break;
             case 'good': 
            $order = 'id';
             $cond[] = '`likes`>`dislikes`';
             $have_addition = true;

            break;
             case 'hot': 
            $order = 'download_count desc,id';
            break;
        default:
            case 'smart':
                $order = 'id';
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
		$url = "/Crx/downloadCrx?id=".$info["id"];
		$infos[$key]["url"] = $url;
		$addition =  $Item->getItemAddition($info['id']);
		 $infos[$key]["like"] = (empty($addition['likes'])) ? 0 : $addition['likes'];
		 $infos[$key]["dislike"] =  (empty($addition['dislikes'])) ? 0 :  $addition['dislikes'];
		$elements[] = $this->crx2html( $infos[$key]);
	}
	echo json_encode($elements);
    }

public function filelist(){
	require_once "Common/filelist.php";
}

private function crx2html($crx){
	if($crx["type"]=="pad"){
		$HD="HD";
	}
	return'
	<li class="hide animated fadeInUp">
			<div class="celldiv" align="center" itemscope itemtype="http://data-vocabulary.org/Event">
			<img src="/upload/apk/bak/'.$crx["iconHash"].'.png" style="width:7em">			
				<div class="detail">					
					<span itemprop="summary" >'.$crx["realname"].'</span>					
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
					<span>
					<a href='.$crx["url"].'><img src="/static/images/download.png"></a>
					</span>
					<span class="download_count">'.$crx["download_count"].'</span>	
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
        Header( "Accept-Ranges:   bytes "); 
        Header( "Accept-Length: " .filesize($filename));
        header( "Content-Disposition:   attachment;   filename= {$name}"); 
        echo file_get_contents($filename);
        readfile($filename); 
        D("Crx")->addDownload($id);
    }


}
?>