<?php
class InfoModel extends ViewModel {
	public $viewFields = array(
		'act' => array('aid','pid','name','start_time','end_time','placeid','rate','poster','description'),
		//'act_tag' => array('tag', '_on'=>'act.aid=act_tag.aid'),
		'place' => array('name'=>'place_name', '_on'=>'act.placeid=place.placeid'),
		'plan' => array('status','gid','host_org','assistant_org', '_on'=>'act.pid=plan.pid'),
		'org' => array('name'=>'org_name','type'=>'org_type', '_on'=>'plan.gid=org.gid')
	);

}
