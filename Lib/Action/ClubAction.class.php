<?php
class ClubAction extends PublicAction {
    public function index() {
        global $_G;
        $this->headnav();
        $keyword = isset($_GET['keyword']) ? $_GET['keyword'] : '';
        $sid = isset($_GET['sid']) ? $_GET['sid'] : $_G['sid'];
        $filter = isset($_GET['filter']) ? $_GET['filter'] : 'all';
        $condition = '';
        $url = '';

        if(!empty($filter))
        {
            if(empty($url))
            {
                $url .= "filter=$filter";
            }
            else
            {
                $url .="&filter=$filter";
            }
        }
        if(!empty($keyword))
        {
            $condition .= " name like '%$keyword%' ";
            $url .= "&keyword=$keyword";
        }
        if(!empty($sid))
        {
            if(empty($condition))
            {
                $condition .= " sid = $sid ";
            }
            else
            {
                $condition .= " AND sid = $sid ";
            }
        }


        $url = '/Club/index?'.$url;
        $schools = M('School')->select();
        $num = count($schools);
        for($i=0;$i<$num;$i++)
        {
            $school_id = $schools[$i]['sid'];
            $schools[$i]['url']=$url."&sid=$school_id";
        }
        $school_all[] = array(
                'sid' => 0,
                'url' => $url."&sid=0",
                'name' => '全部学校'
                );
        $schools =  array_merge($school_all,$schools);
        $schools = json_encode($schools);
		
		list($start, $num, $filter,$keyword,$sid) = $this->parseInput();
        $clubs = D('Club')->getClub(0, 8, $filter,$keyword,$sid);
        $elements = [];
        foreach ($clubs as $club)
            $php_club.= $this->club2html($club);

        $this->assign('php_club', $php_club);
        $this->assign('schools', $schools);
        $this->assign('keyword', $keyword);
        $this->assign('sid', $sid);
        $this->assign('clubstat', D('Club')->get_stat($condition));
        $this->assign('filter', $filter);
        $this->display();
    }
	public function updateUserInfo(){
		if (!(D('User')->isSchoolAdmin(CURRENT_USER)))
            $this->error("没有权限！");
		$info=D('Club')->showMember(110);
		foreach($info[0]['content'][1] as $key => $val){
				$re[UserInfoOption($val)] = $key;
		}
		foreach($info[0]['content'] as $r1 => $v1)//去除表格中数据头尾的空白
		    foreach($v1 as $r2 => $v2)
			   $per2[$r1][$r2] = trim($info[0]['content'][$r1][$r2]);
		foreach($per2 as $key2 => $val2){
			if($key2 > 1)
			   foreach($val2 as $key3 => $val3){
			        if($key3 !=6)
					{ 
						if(UserInfoOption($info[0]['content'][1][$key3])=='gender') 
							$per[$key2]['gender'] = UserGender($val3);
						else
							$per[$key2][UserInfoOption($info[0]['content'][1][$key3])]= $val3;
					}
			   }
		}
		//dump($per);die;
		foreach($per as $a => $b){
			D('User')->where(['realname'=>$b['realname'],'email'=>$b['email']])->data($b)->save();
		}
	}
	public function intro() {
        $this->headnav();
        $gid = $_GET['gid'];
        D('Club')->updateClicks($_GET['gid']);
        $club = $this->getData($_GET['gid']);
        if (empty($club))
            $this->error('社团不存在！');
        $ishandled = M('Club_apply')->field('ishandled')->where(array('uid'=>CURRENT_USER,'gid'=>$gid))->select();
        if($ishandled == 1)
        {
            $club['apply']=true;
        }
        else
        {
            $club['apply']=false;
        }
		//dump(D('Poster')->getPosterByGid($gid));
		$Qrcode='/upload/avatar/Qr/'.'huodongQR_for'.$gid.'_'.A('Qr')->getQrcode($gid).'.png';
		$this->assign('Qrcode',$Qrcode);
        $this->assign('schedule',D('Poster')->getPosterByGid($gid));
		$this->assign('club', $club);
        $this->display();
    }

    public function introModify() {
        $club = $this->getData($_GET['gid']);
        $this->assign('club', $club);

        if ($club['isadmins'])
            $this->display();
        else
            $this->error("抱歉，只有社团管理员才能修改社团简介");
    }

    public function introUpdate() {
        $gid = $_POST['gid'];
        $club = $this->getData($gid);
        if (!$club['isadmins'])
            $this->error("抱歉，只有社团管理员才能修改社团简介");
        $club = M('Club')->find($gid);
        // strip HTML in fields
        $fields = ['name_en','slogan','found_date','teacher','qq_group','contact','homepage','shortdesc'];
        foreach ($fields as $field) {
            $club[$field] = htmlspecialchars($_POST[$field]);
        }
        // long desc is allowed to have HTML
		$club['description']=xss_clean($_POST['description']);//防止XSS攻击
        if (strlen($club['shortdesc']) > 420)
            $club['shortdesc'] = substr($club['shortdesc'], 0, 420);

        $logo = $this->uploadLogo();
        if (!empty($logo))
            $club['logo'] = $logo;

        M('Club')->where(['gid'=>$gid])->save($club);
		A('Qr')->QRpl($gid,$n=1);
        $this->assign('jumpUrl','/Club/intro?gid='.$gid);
        $this->success("修改成功！");
    }

    public function addOwner() {
        //dump(D('User')->isSchoolAdmin(CURRENT_USER));die;
		if (!(D('User')->isSchoolAdmin(CURRENT_USER)))
            $this->error("没有权限！");
		$sid = $_REQUEST['sid'];
		if($sid==''){ $this->error("没有权限！");}
		$this->display();
    }	
    public function addMember(){
		$this->display();
	}
	public function uploadMember(){
		    $gid=$this->_post('gid');
			$filename = $this->uploadxls();
			if (!$filename) {
				$this->error("您必须上传电子表格类文件。请注意最大文件大小的限制。");
			}
	        redirect('/Club/creatMember?f='.$filename.'&gid='.$gid,0,' ');
	}
	public function creatMember(){
		$filename=$this->_get('f');
		if(!$filename)return 0;
		$gid=$this->_get('gid');
		$filePath = 'upload/xls/'.$filename;
		$list=$this->readExcel($filePath);
        $str = implode($list[1]);
        $count = 0;
        $keywords = ["姓名","名字","会员姓名"];
        foreach ($keywords as $key => $value) {
            $tmp = stripos($str, $value);
            if(!empty($tmp))
                 $count++;

        }
        if (!empty($str) && $count==0) {
            $this->assign('firstline',1);
        }
		 $this->assign('list', $list);
		 $this->assign('gid',$gid);
		 $this->display();
			}
	public function saveMember(){
	    $gid=$this->_post('gid');
        $firstline=$this->_post('firstline');
	    $filename=$this->_post('filename');
		$val=$this->_post('v');

		$filePath = 'upload/xls/'.$filename;
		$list=$this->readExcel($filePath);

        if(!empty($firstline)){
            $list_tmp[1]=$val;
            foreach ($list as $keys => $values) {
                $list_tmp[]=$values;
            }
            $list = $list_tmp;
        }
		else
        {
            $list[1]=$val;
        }
		  foreach($val as $key => $value){
		       if($value==''){
			     foreach($list as $m =>$n){
				    unset($list[$m][$key]);
				  }
			   }
			}
        foreach($list as $key2 => $value2){
               foreach ($value2 as $m2 => $n2) {
                if($n2=='')
                    unset($list[$key2][$m2]);
               }
            }
		foreach($list as $r1 => $v1){//去除表格中数据头尾的空白
		    foreach($v1 as $r2 => $v2)
			    $list2[$r1][$r2] = trim(xss_clean($list[$r1][$r2]));//防止xss攻击
	    }
        //dump($list2);die;
        $data['content']=json_encode($list2);
	    $data['address_name']=$filename;
	    $data['real_name']=$filename;
	    $data['gid']=$gid;
	    $vid=M('club_address')->data($data)->add();
		redirect('/Club/address?gid='.$gid.'&vid='.$vid,0,' ');
	}
	public function doMember(){
	    $gid = $this->_post('gid');
		$k = $this->_post('k');
	    $sheet = $this->_post('sheet');
	    $row = $this->_post('row')+1;
		$club=D('Club');
		$info=$club->showMember($gid);
        //dump($info);
		$per = $info[$sheet]['content'][$row];
		foreach($info[$sheet]['content'][1] as $key => $val)
				$re[UserInfoOption($val)] = $key;
		switch($k)
		{
			case 0:
			  foreach($re as $option => $value){
				if($option=='gender') 
					$per_info["gender"] = UserGender($per[$value]);
				else
					$per_info[$option] = $per[$value];
			  }
			  $per_info['sid'] = $club->getSidByGid($gid);
			  //dump($per_info);die;
			  A('User')->addUsers($per_info,$gid);
			  $this->success(0);
			  //$club->addMember($this->_post('gid'),$this->_post('uid'));
			  break;  
			case 1:
			  $email= $per[$re['email']];
			  $telephone= $per[$re['telephone']];
			  $uid=D('User')->getUidWithMail($email)?D('User')->getUidWithMail($email):D('User')->getUidWithTel($telephone);
			  $club->addMember($gid,$uid);
			  $this->success(1);
			  break;
			case 2:
			  $email= $per[$re['email']];
			  $telephone= $per[$re['telephone']];
			  $uid=D('User')->getUidWithMail($email)?D('User')->getUidWithMail($email):D('User')->getUidWithTel($telephone);
			  $club->removeMember($gid,$uid);
			  $this->success(2);
			  break; 
			default:
			$this->error('非法操作');
		}
	}
	public function readExcel($filePath){
	   if(!file_exists($filePath)) $this->error('文件不存在');
        vendor('PHPExcel.PHPExcel');
        $inputFileType = PHPExcel_IOFactory::identify($filePath);
        //$inputFileType = "OOCalc";
        //dump($inputFileType);die;
        $PHPReader = PHPExcel_IOFactory::createReader($inputFileType);
		$PHPExcel = $PHPReader->load($filePath);
		$sheet = $PHPExcel->getActiveSheet();
		$highestRow = $sheet->getHighestRow(); // 取得总行数
		 $highestColumn = $sheet->getHighestColumn(); // 取得总列数
		 // 根据自己的数据表的大小修改
		 $arr = array('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
		 $i=0;
         $j=0;
         $k=0;
        for($column = 0; $arr[$column] <= $highestColumn && $arr[$column] !='Z' && $j<=3; $column++){
            $i=0;
              for($row = 1; $row <= $highestRow ; $row++){
                $val = trim($sheet->getCellByColumnAndRow($column, $row)->getValue());
                if($val=='') $i++; 
                if($i >= $highestRow) $j++;
            }
            $k++;
          }
         $highestColumn = $k - $j;
         // 每次读取一行，再在行中循环每列的数值
         for($row = 1; $row <= $highestRow; $row++){
		  for($column = 0; $column < $highestColumn && $column <=26; $column++){
		      $val = $sheet->getCellByColumnAndRow($column, $row)->getValue();
		      $list[$row][] = $val;
		  }
		 }
		 return $list;
	}
	public function uploadxls() {
        import("ORG.Net.UploadFile");
        $upload = new UploadFile();
        $upload->maxSize = 8 * 1024 * 1024;
        $upload->allowExts = ["xlsx","xlsm","xltx","xltm","xls","xlt","ods","ots","slk","xml","gnumeric","htm","html","csv"];
        $upload->savePath = './upload/xls/';
        $upload->saveRule = 'uniqid';
		 if(!$upload->upload()) {// 上传错误 提示错误信息 
			$this->error($upload->getErrorMsg()); 
		}
		else{
			$info = $upload->getUploadFileInfo();
			return $info[0]["savename"];
        }
    }
    public function delxls(){
        global $_G;
        $gid = $this->getInputGid();
		if(empty($_G[uid]))
        {
            $this->assign('jumpUrl','/User/login');
            $this->error("您尚未登录");
        }
        if(!$this->isManager($gid)){
            $this->error("部长以上可操作此手机通讯录");
        }
        if(!empty($vid) && D('Club')->isVcardOwner($gid,$vid) == 0){
            $this->error("无权限操作此手机通讯录");
        }
        $vids=explode(";",trim($this->_post('vids')));
        if($vids[0]=='')
            unset($vids[0]);
        //dump($vids); 
        $num = D("Club")->delExcels($gid,$vids);
        if($num>0)
             $this->success("成功删除了".$num."个文档．");
        else
             $this->error("未删除文档．");
    }
	public function addOwnerSubmit() {
        $uid = $_REQUEST['owner'];
        $gid = $_REQUEST['gid'];
        $id = $_REQUEST['id'];
        //dump($id);die;
		$sid = $_REQUEST['sid'];
		if($sid==''&&$id==''){ $this->error("没有权限！");}
		if (!(D('User')->isSchoolAdmin(CURRENT_USER)))
            $this->error("没有权限！");
        $club['owner'] = $_REQUEST['owner'];
		if($sid!=D('Club')->getSidByGid($gid)&&$id==''){
			$this->error('对不起，您无权操作校外社团');
		}
		$per_owner = M('Club')->field('owner')->where(array('gid'=>$gid))->find()['owner'];
		if($uid - $per_owner==0){
			$data2['priv'] = 'admin';
			$data2['title'] = '会长';
			D('User_group')->where(['uid'=>$per_owner,'gid'=>$gid])->save($data2);
			$this->error("已是该协会会长");
		
		}
		//die;
	    M('Club')->where(array('gid'=>$_REQUEST['gid']))->save($club);
       
		$priv = 'admin';
        $priv_pre = M('User_group')->result_first("SELECT priv FROM ustc_user_group where uid = $uid and gid = $gid");
        
		if($priv_pre)
        {
            if(($priv_pre!='inactive')&&($priv=='inactive'))
            {
                M('Club')->where(['gid'=>$gid])->setDec('member_count'); // 会员数减1 
            }
            if(($priv_pre=='inactive')&&($priv!='inactive'))
            {
                M('Club')->where(['gid'=>$gid])->setInc('member_count'); // 会员数加1 
            }
            M('user_group')->where(array('gid'=>$_REQUEST['gid'], 'uid'=>$_REQUEST['owner']))->delete();
        }
        else
        {
            M('Club')->where(['gid'=>$gid])->setInc('member_count'); // 会员数加1 
        }

        $record['gid'] = $_REQUEST['gid'];
        $record['uid'] = $_REQUEST['owner'];
        $record['sid'] = M('Club')->result_first("SELECT sid FROM ustc_club where gid = $gid");
        $record['priv'] = 'admin';
        $record['title'] = '会长';
        //dump($record);
		//die;
		$row = M('user_group');
        $row->create($record);
        $email=D('User')->result_first("select email from ustc_user where uid = ".$record['uid']);
        $club=D('Club')->getInfo($record['gid']);
        $realname = D('User')->getRealname($record['uid']);
        //$emails[] = $email;
        if($row->add())
        {
            SendMail($email,"您申请成为".$club['name']."会长已被管理员审核通过",
                    $realname."您好:\n\n您申请成为".$club['name']."会长已被管理员审核通过\n\n点击下面链接进入".$club['name']."社团主页，完善社团信息\n".
                    "http://".$_SERVER['HTTP_HOST']."/Club/?gid=$gid\n\n".
                    "感谢您的支持,校园活动平台 http://".$_SERVER['HTTP_HOST']
                    );
			if($id){
			$handle=array(
				'htime'=>time(),
				'handle_uid'   => CURRENT_USER,
				'ishandled'=>1
				);
			M('Club_apply')->where(['id'=>$id])->save($handle);
			}
		}
		if(!$id)
		{
			$data['priv'] = 'member';
			$data['title'] = '前会长';
			D('User_group')->where(['uid'=>$per_owner,'gid'=>$gid])->save($data);
			$this->success("更换会长成功！");
			return;
		}
		$this->success("设置会长成功！");
		//redirect("Club/manage?gid=76",params=array(),delay=0,msg='') 

    }
	
    public function refuseOwnerSubmit(){
        $uid = $_REQUEST['owner'];
        $gid = $_REQUEST['gid'];
        $id = $_REQUEST['id'];
        if (!(D('User')->isSchoolAdmin(CURRENT_USER)))
            $this->error("没有权限！");
        $handle=array(
				'htime'=>time(),
				'handle_uid'   => CURRENT_USER,
				'ishandled'=>1
				);
		M('Club_apply')->where(['id'=>$id])->save($handle);
		$this->success("拒绝其成为会长成功！");
    }

    public function introAdd() {
        if (CURRENT_USER == 0) {
            $this->error("您需要先登录");
        }

        global $_G;
        $school = M('User')->field('sid')->find($_G[uid]);
        $school_id = $school['sid'];

        if (!(D('User')->isSchoolAdmin(CURRENT_USER,$school_id)))
        {
            $this->error("您没有权限");
        }

        if(D('User')->isDeveloper(CURRENT_USER))
        {
            $schools = M('School')->select();
        }
        else
        {
            $schools = M('School')->where("sid = $school_id")->select();
        }

        $schools = json_encode($schools);

        $this->assign('schools', $schools);
        $this->assign('school_id', $school_id);

        $this->display();
    }
    public function ajaxAutocomplete()
    {

        $condition_info['name']  =array('like',"%".$_GET['term']."%");
        $res = M('Club')->field('name')->where($condition_info)->order("total_rate DESC")->limit(10)->select();
        if($res){$count=count($res);}
        else $count = 0;
        echo '[';
        foreach($res as $key => $val)
        {
            echo "\"$val[name]\"";
            if($i++<$count-1)
            {
                echo ",";
            }
        }
        echo ']';
    }
    public function introInsert() {
        if (!(D('User')->isSchoolAdmin(CURRENT_USER)))
            $this->error("没有权限！");

        $fields = ['sid','type','name','owner','name_en','slogan','found_date','teacher','qq_group','contact','homepage','shortdesc'];
        foreach ($fields as $field) {
            $club[$field] = htmlspecialchars($_POST[$field]);
        }
        if (empty($club['name']))
            $this->error("必须有社团名称");
        if (strlen($club['shortdesc']) > 420)
            $club['shortdesc'] = substr($club['shortdesc'], 0, 420);
		$club['description']=xss_clean($_POST['description']);//防止XSS攻击
        $club['logo'] = $this->uploadLogo();

        if (!is_numeric($club['owner']) || $club['owner'] <= 0) // key constraint
            unset($club['owner']);

        $model = M('Club');
        $model->create($club);
        $model->add();
		
		$gid=$model->field('gid')->where(array_filter($club))->order('gid desc')->find()['gid'];//给新加入的社团制作二维码
		A('Qr')->QRpl($gid,$n=1);
		$this->success("添加成功！");
    }

    private function uploadLogo() {
        import("ORG.Net.UploadFile");
        $upload = new UploadFile();
        $upload->maxSize = 2 * 1024 * 1024;
        $upload->allowExts = ['jpg', 'gif', 'png', 'jpeg'];
        $upload->savePath = './upload/clublogo/';
        $upload->saveRule = 'uniqid';

        import("ORG.Util.Image");
        $upload->thumb = true;
        $upload->thumbPath = './upload/clublogo/thumb/';
        $upload->thumbMaxWidth = 500; // twice width
        $upload->thumbMaxHeight = 2000;

        if ($upload->upload()) {
            $info = $upload->getUploadFileInfo();
            return $info[0]["savename"];
        }
        return null;
    }

    public function sendEmail() {
		$gid = $_REQUEST['gid'];
        if(!D('User')->checkLogin()){$this->assign('jumpUrl', '/User/login');$this->error('您尚未登陆');}
        if(!D('Club')->isManager($gid)){$this->error('只有会长和部长才有权限群发邮件。');}
        $gid = $_GET['gid'];
        if(!$gid){$this->error('非法操作！');}
        $re=D('Sms')->getMember($gid);
        $members = array();
        foreach($re as $row => $value)
        {
            if($value['priv']!='member')
                $value['info']=$value['realname'].'('.$value['title'].')'.'--'.$value['email'];
            else
                $value['info']=$value['realname'].'--'.$value['email'];
            $members[] = $value;
        }

        $club = D('Club')->getInfo($gid);
        $this->assign('club',$club);
        $this->assign('members',$members);
        //dump($club);
        $this->display();
    }

    public function sendEmailSubmit() {
        $gid = $this->getInputGid();
        if(!D('User')->checkLogin())
        {
            $this->assign('jumpUrl', '/User/login');
            $this->error('您尚未登陆');
        }
        if(!D('Club')->isManager($gid)){$this->error('只有会长和部长才有权限群发邮件。');}
        $tid = $_POST['tid'];
        $emails = array();
        if(trim($tid)=="all")
        {
            $members = M()->query("SELECT u.email FROM ustc_user AS u, ustc_user_group AS g WHERE g.gid = '$gid' AND g.uid = u.uid AND g.priv != 'inactive'");
            foreach ($members as $member)
                $emails[] = $member['email'];
        }
        elseif(!empty($tid))
        {
            $tid=explode(";",$tid);
            $tid_all = "(";
            foreach($tid as $value)
            {
                if($value)
                {
                    $tid_all .= $value.",";
                }
            }
            $tid_all = substr($tid_all,0,strlen($tid_all)-1).")";
            $members = M()->query("SELECT email FROM ustc_user  WHERE uid in $tid_all");
            foreach ($members as $member)
                $emails[] = $member['email'];
        }
        if (empty($emails))
            $this->error("您没有选择成员 :)");

        if (!($title = $_POST['title']))
            $this->error("必须填写邮件标题");
        if (strlen($title) > 200)
            $this->error("邮件标题过长!");
        if (strlen($title) < 5)
            $this->error("邮件标题过短!");
		$message=xss_clean($_POST['message']);//防止XSS攻击
		if (!($message))
            $this->error("必须填写邮件内容");
        if (strlen($message) > 10000)
            $this->error("邮件内容过长!");
        if (strlen($message) < 10)
            $this->error("邮件内容过短!");
        sendMail($emails, $title, $message, true);

        $this->assign('jumpUrl', '/Club/manage?gid='.$gid);
        $this->success("成功发送邮件给 ". count($emails) ." 人");
    }

    public function checkMembership() {
        $member = M('user')->where(array(
            'student_no' => $_REQUEST['student_no'],
            'realname' => $_REQUEST['name'],
            'email' => $_REQUEST['email'],
        ))->find();
        if (empty($member)) {
            die('ERROR');
        }
        $count = M('user_group')->where(array('uid'=>$member['uid'], 'gid'=>$_REQUEST['gid']))->count();
        if ($count == 1)
            die('OK');
        else
            die('ERROR');
    }

    public function manage() {
        //import(“ORG.Util.Page”);// 导入分页类

        $gid = $this->getInputGid();
        
        $page = isset($_GET['page']) && is_numeric($_GET['page']) ? $_GET['page'] : 1;
        //$start = isset($_GET['start']) && is_numeric($_GET['start']) ? $_GET['start'] : 0;
        $num = isset($_GET['num']) && is_numeric($_GET['num']) ? $_GET['num'] : 20;
        $start = ($page-1)*$num;
        
        $club = $this->getData($gid);
        $this->assign('club', $club);
        
        if (!$this->isManager($gid)) {
            $start = 0;
            $num = 20;
        }
        //$count = M()->query("SELECT count(*) FROM (ustc_user INNER JOIN ustc_user_group ON ustc_user.uid = ustc_user_group.uid) INNER JOIN ustc_priv ON ustc_user_group.priv = ustc_priv.priv_name WHERE ustc_user_group.gid='$gid'");
        
        //$Page = new Page($count,20);
        $members = M()->query("SELECT * FROM (ustc_user INNER JOIN ustc_user_group ON ustc_user.uid = ustc_user_group.uid) INNER JOIN ustc_priv ON ustc_user_group.priv = ustc_priv.priv_name WHERE ustc_user_group.gid='$gid' ORDER BY ustc_priv.priv_value desc LIMIT $start,$num");
       // $members = M()->query("SELECT * FROM (ustc_user INNER JOIN ustc_user_group ON ustc_user.uid = ustc_user_group.uid) INNER JOIN ustc_priv ON ustc_user_group.priv = ustc_priv.priv_name WHERE ustc_user_group.gid='$gid' ORDER BY ustc_priv.priv_value desc LIMIT $Page->firstRow,$Page-
       // >listRows");
    
       // if(count($member)>0)$count = count($member);

       // $Page = new Page($count,20);

        //$show = $Page->show();

        //$this->assign('list',$list);// 赋值数据集
        //$this->assign('members',$show);// 赋值分页输出
        //$this->display(); // 输出模板

        foreach ($members as &$member) {
            $member['avatar'] = D('user')->getAvatar($member['uid'],'small');
            $member['school']=D('School')->result_first("select name from ustc_school where sid = ".$member['sid']);
            /*if (empty($member['avatar']))
              $member['avatar'] = C('AVATAR_PATH')."noavatar_big.gif";
              else
              $member['avatar'] = C('AVATAR_PATH').$member['avatar'];*/
        }
        unset($member);
        //$members = D('Club')->sortMemberByPriv($members);
        $this->assign('members', $members);
        
        $inactive_members = M()->query("SELECT * FROM ustc_user AS u, ustc_user_group AS ug WHERE ug.gid='$gid' AND ug.priv = 'inactive' AND ug.uid = u.uid");
        
        foreach($inactive_members as &$member){
            $member['school']=D('School')->result_first("select name from ustc_school where sid = ".$member['sid']);
        }
        unset($member);
		
        $teams = M("Team")->where(array('type'=>'team','gid'=>$gid,'flag'=>1))->select();
		
        $departments =M("Team")->where(array('type'=>'department','gid'=>$gid,'flag'=>1))->select();
		
        $acts = D('Activity')->getActsByGid($gid);
		

        //dump($acts);
		$this->assign('acts', $acts);
		$this->assign('teams', $teams);
		$this->assign('departments', $departments);

        $this->assign('inactive', $inactive_members);
        $this->assign('pageStart', $start);
        $this->assign('pageNow', $page);
        $this->headnav();
        $this->display();
    }

    public function join() {
        if (CURRENT_USER == 0) {
            $this->error("您需要注册或登录后才能加入社团");
        }
        $gid = $this->getInputGid();
        $sid = M('Club')->result_first("SELECT sid FROM ustc_club where gid = $gid");
        if ($this->getPriv($gid) == null) {
            $record = array(
                    'uid' => CURRENT_USER,
                    'gid' => $gid,
                    'sid' => $sid,
                    'priv' => 'inactive',
                    'title' => '审核中'
                    );
            $obj = M('user_group');
            $obj->create($record);
            $obj->add();
            $this->assign('jumpUrl', "/Club/intro?gid=$gid");
            $this->success("您的加入申请已经提交");
        } else
            $this->error("您已经是这个社团的成员了，请勿重复提交申请");
    }

    public function joinVerify() {
        list($gid, $uid) = $this->getInputGidUid();
        $this->assign('jumpUrl', "/Club/manage?gid=$gid");
        if ($this->isManager($gid)) {
            if ($this->getPriv($gid, $uid) == 'inactive') {
                //echo 13;
				//die;
				D('Club')->addMember($gid, $uid);
                $this->sendJoinClubEmail($uid, $gid, true);
                $this->success("已经通过此加入申请");
            } else
                $this->error("此用户不处于待审核状态");
        } else
            $this->error("只有会长和部长才有权限审核会员");
    }

    public function joinDeny() {
        list($gid, $uid) = $this->getInputGidUid();
        $this->assign('jumpUrl', "/Club/manage?gid=$gid");
        if ($this->isManager($gid)) {
            if ($this->getPriv($gid, $uid) == 'inactive') {
                M('user_group')->where(['uid'=>$uid, 'gid'=>$gid])->delete();
                $this->sendJoinClubEmail($uid, $gid, false);
                $this->success("已经拒绝此加入申请");
            } else
                $this->error("此用户不处于待审核状态");
        } else
            $this->error("只有会长和部长才有权限审核会员");
    }

    // should be only called in ajax
    public function changeTitle() {
        list($gid, $uid) = $this->getInputGidUid();
        $title = htmlspecialchars($_GET['title']);
        if (!in_array($_GET['priv'], ['admin','vice-admin','manager', 'vice-manager', 'team-leader', 'member', 'inactive'])) {
            die("Invalid privilege");
        }
        $priv = $_GET['priv'];

        if ($this->isAdmin($gid)) {
            $record['priv'] = $priv;
            $record['title'] = $title;
            $priv_pre = M('User_group')->result_first("SELECT priv FROM ustc_user_group where uid = $uid and gid = $gid");
            if(($priv_pre!='inactive')&&($priv=='inactive'))
            {
                M('Club')->where(['gid'=>$gid])->setDec('member_count'); // 会员数减1 
            }
            if(($priv_pre=='inactive')&&($priv!='inactive'))
            {
                M('Club')->where(['gid'=>$gid])->setInc('member_count'); // 会员数加1 
            }
            $record['sid'] = M('Club')->result_first("SELECT sid FROM ustc_club where gid = $gid");
            M('user_group')->where(['uid'=>$uid, 'gid'=>$gid])->save($record);
            die("OK");
        } else
            die("Not enough privilege");
    }
    public function changeTitleText() {
        list($gid, $uid) = $this->getInputGidUid();
        $title = htmlspecialchars($_POST['title']);

        if ($this->isAdmin($gid)) {
            $record['title'] = $title;
            $record['sid'] = M('Club')->result_first("SELECT sid FROM ustc_club where gid = $gid");
            M('user_group')->where(['uid'=>$uid, 'gid'=>$gid])->save($record);
            $this->success('修改title成功');
        } else
            $this->error('修改title失败');
    } 
    public function test()
    {
        $clubs = M('Club')->where("1")->select();
        foreach($clubs as $value)
        {
			$num = M('User_group')->result_first("SELECT count(*) FROM ustc_user_group where gid = $value[gid] and sid = 1 and priv !='inactive'");
			$record['member_count'] = $num;
			M('Club')->where(['gid'=>$value[gid]])->save($record);
			dump(M('Club')->getLastSql());
        }
		
        /*M('Club')->query("update ustc_user_group set priv = 'vice-admin' where title = '副主席'");
        M('Club')->query("update ustc_user_group set priv = 'vice-admin' where title = '副会长'");
        M('Club')->query("update ustc_user_group set priv = 'vice-admin' where title = '副社长'");
        M('Club')->query("update ustc_user_group set priv = 'vice-manager' where title = '副部长'");
        M('Club')->query("update ustc_user_group set priv = 'team-leader' where title = '活动负责人'");
        M('Club')->query("update ustc_user_group set priv = 'team-leader' where title = '项目组长'");*/
    }

    public function removeMember() {
        list($gid, $uid) = $this->getInputGidUid();
        if ($this->isAdmin($gid)) {
            D('Club')->removeMember($gid, $uid);
            die("OK");
        } else
            die("Not enough privilege");
    }

    public function quit() {
        $gid = $this->getInputGid();
        if ($this->getPriv($gid) == 'member') {
            D('Club')->removeMember($gid, CURRENT_USER);
        }
        $this->assign('jumpUrl', "/Club/intro?gid=$gid");
        $this->success("退出社团成功！");
    }

    private function getPriv($gid, $uid = CURRENT_USER) {
        return M()->result_first("SELECT priv FROM ustc_user_group WHERE `uid`='$uid' AND `gid`='$gid'");
    }

    private function getPrivValue($gid,$uid = CURRENT_USER)
    {
        return M()->result_first("SELECT up.priv_value FROM ustc_user_group As ug, ustc_priv As up WHERE ug.priv = up.priv_name AND ug.uid='$uid' AND ug.gid='$gid'");
    }

    public function isAdmin($gid, $uid = CURRENT_USER) {
        return D('User')->isSchoolAdmin($uid) || $this->getPriv($gid,$uid) == 'admin';
    }

    public function isManager($gid, $uid = CURRENT_USER) {
        return D('User')->isSchoolAdmin($uid) || $this->getPrivValue($gid,$uid)>1;
    }

    public function inClub($gid, $uid = CURRENT_USER) {
        return $this->getPriv($gid, $uid) != NULL && $this->getPriv($gid, $uid) != 'inactive';
    }

    private function getData($gid, $join = false) {
        if (!is_numeric($gid))
            return null;
        $club = M('Club')->find($gid);
        if (empty($club))
            return null;
        $club['school'] = M('School')->find($club['sid']);

        if ($club['owner'] != NULL) {
            $club['admin'] = M('User')->find($club['owner']);
        }

        if ($join) {
            $club['managers'] = M()->query("SELECT * FROM ustc_user AS u, ustc_user_group AS g WHERE g.gid = '$gid' AND g.uid = u.uid AND g.priv = 'manager'");
            $club['managerUids'] = [];
            foreach ($club['managers'] as $manager) {
                $club['managerUids'][] = $magager['uid'];
            }

            $club['members'] = M()->query("SELECT * FROM ustc_user AS u, ustc_user_group AS g WHERE g.gid = '$gid' AND g.uid = u.uid AND g.priv = 'member'");
            $club['memberUids'] = [];
            foreach ($club['members'] as $member) {
                $club['memberUids'][] = $member['uid'];
            }
        }

        $mypriv = M()->query("SELECT up.priv_value, up.priv_name, ug.title FROM ustc_user_group As ug, ustc_priv As up WHERE ug.priv = up.priv_name AND ug.uid='".CURRENT_USER."' AND ug.gid='$gid'");
        foreach($mypriv as $v)
        {
            $club['mypriv'] = $v['priv_name'];
            $club['mypriv_value'] = $v['priv_value'];
            $club['title'] = $v['title'];
        }

        $club['isSchoolAdmin'] = D('User')->isSchoolAdmin(CURRENT_USER);
        $club['isadmin'] = ($club['isSchoolAdmin'] || $club['mypriv'] == 'admin');//主席
        $club['isadmins'] = ($club['isadmin'] || $club['mypriv'] == 'vice-admin');//副主席以上
		$club['iscorers'] = ($club['isSchoolAdmin'] || $club['mypriv_value'] > 5 );//副部长以上
        $club['ismanager'] = ($club['isadmins'] || $club['mypriv_value'] > 1 );//项目负责人以上
        $club['isin'] = $club['mypriv_value'] > 0;//会员
        $club['memberCount'] = $club['member_count'];
        $club['posterCount'] = $club['poster_count'];
        //dump($club);
        return $club;
    }

    public function work() {
        $list = M('info')->select();
        $this->assign("list", $list);
        $this->display();
    }

    public function ajaxGet() {
        list($start, $num, $filter,$keyword,$sid) = $this->parseInput();
        $clubs = D('Club')->getClub($start, $num, $filter,$keyword,$sid);
        $elements = [];
        foreach ($clubs as $club)
            $elements[] = $this->club2html($club);
        echo json_encode($elements);
    }

    public function ajaxApply()
    {
        if (CURRENT_USER == 0)
        {
            $this->error('您尚未登录，请先登录');
        }
        $gid = $_POST['gid'];
        $sid = D('Club')->getSidByGid($gid);
        $time = time();
        $data = array(
                'uid'=>CURRENT_USER,
                'gid'=>$gid,
                'sid'=>$sid,
                'time'=>$time
                );
        if(M('Club_apply')->where(array('uid'=>CURRENT_USER,'gid'=>$gid,'ishandled'=>0))->select())
        {
            //$error = array('status'=>0,'info'=>'您已经申请过');
            //echo json_encode($error);
            $this->error('您已经申请过');
        }
        else
        {
            if(!M('User_group')->where(array('uid'=>CURRENT_USER,'gid'=>$gid,'sid'=>$sid))->select())
            {
                $record['gid'] = $gid;
                $record['uid'] = CURRENT_USER;
                $record['sid'] = $sid;
                $record['priv'] = 'inactive';
                $record['title'] = '审核中';
                $row = M('User_group');
                $row->create($record);
                $row->add();
            }
            M('Club_apply')->data($data)->add();
            $this->success('申请成功，等待审核');
        }
    }

    private function parseInput() {
        $start = isset($_GET['start']) && is_numeric($_GET['start']) ? $_GET['start'] : 0;
        $num = isset($_GET['num']) && is_numeric($_GET['num']) ? $_GET['num'] : 0;
        $filter = isset($_GET['filter']) ? $_GET['filter'] : '';
        $keyword = isset($_GET['keyword']) ? $_GET['keyword'] : '';
        $sid = isset($_GET['sid']) ? $_GET['sid'] : 0;
        return array($start, $num, $filter, $keyword,$sid);
    }

    private function club2html($club) {
        return '<li class="hide">'.
            '<div class="celldiv">
			<div itemscope itemtype="http://data-vocabulary.org/Organization">
			<a target="_blank" href="/Club/intro?gid='.$club->gid().'" itemprop="url">'.
            '<p class="title" itemprop="name">'.$club->name().'</p>
			</a>'.
            $this->clubLogoThumbHtml($club).
            '<div class="intro">'.$club->shortdesc().'</div>'.
            '<div class="detail"><div class="hot">注册会员：'.$club->memberCount().'人'.
            $this->apply2html($club->gid()).
            '</div></div>'.
            '<div class="school">'.$club->schoolName($club->gid()).'</div>
			</div>
			</div></li>';
    }

    private function clubLogoThumbHtml($club) {
        if ($club->logoThumbUrl() != '')
            return '<a href="/Club/intro?gid='.$club->gid().'">'.
                '<img id="club-'.$club->gid().'" '.
                'class="clublogo" '.
                'height="'.$club->logoThumbHeight().'" '.
                'src="'.$club->logoThumbUrl().' "'.
                '/></a>';
        else return '';
    }

    private function apply2html($gid) {
        $priv = $this->getPriv($gid);
        if (CURRENT_USER == 0) // not login
            $priv = 'notlogin';
        $str = '<span id="apply-'.$gid.'" class="shenqing ';
        switch ($priv) {
            case 'admin':
            case 'manager':
            case 'member': $str .= 'isin';break;
            case 'inactive': $str .= 'applying';break;
            case 'notlogin': $str .= 'apply-notlogin';break;
            default: $str .= 'apply';
        }
        $str .= '">';
        switch ($priv) {
            case 'admin':
            case 'manager':
            case 'member': $str .= '已加入';break;
            case 'inactive': $str .= '申请中';break;
            default: $str .= '申请加入';
        }
        $str .= '</span>';
        return $str;
    }

    private function getInputGidUid() {
        if (!is_numeric($_REQUEST['gid']))
            $this->error("您所查找的社团不存在");
        if (!is_numeric($_REQUEST['uid']))
            $this->error("要验证的用户不存在");
        return array($_REQUEST['gid'], $_REQUEST['uid']);
    }

    private function getInputGid() {
        if (!is_numeric($_REQUEST['gid']))
            $this->error("您所查找的社团不存在");
        return $_REQUEST['gid'];
    }
    public function search()
    {
        $keyword = $_REQUEST['keyword'];
        if(empty($keyword))
        {
            $this->error("搜索关键词不能为空");
        }
        $this->assign('keyword', $keyword);
        $this->assign('clubstat', D('Club')->get_stat());
        $this->assign('filter', isset($_GET['filter']) ? $_GET['filter'] : 'all');
        $this->display();
    }
    public function address()
    {
        global $_G;
        if(empty($_G[uid]))
        {
            $this->assign('jumpUrl','/User/login');
            $this->error("您尚未登录");
        }
        $gid = $this->getInputGid();
        $vid = $this->_get('vid');//excel
		$club = $this->getData($gid);
		//dump($club);
        if(!$this->isManager($gid) && (D('Club')->isVcardOwner($gid,$vid) == 0 && empty($vid))) {
            $this->error("无权访问改通讯录");
        }
        if(empty($vid)){
        	$address = D('Address');
        	$members = $address->createAddress($gid);     
		}
		else{
			$excel=D('Club')->showMember($gid,$vid);
        }
		foreach($excel as $key3 => $val3){
			foreach($val3['content'][1] as $key => $val){
				if($val=='邮箱') $re[$key3]['email']=$key;
				if($val=='手机') $re[$key3]['telephone']=$key;
			}
			foreach($val3['content'] as $key2 => $val2)
			if($key2!=1)
				$kind[$key3][$key2] = D('Club')->UserKind($gid,$val2[$re[$key3]['email']],$val2[$re[$key3]['telephone']]);
		}

		$this->assign("kind", $kind);
		$this->assign("excel", $excel);
//	dump($excel);die;	
		$this->assign("club", $club);
        $this->assign("members", $members);
        $this->display();
    }
	public function addrManage(){
        global $_G;
        if(empty($_G[uid]))
        {
            $this->assign('jumpUrl','/User/login');
            $this->error("您尚未登录");
        }
        $gid = $this->getInputGid();
        $club = $this->getData($gid);
	   if(!$this->isManager($gid)) {
            $this->error("只有会长和部长才有权限查看通讯录");
        }
		$club = $this->getData($gid);
        $activitys=D('Activity')->getActsByGid($gid);
		$excel=D('Club')->showMember($gid);
		$this->assign("activitys",$activitys);
        $this->assign("excel", $excel);
		$this->assign("club", $club);
		$this->display();
	}
    public function emailAddress()
    {
        global $_G;
        if(empty($_G[uid]))
        {
            $this->assign('jumpUrl','/User/login');
            $this->error("您尚未登录");
        }
        $gid = $this->getInputGid();
        $club = $this->getData($gid);
        if(!$this->isManager($gid)) {
            $this->error("只有会长和部长才有权限查看通讯录");
        }
        $address = D('Address');
        $members = $address->createAddress($gid);
        $email_all = '';
        foreach($members as $key => $value)
        {
            $email_all.='"'.$value[realname].'"'.htmlspecialchars('<').$value[email].htmlspecialchars('>').', ';
        }
        $this->assign("club", $club);
        $this->assign("email", $email_all);
        $this->display();
    }
    
 /***********生成通讯录各种格式文件＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊
 */ 
    public function createAddressParse()
    {

        global $_G;
        if(empty($_G[uid]))
        {
            $this->assign('jumpUrl','/User/login');
            $this->error("您尚未登录");
        }
        $act_id = $this->_get('act_id');
        if(empty($act_id))
            $gid = $this->getInputGid();
        else
            $gid = D("Activity")->getGidByID($act_id);
        
        if(!$this->isManager($gid)) {
            $this->error("只有会长和部长才有权限操作此通讯录");
        }
        $vid = $this->_get('vid');
        if(!empty($vid) && D('Club')->isVcardOwner($gid,$vid) == 0){
            $this->error("无权限操作此手机通讯录");
        }
        if(empty($vid)){
            if(empty($act_id))
                $members = D('Address')->createAddress($gid);
            else
                $members = D('Activity')->getAddress($act_id);
        }
        else{
            $excel=D('Club')->showMember($gid,$vid);
            if(empty($excel))
                $this->error("抱歉该通讯录不存在");
            $members = $this->excel2Sql($excel[0]);
        }
        return array(
                'gid'=>$gid,
                'members'=>$members
            ); 
    }
    public function createAddressFetion()
    {
        
        $re=$this->createAddressParse();//生成通讯录权限预处理
        $gid=$re['gid'];
        $members=$re['members'];
        $filename="./upload/address_fetion".$gid.".csv";
        $file=fopen($filename,"w");
        if($file){
            fwrite($file,iconv( "UTF-8", "gbk" ,"MobileNo,Name"));
            fwrite($file,"\r\n");
            foreach($members as $key => $value)
            {
                $content = iconv( "UTF-8", "gbk" , "$value[telephone],$value[realname]");
                fwrite($file,"$content");
                fwrite($file, " \r\n");
            }
        }
        fclose($file);
        header("Cache-Control:must-revalidate,post-check=0,pre-check=0");  
        header("Content-Description:File Transfer");  
        header ("Content-type: application/octet-stream"); //定义数据类型
        header ("Content-Length: " . filesize ($filename));  
        header("Content-Disposition: attachment; filename=".basename($filename)); 
        readfile($filename);
    }
    public function createAddressEmailUSTC()
    {
        $re=$this->createAddressParse();//生成通讯录权限预处理
        $gid=$re['gid'];
        $members=$re['members'];
        $filename="./upload/address_email_ustc".$gid.".csv";
        $file=fopen($filename,"w");
        if($file){
            fwrite($file,iconv( "UTF-8", "gbk" ,"联系组,姓名,Email,手机"));
            fwrite($file,"\r\n");
            foreach($members as $key => $value)
            {
                $content = iconv( "UTF-8", "gbk" , "$club[name],$value[realname],$value[email],$value[telephone]");
                fwrite($file,"$content");
                fwrite($file, " \r\n");
            }
        }
        fclose($file);
        header("Cache-Control:must-revalidate,post-check=0,pre-check=0");  
        header("Content-Description:File Transfer");  
        header ("Content-type: application/octet-stream"); //定义数据类型
        header ("Content-Length: " . filesize ($filename));  
        header("Content-Disposition: attachment; filename=".basename($filename)); 
        readfile($filename);
    }
    public function createAddress()
    {
        
        $re=$this->createAddressParse();//生成通讯录权限预处理
        $gid=$re['gid'];
        $members=$re['members'];
        $filename="./upload/address".$gid.".csv";
        $file=fopen($filename,"w");
        if($file){
            fwrite($file,iconv( "UTF-8", "gbk" ,"姓名,学号,性别,职务,学历,入学年级,email,手机,QQ,主页"));
            fwrite($file,"\r\n");
            foreach($members as $key => $value)
            {
                $value['gender']=$value['gender']?'男':'女';
                $value[student_no]=strtoupper($value[student_no]);
                $content = iconv( "UTF-8", "gbk" , "$value[realname],$value[student_no],$value[gender],$value[title],$value[education],$value[grade],$value[email],$value[telephone],$value[qq],$value[homepage]");
                fwrite($file,"$content");
                fwrite($file, " \r\n");
            }
        }
        fclose($file);
        header("Cache-Control:must-revalidate,post-check=0,pre-check=0");  
        header("Content-Description:File Transfer");  
        header ("Content-type: application/octet-stream"); //定义数据类型
        header ("Content-Length: " . filesize ($filename));  
        header("Content-Disposition: attachment; filename=".basename($filename)); 
        readfile($filename);
    }
	public function createVcard()
    {
        $re=$this->createAddressParse();//生成通讯录权限预处理
        $gid=$re['gid'];
        $members=$re['members'];
		require_once "Common/vcard.php";
		foreach($members as $key => $per){
		$v = new vCard();
		$v->setPhoneNumber($per['telephone'], "CELL");
		$v->setName("", $per['realname'], "", "");
		$v->setTitle($per['title']);
		//$v->setBirthday("1960-07-31");
		//$v->setAddress("", "", "Musterstrasse 20", "Musterstadt", "", "98765", "Deutschland");
		$v->setEmail($per['email']);
		$v->setQQ($per['qq']);
		if($per['gender']) 
			{
				if($per['gender']==1)
					$v->setSex('M');
				if($per['gender']==0) 
					$v->setSex('F');
			}
		if($per['student_no'])
			$v->setNote('学号：'.$per['student_no']);
		//$v->setNote("/upload/avatar/small_avatar_".pathinfo($per['avatar'])['extension']);
		$v->setURL($per['homepage'], "WORK");
		$photo = "/upload/avatar/small_".$per['avatar'];
		//$photo = "sdad.bmp";
		//echo file_exists($photo)."<br>";
		if($per['avatar'])
			{				
				$type = pathinfo($photo)['extension'];
				$v->setPhoto($type, $photo);
			}
		$output .= $v->getVCard();
		}
		$filename = D('Club')->getClubName($gid);
		//dump($output);die;
		Header("Content-Disposition: attachment; filename=$filename.vcf");
		Header("Content-Length: ".strlen($output));
		Header("Connection: close");
		Header("Content-Type: text/x-vCard; name=$filename.vcf");
		echo $output;
    }
    public function downloadSource(){
        global $_G;
        if(empty($_G[uid]))
        {
            $this->assign('jumpUrl','/User/login');
            $this->error("您尚未登录");
        }
        $act_id = $this->_get('act_id');
        if(empty($act_id))
            $gid = $this->getInputGid();
        else
            $gid = D("Activity")->getGidByID($act_id);
        
        if(!$this->isManager($gid)) {
            $this->error("只有会长和部长才有权限操作此通讯录");
        }
        $vid = $this->_get('vid');
        if(!empty($vid) && D('Club')->isVcardOwner($gid,$vid) == 0){
            $this->error("无权限操作此手机通讯录");
        }
        $file = D('Club')->getXlsInfo($gid,$vid);
        $filepath = "./upload/xls/".$file['real_name'];
        if(!file_exists($filepath))
        {
            $this->error("文件不存在！");
        }
        $filename=realpath($filepath);  //文件名
        $name = $file['real_name'];
        Header( "Content-type:   application/octet-stream "); 
        Header( "Accept-Ranges:   bytes "); 
        Header( "Accept-Length: " .filesize($filename));
        header( "Content-Disposition:   attachment;   filename= {$name}"); 
        echo file_get_contents($filename);
        readfile($filename); 
    }
    public function excel2Sql($excel){
		foreach($excel['content'][1] as $key => $val){
		  $re[UserInfoOption($val)] = $key;
		}
		//dump($re);die;
		foreach($excel['content'] as $r1 => $v1)//去除表格中数据头尾的空白
		    foreach($v1 as $r2 => $v2)
			   $per2[$r1][$r2] = trim($info[0]['content'][$r1][$r2]);
		foreach($excel['content'] as $key2 => $val2){
			if($key2 > 1)
			   foreach($val2 as $key3 => $val3){
			        if($key3 !=6)
					{ 
						if(UserInfoOption($excel['content'][1][$key3])=='gender') 
							$per[$key2]['gender'] = UserGender($val3);
						else
							$per[$key2][UserInfoOption($excel['content'][1][$key3])]= $val3;
					}
			   }
		}
		//dump($per);die;
    return $per;
	}
	/*************END*******************************/
    public function getRealname($mobile,$vid,$gid){
        $excel=D('Club')->showMember($gid,$vid);
        $members = $this->excel2Sql($excel[0]);
        foreach ($members as $key => $value) {
            if ($value['telephone'] == $mobile) {
                return $value['realname'];
            }
        }
        //dump($members);die;
    }
    private function sendJoinClubEmail($uid, $gid, $status) {
        $user = M('user')->field(array('email', 'realname'))->find($uid);
        extract($user);
        $club = M('club')->field(array('name AS clubname', 'member_count'))->find($gid);
        extract($club);
        SendMail($email,
                $status ? "您已成功加入".$clubname : $clubname."拒绝了您的加入请求",
                $realname."你好:\n\n".
                ($status ? 
                 "您加入 $clubname 的申请已经审核通过。欢迎第 $member_count 位会员！":
                 "抱歉，您加入 $clubname 的申请被拒绝。请联系社团负责人以询问原因。"
                ).
                "\n\n点击下面链接可以查看 $clubname 的会员列表\n".
                "http://".$_SERVER['HTTP_HOST']."/Club/manage?gid=$gid\n\n".
                "校园活动平台 http://".$_SERVER['HTTP_HOST']
                );
    }

    public function sendNewMemberEmail() {
        if ($_GET['token'] != 'campusATustc')
            die();
        $groups = array();
        $members = M()->query("SELECT * FROM ustc_user AS u, ustc_user_group AS g WHERE g.uid = u.uid AND g.priv = 'inactive'");
        foreach ($members as $member) {
            $groups[$member['gid']][] = $member;
        }
        foreach ($groups as $gid => $group) {
            $this->__sendNewMemberEmail($gid, $group);
        }
    }

    private function __sendNewMemberEmail($gid, $members) {
        $group = M('club')->field(array('name AS clubname', 'owner'))->find($gid);
        extract($group);
        if (empty($owner))
            return;
        $owner = M('user')->field(array('realname', 'email'))->find($owner);
        extract($owner);
        $title = $clubname.'有'.count($members).'位新成员等待审核';
        foreach ($members as $member) {
            $content .= $member['realname'].' '.$member['dept'].' '.$member['grade'].'级'.$member['education']."\n";
        }
        $header =
            $realname."你好:\n\n".
            $title."。\n\n";
        $footer =
            "\n请点击下面链接以查看会员列表并审核新会员:\n".
            "http://".$_SERVER['HTTP_HOST']."/Club/manage?gid=$gid\n\n".
            "校园活动平台 http://".$_SERVER['HTTP_HOST'];
        echo "To: ".$email."\n";
        echo "Title: ".$title."\n";
        echo $header.$content.$footer."\n\n";
        SendMail($email, $title, $header.$content.$footer);
    }
}
