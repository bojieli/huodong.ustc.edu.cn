<?php
class NotifyModel extends ViewModel {
	public $viewFields = array(
		'act' => array('aid','pid','name','is_public','act_date','start_time','end_time','apply_place','place_diyname','placeid','rate','poster','description','content'),
		//'act_tag' => array('tag', '_on'=>'act.aid=act_tag.aid'),
		'place' => array('name'=>'place_name', '_on'=>'act.placeid=place.placeid'),
		'plan' => array('status','gid','host_org','assistant_org', '_on'=>'act.pid=plan.pid'),
		'org' => array('name'=>'org_name','type'=>'org_type', '_on'=>'plan.gid=org.gid')
	);

	public function msgCount() {
		return CURRENT_USER;
	}
}
