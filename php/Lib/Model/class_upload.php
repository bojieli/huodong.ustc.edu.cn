<?php
// include/class_upload.php 2011-08-19

class upload {
	function save($file, $path = CURRENT_PATH, $name = '') {
		if (!file_exists($file['tmp_name'])) {
			return false;
		}
		do {
			$filename = md5($file['name'].random(10));
		} while(upload::filename_used($filename));

		$object = array(
			'class' => 'file',
			'title' => $file['name'],
			'name' => $name,
			'abstract' => $file['type'],
			'content' => $filename,
			'priv' => 755,
			'priv_group' => 755
		);

		$newpath = OBJ::insert($path, $object);
		if (!$newpath) {
			return NOT_ALLOWED; // fail insert object, maybe privilege disallowed
		}

		$flag = upload::save_upload_file($file['tmp_name'], $filename);
		if (!$flag) {
			return FAILED;
		}
		
		// MIME types image/jpeg, image/gif, image/png, image/bmp, image/tiff
		if (substr($file['type'], 0, 6) == 'image/') {
			upload::create_thumb($filename);
		}

		return $newpath; // return newpath for parent iframe to identify the file location
	}

	function create_thumb($filename) {
		require_once libfile('class/image');
		$image = new image();
		global $_G;
		$image->Thumb(upload::gen_path($filename), upload::gen_path($filename).'_thumb', $_G['image']['thumb_width'], $_G['image']['thumb_height']);
	}
	
	function filename_used($filename) {
		return DB::result_first("SELECT COUNT(*) FROM common_object WHERE `class`='file' AND `content` = '$filename'");
	}

	function save_upload_file($source, $target) {
		return move_uploaded_file($source, upload::gen_path($target));
	}

	function down($path, $thumb = false) {
		$file = OBJ::get($path);
		if (empty($file)) {
			window::error('文件不存在或您没有权限访问！');
		}
		$filename = $file['content'];
		if ($thumb) {
			$filename = $file['content'].'_thumb';
		}
		$type = $file['abstract'];

		$filesize = filesize(upload::gen_path($filename));

		$fp = fopen(upload::gen_path($filename), 'r');
		if (!$fp) {
			if ($thumb) { // try original file
				$fp = fopen(upload::gen_path($file['content']), 'r');
				if (!$fp) {
					window::error('文件不存在！');
				}
			} else {
				window::error('文件不存在！');
			}
		}

		// turn off output buffer to save memory
		ob_end_clean();
		header('HTTP/1.1 200 OK');
		header('Content-type: '.$type);
		header('Accept-Ranges: bytes; Accept-Length='.$filesize);
		header('Content-Disposition: '.(isset($_GET['inline']) ? 'inline' : 'attachment').'; filename='.$file['title']);
		
		while (!feof($fp)) {
			$s = fread($fp, 1024 * 512);
			echo $s;
		}
		exit();
	}
	
	function down_thumb($path) {
		upload::down($path, true);
	}

	function delete($path) {
		if (!check_priv($path, PRIV_WRITE)) {
			window::error("没有权限删除文件！");
		}
		$filename = OBJ::get_attr($path, 'content');
		@unlink(upload::gen_path($filename));
		@unlink(upload::gen_path($filename.'_thumb'));
	}

	function gen_path($filename) {
		return GEWU_ROOT.'/data/upload/'.$filename;
	}
}
