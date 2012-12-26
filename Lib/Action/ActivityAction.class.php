<?php
class ActivityAction extends PublicAction{
	public function index(){
		global $_G;
        $this->headnav();
        $keyword = isset($_GET['keyword']) ? addslashes($_GET['keyword']) : '';
        $sid = isset($_GET['sid']) ? addslashes($_GET['sid']) : $_G['sid'];
        $condition = '';
        $url = '';
        if(!empty($keyword))
        {
            $condition = " (name like '%$keyword%' or place like '%$keyword%' or description like '%$keyword%') ";
            if(empty($url))
            {
                $url .= "keyword='$keyword'";
            }
            else
            {
                $url .="&keyword='$keyword'";
            }
        }
        if(!empty($sid))
        {
            if(empty($condition))
            {
                $condition .= " sid = '$sid' ";
            }
            else
            {
                $condition .= " AND sid = '$sid' ";
            }
        }

        $schools = M('School')->select();
        $num = count($schools);
        for($i=0;$i<$num;$i++)
        {
            $school_id = $schools[$i]['sid'];
            if(empty($url))
            {
                $schools[$i]['url']="/Poster/index?sid=$school_id";
            }
            else
            {
                $schools[$i]['url']='/Poster/index?'.$url."&sid=$school_id";
            }

        }
        $school_all[] = array(
                'sid' => 0,
                'url' => empty($url)?'/Poster/index?sid=0':'/Poster/index?'.$url."&sid=0",
                'name' => '全部学校'
                );
        $schools =  array_merge($school_all,$schools);
        $schools = json_encode($schools);
        $this->assign('schools', $schools);
        $this->assign('sid', $sid);
        $this->assign('keyword', $keyword);
        $this->assign('stat', D('Poster')->get_stat($condition));
        $this->assign('order', empty($_GET['order']) ? 'new' : $_GET['order']);
		$this->display('Poster:index');
	}
	 public function ajaxGet() {
        //list($start, $num, $cond, $order) = $this->parseInput();
		$start = $this->_get('start');
		$num = $this->_get('num');
		$act_id = $this->_get('act_id');
		$pictures = D('Activity')->getPicture($act_id,$start,$num,$order="likes desc");
		//dump($pictures);
        $elements = [];
        foreach ($pictures as $picture)
            $elements[] = $this->picture2html($picture);
        echo json_encode($elements);
    }

    public function ajaxGetDesc()
    {
    	$pid=$this->_get('pid');
    	$picture = M('Activity_picture')->where(array('pid' =>$pid))->select();
    	if($picture)
    	{
    		$result['status']=1;
    		foreach ($picture as $key => $value) {
    			$result['pic']=$value['path'].'thumb/large_'.$value['name'];
    			$result['description']=$value['title']."<br>".$value['description'];
    		}
    		echo json_encode($result);
    	}
    	else
    	{
    		$result['status']=1;
    		echo json_encode($result);
    	}
    	
    }
	private function picture2html($picture) {
        return '<li class="hide"><div class="celldiv" itemscope itemtype="http://data-vocabulary.org/Event">'.
            ($picture['path'] ? '<img id="'.$picture['pid'].'" class="picture" itemprop="photo" height="'.$picture['height'].'" src="'.$picture['path'].'"  />' : '').
            '<div class="detail"><div class="hot">'.
            '<span class="ding"><span class="iconding" onclick="like('.$picture['pid'].');return false;"></span><span id = "rate_'.$picture['pid'].'"   class="rate">'.$picture['likes'].'</span></span></div>
            <p>'.$picture['title'].'</p>
            </div></div></li>';
    }
    private function picture2html2($picture) {
        return '<li class="show" style="position:static; margin:22px; display:inline-block;"><div class="celldiv" itemscope itemtype="http://data-vocabulary.org/Event">'.
            ($picture['path'] ? '<img id="'.$picture['pid'].'" class="picture" itemprop="photo" height="'.$picture['height'].'" src="'.$picture['path'].'"  />' : '').
            '<div class="detail"><div class="hot">'.
            '<span class="ding"><span id = "rate_'.$picture['pid'].'"   class="rate">'.$picture['likes'].'</span></span></div>
            <p>'.$picture['title'].'</p>
            </div></div></li>';
    }
	public function show()
	{
		$act_id = $this->_get('act_id');
		$activity = M('Activity')->find($act_id);
		if($activity['poster_id'])
		{
			$poster = M('Poster')->field('gid,aid,name')->find($activity['poster_id']);
			$club_id = $poster['gid'];
			$activity['post_name'] = $poster['name'];
			$activity['poster_url'] = "/Poster/singlePage?aid=".$poster['aid'];
			if($club_id)
			{
				$club_name = M('Club')->field('name')->find($club_id);
				$club_name = $club_name['name'];
				$activity['club_name'] = $club_name;
				$activity['club_url'] = "/Club/intro?gid=".$club_id;
			}
		}

		$this->assign('act_id', $act_id);
		$this->assign('activity', $activity);
		$this->display();
	}
	public function admin()
	{
		global $_G;
		if(!D('User')->checkLogin())
        {
            $this->assign('jumpUrl','/User/login');
            $this->error('您尚未登录');
        }

		$act_id = $this->_get('act_id');
		$activity = M('Activity')->find($act_id);
		$uid = $_G['uid'];
		if($uid!=$activity['uid'])
		{
            $this->error('您没有权限');
		}
		$pictures = M('Activity_picture')->where(array("act_id"=>$act_id))->select();
		$this->assign('activity', $activity);
		$this->assign('pictures', $pictures);
		$this->display();
	}
	public function award()
	{
		global $_G;
		if(!D('User')->checkLogin())
        {
            $this->assign('jumpUrl','/User/login');
            $this->error('您尚未登录');
        }
        $uid = $_G['uid'];

		$reward = $this->_post('reward');
		$level = $this->_post('level');
		$pid = $this->_post('pid');
		$picture = M('Activity_picture')->find($pid);
		$act_id = $picture['act_id'];
		$activity = M('Activity')->find($act_id);
		if($uid!=$activity['uid'])
		{
            $this->error('您没有权限');
		}
		$data['reward'] = $reward;
		$data['level'] = $level;
		M('Activity_picture')->where(array('pid' => $pid))->save($data);
		$this->success('设置成功');
	}
	public function show_award()
	{
		import("ORG.Util.Image");
		$act_id = $this->_get('act_id');
		$activity = M('Activity')->find($act_id);
		$pictures = M('Activity_picture')->where(array("act_id"=>$act_id))->order('level desc')->select();
		$result = array();
		foreach ($pictures as $key => $picture) {
			$reward = $picture['reward'];
			if(empty($reward))
			{
				$reward="优秀作品";
			}
			$path = $picture['path'].'thumb/thumb_'.$picture['name'];
			$picture['path'] = $path;
			$info = Image::getImageInfo('.'.$path);
				if ($info['width'] <= 250)
					$picture['height'] = $info['height'];
				else if ($info['width'] <= 500)
					$picture['height'] = ceil($info['height'] * 250 / $info['width']);
				else
					$picture['height'] = ceil($info['height'] / 2);
			$info = $this->picture2html2($picture);
			$result[$reward][]=$info;
		}
		
		$this->assign('act_id', $act_id);
		$this->assign('activity', $activity);
		$this->assign('pictures', $result);
		$this->display();
	}
	public function find() {
		$act_id = $this->getActID();
		$actDB = D('Activity');
		$act = $actDB->getActivityByID($act_id);
		if(empty($act)) {
			$this->error('活动不存在！');
		}
		/*
		dump($act);
		echo $act[poster_id];
		*/
		$poster = D('Poster')->getPosterById($act[poster_id]);
		/*
		echo D('Poster')->getLastSql();
		dump($poster);
		//die();
		*/
        if (empty($poster))
            $this->error("海报不存在！");
		$poster->rate = $poster->getRate();
        $poster->school = $poster->schoolName();
        $poster->name = $poster->name();
        $poster->humanDate = $poster->humanDate();
        $poster->start_time1 = date('c',$poster->start_time);
        $poster->end_time1 = date('c',$poster->end_time);
        $poster->thumbPoster = $poster->thumbUrl();
        $poster->largePoster = $poster->thumbUrl(true);
        $poster->origPoster = $poster->origPosterUrl();
        $poster->canModify = $poster->canModify();
        $poster->clubName = $poster->clubName();
        //dump($poster);
		$this->assign('poster', $poster->toArray());
		$this->assign('activity',$act);
		//dump($act);
		$this->display();
	}
	
	public function postPic() {
		$id=$this->getActID();
		if(!$this->allowPost($id)) {
				$this->error('没有权限！');
		}
		if(!$_POST['submit']) {
			$act = D('Activity')->getActivityByID($id);
			//dump($act);
			$this->assign('activity',$act);
			$this->display();
		}else {
			$picInfo = $this->uploadPic();
			global $_G;
			$data=array(
				'name' => $picInfo[savename],
				'path' => '/upload/picture/',
				'title' => empty($_POST['title']) ? '':$_POST['title'],
				'description' => empty($_POST[desc]) ? '':$_POST[desc],
				'uid' => $_G[uid],
				'time' => time(),
				'act_id' => $id,
				'likes' =>0
			);
			D('Activity')->addPic($data);
			if($_GET[batch] == 1) {
				$this->ajaxReturn(1,'成功上传！',1);
			} else {
				$this->assign('jumpUrl','/Activity/find?id='.$id);
				$this->success('成功上传');
			}
		}
	}
	
	public function delete() {
		$typeArr = array('pic','article');
		$id = (empty($_GET[id]) || !is_numeric($_GET[id])) ? 0:$_GET[id];
		$status=false;
		switch($_GET[type]) {
			case 'pic':
				if($this->allowDel('pic',$id)) {
					$status=D('Activity')->deletePic($id);
				} else {
					$this->error('没有权限！');
				}
				break;
			case 'article':
				if($this->allowDel('article',$id)) {
					$status=D('Activity')->deleteArticle($id);
				} else {
					$this->error('没有权限！');
				}
				break;
		}
		if($status) {
			$this->success('删除成功！');
		}else{
			$this->error('删除失败！');
		}
	}
	
	private function allowDel($type='pic',$id) {
		global $_G;
		switch($type){
			case 'pic':
				$info = D('Activity')->getPic($id);
				if( $info[uid]==$_G[uid] || $_G[isadmin]) {
					return true;
				}
				return false;
				break;
			
		}
		return false;
		
	}
	
	private function allowPost($aid) {
		global $_G;
		$info = D('Activity')->where('act_id='.$aid)->find();
		if(!empty($_G[uid]) && !empty($info) && $info[enable_post]) {
			return true;
		}
		return false;
		
	}
	private function uploadPic() {
		import("ORG.Net.UploadFile");
        $upload = new UploadFile();
        $upload->maxSize = 8 * 1024 * 1024;
        $upload->allowExts = ['jpg', 'gif', 'png', 'jpeg'];
        $upload->savePath = './upload/picture/';
        $upload->saveRule = 'uniqid';

        import("ORG.Util.Image");
        $upload->thumb = true;
        $upload->thumbPath = './upload/picture/thumb/';
        $upload->thumbMaxWidth = '500,800';
        $upload->thumbMaxHeight = '2000,3200';
        $upload->thumbPrefix = 'thumb_,large_';

		
        if ($upload->upload()) {
            $info = $upload->getUploadFileInfo();
            return $info[0];
        }
		echo $upload->getErrorMsg();
		die();
        return null;
	}
	
	public function getPicArt() {
		$id = $this->getActID();
		$info = D('Activity')->getActivityByID($id,1,"likes desc");
		$this->assign('activity',$info);
		$this->display('Activity:find');
	}
	public function test() {
	/*
		$activity = D('Activity');
		$res=$activity->getActivityByID(1);
		dump($res);
		echo $activity->getLastSql();
		*/
		global $_G;
		dump($_G);
	}
	
	private function getActID() {
		$id = $_GET[id];
		if(empty($id) || !is_numeric($id)) {
			$this->error('页面没有找到，参数不正确！');
		}
		return $id;
	}
}

?>