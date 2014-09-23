<?php
class CrxAction extends PublicAction{
	public function index(){
	// echo "test";
		//var_dump($this->apk2crx());
		$this->display();
	}
	public function upload() {
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
			
			$crx = $this->apk2crx($filename);
			$url = "/upload/apk/".$crx;
			echo "<a href=".$url ."></a>";
	}
private function apk2crx($filename){
	//echo $source;die();
	if(!file_exists("./upload/apk/".$filename)){
	    echo $filename . " does not exist <br />";
	    return -1;
	}
	$cmd = "cd ./upload/apk/;/usr/local/bin/apk2crx " . $filename. " 2>&1";
	//var_dump($filename);die();
	return shell_exec($cmd);
}
}
?>