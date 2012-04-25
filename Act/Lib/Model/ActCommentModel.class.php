<?php
class ActCommentModel extends ViewModel {
	public $viewFields = array(
		'act_comment' => array('id', 'uid', 'content', 'time', 'rate'),
		'user' => array('username', '_on'=>'act_comment.uid=user.uid')
	);
}
