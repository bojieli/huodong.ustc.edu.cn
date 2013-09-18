<?php


class ActivityModel extends Model {
	public function creatActivity($uid,$gid,$title,$poster_id,$tid,$shortdesc){
		$register_form = '["gender","student_no","realname","telephone","email"]';
		$con = array(
			'uid'=>$uid,
			'gid'=>$gid,
			'title'=>$title,
			'poster_id'=>$poster_id,
			'tid' => $tid,
			'shortdesc'=>$shortdesc,
			'register_form'=>$register_form,
			'time'=> time()
		);
		M('Activity')->add($con);
		M('Activity')->field('act_id')->where($con)->find()['act_id'];
		return true;
	}
	public function ModifyActivity($uid,$gid,$title,$poster_id,$tid,$shortdesc,$act_id){
		$con = array(
			'uid'=>$uid,
			'gid'=>$gid,
			'title'=>$title,
			'poster_id'=>$poster_id,
			'tid' => $tid,
			'shortdesc'=>$shortdesc
		);
		M('Activity')->where(['act_id'=>$act_id])->save($con);
		return true;
	}
	public function getActIDByGid($gid){
		return M('Activity')->field('act_id')->where(['gid'=>$gid])->select();
	}
	public function getActsByGid($gid){
		$act_ids = $this->getActIDByGid($gid);
		foreach($act_ids as $val)
			$re[]=$this->getActivityByID($val['act_id'],0);
		return $re;
	}
	public function getActivityByID($id,$all=1,$order="act_id desc") {
		$where = array(
			'act_id' => $id,
		);
		$info = $this->join(C('DB_PREFIX').'poster on '.C('DB_PREFIX').'poster.aid = '.C('DB_PREFIX').'activity.poster_id')
			->order($order)->where($where)->find();
		//$info = $this->where($where)->find();
		if(!empty($info[act_id]) && $all) {
			$info[picture]=D('activity_picture')->join(C('DB_PREFIX').'user on '.C('DB_PREFIX').'user.uid='.C('DB_PREFIX').'activity_picture.uid')->where('act_id='.$info[act_id])->order('time desc')->select();
			$info[article]=D('activity_article')->join(C('DB_PREFIX').'user on '.C('DB_PREFIX').'user.uid='.C('DB_PREFIX').'activity_article.uid')->where('act_id='.$info[act_id])->order('time desc')->select();
		}
		$info['gid']=$this->getGidByID($id);
		return $info;
	}
	public function getGidByID($act_id){
		return M('Activity')->field('gid')->where(['act_id'=>$act_id])->find()['gid'];
	}
	public function getPicture($act_id,$start,$num,$order)
	{
		import("ORG.Util.Image");
		$pictures = M('Activity_picture')->where(array("act_id"=>$act_id))->order($order)->limit("$start,$num")->select();
		//echo M('Activity_picture')->getLastSql();
		//dump($pictures);
		$results = array();
		foreach($pictures as $picture)
		{
			$path = $picture['path'].'thumb/thumb_'.$picture['name'];
			$picture['path'] = $path;
			$info = Image::getImageInfo('.'.$path);
				if ($info['width'] <= 250)
					$picture['height'] = $info['height'];
				else if ($info['width'] <= 500)
					$picture['height'] = ceil($info['height'] * 250 / $info['width']);
				else
					$picture['height'] = ceil($info['height'] / 2);
			$results[] = $picture;
		}
		//dump($results);
		return $results;
	}
	
	public function addPic($data) {
		M('activity_picture')->add($data);
		
		$this->where('act_id='.$data[act_id])->setInc('picture_num');
	}
	public function updatePic($pid,$data){
			//dump($pid);die;
	    M('activity_picture')->where(['pid'=>$pid])->save($data);
	}
	public function deletePic($pid) {
		$pic = M('activity_picture')->where('pid='.$pid)->find();
		
		return ( M('activity_picture')->where('pid='.$pid)->delete() ) && ($this->where('act_id='.$pic[act_id])->setDec('picture_num'));
	}
	
	public function getPic($pid) {
		return M('activity_picture')->where('pid='.$pid)->find();
	}
	
	public function likesPic($pid) {
		return M('activity_picture')->where('pid='.$pid)->setInc('likes');
	}
	public function getAddress($act_id){
		return M('Activity_register')->where(['act_id'=>$act_id])->select();
	}
	public function change_priv($priv,$act_id,$type){
		return M('Activity')->where(['act_id'=>$act_id])->save([$type.'_priv'=>$priv]);
	}
	public function get_priv($act_id,$type){
		return M('Activity')->field($type.'_priv')->where(['act_id'=>$act_id])->find()[$type.'_priv'];
	}
}
	

?>
