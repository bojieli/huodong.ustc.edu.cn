<?php


class ActivityModel extends Model {

	
	public function getActivityByID($id,$all=1) {
		$where = array(
			'act_id' => $id,
		);
		$info = $this->join(C('DB_PREFIX').'poster on '.C('DB_PREFIX').'poster.aid = '.C('DB_PREFIX').'activity.poster_id')->where($where)->find();
		//$info = $this->where($where)->find();
		if(!empty($info[act_id]) && $all) {
			$info[picture]=D('activity_picture')->join(C('DB_PREFIX').'user on '.C('DB_PREFIX').'user.uid='.C('DB_PREFIX').'activity_picture.uid')->where('act_id='.$info[act_id])->order('time desc')->select();
			$info[article]=D('activity_article')->join(C('DB_PREFIX').'user on '.C('DB_PREFIX').'user.uid='.C('DB_PREFIX').'activity_article.uid')->where('act_id='.$info[act_id])->order('time desc')->select();
		}
		return $info;
	
	}

	public function getPicture($act_id,$start, $num)
	{
		import("ORG.Util.Image");
		$pictures = M('Activity_picture')->where(array("act_id"=>$act_id))->limit("$start,$num")->select();
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
	
}


?>