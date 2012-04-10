<?php
// include/function_rulelist.php 2011-07-10 boj
// parsing rule list

// Note that these functions have no direct access to database, nor privileges
//	to gather information needed for judging the rules. These functions
//	use common object visitor interfaces to get attribute values. If
//	access is denied, the expected attribute is considered NULL.
// Calling functions should get the rule list from storage and transfer
//	it here as an argument, then get the result back and make proper
//	decisions.

function check_rules($rule_list = '', $needle = '') {

}

function check_priv_list($priv_list = '', $object_path = '', $event = '') {

}

function check_belong($rule_list = '', $needle = '') {

}
?>
