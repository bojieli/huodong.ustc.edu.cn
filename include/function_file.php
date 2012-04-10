<?php
// include/function_file.php 2011-07-24 boj
// functions for files (upload, management, etc)
/**
 * Recursive directory creation based on full path.
 *
 * Will attempt to set permissions on folders.
 *
 * @since 2.0.1
 *
 * @param string $target Full path to attempt to create.
 * @return bool Whether the path was created. True if path already exists.
 */
function wp_mkdir_p( $target ) {
	// from php.net/mkdir user contributed notes
	$target = str_replace( '//', '/', $target );

	// safe mode fails with a trailing slash under certain PHP versions.
	$target = rtrim($target, '/'); // Use rtrim() instead of untrailingslashit to avoid formatting.php dependency.
	if ( empty($target) )
		$target = '/';

	if ( file_exists( $target ) )
		return @is_dir( $target );

	// Attempting to create the directory may clutter up our display.
	if ( @mkdir( $target ) ) {
		$stat = @stat( dirname( $target ) );
		$dir_perms = $stat['mode'] & 0007777;  // Get the permission bits.
		@chmod( $target, $dir_perms );
		return true;
	} elseif ( is_dir( dirname( $target ) ) ) {
			return false;
	}

	// If the above failed, attempt to create the parent node, then try again.
	if ( ( $target != '/' ) && ( wp_mkdir_p( dirname( $target ) ) ) )
		return wp_mkdir_p( $target );

	return false;
}

/**
 * Test if a give filesystem path is absolute ('/foo/bar', 'c:\windows').
 *
 * @since 2.5.0
 *
 * @param string $path File path
 * @return bool True if path is absolute, false is not absolute.
 */
function path_is_absolute( $path ) {
	// this is definitive if true but fails if $path does not exist or contains a symbolic link
	if ( realpath($path) == $path )
		return true;

	if ( strlen($path) == 0 || $path[0] == '.' )
		return false;

	// windows allows absolute paths like this
	if ( preg_match('#^[a-zA-Z]:\\\\#', $path) )
		return true;

	// a path starting with / or \ is absolute; anything else is relative
	return (bool) preg_match('#^[/\\\\]#', $path);
}

/**
 * Join two filesystem paths together (e.g. 'give me $path relative to $base').
 *
 * If the $path is absolute, then it the full path is returned.
 *
 * @since 2.5.0
 *
 * @param string $base
 * @param string $path
 * @return string The path with the base or absolute path.
 */
function path_join( $base, $path ) {
	if ( path_is_absolute($path) )
		return $path;

	return rtrim($base, '/') . '/' . ltrim($path, '/');
}

/**
 * Determines a writable directory for temporary files.
 * Function's preference is to WP_CONTENT_DIR followed by the return value of <code>sys_get_temp_dir()</code>, before finally defaulting to /tmp/
 *
 * In the event that this function does not find a writable location, It may be overridden by the <code>WP_TEMP_DIR</code> constant in your <code>wp-config.php</code> file.
 *
 * @since 2.5.0
 *
 * @return string Writable temporary directory
 */
function get_temp_dir() {
	static $temp;
	if ( defined('WP_TEMP_DIR') )
		return trailingslashit(WP_TEMP_DIR);

	if ( $temp )
		return trailingslashit($temp);

	$temp = WP_CONTENT_DIR . '/';
	if ( is_dir($temp) && @is_writable($temp) )
		return $temp;

	if  ( function_exists('sys_get_temp_dir') ) {
		$temp = sys_get_temp_dir();
		if ( @is_writable($temp) )
			return trailingslashit($temp);
	}

	$temp = ini_get('upload_tmp_dir');
	if ( is_dir($temp) && @is_writable($temp) )
		return trailingslashit($temp);

	$temp = '/tmp/';
	return $temp;
}

/**
 * Retrieve the file type based on the extension name.
 *
 * @package WordPress
 * @since 2.5.0
 * @uses apply_filters() Calls 'ext2type' hook on default supported types.
 *
 * @param string $ext The extension to search.
 * @return string|null The file type, example: audio, video, document, spreadsheet, etc. Null if not found.
 */
function wp_ext2type( $ext ) {
	$ext2type = apply_filters( 'ext2type', array(
		'audio'       => array( 'aac', 'ac3',  'aif',  'aiff', 'm3a',  'm4a',   'm4b', 'mka', 'mp1', 'mp2',  'mp3', 'ogg', 'oga', 'ram', 'wav', 'wma' ),
		'video'       => array( 'asf', 'avi',  'divx', 'dv',   'flv',  'm4v',   'mkv', 'mov', 'mp4', 'mpeg', 'mpg', 'mpv', 'ogm', 'ogv', 'qt',  'rm', 'vob', 'wmv' ),
		'document'    => array( 'doc', 'docx', 'docm', 'dotm', 'odt',  'pages', 'pdf', 'rtf', 'wp',  'wpd' ),
		'spreadsheet' => array( 'numbers',     'ods',  'xls',  'xlsx', 'xlsb',  'xlsm' ),
		'interactive' => array( 'key', 'ppt',  'pptx', 'pptm', 'odp',  'swf' ),
		'text'        => array( 'asc', 'csv',  'tsv',  'txt' ),
		'archive'     => array( 'bz2', 'cab',  'dmg',  'gz',   'rar',  'sea',   'sit', 'sqx', 'tar', 'tgz',  'zip' ),
		'code'        => array( 'css', 'htm',  'html', 'php',  'js' ),
	));
	foreach ( $ext2type as $type => $exts )
		if ( in_array( $ext, $exts ) )
			return $type;
}

/**
 * Retrieve the file type from the file name.
 *
 * You can optionally define the mime array, if needed.
 *
 * @since 2.0.4
 *
 * @param string $filename File name or path.
 * @param array $mimes Optional. Key is the file extension with value as the mime type.
 * @return array Values with extension first and mime type.
 */
function wp_check_filetype( $filename, $mimes = null ) {
	if ( empty($mimes) )
		$mimes = get_allowed_mime_types();
	$type = false;
	$ext = false;

	foreach ( $mimes as $ext_preg => $mime_match ) {
		$ext_preg = '!\.(' . $ext_preg . ')$!i';
		if ( preg_match( $ext_preg, $filename, $ext_matches ) ) {
			$type = $mime_match;
			$ext = $ext_matches[1];
			break;
		}
	}

	return compact( 'ext', 'type' );
}

/**
 * Attempt to determine the real file type of a file.
 * If unable to, the file name extension will be used to determine type.
 *
 * If it's determined that the extension does not match the file's real type,
 * then the "proper_filename" value will be set with a proper filename and extension.
 *
 * Currently this function only supports validating images known to getimagesize().
 *
 * @since 3.0.0
 *
 * @param string $file Full path to the image.
 * @param string $filename The filename of the image (may differ from $file due to $file being in a tmp directory)
 * @param array $mimes Optional. Key is the file extension with value as the mime type.
 * @return array Values for the extension, MIME, and either a corrected filename or false if original $filename is valid
 */
function wp_check_filetype_and_ext( $file, $filename, $mimes = null ) {

	$proper_filename = false;

	// Do basic extension validation and MIME mapping
	$wp_filetype = wp_check_filetype( $filename, $mimes );
	extract( $wp_filetype );

	// We can't do any further validation without a file to work with
	if ( ! file_exists( $file ) )
		return compact( 'ext', 'type', 'proper_filename' );

	// We're able to validate images using GD
	if ( $type && 0 === strpos( $type, 'image/' ) && function_exists('getimagesize') ) {

		// Attempt to figure out what type of image it actually is
		$imgstats = @getimagesize( $file );

		// If getimagesize() knows what kind of image it really is and if the real MIME doesn't match the claimed MIME
		if ( !empty($imgstats['mime']) && $imgstats['mime'] != $type ) {
			// This is a simplified array of MIMEs that getimagesize() can detect and their extensions
			// You shouldn't need to use this filter, but it's here just in case
			$mime_to_ext = apply_filters( 'getimagesize_mimes_to_exts', array(
				'image/jpeg' => 'jpg',
				'image/png'  => 'png',
				'image/gif'  => 'gif',
				'image/bmp'  => 'bmp',
				'image/tiff' => 'tif',
			) );

			// Replace whatever is after the last period in the filename with the correct extension
			if ( ! empty( $mime_to_ext[ $imgstats['mime'] ] ) ) {
				$filename_parts = explode( '.', $filename );
				array_pop( $filename_parts );
				$filename_parts[] = $mime_to_ext[ $imgstats['mime'] ];
				$new_filename = implode( '.', $filename_parts );

				if ( $new_filename != $filename )
					$proper_filename = $new_filename; // Mark that it changed

				// Redefine the extension / MIME
				$wp_filetype = wp_check_filetype( $new_filename, $mimes );
				extract( $wp_filetype );
			}
		}
	}

	// Let plugins try and validate other types of files
	// Should return an array in the style of array( 'ext' => $ext, 'type' => $type, 'proper_filename' => $proper_filename )
	return apply_filters( 'wp_check_filetype_and_ext', compact( 'ext', 'type', 'proper_filename' ), $file, $filename, $mimes );
}

/**
 * Retrieve list of allowed mime types and file extensions.
 *
 * @since 2.8.6
 *
 * @return array Array of mime types keyed by the file extension regex corresponding to those types.
 */
function get_allowed_mime_types() {
	static $mimes = false;

	if ( !$mimes ) {
		// Accepted MIME types are set here as PCRE unless provided.
		$mimes = apply_filters( 'upload_mimes', array(
		'jpg|jpeg|jpe' => 'image/jpeg',
		'gif' => 'image/gif',
		'png' => 'image/png',
		'bmp' => 'image/bmp',
		'tif|tiff' => 'image/tiff',
		'ico' => 'image/x-icon',
		'asf|asx|wax|wmv|wmx' => 'video/asf',
		'avi' => 'video/avi',
		'divx' => 'video/divx',
		'flv' => 'video/x-flv',
		'mov|qt' => 'video/quicktime',
		'mpeg|mpg|mpe' => 'video/mpeg',
		'txt|asc|c|cc|h' => 'text/plain',
		'csv' => 'text/csv',
		'tsv' => 'text/tab-separated-values',
		'ics' => 'text/calendar',
		'rtx' => 'text/richtext',
		'css' => 'text/css',
		'htm|html' => 'text/html',
		'mp3|m4a|m4b' => 'audio/mpeg',
		'mp4|m4v' => 'video/mp4',
		'ra|ram' => 'audio/x-realaudio',
		'wav' => 'audio/wav',
		'ogg|oga' => 'audio/ogg',
		'ogv' => 'video/ogg',
		'mid|midi' => 'audio/midi',
		'wma' => 'audio/wma',
		'mka' => 'audio/x-matroska',
		'mkv' => 'video/x-matroska',
		'rtf' => 'application/rtf',
		'js' => 'application/javascript',
		'pdf' => 'application/pdf',
		'doc|docx' => 'application/msword',
		'pot|pps|ppt|pptx|ppam|pptm|sldm|ppsm|potm' => 'application/vnd.ms-powerpoint',
		'wri' => 'application/vnd.ms-write',
		'xla|xls|xlsx|xlt|xlw|xlam|xlsb|xlsm|xltm' => 'application/vnd.ms-excel',
		'mdb' => 'application/vnd.ms-access',
		'mpp' => 'application/vnd.ms-project',
		'docm|dotm' => 'application/vnd.ms-word',
		'pptx|sldx|ppsx|potx' => 'application/vnd.openxmlformats-officedocument.presentationml',
		'xlsx|xltx' => 'application/vnd.openxmlformats-officedocument.spreadsheetml',
		'docx|dotx' => 'application/vnd.openxmlformats-officedocument.wordprocessingml',
		'onetoc|onetoc2|onetmp|onepkg' => 'application/onenote',
		'swf' => 'application/x-shockwave-flash',
		'class' => 'application/java',
		'tar' => 'application/x-tar',
		'zip' => 'application/zip',
		'gz|gzip' => 'application/x-gzip',
		'exe' => 'application/x-msdownload',
		// openoffice formats
		'odt' => 'application/vnd.oasis.opendocument.text',
		'odp' => 'application/vnd.oasis.opendocument.presentation',
		'ods' => 'application/vnd.oasis.opendocument.spreadsheet',
		'odg' => 'application/vnd.oasis.opendocument.graphics',
		'odc' => 'application/vnd.oasis.opendocument.chart',
		'odb' => 'application/vnd.oasis.opendocument.database',
		'odf' => 'application/vnd.oasis.opendocument.formula',
		// wordperfect formats
		'wp|wpd' => 'application/wordperfect',
		) );
	}

	return $mimes;
}

/*
 * File validates against allowed set of defined rules.
 *
 * A return value of '1' means that the $file contains either '..' or './'. A
 * return value of '2' means that the $file contains ':' after the first
 * character. A return value of '3' means that the file is not in the allowed
 * files list.
 *
 * @since 1.2.0
 *
 * @param string $file File path.
 * @param array $allowed_files List of allowed files.
 * @return int 0 means nothing is wrong, greater than 0 means something was wrong.
 */
function validate_file( $file, $allowed_files = '' ) {
	if ( false !== strpos( $file, '..' ))
		return 1;

	if ( false !== strpos( $file, './' ))
		return 1;

	if (!empty ( $allowed_files ) && (!in_array( $file, $allowed_files ) ) )
		return 3;

	if (':' == substr( $file, 1, 1 ))
		return 2;

	return 0;
}

class upload {

	var $attach = array();
	var $type = '';
	var $extid = 0;
	var $errorcode = 0;
	var $forcename = '';

	function upload() {

	}

	function init($attach, $type = 'temp', $extid = 0, $forcename = '') {

		if(!is_array($attach) || empty($attach) || !$this->is_upload_file($attach['tmp_name']) || trim($attach['name']) == '' || $attach['size'] == 0) {
			$this->attach = array();
			$this->errorcode = -1;
			return false;
		} else {
			$this->type = $this->check_dir_type($type);
			$this->extid = intval($extid);
			$this->forcename = $forcename;

			$attach['size'] = intval($attach['size']);
			$attach['name'] =  trim($attach['name']);
			$attach['thumb'] = '';
			$attach['ext'] = $this->fileext($attach['name']);

			$attach['name'] =  htmlspecialchars($attach['name'], ENT_QUOTES);
			if(strlen($attach['name']) > 90) {
				$attach['name'] = cutstr($attach['name'], 80, '').'.'.$attach['ext'];
			}

			$attach['isimage'] = $this->is_image_ext($attach['ext']);
			$attach['extension'] = $this->get_target_extension($attach['ext']);
			$attach['attachdir'] = $this->get_target_dir($this->type, $extid);
			$attach['attachment'] = $attach['attachdir'].$this->get_target_filename($this->type, $this->extid, $this->forcename).'.'.$attach['extension'];
			$attach['target'] = getglobal('setting/attachdir').'./'.$this->type.'/'.$attach['attachment'];
			$this->attach = & $attach;
			$this->errorcode = 0;
			return true;
		}

	}

	function save($ignore = 0) {
		if($ignore) {
			if(!$this->save_to_local($this->attach['tmp_name'], $this->attach['target'])) {
				$this->errorcode = -103;
				return false;
			} else {
				$this->errorcode = 0;
				return true;
			}
		}

		if(empty($this->attach) || empty($this->attach['tmp_name']) || empty($this->attach['target'])) {
			$this->errorcode = -101;
		} elseif(in_array($this->type, array('group', 'album', 'category')) && !$this->attach['isimage']) {
			$this->errorcode = -102;
		} elseif(in_array($this->type, array('common')) && (!$this->attach['isimage'] && $this->attach['ext'] != 'ext')) {
			$this->errorcode = -102;
		} elseif(!$this->save_to_local($this->attach['tmp_name'], $this->attach['target'])) {
			$this->errorcode = -103;
		} elseif(($this->attach['isimage'] || $this->attach['ext'] == 'swf') && (!$this->attach['imageinfo'] = $this->get_image_info($this->attach['target'], true))) {
			$this->errorcode = -104;
			@unlink($this->attach['target']);
		} else {
			$this->errorcode = 0;
			return true;
		}

		return false;
	}

	function error() {
		return $this->errorcode;
	}

	function errormessage() {
		return lang('error', 'file_upload_error_'.$this->errorcode);
	}

	function fileext($filename) {
		return addslashes(strtolower(substr(strrchr($filename, '.'), 1, 10)));
	}

	function is_image_ext($ext) {
		static $imgext  = array('jpg', 'jpeg', 'gif', 'png', 'bmp');
		return in_array($ext, $imgext) ? 1 : 0;
	}

	function get_image_info($target, $allowswf = false) {
		$ext = discuz_upload::fileext($target);
		$isimage = discuz_upload::is_image_ext($ext);
		if(!$isimage && ($ext != 'swf' || !$allowswf)) {
			return false;
		} elseif(!is_readable($target)) {
			return false;
		} elseif($imageinfo = @getimagesize($target)) {
			list($width, $height, $type) = !empty($imageinfo) ? $imageinfo : array('', '', '');
			$size = $width * $height;
			if($size > 16777216 || $size < 16 ) {
				return false;
			} elseif($ext == 'swf' && $type != 4 && $type != 13) {
				return false;
			} elseif($isimage && !in_array($type, array(1,2,3,6,13))) {
				return false;
			}
			return $imageinfo;
		} else {
			return false;
		}
	}

	function is_upload_file($source) {
		return $source && ($source != 'none') && (is_uploaded_file($source) || is_uploaded_file(str_replace('\\\\', '\\', $source)));
	}

	function get_target_filename($type, $extid = 0, $forcename = '') {
		if($type == 'group' || ($type == 'common' && $forcename != '')) {
			$filename = $type.'_'.intval($extid).($forcename != '' ? "_$forcename" : '');
		} else {
			$filename = date('His').strtolower(random(16));
		}
		return $filename;
	}

	function get_target_extension($ext) {
		static $safeext  = array('attach', 'jpg', 'jpeg', 'gif', 'png', 'swf', 'bmp', 'txt', 'zip', 'rar', 'mp3');
		return strtolower(!in_array(strtolower($ext), $safeext) ? 'attach' : $ext);
	}

	function get_target_dir($type, $extid = '', $check_exists = true) {

		$subdir = $subdir1 = $subdir2 = '';
		if($type == 'album' || $type == 'forum' || $type == 'portal' || $type == 'category' || $type == 'profile') {
			$subdir1 = date('Ym');
			$subdir2 = date('d');
			$subdir = $subdir1.'/'.$subdir2.'/';
		} elseif($type == 'group' || $type == 'common') {
			$subdir = $subdir1 = substr(md5($extid), 0, 2).'/';
		}

		$check_exists && discuz_upload::check_dir_exists($type, $subdir1, $subdir2);

		return $subdir;
	}

	function check_dir_type($type) {
		return !in_array($type, array('forum', 'group', 'album', 'portal', 'common', 'temp', 'category', 'profile')) ? 'temp' : $type;
	}

	function check_dir_exists($type = '', $sub1 = '', $sub2 = '') {

		$type = discuz_upload::check_dir_type($type);

		$basedir = !getglobal('setting/attachdir') ? (DISCUZ_ROOT.'./data/attachment') : getglobal('setting/attachdir');

		$typedir = $type ? ($basedir.'/'.$type) : '';
		$subdir1  = $type && $sub1 !== '' ?  ($typedir.'/'.$sub1) : '';
		$subdir2  = $sub1 && $sub2 !== '' ?  ($subdir1.'/'.$sub2) : '';

		$res = $subdir2 ? is_dir($subdir2) : ($subdir1 ? is_dir($subdir1) : is_dir($typedir));
		if(!$res) {
			$res = $typedir && discuz_upload::make_dir($typedir);
			$res && $subdir1 && ($res = discuz_upload::make_dir($subdir1));
			$res && $subdir1 && $subdir2 && ($res = discuz_upload::make_dir($subdir2));
		}

		return $res;
	}

	function save_to_local($source, $target) {
		if(!discuz_upload::is_upload_file($source)) {
			$succeed = false;
		}elseif(@copy($source, $target)) {
			$succeed = true;
		}elseif(function_exists('move_uploaded_file') && @move_uploaded_file($source, $target)) {
			$succeed = true;
		}elseif (@is_readable($source) && (@$fp_s = fopen($source, 'rb')) && (@$fp_t = fopen($target, 'wb'))) {
			while (!feof($fp_s)) {
				$s = @fread($fp_s, 1024 * 512);
				@fwrite($fp_t, $s);
			}
			fclose($fp_s); fclose($fp_t);
			$succeed = true;
		}

		if($succeed)  {
			$this->errorcode = 0;
			@chmod($target, 0644); @unlink($source);
		} else {
			$this->errorcode = 0;
		}

		return $succeed;
	}

	function make_dir($dir, $index = true) {
		$res = true;
		if(!is_dir($dir)) {
			$res = @mkdir($dir, 0777);
			$index && @touch($dir.'/index.html');
		}
		return $res;
	}
}
?>