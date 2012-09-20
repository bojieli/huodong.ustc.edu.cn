<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- QQ登录 -->
<meta property="qc:admins" content="61701556566401633636375" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>
<?php if(($ts['site']['page_title'])  !=  ""): ?><?php echo ($ts['site']['page_title']); ?> <?php echo ($ts['site']['site_name']); ?>
<?php else: ?>
    <?php echo ($ts['site']['site_name']); ?><?php endif; ?>    
</title>
<link rel="shortcut icon" href="__THEME__/favicon.ico" />
<meta name="keywords" content="<?php echo ($ts['site']['site_header_keywords']); ?>" />
<meta name="description" content="<?php echo ($ts['site']['site_header_description']); ?>" />
<script>
	var _UID_   = <?php echo (int) $uid; ?>;
	var _MID_   = <?php echo (int) $mid; ?>;
	var _ROOT_  = '__ROOT__';
	var _THEME_ = '__THEME__';
	var _PUBLIC_ = '__PUBLIC__';
	var _LENGTH_ = <?php echo (int) $GLOBALS['ts']['site']['length']; ?>;
	var _LANG_SET_ = '<?php echo LANG_SET; ?>';
	var $CONFIG = {};
		$CONFIG['uid'] = _UID_;
		$CONFIG['mid'] = _MID_;
		$CONFIG['root_path'] =_ROOT_;
		$CONFIG['theme_path'] = _THEME_;
		$CONFIG['public_path'] = _PUBLIC_;
		$CONFIG['weibo_length'] = <?php echo (int) $GLOBALS['ts']['site']['length']; ?>;
		$CONFIG['lang'] =  '<?php echo LANG_SET; ?>';
    var bgerr;
    try { document.execCommand('BackgroundImageCache', false, true);} catch(e) {  bgerr = e;}
</script>
<!-- 全局风格CSS -->
<link href="__THEME__/public.css?20110429" rel="stylesheet" type="text/css" />
<link href="__THEME__/layout.css?20110429" rel="stylesheet" type="text/css" />
<link href="__THEME__/main.css?20110429" rel="stylesheet" type="text/css" />
<link href="__PUBLIC__/js/tbox/box.css" rel="stylesheet" type="text/css" />
<!-- 核心JS加载 -->
<script type="text/javascript" src="__PUBLIC__/js/jquery.js"></script>
<script type="text/javascript" src="__PUBLIC__/js/common.js"></script>
<script type="text/javascript" src="__PUBLIC__/js/tbox/box.js"></script>
<script type="text/javascript" src="__PUBLIC__/js/scrolltopcontrol.js"></script>
<script type="text/javascript" src="__PUBLIC__/js/weibo.js"></script>
<script src="__PUBLIC__/js/jquery.jgrow.min.js"></script>
<script src="__PUBLIC__/js/jquery.isotope.min.js"></script>

<!-- 编辑器样式文件 -->
<link href="__PUBLIC__/js/editor/editor/theme/base-min.css" rel="stylesheet"/>
<!--[if lt IE 8]><!-->
<link href="__PUBLIC__/js/editor/editor/theme/cool/editor-pkg-sprite-min.css" rel="stylesheet"/>
<!--<![endif]-->
<!--[if gte IE 8]><!-->
<link href="__PUBLIC__/js/editor/editor/theme/cool/editor-pkg-min-datauri.css" rel="stylesheet"/>
<!--<![endif]-->
<?php echo Addons::hook('public_head',array('uid'=>$uid));?>
</head>

<body class="page_home">
<div class="wrap">

<?php if(isset($_SESSION["userInfo"])): ?><?php if(isMobile()){ ?>
<!--顶部导航-->
<style>
.page_home{background:#e4e4e4 repeat center top;_padding:0}
.content_holder{margin-top:10px;}
</style>
<div class="top_holder">
 <div class="header">
 <div class="logo_holder">
    <!--个人信息区-->
    <ul class="person per-info">
    <li><?php echo getUserSpace($mid,'fb14 username nocard info-bg','','',false);?></li>
    <li class="header_dropdown"><a href="#" class="application li-bg">消息<span class="ico_arrow arrow-bg"></span></a>
          <div class="dropmenu ip-dropmenu">
                <ul class="message_list_container message_list_new">
                </ul>
                <dl class="message">
          <dd><a href="<?php echo U('home/message/index');?>">查看私信<?php if(($userCount['message'])  >  "0"): ?>(<?php echo ($userCount["message"]); ?>)<?php endif; ?></a></dd> 
          <dd><a href="<?php echo U('home/user/atme');?>">查看@我<?php if(($userCount['atme'])  >  "0"): ?>(<?php echo ($userCount["atme"]); ?>)<?php endif; ?></a></dd> 
          <dd><a href="<?php echo U('home/user/comments');?>">查看评论<?php if(($userCount['comment'])  >  "0"): ?>(<?php echo ($userCount["comment"]); ?>)<?php endif; ?></a></dd> 
          <dd><a href="<?php echo U('home/message/notify');?>">系统通知<?php if(($userCount['notify'])  >  "0"): ?>(<?php echo ($userCount["notify"]); ?>)<?php endif; ?></a></dd> 
          <dd><a href="<?php echo U('home/message/appmessage');?>">应用消息<?php if(($userCount['appmessage'])  >  "0"): ?>(<?php echo ($userCount["appmessage"]); ?>)<?php endif; ?></a></dd> 
                </dl>
                <dl class="square_list">
                <dd><a href="javascript:ui.sendmessage(0)">发私信</a></dd>
                </dl>
          </div>
        </li>
    <li class="header_dropdown"><a href="#" class="application li-bg">帐号<span class="ico_arrow arrow-bg"></span></a>
          <div class="dropmenu ip-dropmenu">
                <dl class="setup">
                <dd><a href="<?php echo U('home/User/findfriend');?>"><span class="ico_pub ico_pub_find"></span>找人</a></dd>
                <dd><a href="<?php echo U('home/Account');?>"><span class="ico_pub ico_pub_set"></span>设置</a></dd>
                <dd><a href="<?php echo U('home/Account/invite');?>"><span class="ico_pub ico_pub_invitation"></span>邀请</a></dd>
                <dd><a href="<?php echo U('home/Account/weiboshare');?>"><span class="ico_pub ico_pub_tool"></span>小工具</a></dd>
                <?php echo Addons::hook('header_account_tab', array('menu' => & $header_account_drop_menu));?>
                <?php if(is_array($header_account_drop_menu)): ?><?php $i = 0;?><?php $__LIST__ = $header_account_drop_menu?><?php if( count($__LIST__)==0 ) : echo "" ; ?><?php else: ?><?php foreach($__LIST__ as $key=>$vo): ?><?php ++$i;?><?php $mod = ($i % 2 )?><dd><a href="<?php echo ($vo['url']); ?>"><span class="ico_pub ico_pub_<?php echo ($vo['act']); ?>"></span><?php echo ($vo['name']); ?></a></dd><?php endforeach; ?><?php endif; ?><?php else: echo "" ;?><?php endif; ?>
                <?php if(($isSystemAdmin)  ==  "TRUE"): ?><dd><a href="<?php echo U('admin/index/index');?>"><span class="ico_pub"><img src="__THEME__/images/audit.png" /></span>后台管理</a></dd><?php endif; ?>
                </dl>
                <dl class="square_list_add">
                <dd><a href="<?php echo U('home/Public/logout');?>"><span class="ico_pub ico_pub_signout"></span>退出</a></dd>
                </dl>
          </div>
        </li>
    </ul>
  <!--/个人信息区-->
  <!--消息提示框-->
    <div id="message_list_container" class="layer_massage_box" style="display:none;">
      <ul id="is_has_message" class="message_list_container">
        </ul>
        <a href="javascript:void(0)" onclick="ui.closeCountList(this)" class="del"></a>
    </div>
  <!--/消息提示框-->
    
    <div class="nav nav-left">
      <ul>
        <li><a href="<?php echo U('home');?>" class="fb14 nav-bg">首页</a></li>
    <li class="header_dropdown"><a href="#" class="application li-bg">广场<span class="ico_arrow arrow-bg"></span></a>
          <div class="dropmenu ip-dropmenu">
                <dl class="square_list">
                <dd><a href="<?php echo U('home/Square/top');?>"><span class="ico_pub ico_pub_billboard"></span>风云榜</a></dd>
                <dd><a href="<?php echo U('home/Square/star');?>"><span class="ico_pub ico_pub_hall"></span>名人堂</a></dd>
                <?php echo Addons::hook('header_square_tab', array('menu' => & $header_square_expend_menu));?>
                <?php if(is_array($header_square_expend_menu)): ?><?php $i = 0;?><?php $__LIST__ = $header_square_expend_menu?><?php if( count($__LIST__)==0 ) : echo "" ; ?><?php else: ?><?php foreach($__LIST__ as $key=>$vo): ?><?php ++$i;?><?php $mod = ($i % 2 )?><dd><a href="<?php echo U('home/Square/' . $vo['act'], $vo['param']);?>"><span class="ico_pub ico_pub_<?php echo ($vo['act']); ?>"></span><?php echo ($vo['name']); ?></a></dd><?php endforeach; ?><?php endif; ?><?php else: echo "" ;?><?php endif; ?>
            </dl>
          </div>
        </li>
        <li class="header_dropdown"><a href="#" class="application li-bg">应用<span class="ico_arrow arrow-bg"></span></a>
          <div class="dropmenu ip-dropmenu">
            <dl class="app_list">
                <?php foreach ($ts['user_app'] as $_temp_type => $_temp_apps) { ?>
                <?php foreach ($_temp_apps as $_temp_app) { ?>
                    <dd>
                        <?php if($_temp_type == 'local_app' || $_temp_type == 'local_default_app') { ?>
                        <a href="<?php echo $_temp_app['app_entry'];?>" class="a14">
                            <img class="app_ico" src="<?php echo $_temp_app['icon_url'];?>" />
                            <?php echo $_temp_app['app_alias'];?>
                        </a>
                        <?php }else { ?>
                        <a href="__ROOT__/apps/myop/userapp.php?id=<?php echo $_temp_app['app_id'];?>" class="a14">
                            <img class="app_ico" src="http://appicon.manyou.com/icons/<?php echo $_temp_app['app_id'];?>" />
                            <?php echo $_temp_app['app_alias'];?>
                        </a>
                        <?php }?>
                    </dd>
                <?php } // end of foreach?>
                <?php } // end of foreach?>
                </dl>
                <dl class="app_list_add">
                <dd><a href="<?php echo U('home/Index/addapp');?>"><span class="ico_app_add"></span>添加更多应用</a></dd>
                </dl>
          </div>
        </li>
		
      </ul>
    </div>
 </div>
  <form action="<?php echo U('home/user/search');?>" id="quick_search_form" method="post">
    <div>
    <div class="soso br3 line"><label id="_header_search_label" style="display: block;" onclick="$(this).hide();$('#_header_search_text').focus();">搜名字/标签/微博</label><input type="text" class="line-text" value="" name="k" id="_header_search_text" onblur="if($(this).val()=='') $('#_header_search_label').show();"/></div><input name="" type="button" onclick="$('#quick_search_form').submit()" class="ip-serach hand br3"/></div>
  <script>
  if($('#_header_search_text').val()=='')
    $('#_header_search_label').show();
  else
    $('#_header_search_label').hide();
  </script>
    </form>
  </div>
</div>
<?php }else{ ?>
<!--顶部导航-->
<div class="header_holder">
 <div class="header">
 <div class="logo_holder">
    <div class="logo"><a href="<?php echo U('home/Index');?>"><img src="<?php echo $ts['site']['site_logo']?$ts['site']['site_logo']:__THEME__.'/images/logo.png'; ?>" style="_filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled=true,sizingMethod=crop)" /></a></div>
    <form action="<?php echo U('home/user/search');?>" id="quick_search_form" method="post">
    <div class="soso br3"><label id="_header_search_label" style="display: block;" onclick="$(this).hide();$('#_header_search_text').focus();">搜名字/标签/微博</label><input type="text" class="so_text" value="" name="k" id="_header_search_text" onblur="if($(this).val()=='') $('#_header_search_label').show();"/><input name="" type="button" onclick="$('#quick_search_form').submit()" class="so_btn hand br3"/></div>
	<script>
	if($('#_header_search_text').val()=='')
		$('#_header_search_label').show();
	else
		$('#_header_search_label').hide();
	</script>
    </form>
    <div class="nav">
      <ul>
        <li><a href="<?php echo U('home');?>" class="fb14">首页</a></li>
		<li class="header_dropdown"><a href="<?php echo U('home/Square/index');?>" class="application">广场<span class="ico_arrow"></span></a>
          <div class="dropmenu">
                <dl class="square_list">
                <dd><a href="<?php echo U('home/Square/top');?>"><span class="ico_pub ico_pub_billboard"></span>风云榜</a></dd>
                <dd><a href="<?php echo U('home/Square/star');?>"><span class="ico_pub ico_pub_hall"></span>名人堂</a></dd>
                <?php echo Addons::hook('header_square_tab', array('menu' => & $header_square_expend_menu));?>
				<?php if(is_array($header_square_expend_menu)): ?><?php $i = 0;?><?php $__LIST__ = $header_square_expend_menu?><?php if( count($__LIST__)==0 ) : echo "" ; ?><?php else: ?><?php foreach($__LIST__ as $key=>$vo): ?><?php ++$i;?><?php $mod = ($i % 2 )?><dd><a href="<?php echo U('home/Square/' . $vo['act'], $vo['param']);?>"><span class="ico_pub ico_pub_<?php echo ($vo['act']); ?>"></span><?php echo ($vo['name']); ?></a></dd><?php endforeach; ?><?php endif; ?><?php else: echo "" ;?><?php endif; ?>
            </dl>
          </div>
        </li>
        <?php if(!empty($my_group_list)){ ?>
		<li id="iframe_group_li" class="header_dropdown"><a href="<?php echo U('group/index/newIndex');?>" class="application">群组<span class="ico_arrow"></span></a>
          <div id="iframe_group" class="dropmenu"><iframe id="iframe_g" style="position:absolute;_filter:alpha(opacity=0);opacity=0;z-index:-1;width:100%;height:100%;top:0;left:0;scrolling:no;" frameborder="0" src="about:blank"></iframe>
                <dl class="group_list">
                            <?php $moreGroup = false; ?>
                            <?php foreach($my_group_list as $key=>$value){ ?>
                                <dd><a href="<?php echo U('group/group/index',array('gid'=>$value['id']));?>"><?php echo ($value['name']); ?></a></dd>
                                 <?php if($key>=5){
                                       $moreGroup = true;
                                       break;
                                       } ?>
                            <?php } ?>
                </dl>
                <dl class="group_list_add">
                <dd><?php if($moreGroup){ ?><a href="<?php echo U('group/SomeOne');?>" class="right">更多&raquo;</a><?php } ?><a href="<?php echo U('group/Index/add');?>">创建群组</a></dd>
                </dl>
          </div>
        </li>
        <?php } ?>
        <li id="iframe_app_li" class="header_dropdown"><a href="<?php echo U('home/Index/addapp');?>" class="application">应用<span class="ico_arrow"></span></a>
          <div id="iframe_app" class="dropmenu"><iframe id="iframe_a" style="position:absolute;_filter:alpha(opacity=0);opacity=0;z-index:-1;width:100%;height:100%;top:0;left:0;scrolling:no;" frameborder="0" src="about:blank"></iframe>
            <dl class="app_list">
                <?php foreach ($ts['user_app'] as $_temp_type => $_temp_apps) { ?>
                <?php foreach ($_temp_apps as $_temp_app) { ?>
                    <dd>
                        <?php if($_temp_type == 'local_app' || $_temp_type == 'local_default_app') { ?>
                        <a href="<?php echo $_temp_app['app_entry'];?>" class="a14">
                            <img class="app_ico" src="<?php echo $_temp_app['icon_url'];?>" />
                            <?php echo $_temp_app['app_alias'];?>
                        </a>
                        <?php }else { ?>
                        <a href="__ROOT__/apps/myop/userapp.php?id=<?php echo $_temp_app['app_id'];?>" class="a14">
                            <img class="app_ico" src="http://appicon.manyou.com/icons/<?php echo $_temp_app['app_id'];?>" />
                            <?php echo $_temp_app['app_alias'];?>
                        </a>
                        <?php }?>
                    </dd>
                <?php } // end of foreach?>
                <?php } // end of foreach?>
                </dl>
                <dl class="app_list_add">
                <dd><a href="<?php echo U('home/Index/addapp');?>"><span class="ico_app_add"></span>添加更多应用</a></dd>
                </dl>
          </div>
        </li>
  		<?php echo Addons::hook('header_topnav', array('menu' => & $header_topnav));?>
  		<?php if(is_array($header_topnav)): ?><?php $i = 0;?><?php $__LIST__ = $header_topnav?><?php if( count($__LIST__)==0 ) : echo "" ; ?><?php else: ?><?php foreach($__LIST__ as $key=>$vo): ?><?php ++$i;?><?php $mod = ($i % 2 )?><li><a href="<?php echo ($vo['url']); ?>" class="fb14"><?php echo ($vo['name']); ?></a></li><?php endforeach; ?><?php endif; ?><?php else: echo "" ;?><?php endif; ?>
      </ul>
    </div>
 </div>
	<!--个人信息区-->
    <ul class="person">
		<li><?php echo getUserSpace($mid,'fb14 username nocard','','',false);?></li>
		<li class="header_dropdown" id="message_show"><a href="<?php echo U('home/message/index');?>" class="application">消息<span class="ico_arrow"></span></a>
          <div class="dropmenu">
                <ul class="message_list_container message_list_new">
                </ul>
                <dl class="message">
      					<dd><a href="<?php echo U('home/message/index');?>">查看私信<?php if(($userCount['message'])  >  "0"): ?>(<?php echo ($userCount["message"]); ?>)<?php endif; ?></a></dd> 
      					<dd><a href="<?php echo U('home/user/atme');?>">查看@我<?php if(($userCount['atme'])  >  "0"): ?>(<?php echo ($userCount["atme"]); ?>)<?php endif; ?></a></dd> 
      					<dd><a href="<?php echo U('home/user/comments');?>">查看评论<?php if(($userCount['comment'])  >  "0"): ?>(<?php echo ($userCount["comment"]); ?>)<?php endif; ?></a></dd> 
      					<dd><a href="<?php echo U('home/message/notify');?>">系统通知<?php if(($userCount['notify'])  >  "0"): ?>(<?php echo ($userCount["notify"]); ?>)<?php endif; ?></a></dd> 
      					<dd><a href="<?php echo U('home/message/appmessage');?>">应用消息<?php if(($userCount['appmessage'])  >  "0"): ?>(<?php echo ($userCount["appmessage"]); ?>)<?php endif; ?></a></dd> 
                </dl>
                <dl class="square_list">
                <dd><a href="javascript:ui.sendmessage(0)">发私信</a></dd>
                </dl>
          </div>
        </li>
		<li class="header_dropdown" id="account_show"><a href="<?php echo U('home/Account');?>" class="application">帐号<span class="ico_arrow"></span></a>
          <div class="dropmenu">
                <dl class="setup">
                <dd><a href="<?php echo U('home/User/findfriend');?>"><span class="ico_pub ico_pub_find"></span>找人</a></dd>
                <dd><a href="<?php echo U('home/Account');?>"><span class="ico_pub ico_pub_set"></span>设置</a></dd>
                <dd><a href="<?php echo U('home/Account/invite');?>"><span class="ico_pub ico_pub_invitation"></span>邀请</a></dd>
                <dd><a href="<?php echo U('home/Account/weiboshare');?>"><span class="ico_pub ico_pub_tool"></span>小工具</a></dd>
                <?php echo Addons::hook('header_account_tab', array('menu' => & $header_account_drop_menu));?>
				        <?php if(is_array($header_account_drop_menu)): ?><?php $i = 0;?><?php $__LIST__ = $header_account_drop_menu?><?php if( count($__LIST__)==0 ) : echo "" ; ?><?php else: ?><?php foreach($__LIST__ as $key=>$vo): ?><?php ++$i;?><?php $mod = ($i % 2 )?><dd><a href="<?php echo ($vo['url']); ?>"><span class="ico_pub ico_pub_<?php echo ($vo['act']); ?>"></span><?php echo ($vo['name']); ?></a></dd><?php endforeach; ?><?php endif; ?><?php else: echo "" ;?><?php endif; ?>
                <?php if(($isSystemAdmin)  ==  "TRUE"): ?><dd><a href="<?php echo U('admin/index/index');?>"><span class="ico_pub ico_pub_admin"></span>后台管理</a></dd><?php endif; ?>
                </dl>
                <dl class="square_list_add">
                <dd><a href="<?php echo U('home/Public/logout');?>"><span class="ico_pub ico_pub_signout"></span>退出</a></dd>
                </dl>
          </div>
        </li>
    </ul>
	<!--/个人信息区-->
	<!--消息提示框-->
    <div id="message_list_container" class="layer_massage_box" style="display:none;">
    	<ul id="is_has_message" class="message_list_container">
        </ul>
        <a href="javascript:void(0)" onclick="ui.closeCountList(this)" class="del"></a>
    </div>
	<!--/消息提示框-->
  </div>
</div>
<!--/顶部导航-->
<?php } ?><?php endif; ?>
<?php if( !isset($_SESSION["userInfo"])): ?><div class="header_holder">
    <div class="header">
      <div class="logo"><a href="<?php echo U('home/Index');?>"><img src="<?php echo $ts['site']['site_logo']?$ts['site']['site_logo']:__THEME__.'/images/logo.png'; ?>" style="_filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled=true,sizingMethod=crop)" /></a></div>
      <div id="indt" class="nav_sub br3">
        <p>
      	<?php if(($ts['site']['site_anonymous_square'])  ==  "1"): ?><a href="<?php echo U('home/Square');?>">微博广场</a>&nbsp;|&nbsp;<?php endif; ?>
      	<a href="<?php echo U('home/Public/register');?>">注册</a>&nbsp;|&nbsp;
      	<a href="javascript:ui.quicklogin();">登录</a>
        <p>
      </div>
  </div>
</div><?php endif; ?>
<?php echo constant(" 头部广告 *");?>
<?php if(is_array($ts['ad']['header'])): ?><?php $i = 0;?><?php $__LIST__ = $ts['ad']['header']?><?php if( count($__LIST__)==0 ) : echo "" ; ?><?php else: ?><?php foreach($__LIST__ as $key=>$vo): ?><?php ++$i;?><?php $mod = ($i % 2 )?><div class="ad_header"><div class="ke-post"><?php echo ($vo['content']); ?></div></div><?php endforeach; ?><?php endif; ?><?php else: echo "" ;?><?php endif; ?>  

<script>
$(document).ready(function(){
	$(".header_dropdown").hover(
		function(){ 
      var type = $(this).attr('id');
      if(type == 'message_show' || type == 'account_show') {
        var obj = document.getElementById('message_list_container');
        if(obj !== null) {
          var isHas = $('#is_has_message').html();
          if(isHas) {
            $('#message_list_container').css("display", 'none');
          }
        }
      }
      $(this).addClass("hover"); 
    },
		function(){ 
      var type = $(this).attr('id');
      if(type == 'message_show' || type == 'account_show') {
        var obj = document.getElementById('message_list_container');
        if(obj !== null) {
          var isHas = $('#is_has_message').html();
          if(isHas) {
            $('#message_list_container').css("display", '');
          }
        }
      }
      $(this).removeClass("hover"); 
    }
	);
	
	<?php if($mid > 0) { ?>
		ui.countNew();
		setInterval("ui.countNew()",120000);
	<?php } ?>
});
</script>

<?php echo constant(" 注册引导 *");?>
<?php if(!$mid && APP_NAME.'/'.MODULE_NAME != 'home/Public' && APP_NAME.'/'.MODULE_NAME != 'home/Index'){ ?>
<div class="content no_bg" style=" margin-bottom:10px;overflow:hidden;zoom:1">
  <div  style="padding:10px 15px;zoom:1">
    <div style="float:right; width:220px; text-align:center; padding-top:5px;font-size:14px"><a class="regbtn" title="立即注册" href="<?php echo U('home/Public/register');?>"> &nbsp;</a><br />
      有帐号？<a href="<?php echo U('home/Public/login');?>"><strong>马上登录</strong></a></div>
    <div style=" margin-right:250px;">
      <h2 class="f18px lh30 fB">欢迎来到<?php echo ($ts['site']['site_name']); ?>，赶紧注册吧！</h2>
      <p class="f14px cGray2">微博是一个大家表达真实自我的即时广播平台。赶紧开通微博，获得朋友、同事最新动态，通过网页、手机随时随地记录自己的点滴生活！</p>
    </div>
  </div>
</div>
<?php } ?>

<script type="text/javascript">
$(function() {
  $('#iframe_group_li').live('mousemove', function() {
    var group_width = $('#iframe_group').width();
    var group_height = $('#iframe_group').height();
    $('#iframe_g').css('width', group_width);
    $('#iframe_g').css('height', group_height);
  });
  $('#iframe_app_li').live('mousemove', function() {
    var app_width = $('#iframe_app').width();
    var app_height = $('#iframe_app').height();
    $('#iframe_a').css('width', app_width);
    $('#iframe_a').css('height', app_height);
  });
});
</script>
<?php
// 读取附件大小的配置
$_editor_system_default = model('Xdata')->lget('attach');
$_editor_size_limit = empty($_editor_system_default['attach_max_size']) ? 2 : $_editor_system_default['attach_max_size']; // 默认2M
$_editor_size_limit = floatval($_editor_size_limit) * 1000; // K
?>

<!-- 引入编辑器相关的JS文件 -->
<script src="__PUBLIC__/js/editor/kissy-min.js?t=20120401"></script>
<script src="__PUBLIC__/js/editor/uibase-min.js?t=20120401"></script>
<script src="__PUBLIC__/js/editor/dd-min.js?t=20120401"></script>
<script src="__PUBLIC__/js/editor/component-min.js?t=20120401"></script>
<script src="__PUBLIC__/js/editor/overlay-min.js?t=20120401"></script>
<script src="__PUBLIC__/js/editor/editor/editor-all-pkg-min.js?t=20120401"></script>
<script src="__PUBLIC__/js/editor/editor/biz/ext/editor-plugin-pkg-min.js?t=20120401"></script>
<script>
<?php echo "var limitSize = '".$_editor_size_limit."';"; ?>
var _KISSY_ = {};

function loadEditor(textareaId){
	setTimeout("_loadEditor('"+textareaId+"')",100);}
function _loadEditor(textareaId) {
    KISSY.Editor.Config.base = "__PUBLIC__/js/editor/editor/plugins/";
    KISSY.use('editor', function() {
        var KE = KISSY.Editor;
        var EDITER_UPLOAD = "<?php echo U('home/Attach/kissy'); ?>";
        //编辑器内弹窗 z-index 底限，防止互相覆盖
        KE.Config.baseZIndex = 999999;
        var cfg = {
            attachForm:true,
            baseZIndex:10000,
            focus:false,
            pluginConfig: {
                "image":{
                    upload:{
                        serverUrl:EDITER_UPLOAD,
                        surfix:"png,jpg,jpeg,gif,bmp",
                        sizeLimit:limitSize
                    }
                },
                "flash":{
                    defaultWidth:"300",
                    defaultHeight:"300"
                },
                "resize":{
                    direction:["y"]
                }
            }
        };
        _KISSY_[textareaId] = KE("#"+textareaId, cfg);
        _KISSY_[textareaId].use(
            "font,link,image,flash,xiami-music,smiley");
    });
}

function getEditorContent(textareaId)
{
    return _KISSY_[textareaId].getData();
}

function setEditorContent(textareaId,html)
{
    return _KISSY_[textareaId].setData(html);
}

function getEditorWordCount() {
	var count = 0;
	return count;
}
</script>
<link rel="stylesheet" href="../Public/event.css" type="text/css" media="screen" charset="utf-8" />
<script  type="text/javascript" src="__PUBLIC__/js/rcalendar.js" ></script>
<script type="text/javascript" src="../Public/js/event.js"></script>
<script>
//dsy.add();
</script>
<div class="content_holder">
<div class="content no_bg">
  <!-- 内容 begin  -->
<div class=page_tit>
  <!-- page_title begin -->
  <h2><img src="<?php echo ($ts['app']['icon_url']); ?>" /><?php echo ($ts['app']['app_alias']); ?></h2>
  <ul class="tit_tab">
    <li><a href="<?php echo U('event/Index/index');?>" <?php if(in_array((ACTION_NAME),array('index','all_photos','all_albums')) || !in_array((ACTION_NAME),array('all_photos','all_albums'))&&$uid!=$mid)echo 'class="on"'; ?>><?php echo ($ts['app']['app_alias']); ?>首页</a></li>
    <li><a href="<?php echo U('event/Index/personal', array('action'=>'launch'));?>" <?php if(!in_array((ACTION_NAME),array('index','all_photos','all_albums'))&&$uid==$mid)echo 'class="on"'; ?>>我的<?php echo ($ts['app']['app_alias']); ?></a></li>
  </ul>
  <div class="c"></div>
</div>
  <div class="main no_l">
    <!-- 画布 begin  -->
    <div class="mainbox">
		<div class="mainbox_appR">
  <div class="right_box box_create"><a href="<?php echo U('/Index/addEvent');?>" class="btn_event_c"></a></div>
 <!--发起者&关注者-->
    <?php if(ACTION_NAME == 'eventDetail') { ?>
    <div class="right_box">
            <div>
              <h2>发起者</h2>
              <ul class="ListBox">
                <li><span class="headpic50"><a href="<?php echo U('home/space/index',array('uid'=>$uid));?>"  class="tips" rel="<?php echo U('home/space/index',array('uid'=>$uid));?>"><img src="<?php echo (getUserFace($uid)); ?>" /></a></span><?php echo getUserSpace($uid,'fn','','{uname}') ?></li>
              </ul>
              <div class="btm"></div>
            </div>
            <div>
              <h2>关注者</h2>
              <ul class="ListBox">
                <?php if(is_array($attention)): ?><?php $i = 0;?><?php $__LIST__ = $attention?><?php if( count($__LIST__)==0 ) : echo "" ; ?><?php else: ?><?php foreach($__LIST__ as $key=>$vo): ?><?php ++$i;?><?php $mod = ($i % 2 )?><li><span class="headpic50"><a href="<?php echo U('home/space/index',array('uid'=>$vo['uid']));?>"  class="tips" rel="<?php echo U('home/space/index',array('uid'=>$vo['uid']));?>"><img src="<?php echo (getUserFace($vo['uid'])); ?>" /></a></span><a href="<?php echo U('home/space/index',array('uid'=>$vo['uid']));?>"><?php echo (getUserName($vo['uid'])); ?></a></li><?php endforeach; ?><?php endif; ?><?php else: echo "" ;?><?php endif; ?>
                <div class="c"></div>
              </ul>
              <p class="alR"><a href="<?php echo U('//member',array('id'=>$id,'action'=>'att'));?>">所有的人>></a></p>
              <div class="btm"></div>
            </div>
            <!-- <div class="boxR">
		    	<h3>参加这个活动的人也参加了</h3>
		        <?php if(is_array($other)): ?><?php $i = 0;?><?php $__LIST__ = $other?><?php if( count($__LIST__)==0 ) : echo "" ; ?><?php else: ?><?php foreach($__LIST__ as $key=>$vo): ?><?php ++$i;?><?php $mod = ($i % 2 )?><p class="btmlineD">
		            <a href="<?php echo U('//eventDetail',array('id'=>$vo['id'],'uid'=>$vo['uid']));?>"><?php echo ($vo['title']); ?></a> <br />
		            <span class="cGray2"><?php echo ($vo['cTime']); ?> <?php echo ($vo['joinCount']); ?>人参加/<?php echo ($vo['attentionCount']); ?>人关注</span><br />
		            </p><?php endforeach; ?><?php endif; ?><?php else: echo "" ;?><?php endif; ?>
		     </div> -->
          </div>
          <?php } ?>
    <!--发起者&关注者END--> 
  
<!--搜索活动&分类浏览-->
  <div class="right_box">
            <div class="FSort">
              <h2>搜索<?php echo ($ts['app']['app_alias']); ?></h2>
              <div>
                <form action="<?php echo U('//');?>" method="POST" name="subform">
                  <span class="left mr5">
                  <input name="title" type="text" value="<?php echo ($title); ?>" class="text"  style="width:90px;"/>
                  </span>
                  <input type="submit" class="btn_b left" value="搜 索" />
                </form>
              </div>
            </div>
            <div class="FSort">
              <h2>分类浏览群</h2>
              <ul>
                <li
                <?php if( !isset( $_GET['cid'] ) ){echo "class = 'on'";} ?>
                > <a href="<?php echo U('//');?>" >全部</a>
                </li>
                <?php foreach($category as $k=>$cate){ ?>
                <li
                <?php if(($k)  ==  $_GET['cid']): ?>class="on"<?php endif; ?>
                ><a href="<?php echo U('//', array('cid'=>$k));?>"><?php echo ($cate); ?></a>
                </li>
                <?php } ?>
              </ul>
            </div>
          </div>
<!--搜索活动&分类浏览END-->   
           
 <!--推荐活动--> 
  <div class="right_box">
    <h2>推荐<?php echo ($ts['app']['app_alias']); ?></h2>
    <ul class="Recommended">
      <?php if(is_array($is_hot_list)): ?><?php $i = 0;?><?php $__LIST__ = $is_hot_list?><?php if( count($__LIST__)==0 ) : echo "" ; ?><?php else: ?><?php foreach($__LIST__ as $key=>$li): ?><?php ++$i;?><?php $mod = ($i % 2 )?><li>
          <div class="c1"><a href="<?php echo U('//eventDetail',array(uid=>$li['uid'],id=>$li['id']));?>"><img src="<?php echo ($li['coverId']); ?>" /></a></div>
          <div class="c2">
            <dl>
              <dt><strong><a href="<?php echo U('//eventDetail',array(uid=>$li['uid'],id=>$li['id']));?>" class="OverH" title="<?php echo ($li["title"]); ?>" ><?php echo (getShort($li["title"],7,'...')); ?></a></strong></dt> 
              <dd>类型：<?php echo ($li["type"]); ?></dd>
              <dd>地点：<?php echo ($li["address"]); ?></dd>
              <dd>发起者：<a href="<?php echo U('home/Space/index',array(uid=>$li['uid']));?>"><?php echo (getShort(getUserName($li["uid"]),5)); ?></a></dd>
            </dl>
          </div>
        </li><?php endforeach; ?><?php endif; ?><?php else: echo "" ;?><?php endif; ?>
    </ul>
  </div>
  <!--推荐活动END-->
  
</div>
      <div class="mainbox_appC">
        <div class=page_title2>
          <!-- page_title begin -->
          <h2><span class="right fn f12px"><a href="javascript:history.back( -1 )">返回上一页</a></span>发起活动</h2>
        </div>
        <!-- page_title end -->
        <div class="groupBox">
            <div class="box1">
              <form method="post" action="<?php echo U('event/Index/doAddEvent');?>"  enctype="multipart/form-data" onsubmit="return check();">
              <div class="elist">
                <dl class="add_event">
                  <dd>
                    <label><span class="txt_impt">*</span>项目名称：</label>
                    <div class="c2">
                      <input name="title" type="text" class="text" id="title" onfocus="this.className='text2'" onblur="this.className='text'" maxlength="60" />
                    </div>
                    <div class="c"></div>
                  </dd>
                  <dd>
                    <label> <span class="txt_impt">*</span>是否完成：</label>
                    <div class="c2">
			<label for="type2">
                        <input type="radio" id="type2" name="type" value="2" checked="checked" onclick="$('#complete-time').hide();" />未完成
			</label>
			<label for="type1">
                        <input type="radio" id="type1" name="type" value="1" onclick="$('#complete-time').show();" />已完成
			</label>
                    </div>
                    <div class="c"></div>
                  </dd>
		  <div id="complete-time" style="display:none">
                  <dd>
                    <label> <span class="txt_impt">*</span>完成时间：</label>
                    <div class="c2">
                      <input name="sTime" type="text" class="text" id="sTime" onfocus="this.className='text2';rcalendar(this,'full');" onblur="this.className='text'" readonly />
                      -
                      <input name="eTime" type="text" class="text" id="eTime" onfocus="this.className='text2';rcalendar(this,'full');" onblur="this.className='text'" readonly />
                    </div>
                    <div class="c"></div>
                  </dd>
		  </div>
                  <dd>
                    <label><span class="txt_impt">*</span>项目介绍：</label>
                    <div class="c2">
                      <textarea id="explain" name="explain" style="width:100%; height:350px;"></textarea>
                    </div>
                    <div class="c"></div>
                  </dd>
                  <!--
          <li>
            <div class="c1">关联群组：<span class="cRed pr5">*</span></div>
            <div class="c2">
              <select name="select3">
                <option>选择关联群组</option>
              </select><br />
              <span class="cGray2">必须是您自己创建的分，关联后活动话题会同步到该群组。</span></div>
          </li>
          -->
                  <dd>
                    <label><span class="txt_impt"></span>上传论文：</label>
                    <div class="c2">
                      <input name="cover" type="file" />
                    </div>
                    <div class="c"></div>
                  </dd>
                  <!--<li>
                  <div class="c1">将图片上传到：&nbsp;&nbsp;&nbsp;</div> 
               <div class="c2">
            <?php echo W('AlbumList',array( 'uid'=>$mid , 'form_name'=>'albumId' , 'selected'=>intval($_GET['albumId']) ) );?>
            </div>
          </li>-->
                  <dd>
                    <label>&nbsp;</label>
                    <div class="c2">
                      <input name="button" type="submit" class="btn_b" id="button" value="发起活动" />
                    </div>
                    <div class="c"></div>
                  </dd>
                </dl>
              </div>
              </form>
            </div>
          </div>
          <!-- end  -->
        </div>
      </div>
    </div>
  </div>
</div>
  <!-- 画布 end  -->

<!-- 内容 end -->
<?php if(is_array($ts['ad']['footer'])): ?><?php $i = 0;?><?php $__LIST__ = $ts['ad']['footer']?><?php if( count($__LIST__)==0 ) : echo "" ; ?><?php else: ?><?php foreach($__LIST__ as $key=>$vo): ?><?php ++$i;?><?php $mod = ($i % 2 )?><div class="ad_footer"><div class="ke-post"><?php echo ($vo['content']); ?></div></div><?php endforeach; ?><?php endif; ?><?php else: echo "" ;?><?php endif; ?>
<div class="footer_bg">
<div class="footer">
	<div class="menu">
		<?php foreach($ts['footer_document'] as $k => $v) {
            $v['url'] = isset($v['url']) ? $v['url'] : U('home/Public/document',array('id'=>$v['document_id']));
            $ts['footer_document'][$k] = '<a href="'.$v['url'].'" target="_blank">'.$v['title'].'</a>';
        }
        echo implode('&nbsp;&nbsp;|&nbsp;&nbsp', $ts['footer_document']); ?>
	</div>
	<div>
		Powered by <a href="http://www.thinksns.com/" target="_blank" title="ThinkSNS开源微博系统">ThinkSNS</a>&nbsp;&nbsp; <?php echo ($ts['site']['site_icp']); ?> 
		<?php if(isMobile()) { ?>
			<a href="<?php echo U('home/Public/toWap');?>">访问WAP版</a>
		<?php } ?>
	</div>
</div>
</div>
</div>
<?php $ts['cnzz'] = getCnzz(false);
if (!empty($ts['cnzz'])) { ?>
<div style="display:none;">
<script src="http://s87.cnzz.com/stat.php?id=<?php echo ($ts['cnzz']['cnzz_id']); ?>&web_id=<?php echo ($ts['cnzz']['cnzz_id']); ?>" language="JavaScript" charset="gb2312"></script>
</div>
<?php } ?>
<?php echo Addons::hook('public_footer');?>
</body>
</html>
<script>
$(document).ready(function(){
    loadEditor("explain");
});
</script>