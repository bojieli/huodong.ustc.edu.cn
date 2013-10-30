<?php
class TimelineAction extends PublicAction{
	public function index(){
		$gid=$this->_get('gid');
		$this->assign('club',D('Club')->getInfo($gid));
		$this->assign('gid',$gid);
		$this->display();
	}
	public function Club(){
		$gid=$this->_get('gid');
		//$gid=2;
		$club=D('Club')->getInfo($gid);
		$posters=D('Poster')->getPosterByGid($gid);
		$posters=$this->format($posters);
	    $info["timeline"]['headline']='那些年,'.$club['name'].'走过的路。。。';
		$info["timeline"]['type']='default';
		$info["timeline"]['text']=$club['slogan'];
		$info["timeline"]['startDate']=$posters[count($posters)-1]['startDate'];
		$info["timeline"]['date']=$posters;
		//$timeline=$info;
		$this->ajaxReturn($info);
	}
	private function format($posters)
	{
		//$key=['startDate,endDate,headline,text,asset'];
		$url="http://huodong.ustc.edu.cn/upload/poster/thumb/";
		foreach($posters as $key => $poster){
			$tmp[$key]['startDate']=date("Y,n,j",$poster['start_time']);
			$tmp[$key]['endDate']=date("Y,n,j",$poster['end_time']);
			$tmp[$key]['headline']=$poster['name'];
			$tmp[$key]['text']='<p>'.$poster['description'].'</p>';
			$thumb_url=$url.'thumb_'.$poster['poster'];
			$large_url=$url.'large_'.$poster['poster'];
			$tmp[$key]['asset']=array('media'=>$large_url,'thumbnail'=>$thumb_url);
		}
		return $tmp;
	}
}?>