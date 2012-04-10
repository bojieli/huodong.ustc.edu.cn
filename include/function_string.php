<?php
// include/function_string.php 2011-07-10 boj
// common string functions (strengthened <string.h>)

function gaddslashes($string) {
	if(is_array($string)) {
		$keys = array_keys($string);
		foreach($keys as $key) {
			$val = $string[$key];
			unset($string[$key]);
			$string[addslashes($key)] = gaddslashes($val);
		}
	} else {
		$string = addslashes($string);
	}
	return $string;
}

function ghtmlspecialchars($string) {
	if(is_array($string)) {
		foreach($string as $key => $val) {
			$string[$key] = ghtmlspecialchars($val);
		}
	} else {
		$string = str_replace(array('&', '"', '<', '>'), array('&amp;', '&quot;', '&lt;', '&gt;'), $string);
		if(strpos($string, '&amp;#') !== false) {
			$string = preg_replace('/&amp;((#(\d{3,5}|x[a-fA-F0-9]{4}));)/', '&\\1', $string);
		}
	}
	return $string;
}

function gstrpos($string, &$arr, $returnvalue = false) {
	if(empty($string)) return false;
	foreach((array)$arr as $v) {
		if(strpos($string, $v) !== false) {
			$return = $returnvalue ? $v : true;
			return $return;
		}
	}
	return false;
}

// search from right side
function strrstr($haystack, $needle) {
	$len = strlen($haystack);
	for ($i=$len-1; $i>=0; $i--) {
		if ($haystack[$i] == $needle) {
			return $i;
		}
	}
	return -1; // not found
}

// I'd like to use this instead of is_numeric...
function isnumber($str) {
	return preg_match("/^[0-9]+$/", $str);
}

// whether the string is a valid IP address
function isip($ip) {
	return preg_match("/^([0-9]{1,3}\.){3}[0-9]{1,3}$/", $ip);
}

// whether the string is a valid email address
function isemail($email) {
	return strlen($email) > 6 && preg_match("/^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/", $email);
}

// whether the string is a valid variable(attribute) name
function isvarname($varname) {
	return preg_match("/^[_a-zA-Z][_a-zA-Z0-9]*$/", $varname);
}

// whether the string is a valid variable(attribute) name
function isattrname($attrname) {
	return preg_match("/^[_a-zA-Z][_a-zA-Z0-9]*$/", $attrname);
}

// whether the string is a valid function name
function isfuncname($funcname) {
	return preg_match("/^[_a-zA-Z][_a-zA-Z0-9]*$/", $funcname);
}

// whether the string is a valid method name
function ismethodname($methodname) {
	return preg_match("/^[_a-zA-Z][_a-zA-Z0-9]*::[_a-zA-Z][_a-zA-Z0-9]*$/", $methodname);
}

// whether the string is a valid object path
// . and .. are also valid
function ispath($path) {
	if (empty($path)) return false;
	return preg_match("/^(\/)?(([_a-zA-Z0-9]*|\.|\.\.)\/)*([_a-zA-Z0-9]*|\.|\.\.)$/", $path);
}

function random($length, $numeric = 0) {
	$seed = base_convert(md5(microtime().$_SERVER['DOCUMENT_ROOT']), 16, $numeric ? 10 : 35);
	$seed = $numeric ? (str_replace('0', '', $seed).'012340567890') : ($seed.'zZ'.strtoupper($seed));
	$hash = '';
	$max = strlen($seed) - 1;
	for($i = 0; $i < $length; $i++) {
		$hash .= $seed{mt_rand(0, $max)};
	}
	return $hash;
}

function strexists($string, $find) {
	return !(strpos($string, $find) === FALSE);
}

function gstrlen($str) {
	if(strtolower(CHARSET) != 'utf-8') {
		return strlen($str);
	}
	$count = 0;
	for($i = 0; $i < strlen($str); $i++){
		$value = ord($str[$i]);
		if($value > 127) {
			$count++;
			if($value >= 192 && $value <= 223) $i++;
			elseif($value >= 224 && $value <= 239) $i = $i + 2;
			elseif($value >= 240 && $value <= 247) $i = $i + 3;
	    	}
    		$count++;
	}
	return $count;
}

function cutstr($string, $length, $dot = ' ...') {
	if(strlen($string) <= $length) {
		return $string;
	}

	$pre = chr(1);
	$end = chr(1);
	$string = str_replace(array('&amp;', '&quot;', '&lt;', '&gt;'), array($pre.'&'.$end, $pre.'"'.$end, $pre.'<'.$end, $pre.'>'.$end), $string);

	$strcut = '';
	if(strtolower(CHARSET) == 'utf-8') {

		$n = $tn = $noc = 0;
		while($n < strlen($string)) {

			$t = ord($string[$n]);
			if($t == 9 || $t == 10 || (32 <= $t && $t <= 126)) {
				$tn = 1; $n++; $noc++;
			} elseif(194 <= $t && $t <= 223) {
				$tn = 2; $n += 2; $noc += 2;
			} elseif(224 <= $t && $t <= 239) {
				$tn = 3; $n += 3; $noc += 2;
			} elseif(240 <= $t && $t <= 247) {
				$tn = 4; $n += 4; $noc += 2;
			} elseif(248 <= $t && $t <= 251) {
				$tn = 5; $n += 5; $noc += 2;
			} elseif($t == 252 || $t == 253) {
				$tn = 6; $n += 6; $noc += 2;
			} else {
				$n++;
			}

			if($noc >= $length) {
				break;
			}

		}
		if($noc > $length) {
			$n -= $tn;
		}

		$strcut = substr($string, 0, $n);

	} else {
		for($i = 0; $i < $length; $i++) {
			$strcut .= ord($string[$i]) > 127 ? $string[$i].$string[++$i] : $string[$i];
		}
	}

	$strcut = str_replace(array($pre.'&'.$end, $pre.'"'.$end, $pre.'<'.$end, $pre.'>'.$end), array('&amp;', '&quot;', '&lt;', '&gt;'), $strcut);

	$pos = strrpos($strcut, chr(1));
	if($pos !== false) {
		$strcut = substr($strcut,0,$pos);
	}
	return $strcut.$dot;
}

function gstripslashes($string) {
	if(empty($string)) return $string;
	if(is_array($string)) {
		foreach($string as $key => $val) {
			$string[$key] = gstripslashes($val);
		}
	} else {
		$string = stripslashes($string);
	}
	return $string;
}

function checkformulasyntax($formula, $operators, $tokens) {
	$var = implode('|', $tokens);
	$operator = implode('', $operators);

	$operator = str_replace(
		array('+', '-', '*', '/', '(', ')', '{', '}', '\''),
		array('\+', '\-', '\*', '\/', '\(', '\)', '\{', '\}', '\\\''),
		$operator
	);

	if(!empty($formula)) {
		if(!preg_match("/^([$operator\.\d\(\)]|(($var)([$operator\(\)]|$)+))+$/", $formula) || !is_null(eval(preg_replace("/($var)/", "\$\\1", $formula).';'))){
			return false;
		}
	}
	return true;
}

function stripsearchkey($string) {
	$string = trim($string);
	$string = str_replace('*', '%', addcslashes($string, '%_'));
	$string = str_replace('_', '\_', $string);
	return $string;
}

/**
 * Convert integer number to format based on the locale.
 *
 * @since 2.3.0
 *
 * @param int $number The number to convert based on locale.
 * @param int $decimals Precision of the number of decimal places.
 * @return string Converted number in string format.
 */
function number_format_i18n( $number, $decimals = 0 ) {
	global $wp_locale;
	$formatted = number_format( $number, absint( $decimals ), $wp_locale->number_format['decimal_point'], $wp_locale->number_format['thousands_sep'] );
	return apply_filters( 'number_format_i18n', $formatted );
}

/**
 * Convert number of bytes largest unit bytes will fit into.
 *
 * It is easier to read 1kB than 1024 bytes and 1MB than 1048576 bytes. Converts
 * number of bytes to human readable number by taking the number of that unit
 * that the bytes will go into it. Supports TB value.
 *
 * Please note that integers in PHP are limited to 32 bits, unless they are on
 * 64 bit architecture, then they have 64 bit size. If you need to place the
 * larger size then what PHP integer type will hold, then use a string. It will
 * be converted to a double, which should always have 64 bit length.
 *
 * Technically the correct unit names for powers of 1024 are KiB, MiB etc.
 * @link http://en.wikipedia.org/wiki/Byte
 *
 * @since 2.3.0
 *
 * @param int|string $bytes Number of bytes. Note max integer size for integers.
 * @param int $decimals Precision of number of decimal places. Deprecated.
 * @return bool|string False on failure. Number string on success.
 */
function size_format( $bytes, $decimals = 0 ) {
	$quant = array(
		// ========================= Origin ====
		'TB' => 1099511627776,  // pow( 1024, 4)
		'GB' => 1073741824,     // pow( 1024, 3)
		'MB' => 1048576,        // pow( 1024, 2)
		'kB' => 1024,           // pow( 1024, 1)
		'B ' => 1,              // pow( 1024, 0)
	);
	foreach ( $quant as $unit => $mag )
		if ( doubleval($bytes) >= $mag )
			return number_format_i18n( $bytes / $mag, $decimals ) . ' ' . $unit;

	return false;
}

/**
 * Unserialize value only if it was serialized.
 *
 * @since 2.0.0
 *
 * @param string $original Maybe unserialized original, if is needed.
 * @return mixed Unserialized data can be any type.
 */
function maybe_unserialize( $original ) {
	if ( is_serialized( $original ) ) // don't attempt to unserialize data that wasn't serialized going in
		return @unserialize( $original );
	return $original;
}

/**
 * Check value to find if it was serialized.
 *
 * If $data is not an string, then returned value will always be false.
 * Serialized data is always a string.
 *
 * @since 2.0.5
 *
 * @param mixed $data Value to check to see if was serialized.
 * @return bool False if not serialized and true if it was.
 */
function is_serialized( $data ) {
	// if it isn't a string, it isn't serialized
	if ( ! is_string( $data ) )
		return false;
	$data = trim( $data );
 	if ( 'N;' == $data )
		return true;
	$length = strlen( $data );
	if ( $length < 4 )
		return false;
	if ( ':' !== $data[1] )
		return false;
	$lastc = $data[$length-1];
	if ( ';' !== $lastc && '}' !== $lastc )
		return false;
	$token = $data[0];
	switch ( $token ) {
		case 's' :
			if ( '"' !== $data[$length-2] )
				return false;
		case 'a' :
		case 'O' :
			return (bool) preg_match( "/^{$token}:[0-9]+:/s", $data );
		case 'b' :
		case 'i' :
		case 'd' :
			return (bool) preg_match( "/^{$token}:[0-9.E-]+;\$/", $data );
	}
	return false;
}

/**
 * Check whether serialized data is of string type.
 *
 * @since 2.0.5
 *
 * @param mixed $data Serialized data
 * @return bool False if not a serialized string, true if it is.
 */
function is_serialized_string( $data ) {
	// if it isn't a string, it isn't a serialized string
	if ( !is_string( $data ) )
		return false;
	$data = trim( $data );
	$length = strlen( $data );
	if ( $length < 4 )
		return false;
	elseif ( ':' !== $data[1] )
		return false;
	elseif ( ';' !== $data[$length-1] )
		return false;
	elseif ( $data[0] !== 's' )
		return false;
	elseif ( '"' !== $data[$length-2] )
		return false;
	else
		return true;
}

/**
 * Replaces double line-breaks with paragraph elements.
 *
 * A group of regex replaces used to identify text formatted with newlines and
 * replace double line-breaks with HTML paragraph tags. The remaining
 * line-breaks after conversion become <<br />> tags, unless $br is set to '0'
 * or 'false'.
 *
 * @since 0.71
 *
 * @param string $pee The text which has to be formatted.
 * @param int|bool $br Optional. If set, this will convert all remaining line-breaks after paragraphing. Default true.
 * @return string Text which has been converted into correct paragraph tags.
 */
function texturize($pee, $br = 1) {

	if ( trim($pee) === '' )
		return '';
		
	$pee = $pee . "\n"; // just to make things a little easier, pad the end
	
	// a little XHTML help
	$pee = str_replace('<br>', '<br />', $pee);
	$pee = str_replace('<hr>', '<hr />', $pee);
	
	$pee = preg_replace('|<br />\s*<br />|', "\n\n", $pee);
	// Space things out a little
	$allblocks = '(?:table|thead|tfoot|caption|col|colgroup|tbody|tr|td|th|div|dl|dd|dt|ul|ol|li|pre|select|option|form|map|area|blockquote|address|math|style|input|p|h[1-6]|hr|fieldset|legend|section|article|aside|hgroup|header|footer|nav|figure|figcaption|details|menu|summary)';
	$pee = preg_replace('!(<' . $allblocks . '[^>]*>)!', "\n$1", $pee);
	$pee = preg_replace('!(</' . $allblocks . '>)!', "$1\n\n", $pee);
	$pee = str_replace(array("\r\n", "\r"), "\n", $pee); // cross-platform newlines
	if ( strpos($pee, '<object') !== false ) {
		$pee = preg_replace('|\s*<param([^>]*)>\s*|', "<param$1>", $pee); // no pee inside object/embed
		$pee = preg_replace('|\s*</embed>\s*|', '</embed>', $pee);
	}
	$pee = preg_replace("/\n\n+/", "\n\n", $pee); // take care of duplicates
	// make paragraphs, including one at the end
	$pees = preg_split('/\n\s*\n/', $pee, -1, PREG_SPLIT_NO_EMPTY);
	$pee = '';
	foreach ( $pees as $tinkle ) {
		$pee .= '<p>' . trim($tinkle, "\n") . "</p>\n";
	}
	$pee = preg_replace('|<p>\s*</p>|', '', $pee); // under certain strange conditions it could create a P of entirely whitespace
	$pee = preg_replace('!<p>([^<]+)</(div|address|form)>!', "<p>$1</p></$2>", $pee);
	$pee = preg_replace('!<p>\s*(</?' . $allblocks . '[^>]*>)\s*</p>!', "$1", $pee); // don't pee all over a tag
	$pee = preg_replace("|<p>(<li.+?)</p>|", "$1", $pee); // problem with nested lists
	$pee = preg_replace('|<p><blockquote([^>]*)>|i', "<blockquote$1><p>", $pee);
	$pee = str_replace('</blockquote></p>', '</p></blockquote>', $pee);
	$pee = preg_replace('!<p>\s*(</?' . $allblocks . '[^>]*>)!', "$1", $pee);
	$pee = preg_replace('!(</?' . $allblocks . '[^>]*>)\s*</p>!', "$1", $pee);
	if ($br) {
		$pee = preg_replace('|(?<!<br />)\s*\n|', "<br />\n", $pee); // optionally make line breaks
	}
	$pee = preg_replace('!(</?' . $allblocks . '[^>]*>)\s*<br />!', "$1", $pee);
	$pee = preg_replace('!<br />(\s*</?(?:p|li|div|dl|dd|dt|th|pre|td|ul|ol)[^>]*>)!', '$1', $pee);
	if (strpos($pee, '<pre') !== false)
		$pee = preg_replace_callback('!(<pre[^>]*>)(.*?)</pre>!is', 'clean_pre', $pee );
	$pee = preg_replace( "|\n</p>$|", '</p>', $pee );

	return $pee;
}


/**
 * Balances tags of string using a modified stack.
 *
 * @since 2.0.4
 *
 * @author Leonard Lin <leonard@acm.org>
 * @license GPL
 * @copyright November 4, 2001
 * @version 1.1
 * @todo Make better - change loop condition to $text in 1.2
 * @internal Modified by Scott Reilly (coffee2code) 02 Aug 2004
 *		1.1  Fixed handling of append/stack pop order of end text
 *			 Added Cleaning Hooks
 *		1.0  First Version
 *
 * @param string $text Text to be balanced.
 * @return string Balanced text.
 */
function balance_tags( $text ) {
	$tagstack = array();
	$stacksize = 0;
	$tagqueue = '';
	$newtext = '';
	$single_tags = array('br', 'hr', 'img', 'input'); // Known single-entity/self-closing tags
	$nestable_tags = array('blockquote', 'div', 'span'); // Tags that can be immediately nested within themselves

	// WP bug fix for comments - in case you REALLY meant to type '< !--'
	$text = str_replace('< !--', '<    !--', $text);
	// WP bug fix for LOVE <3 (and other situations with '<' before a number)
	$text = preg_replace('#<([0-9]{1})#', '&lt;$1', $text);

	while ( preg_match("/<(\/?[\w:]*)\s*([^>]*)>/", $text, $regex) ) {
		$newtext .= $tagqueue;

		$i = strpos($text, $regex[0]);
		$l = strlen($regex[0]);

		// clear the shifter
		$tagqueue = '';
		// Pop or Push
		if ( isset($regex[1][0]) && '/' == $regex[1][0] ) { // End Tag
			$tag = strtolower(substr($regex[1],1));
			// if too many closing tags
			if( $stacksize <= 0 ) {
				$tag = '';
				// or close to be safe $tag = '/' . $tag;
			}
			// if stacktop value = tag close value then pop
			else if ( $tagstack[$stacksize - 1] == $tag ) { // found closing tag
				$tag = '</' . $tag . '>'; // Close Tag
				// Pop
				array_pop( $tagstack );
				$stacksize--;
			} else { // closing tag not at top, search for it
				for ( $j = $stacksize-1; $j >= 0; $j-- ) {
					if ( $tagstack[$j] == $tag ) {
					// add tag to tagqueue
						for ( $k = $stacksize-1; $k >= $j; $k--) {
							$tagqueue .= '</' . array_pop( $tagstack ) . '>';
							$stacksize--;
						}
						break;
					}
				}
				$tag = '';
			}
		} else { // Begin Tag
			$tag = strtolower($regex[1]);

			// Tag Cleaning

			// If self-closing or '', don't do anything.
			if ( substr($regex[2],-1) == '/' || $tag == '' ) {
				// do nothing
			}
			// ElseIf it's a known single-entity tag but it doesn't close itself, do so
			elseif ( in_array($tag, $single_tags) ) {
				$regex[2] .= '/';
			} else {	// Push the tag onto the stack
				// If the top of the stack is the same as the tag we want to push, close previous tag
				if ( $stacksize > 0 && !in_array($tag, $nestable_tags) && $tagstack[$stacksize - 1] == $tag ) {
					$tagqueue = '</' . array_pop ($tagstack) . '>';
					$stacksize--;
				}
				$stacksize = array_push ($tagstack, $tag);
			}

			// Attributes
			$attributes = $regex[2];
			if( !empty($attributes) )
				$attributes = ' '.$attributes;

			$tag = '<' . $tag . $attributes . '>';
			//If already queuing a close tag, then put this tag on, too
			if ( !empty($tagqueue) ) {
				$tagqueue .= $tag;
				$tag = '';
			}
		}
		$newtext .= substr($text, 0, $i) . $tag;
		$text = substr($text, $i + $l);
	}

	// Clear Tag Queue
	$newtext .= $tagqueue;

	// Add Remaining text
	$newtext .= $text;

	// Empty Stack
	while( $x = array_pop($tagstack) )
		$newtext .= '</' . $x . '>'; // Add remaining tags to close

	// WP fix for the bug with HTML comments
	$newtext = str_replace("< !--","<!--",$newtext);
	$newtext = str_replace("<    !--","< !--",$newtext);

	return $newtext;
}

?>
