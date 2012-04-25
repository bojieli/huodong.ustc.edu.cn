<?php
class PlanModel extends RelationModel {
	public $_link = array(
		'org' => array(
			'mapping_type' => BELONGS_TO,
			'foreign_key' => 'gid',
			'mapping_name' => 'org'
			),
		'user' => array(
			'mapping_type' => BELONGS_TO,
			'foreign_key' => 'leader_uid',
			'mapping_name' => 'leader'
			),
		'act' => array(
			'mapping_type' => HAS_MANY,
			'foreign_key' => 'pid',
			'mapping_name' => 'act',
			'mapping_order' => 'aid'
			),
		'plan_budget' => array(
			'mapping_type' => HAS_MANY,
			'mapping_name' => 'budget',
			'foreign_key' => 'pid'
			),
		'plan_audit' => array(
			'mapping_type' => HAS_MANY,
			'mapping_name' => 'audit',
			'foreign_key' => 'pid'
			),
		'plan_public_relation' => array(
			'mapping_type' => HAS_MANY,
			'mapping_name' => 'public_relation',
			'foreign_key' => 'pid'
			),
		'plan_member' => array(
			'mapping_type' => HAS_MANY,
			'mapping_name' => 'member',
			'foreign_key' => 'pid'
			),
		'plan_participant' => array(
			'mapping_type' => HAS_MANY,
			'mapping_name' => 'participant',
			'foreign_key' => 'pid'
			),
		'plan_sponsor' => array(
			'mapping_type' => HAS_MANY,
			'mapping_name' => 'sponsor',
			'foreign_key' => 'pid'
			),
		'plan_account_book' => array(
			'mapping_type' => HAS_MANY,
			'mapping_name' => 'account_book',
			'foreign_key' => 'pid'
			),
		'plan_attachment' => array(
			'mapping_type' => HAS_MANY,
			'mapping_name' => 'attachment',
			'foreign_key' => 'pid'
			)
	);
}
