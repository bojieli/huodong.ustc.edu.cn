<?php
// include/function_template.php 2011-07-24 boj
// template parsing functions

// CAUTION: This version has no detection of infinite loop.

// THE FOLLOWING DOCUMENTATION SHOULD BE SYNCHRONIZED WITH DESIGN DOCUMENT

// Template syntax is derived from HTML syntax by adding several tokens to HTML, 
//	providing a control mechanism of information shown in an object.
// Template tokens are divided into two types: logical, instructional.
// Note that extra tokens defined in CSS are not considered template tokens, 
//	for they have nothing to do with the control flow.

// ===========================================================================

// Logical template tokens definition
//	if, for, ref, include

// 'if' statement
// syntax: <if condition>... [<elseif [condition] />...] [<else [condition] />...] </if>

// Note that <if> and its condition is required (otherwise why is there to be an 'if' statement?), 
//	<elseif> can be repeated zero or one or multiple times,
//	<else> can be repeated zero or one time.
// Since <elseif> and <else> is self-closed, tokens still appear in pairs. Unclosed <elseif> and <else>
//	clause will break the HTML structure, which might have been XML-compliant.

// <condition> is the success criteria presented in SQL syntax.
// For ease of use, conditions with '==' comparison and attribute name not 'condition',
//	can be represented outside <condition> in HTML attribute syntax (attribute_name='value').
//	While parsing, outside conditions will be added to <condition> with 'AND' between adjacent ones.

// Possible 'if' statement 1:
// Say 'I have so long been waiting for you' to and only to the expected user.
//	<if user='the_one'><script>alert('I have so long been waiting for you');</script></if>
// Example HTML output: (when the statement is false)
//	(nothing)

// Possible 'if' statement 2:
// Show 'delete' link if current user has the privilege to delete current object.
//	<if condition="have_privilege(delete)"><a href="delete">DELETE ME!</a></if>
// Example HTML output: (when the statement is true)
//	<a href="delete">DELETE ME!</a>

// ===========================================================================

// 'for' statement
// syntax: <for [source] [depth] [condition] [order] [limit] >...</for>

// If a valid <source> is given, sub-objects will be selected from that source.
// If <source> is not given or invalid, <source> will be set to current object. (NOT root!)

// If a positive numeric <depth> is given, sub-objects with relative path to <source> not longer than
//	<depth> will be selected.
// Specificly, if <depth> is 1, only child objects of <source> will be selected.
// The default value of <depth> is 1.
// If <depth> is set but not valid, <depth> will be set to INFINITY, which means no depth limit.

// <condition> is the selection criteria of sub-objects, presented in SQL syntax.
// For ease of use, conditions with '==' comparison and attribute name NOT
//	in_array('for', 'source', 'depth', 'condition', 'order', 'limit')
//	can be represented outside <condition> in HTML attribute syntax (attribute_name='value').
//	While parsing, outside conditions will be added to <condition> with 'AND' between adjacent ones.

// <order> is the ranking order of selected objects presented in SQL syntax, excluding 'ORDER BY'.
// <order> = [<attribute> [<order>]] repeated n(>=1) times, where order can be DESC (descending) or null (ascending).

// <limit> limits the number of selected objects.
// If <limit> consists of only one positive integer, then objects ranked 0 ~ <limit>-1 will be selected.
//	Note that the first object is ranked 0, NOT 1.
// If <limit> consists of two non-negative integers separated by ',', call them <start>,<number> correspondingly,
//	then objects ranked <start> ~ <start>+<number>-1 will be selected.
// The syntax of <limit> is identical to SQL LIMIT.

// Possible 'for' statement 1:
// Show a list of all news in current channel.
//	<ul><for><li>extract_date($create_time) <a href="$link">$title</a></li></for></ul>
// Example HTML result:
//	<ul><li>2011-07-08 <a href="2617">RFC 2617</a></li><li>2011-07-07 <a href="2616">Hypertext Transfer Protocol</a></li></ul>

// ===========================================================================

// 'ref' statement
// syntax: <ref source>...</ref>

// Different from 'for' statement, 'ref' just show the <source> object.
// It can be used to switch to another given object promptly.

// Possible 'ref' statement:
// Show the title of a manually referred object.
//	... HTTP and FTP are two widely acknowleged application-layer network protocols.
//	<ul><li><ref source="../RFC/2616"><a href="$link">$title</a> addlink($tags) </ref></li>
//	<li><ref source="../RFC/959"><a href="$link">$title</a> addlink($tags) </ref></li></ul>
// Example HTML result:
//	... HTTP and FTP are two widely acknowleged application-layer network protocols.
//	<ul><li><a href="../RFC/2616">Hypertext Transfer Protocol</a> <a href="HTTP?tag">HTTP</a><a href="RFC?tag">RFC</a> </ref></li>
//	<li><a href="../RFC/959">File Tranfer Protocol</a> <a href="FTP?tag">FTP</a><a href="RFC?tag">RFC</a> </ref></li></ul>

// ===========================================================================

// 'include' statement
// syntax: <include source [updatelink] />

// This statement initiates a 'read' event to <source> and get the contents of <source>.
// If <updatelink> is set to be true, then the relative links in included content will be updated
//	to adapt current object path.
// If <updatelink> is not set or set to be a value other than 'true', then the included content
//	will be exactly filled here. This may lead to some dead links.

// Possible 'include' statement:
// Show the user panel on the topright corner of page.
//	<div class="upanel"><include source="/user/upanel" /></div>
// Example HTML result:
//	<div class="upanel">Welcome <a href="/user/profile">boj</a> <a href="/user/logout">Logout</a></div>

// ===========================================================================

// Instructional templates token definition
//	event, call, eval, set

// 'event' statement (no return value)
// syntax: <event event [arguments] />

// Trigger an event.
// Use HTML-style argument list to provide arguments for the event.
// Use escape ('\') character to escape double-quote ('"') character.

// ===========================================================================

// 'call' statement
// syntax: <call event [argument] />

// Call a SYNCHRONOUS event and get the return value.
// Use HTML-style argument list to provide arguments for the event.
// Use escape ('\') character to escape double-quote ('"') character.

// ===========================================================================

// 'eval' statement
// syntax: <eval>command</eval>

// Execute a command in script syntax and get the return value.
// If the command consists of HTML special characters, they should be encoded first to avoid ambigious tokens.
// The command parser will decode the command to recover the HTML special characters before any other action.

// ===========================================================================

// 'set' statement (no return value)
// syntax: <set attribute="value" />

// Set an attribute with given value. The name of attribute should be a valid variable name.
// Use escape ('\') character in <value> to escape double-quote ('"') character.
// If the attribute is currently set, its value will be updated.

// ===========================================================================

function extract_condition(&$template, $startpos, &$endpos) {
	var $pos = $startpos;
	var $data = array();
	while ($template[$pos] != '>') { // end of tag
		$equalpos = strpos($template, '=', $pos);
		$attr = trim(substr($template, $pos, $equalpos - $pos));
		
		$pos = $equalpos + 1;
		$spacepos = strpos($template, ' ', $pos);
		$data[$attr] = trim(substr($template, $pos, $spacepos - $pos), ' "');
		
		$pos = $spacepos + 1;
	}
	$endpos = $pos; // return end position by reference
	return $data;
}

function condition2sql($condition) {
	$sql = '1';	
	foreach ($condition as $key => $value) {
		$sql .= " AND `$key` = '$value'";
	}
	return $sql;
}

function sql2condition($sql) { // return condition['attr', 'sign', 'value']
	var $condition = array();
	var $pos = 0;
	var $length = strlen($sql);
	while ($pos < $length) {
		var $signpos = $pos+1;
		while ($signpos < $length && !in_array($sql[$signpos], array('>', '<', '=', '!'))) {
			$signpos++;
		}
		var $attr = trim(substr($sql, $pos, $signpos - $pos), ' `');
		var $sign = $sql[$signpos];
		if ($sql[$signpos+1] == '=') {
			$sign .= '=';
			$signpos++;
		}
		
		$pos = $signpos+1;
		var $andpos = strpos($sql, 'AND', $pos);
		var $value = trim(substr($sql, $pos, $andpos - $pos), " '");
		
		$condition[] = array( 'attr' => $attr, 'sign' => $sign, 'value' => $value );
	}
	return $condition;
}

function check_condition($condition = array(), $curr_path) {
	
	var $sql_condition = sql2condition($condition['condition']);
	unset($condition['condition']);
	foreach ($sql_condition as $cond) {
		$key = $cond['key'];
		$value = $cond['value'];		
		switch ($cond['sign']) {
			case '==':
			case '='	: if (OBJ::get($curr_path, $key) != $value) return false;
				else break;
			case '!=': if (OBJ::get($curr_path, $key) == $value) return false;
				else break;
			case '>' : if (!(OBJ::get($curr_path, $key) > $value)) return false;
				else break;
			case '<' : if (!(OBJ::get($curr_path, $key) < $value)) return false;
				else break;
			case '>=': if (!(OBJ::get($curr_path, $key) >= $value)) return false;
				else break;
			case '<=': if (!(OBJ::get($curr_path, $key) <= $value)) return false;
				else break;
			default: return false; // undefined sign
		}
	}
	
	foreach ($condition as $key => $value) {
		if (OBJ::get($curr_path, $key) != $value)) {
			return false;		
		}
	}
	return true;
}

// WARNING: This function changes template and condition by reference.
function parse_tags($tag, &$template, &$condition, $self_closed = false) {
	var $tag_length = strlen($tag);
	$template = trim($template, ' \t\n\r');
	if ($self_closed) {
		if (substr($template, 0, $tag_length+1) != '<'.$tag) {
			$condition = extract_condition($template, $tag_length+1, $endcondpos);
			return true;
		}
		return false;
	}
	else { // not self-closed tags
		if (substr($template, 0, $tag_length+1) != '<'.$tag || substr($template, -($tag_length+3), $tag_length+3) != '</'.$tag.'>') {
			return false; // invalid tag syntax
		}
	
		var $endcondpos; // by reference
		$condition = extract_condition($template, $tag_length+1, $endcondpos);
		$template = substr($template, $endcondpos+1); // omit condition part
		$template = substr($template, 0, -($tag_length+3)); // omit end tag
		return true;
	}
}

function parse_if($template, $curr_path) {
	var $condition;
	if (!parse_tags('if', $template, $condition)) {
		return null;
	}
	
	if (check_condition($condition, $curr_path)) {
		return parse_template($template, $curr_path);
	}
	else { // find elseif or else
		var $elseifpos = strpos($template, '<elseif');
		if ($elseifpos !== false) {
			return parse_if('<if'.substr($template, $elseifpos + 7), $curr_path); // pretend to be if
		}
		var $elsepos = strpos($template, '<else');
		if ($elsepos !== false) {
			var $tagendpos = strpos($template, '>', $elsepos + 5);
			return parse_template(substr($template, $tagendpos + 1), $curr_path);
		}
		return null; // no else
	}
}

function parse_for($template, $curr_path) {
	var $condition;
	if (!parse_tags('for', $template, $condition)) {
		return null;
	}
	
	var $sql = '';
	if (isset($condition['source'])) {
		$condition['parent'] = $condition['source'];
		unset($condition['source']);
	}
	if (isset($condition['depth'])) {		
		if (is_numeric($condition['depth'])) {
			$depth = $condition['depth'];
		} else {
			$depth = INFINITY; // if depth is invalid, then set it to infinity
		}
		unset($condition['depth']);
	} else {
		$depth = 1; // the default depth is 1, only finding child
	}
	if (isset($condition['order'])) {
		$order = $condition['order'];
		unset($condition['order']);
	} else {
		$order = null;
	}
	if (isset($condition['limit'])) {
		$limit = $condition['limit'];
		unset($condition['limit']);
	} else {
		$limit = null;
	}
	
	var $where = '';
	if (!empty($condition['condition'])) {
		$where = $condition['condition'] . ' AND ';
		unset($condition['condition']);
	}
	$where .= condition2sql($data);
	
	var $return = '';
	// This is an optimization to prefetch all attributes. In fact only `path` is needed.
	$objects = OBJ::find($curr_path, $depth, null, $where, $order, $limit);
	foreach ($objects as $object) {
		$return .= parse_template($template, $object['path']); // parse for each object
	}
	return $return;
}

function parse_ref($template, $curr_path) {
	var $condition;
	if (!parse_tags('ref', $template, $condition)) {
		return null;
	}
	if (ispath($condition['source'])) {
		return parse_template($template, $condition['source']); // <ref> changes current path to `source`
	}
	else return null; // invalid source path
}

function parse_include($template, $curr_path) {
	var $condition;
	if (!parse_tags('include', $template, $condition, true)) { // self-closed
		return null;
	}
	return OBJ::read($condition['source']);
}

function parse_event($template, $curr_path) {
	global $event;	
	var $args;
	if (!parse_tags('event', $template, $args, true)) { // self-closed
		return null;
	}
	$event_name = $args['event'];
	unset($args['event']);
	$event->set($event_name, $args);
	return null;
}

function parse_call($template, $curr_path) {
	global $event;	
	var $args;
	if (!parse_tags('call', $template, $args, true)) { // self-closed
		return null;
	}
	$event_name = $args['event'];
	unset($args['event']);
	return $event->call($event_name, $args);
}

function parse_eval($template, $curr_path) {
	var $args; // unused
	if (function_exists('eval') && parse_tags('eval', $template, $args)) {
		return eval($template);
	}
	else return null;
}

function parse_set($template, $curr_path) {
	var $data;
	if (parse_tags('set', $template, $data, true)) { // self-closed
		OBJ::update($curr_path, $data);
	}
	return null;
}

function find_closed_tag(&$template, $begin_tag, $end_tag, $start) {
	var $pos = $start;
	var $depth = 1;
	var $begin_tag_length = strlen($begin_tag);
	var $end_tag_length = strlen($end_tag);
	while(true) {
		if(substr($template, $pos, $begin_tag_length) == $begin_tag) {
			$depth++;
		}
		elseif(substr($template, $pos, $end_tag_length) == $end_tag) {
			$depth--;
			if($depth == 0) {
				return $pos + $end_tag_length;
			}
		}
		$pos++;
	}
}

function parse_template($template, $curr_path = '.') {
	var $found;
	//do { // do while have nothing to do
		$found = false;
		var $pos = 0;
		$template[strlen($template)] = '\0';
		while ($template[$pos] != '\0') {
			if ($template[$pos] == '$') { // possible attribute
				var $attr_end = $pos+1;
				while(true) {
					var $c = $template[$attr_end];					
					if ($c>='a' && $c<='z' || $c>='A' && $c<='Z' || $c>='0' && $c<='9' || $c=='_' || $c=='-')
						$attr_end++;
					else break;
				}
				if ($attr_end - $pos > 1) {
					$found = true;					
					var $before = substr($template, 0, $pos);
					var $attr = substr($template, $pos+1, $attr_end - $pos);
					var $after = substr($template, $attr_end);
					var $value = OBJ::get($curr_path, $attr);
					while ($value[0] == '$') {
						$value = OBJ::get($curr_path, substr($value,1)); // this is a recursive reference
					}
					$template = $before.$value.$after;
					$pos = strlen($before) + strlen($value);
				}
			}
			elseif ($template[$pos] == '<') { // possible tag
				static $tags = array('if', 'for', 'ref', 'include', 'event', 'call', 'eval', 'set');
				foreach ($tags as $tag) {
					if (strpos($template, $tag, $pos) == 1) {
						$found = true;						
						var $endpos = find_closed_tag($template, '<'.$tag, '</'.$tag.'>', $pos+1);
						var $before = substr($template, 0, $pos);
						var $value = parse_if(substr($template, $pos, $endpos-$pos), $curr_path);
						var $after = substr($template, $end);
						$template = $before.$value.$after;
						$pos = strlen($before) + strlen($value);
						break;
					}
				}
			}
			else { // nothing important to do
				$pos++;
			}
		}
	//} while($found);
	return $template;
}

function old_parse_template($template, $curr_path = '.') {
	
	$var_regexp = "((\\\$[a-zA-Z_\x7f-\xff][a-zA-Z0-9_\x7f-\xff]*(\-\>)?[a-zA-Z0-9_\x7f-\xff]*)(\[[a-zA-Z0-9_\-\.\"\'\[\]\$\x7f-\xff]+\])*)";
	$const_regexp = "([a-zA-Z_\x7f-\xff][a-zA-Z0-9_\x7f-\xff]*)";

	$this->subtemplates = array();
	for($i = 1; $i <= 3; $i++) {
		if(strexists($template, '{subtemplate')) {
			$template = preg_replace("/[\n\r\t]*(\<\!\-\-)?\{subtemplate\s+([a-z0-9_:\/]+)\}(\-\-\>)?[\n\r\t]*/ies", "\$this->loadsubtemplate('\\2')", $template);
		}
	}

	$template = preg_replace("/([\n\r]+)\t+/s", "\\1", $template);
	$template = preg_replace("/\<\!\-\-\{(.+?)\}\-\-\>/s", "{\\1}", $template);
	$template = preg_replace("/\{lang\s+(.+?)\}/ies", "\$this->languagevar('\\1')", $template);
	$template = preg_replace("/[\n\r\t]*\{date\((.+?)\)\}[\n\r\t]*/ie", "\$this->datetags('\\1')", $template);
	$template = preg_replace("/[\n\r\t]*\{avatar\((.+?)\)\}[\n\r\t]*/ie", "\$this->avatartags('\\1')", $template);
	$template = preg_replace("/[\n\r\t]*\{eval\s+(.+?)\s*\}[\n\r\t]*/ies", "\$this->evaltags('\\1')", $template);
	$template = preg_replace("/[\n\r\t]*\{csstemplate\}[\n\r\t]*/ies", "\$this->loadcsstemplate('\\1')", $template);
	$template = str_replace("{LF}", "<?=\"\\n\"?>", $template);
	$template = preg_replace("/\{(\\\$[a-zA-Z0-9_\-\>\[\]\'\"\$\.\x7f-\xff]+)\}/s", "<?=\\1?>", $template);
	$template = preg_replace("/\{hook\/(\w+?)(\s+(.+?))?\}/ie", "\$this->hooktags('\\1', '\\3')", $template);
	$template = preg_replace("/$var_regexp/es", "template::addquote('<?=\\1?>')", $template);
	$template = preg_replace("/\<\?\=\<\?\=$var_regexp\?\>\?\>/es", "\$this->addquote('<?=\\1?>')", $template);

	$headeradd = $headerexists ? "hookscriptoutput('$basefile');" : '';
	if(!empty($this->subtemplates)) {
		$headeradd .= "\n0\n";
		foreach($this->subtemplates as $fname) {
			$headeradd .= "|| checktplrefresh('$tplfile', '$fname', ".time().", '$templateid', '$cachefile', '$tpldir', '$file')\n";
		}
		$headeradd .= ';';
	}

	if(!empty($this->blocks)) {
		$headeradd .= "\n";
		$headeradd .= "block_get('".implode(',', $this->blocks)."');";
	}

	$template = "<? if(!defined('IN_DISCUZ')) exit('Access Denied'); {$headeradd}?>\n$template";

	$template = preg_replace("/[\n\r\t]*\{template\s+([a-z0-9_:\/]+)\}[\n\r\t]*/ies", "\$this->stripvtags('<? include template(\'\\1\'); ?>')", $template);
	$template = preg_replace("/[\n\r\t]*\{template\s+(.+?)\}[\n\r\t]*/ies", "\$this->stripvtags('<? include template(\'\\1\'); ?>')", $template);
	$template = preg_replace("/[\n\r\t]*\{echo\s+(.+?)\}[\n\r\t]*/ies", "\$this->stripvtags('<? echo \\1; ?>')", $template);

	$template = preg_replace("/([\n\r\t]*)\{if\s+(.+?)\}([\n\r\t]*)/ies", "\$this->stripvtags('\\1<? if(\\2) { ?>\\3')", $template);
	$template = preg_replace("/([\n\r\t]*)\{elseif\s+(.+?)\}([\n\r\t]*)/ies", "\$this->stripvtags('\\1<? } elseif(\\2) { ?>\\3')", $template);
	$template = preg_replace("/\{else\}/i", "<? } else { ?>", $template);
	$template = preg_replace("/\{\/if\}/i", "<? } ?>", $template);

	$template = preg_replace("/[\n\r\t]*\{loop\s+(\S+)\s+(\S+)\}[\n\r\t]*/ies", "\$this->stripvtags('<? if(is_array(\\1)) foreach(\\1 as \\2) { ?>')", $template);
	$template = preg_replace("/[\n\r\t]*\{loop\s+(\S+)\s+(\S+)\s+(\S+)\}[\n\r\t]*/ies", "\$this->stripvtags('<? if(is_array(\\1)) foreach(\\1 as \\2 => \\3) { ?>')", $template);
	$template = preg_replace("/\{\/loop\}/i", "<? } ?>", $template);

	$template = preg_replace("/\{$const_regexp\}/s", "<?=\\1?>", $template);
	if(!empty($this->replacecode)) {
		$template = str_replace($this->replacecode['search'], $this->replacecode['replace'], $template);
	}
	$template = preg_replace("/ \?\>[\n\r]*\<\? /s", " ", $template);

	if(!@$fp = fopen(DISCUZ_ROOT.$cachefile, 'w')) {
		$this->error('directory_notfound', dirname(DISCUZ_ROOT.$cachefile));
	}

	$template = preg_replace("/\"(http)?[\w\.\/:]+\?[^\"]+?&[^\"]+?\"/e", "\$this->transamp('\\0')", $template);
	$template = preg_replace("/\<script[^\>]*?src=\"(.+?)\"(.*?)\>\s*\<\/script\>/ies", "\$this->stripscriptamp('\\1', '\\2')", $template);
	$template = preg_replace("/[\n\r\t]*\{block\s+([a-zA-Z0-9_\[\]]+)\}(.+?)\{\/block\}/ies", "\$this->stripblock('\\1', '\\2')", $template);
	$template = preg_replace("/\<\?(\s{1})/is", "<?php\\1", $template);
	$template = preg_replace("/\<\?\=(.+?)\?\>/is", "<?php echo \\1;?>", $template);

	flock($fp, 2);
	fwrite($fp, $template);
	fclose($fp);
}
?>
