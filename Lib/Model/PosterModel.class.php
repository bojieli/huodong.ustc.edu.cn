<?php
class PosterModel extends Model {
    public function getPoster($start, $num, $cond = [], $order = '') {
        return M('Poster')->where($cond)->order($order)->limit("$start,$num")->cast(__CLASS__)->select();
    }
    public function getPosterById($aid) {
        return M('Poster')->cast(__CLASS__)->find($aid);
    }
	public function getPosterByGid($gid)
	{
		$re=M('Poster')->where(array('gid'=>$gid))->order('publish_time desc')->select();
	    foreach($re as $row=>$val)
		{
			$re[$row]['Publish_time']=date("n月j日 H:i:s",$val['publish_time']);
			$re[$row]['Start_time']=date("n月j日 H:i:s",$val['start_time']);
			$re[$row]['End_time']=date("n月j日 H:i:s",$val['end_time']);
		}
		return $re;
	}
	public function getPosterAuthorByAid($aid){
		return M('Poster')->field('author')->where(['aid'=>$aid])->find()['author'];
	}
	public function getPosterOwnerByAid($aid){
		return M('Poster')->field('gid')->where(['aid'=>$aid])->find()['gid'];
	}
	public function getPosterStartTime($aid){//ltx
		return M('Poster')->field('start_time')->where(array('aid'=>$aid))->find()['start_time'];
	}
    public function isOutOfStartTime($aid){
		return ($this->getPosterStartTime($aid)<time());
	}
	public function id() {
        return $this->aid;
    }

    public function name() {
        return $this->name;
    }

    public function place() {
        return $this->place;
    }
    public function description(){
        $str = "@http://infopublish.ustc.edu.cn";
        $start = strpos($this->description, $str);
        if( $start !== false){
            $new_str = substr($this->description,$start+strlen($str));
            return html_entity_decode($new_str);
        }else{
            return $this->description;
        }
    }
    public function humanDate() {
        $str = date("n月j日H:i", $this->start_time);
        $str .= ' - ';
        // if in the same day
        if (date("Y-m-d", $this->start_time) == date("Y-m-d", $this->end_time))
            $str .= date("H:i", $this->end_time);
        else
            $str .= date("n月j日H:i", $this->end_time);
        return $str;
    }

    public function schoolName() {
        return D('Club')->schoolName($this->gid);
    }

    public function clubName() {
        $club = M('Club')->field('name')->find($this->gid);
        return $club['name'];
    }

    public function thumbUrl($large = false) {
        if (empty($this->poster))
            return '';
        if ($large) {
            $url = "/upload/poster/thumb/large_".$this->poster;
            if (file_exists('.'.$url))
                return $url;
        }
        return "/upload/poster/thumb/thumb_".$this->poster;
    }

    public function thumbHeight($large = false) {
        import("ORG.Util.Image");
        $info = Image::getImageInfo('.'.$this->thumbUrl($large));
        if (!$large) {
            // width 250 => width 500
            if ($info['width'] <= 250)
                return $info['height'];
            else if ($info['width'] <= 500)
                return ceil($info['height'] * 250 / $info['width']);
            else
                return ceil($info['height'] / 2);
        }
        else
            return $info['height'];
    }

    public function origPosterUrl() {
        if (empty($this->poster))
            return '';
        return "/upload/poster/".$this->poster;
    }

    public function get_stat($condition='') {
        if(empty($condition))
        {
            $condition1 = "";
            $condition2= "";
        }
        else
        {
            $condition1 = " where ".$condition;
            $condition2= " and (".$condition.")";
        }
        $stat['total'] = $this->result_first("SELECT COUNT(*) FROM ustc_poster".$condition1);
        $stat['incoming'] = $this->result_first("SELECT COUNT(*) FROM ustc_poster WHERE end_time > '".time()."'".$condition2);
        $gid_result = M('User_group')->query("SELECT DISTINCT gid FROM ustc_user_group where uid = '".CURRENT_USER."'");
        $gid_condition = "(";
        foreach($gid_result as $v)
        {
            $gid_condition .=$v['gid'].",";
        }
        $gid_condition .= "-1)";
        $stat['followed'] = $this->result_first("SELECT COUNT(*) FROM ustc_poster WHERE gid IN $gid_condition ".$condition2);
        //$stat['followed'] = $this->result_first("SELECT COUNT(*) FROM ustc_poster AS a, ustc_user_group AS ug WHERE ug.uid = '".CURRENT_USER."' AND ug.gid = a.gid".$condition2);
        $stat['newmsg'] = 0;
        return $stat;
    }

    public function getRate($aid = null) {
        if (empty($aid))
            return $this->rate_total;
        else {
            $poster = $this->field('rate_total')->find($aid);
            return $poster['rate_total'];
        }
    }

    public function addCommentCount($aid) {
        if (!is_numeric($aid))
            return;
        M()->execute("UPDATE ustc_poster SET comment_count = comment_count+1 WHERE `aid`='$aid'");
        $this->updateRate($aid, 10);
    }

    public function addLike($aid) {
        if (!is_numeric($aid))
            return;
        M()->execute("UPDATE ustc_poster SET likes = likes+1 WHERE `aid`='$aid'");
        $this->updateRate($aid, 5);
    }

    public function addClick($aid) {
        if (!is_numeric($aid))
            return;
        M()->execute("UPDATE ustc_poster SET clicks = clicks+1 WHERE `aid`='$aid'");
        $this->updateRate($aid, 1);
    }

    private function updateRate($aid, $delta) {
        if (!is_numeric($aid) || !is_numeric($delta))
            return;
        M()->execute("UPDATE ustc_poster SET rate_total = rate_total + ($delta) WHERE `aid`='$aid'");
    }

    public function toArray() {
        return (array)($this->data);
    }

    public function canModify() {
        return A('Club')->isManager($this->gid);
    }
    public function getAuthorByCid($cid){	
    	return M('Poster_comment')->field('author')->where(['cid'=>$cid])->find()['author'];
    }
    public function isPosterOwner($aid,$gid){//海报拥有集体
    	return $gid==$this->getPosterOwnerByAid($aid);
    } 

    public function needUploadAuto($id){
            $con["description"]=$id."@http://infopublish.ustc.edu.cn";
            return M("Poster")->field("aid")->where($con)->find();
    }
    public function getWeiboByRand(){
        //$con['id']=2;
        return M("Weibo_tpl")->order("rand()")->find()["tpl"];
    }
    public function createWeiboQueue($aid){
        $data = array(
            'aid'=>$aid,
            'time'=>time()
            );
        return M("Weibo_queue")->add($data);
    }
    public function getWeiboQueuePer(){
        $con = array(
            'status'=>0
            );
        return M("Weibo_queue")->where($con)->order("id")->find();
    }
    public function finishWeiboTaskPer($aid){
         $con = array(
            'aid'=>$aid
            );
        $data = array(
            'status'=>1,
            'time'=>time()
            );
        return M("Weibo_queue")->where($con)->save($data);
    }

}
