<?php
class CrxModel extends Model {
	public function getItem($id){
		return M("Crx")->where(["id"=>$id])->find();
	}
	public function getItemByHash($hash,$type="phone"){
		return M("Crx")->where(["apkHash"=>$hash,"type"=>$type])->find();
	}
	public function getItemByShortHash($hash,$name,$type="phone"){
		$con["type"]=$type;
		$con["hash"]=array('like',$hash."%");
		$con["name"]=$name;
		return M("Crx")->where($con)->count();
	}
	public function countByHash($hash){
		return M("Crx")->where(["apkHash"=>$hash])->count();
	}
	public function create($data){
		M("Crx")->create($data);
		return M("Crx")->add();
	}
	public function update($data,$id){
		$con["id"]= $id;
		return M("Crx")->where($con)->save($data); 
	}
	public function getAllItem(){
		return M("Crx")->select();
	}
	public function countItem($cond,$have_addition=false){
		
		if($have_addition==true){
	 		return M("Crx")->join(' ustc_crx_addition ON ustc_crx.id = ustc_crx_addition.id')->where($cond)->count();
	 	}else{
	 		return M("Crx")->where($cond)->count();
	 	}
	}
	 public function getCrx($start, $num, $cond = [], $order = '',$have_addition=false) {
	 	if($have_addition==true){
	 		return  M("Crx")->join(' ustc_crx_addition ON ustc_crx.id = ustc_crx_addition.id')->where($cond)->order($order)->limit("$start,$num")->select();
	 	}
        		return M('Crx')->where($cond)->order($order)->limit("$start,$num")->select();
    	}
    	public function sort(){
    		$order = "LOG(ABS(`likes`-`dislikes`)+1) desc";
    		$sort_tmp = M("Crx_addition")->field("id")->order($order)->select();
    		$sort[] = "id"; 
    		foreach ($sort_tmp as $key => $value) {
    			$sort[] = $value["id"];
    		}
    		return $sort;
    	}

	   public function addLike($id) {
	        if (!is_numeric($id))
	            return;
	        if(! M("Crx_addition")->find($id) ){
	        	$this->additionInit($id);
	        }
	        M()->execute("UPDATE ustc_crx_addition SET likes = likes+1 WHERE `id`='$id'");
	    }
	   public function addDisLike($id) {
	        if (!is_numeric($id))
	            return;
	        if( ! M("Crx_addition")->find($id)){
	        	$this->additionInit($id);
	        }
	        M()->execute("UPDATE ustc_crx_addition SET dislikes = dislikes+1 WHERE `id`='$id'");
	    }
	     public function addDownload($id) {
	        if (!is_numeric($id))
	            return;
	        M()->execute("UPDATE ustc_crx SET download_count = download_count+1 WHERE `id`='$id'");
	    }
	    public function getItemAddition($id){
	    	return M("Crx_addition")->where(["id"=>$id])->find();
	    }
	     public function delItemAddition($id){
	    	return M("Crx_addition")->where(["id"=>$id])->delete();
	    }
	    public function additionInit($id){
	    	$data=[
	    		'id'=>$id
	    	];
	    	M("Crx_addition")->create($data);
	    	return M("Crx_addition")->add();
	    }
	    public function del($id){
	    	$con=array('id' =>$id);
	    	return M("Crx")->where($con)->delete();
	    	
	    }
	    public function getKeyword($keyword){
	    	$subQuery = "SELECT `name` FROM `ustc_crx` WHERE ( `name` LIKE '%".$keyword."%' ) UNION SELECT `realname` FROM `ustc_crx` WHERE ( `realname` LIKE '%".$keyword."%' ) order by name limit 10";
	    	$info = M("Crx")->query($subQuery);
		 return $info;
	    }
	    public function getSameNameApp($name){
	    	$con["name"]=$name;
	    	$info = M("Crx")->where($con)->order("versionCode desc")->select();
	    	foreach ($info as $key => $value) {
	    		$info[$key]["htime"]=A("Crx")->tranTime($value["time"]);
	    	}
	    	return $info;
	    }
	    public function getAllFileSizeZero(){
	    	$con["size"]= 0;
	    	$res = M("Crx")->field("id")->where($con)->select();
	    	foreach ($res as $key => $value) {
	    		$ids[]=$value["id"];
	    	}
	    	return $ids;
	    }
	    public function getDescByName($name){
	    	return M("Crx_name")->field("description")->where(["name"=>$name])->find()["description"];
	    }
}
?>