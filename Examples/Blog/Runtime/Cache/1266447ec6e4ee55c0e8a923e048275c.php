<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>Blog By ThinkPHP <?php echo (THINK_VERSION); ?></title><link href="../Public/css/style.css" rel="stylesheet" type="text/css" /><script language="javascript" src="../Public/js/common.js" /></script><script type="text/javascript" src="__PUBLIC__/Js/Base.js"></script><script type="text/javascript" src="__PUBLIC__/Js/prototype.js"></script><script type="text/javascript" src="__PUBLIC__/Js/mootools.js"></script><script type="text/javascript" src="__PUBLIC__/Js/Ajax/ThinkAjax.js"></script><script type="text/javascript" src="__PUBLIC__/Js/UbbEditor.js"></script><script type="text/javascript" src="__PUBLIC__/Js/Form/CheckForm.js"></script><script language="JavaScript"><!--
            //指定当前组模块URL地址
            var URL = '__URL__';
            var APP	 =	 '__APP__';
            var PUBLIC = '__PUBLIC__';
            ThinkAjax.updateTip = '<IMG SRC="../Public/images/loading2.gif" WIDTH="16" HEIGHT="16" BORDER="0" ALT="loading..." align="absmiddle"> 数据处理中...';
            //--></script></head><body><div id="header"><div id="innerHeader"><div id="blogLogo"></div><div class="blog-header"><div class="blog-desc">ThinkPHP  [ Blog示例程序]</div></div><div id="menu"><ul><li><a href="__APP__">日志首页</a></li><li><a href="__APP__/Blog/add">撰写日志</a></li><li><a href="http://thinkphp.cn">官方网站</a></li></ul></div></div></div><!-- 编辑器调用开始 --><script src="__PUBLIC__/Js/thinkeditor/jquery-1.6.2.min.js"></script><script src="__PUBLIC__/Js/thinkeditor/ThinkEditor.js"></script><script>var _APP = "__APP__";
jQuery.noConflict();
(function($) { 
    $(function(){
        var app_len=_APP.lastIndexOf("/index.php")
        if(app_len!= -1){
            _APP = _APP.substr(0,app_len);
        }
        $("#textContent").ThinkEditor({"width":"600px","uploadURL":"/Examples/Blog/Public/editor_up"
        });
    });
})(jQuery);

</script><!-- 编辑器调用结束 --><div id="mainWrapper"><div id="content" class="content"><div id="innerContent"><script language="JavaScript"><!--
                function addRow(){
                    curFileNum++;
                    rowsnum++;
                    var row=tbl.insertRow(-1);
                    //var td = arow.insertCell();
                    var cell = document.createElement("td");
                    cell.innerHTML='<div class="impBtn  fLeft" ><input type="file" id="file'+curFileNum+'" name="file'+ curFileNum +'" class="file  huge"></div><div class="fLeft hMargin"><img src="../Public/images/del.gif"  style="cursor:pointer" onfocus="javascript:getObject(this)" onclick="deleteRow();" width="20" height="20" border="0" alt="删除" align="absmiddle"></div> ';
                    cell.align="center"
                    row.appendChild(cell);
                    //addFileForm.num.value=rowsnum;
                }
                function deleteRow(){
                    if(tbl.rows.length>0){
                        tbl.deleteRow(rindex); //删除当前行
                        rowsnum--;
                    }else{
                        return;
                    }
                    rindex="";
                }
                function getObject(obj){
                    rindex=obj.parentElement.parentElement.rowIndex;/*当前行对象*/
                }
                function selectCategory(){
                    var result= PopModalWindow('__APP__/Category/treeSelect/',268,360);
                    if(typeof(result) == "undefined") return;
                    $('categoryName').value=result[0][0];
                    $('categoryId').value=result[0][1];
                }
                function uploading(msg){
                    $('result').style.display = 'block';
                    $('result').innerHTML	=	'<img src="../Public/images/ajaxloading.gif" width="16" height="16" border="0" alt="" align="absmiddle"> 文件上传中～';
                    return true;
                }
                function save(){
                    if ($('file1').value){
                        uploading();
                        $('upload').submit();
                    }
                    //document.getElementById('editor').value = KE.html('editor');
                    ThinkAjax.sendForm('form1','__URL__/update/',doComplete,'result');

                }
                function uploadComplete(){
                    $('upload').reset();
                }
                function doComplete(data,status){

                }
                function delAttachComplete(data,status){
                    if (status==1){
                        $('attach_'+data).style.display = 'none';
                    }
                }
                //--></script><div class="commentbox"><table cellpadding=3 cellspacing=3 width="680px"><tr><td colspan="2"><div class="block-title"><h5><img src="../Public/images/modify.gif" width="20" height="23" border="0" alt="" align="absmiddle"> 编辑日志</h5></div></td></tr><tr><td colspan="2"><form method=post id="form1" ><table cellpadding=3 cellspacing=3 width="100%" style="font-size:14px"><tr><td colspan="2"><div id="result" class="result none"></div></td></tr><tr><td class="tRight tTop" width="125px">标题：</td><td class="tLeft"><input type="text" class="huge text" check='Require' warning="标题不能为空" name="title" value="<?php echo ($vo["title"]); ?>"></td></tr><tr><td class="tRight" >分类：</td><td class="tLeft" ><input type="text" class="medium readonly text"  readonly name="categoryName" value="<?php echo (getcategoryname($vo["categoryId"])); ?>"><input type="hidden" class="medium bLeft" name="categoryId"  value="<?php echo ($vo["categoryId"]); ?>"></td></tr><tr><td class="tRight tTop" >日志：</td><td class="tLeft"><textarea name="content" id="textContent" cols="45" rows="5"><?php echo ($vo["content"]); ?></textarea></td></tr><tr><td class="tRight">标签：</td><td class="tLeft"><input type="text" class="huge text"   name="tags" value="<?php echo ($vo["tags"]); ?>"><span style="color:gray">用空格隔开多个标签</span></td></tr><tr><td ></td><td class="center"><div style="width:85%;color:gray"><input type="hidden" name="ajax" value="1"><input type="hidden" name="id" value="<?php echo ($vo["id"]); ?>"><div class="fLeft hMargin"><img id="verifyImg" src="__URL__/verify" align="absmiddle"><input type="text" name="verify" class="text small"> 输入验证码 [ <a href="javascript:fleshVerify()">看不清？</a> ] </div><div class="fLeft hMargin"><input type="reset" class="submit small"  value="重 置" ></div><div class="fLeft hMargin"><input type="button" id="submit" value="保存日志" onclick="save()" class="submit small"></div></div></td></tr></table></form><table cellpadding=3 cellspacing=3 width="100%" style="font-size:14px"><tr><td ></td><td><fieldset  style="float:left;width:75%"><legend >附件列表</legend><div><?php if(is_array($attachs)): $i = 0; $__LIST__ = $attachs;if( count($__LIST__)==0 ) : echo "还没有上传任何附件" ;else: foreach($__LIST__ as $key=>$attach): $mod = ($i % 2 );++$i;?><div id="attach_<?php echo ($attach["id"]); ?>"><img src="../Public/images/file.gif" width="19" height="20" border="0" style="border:none" alt="" align="absmiddle"><a href="__URL__/download/id/<?php echo ($attach["id"]); ?>"><?php echo ($attach["name"]); ?></a><?php echo (byte_format($attach["size"])); ?><img src="../Public/images/del.gif" width="20" height="20" onclick="ThinkAjax.send('__URL__/delAttach/id/<?php echo ($attach["id"]); ?>','ajax=1',delAttachComplete,'result')" border="0" alt="删除附件"  style="cursor:hand" align="absmiddle"></div><?php endforeach; endif; else: echo "还没有上传任何附件" ;endif; ?></div></fieldset></td></tr><tr><td class="tRight tTop">附件：</td><td class="tLeft tTop"><form id="upload" method="POST" action="__URL__/upload/" onsubmit="return CheckForm(this);" enctype="multipart/form-data" target="iframeUpload"><input type="hidden" name="ajax" value="1" /><input type="hidden" name="_uploadFileResult" value="result" /><input type="hidden" name="_uploadFormId" value="upload" /><input type="hidden" name="_uploadFileSize" value="-1" /><input type="hidden" name="_uploadResponse" value="uploadComplete" /><input type="hidden" name="_uploadRecordId" value="<?php echo ($vo["id"]); ?>" /><input type="hidden" name="_uploadFileType" value="jpeg,jpg,gif,png,doc,rar,zip,mp3,wav,flv,rm,asf" /><input type="hidden" name="_uploadSavePath" value="<?php echo APP_PATH.'/../'.'Public/Uploads/';?>" /><input type="button" value="增 加" onclick="addRow();" class="submit small" /><input type="submit" value="上 传" onclick="uploading();" class="small submit" /><table id='tbl' style="clear:both"></table></form></td></tr></table></td></tr></table><iframe name="iframeUpload" src="" width="350" height="35" frameborder=0  scrolling="no" style="display:none"></iframe></div></div><script type="text/javascript"><!--
            var curFileNum = 0;
            var rowsnum=0;  //记录行数
            var rindex="";       //列索引
            var tbl	=	$('tbl');
            addRow();
            //--></script><!-- 版权信息区域 --><div id="footer" class="footer" ><div id="innerFooter">Powered by ThinkPHP <?php echo (THINK_VERSION); ?> | Template designed by <a target="_blank" href="http://www.topthink.com.cn">TopThink</a></div></div></body></html>