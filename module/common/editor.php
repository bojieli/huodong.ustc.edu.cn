<?php
// module/common/editor.php 2011-08-23
// online HTML editor
?>
<input type="button" name="Bold" value="加粗" onclick="editor.document.execCommand('bold',false,null)"  />
<input type="button" name="Italic" value="斜" onclick="editor.document.execCommand('italic',false,null)"  />
<input type="button" name="Underline" value="下划线" onclick="editor.document.execCommand('underline',false,null)"  />
<input type="button" name="justifyLeft" value="居左" onclick="editor.document.execCommand('justifyLeft',false,null)" />
<input type="button" name="justifyCenter" value="居中" onclick="editor.document.execCommand('justifyCenter',false,null)" />
<input type="button" name="justifyRight" value="居右" onclick="editor.document.execCommand('justifyRight',false,null)" />
<input type="button" name="redo" value="重做" onclick="editor.document.execCommand('redo',false,null)" />
<input type="button" name="undo" value="撤消" onclick="editor.document.execCommand('undo',false,null)" />
<input type="button" name="backColor" value="背景色" onclick="editor.document.execCommand('backColor',false,'#FF00FF')" />
<br  />
<input type="button" name="createLink" value="链接" onclick="editor.document.execCommand('createLink',false,'http://www.sunzhiyue.com')" />
<input type="button" name="unlink" value="取消链接" onclick="editor.document.execCommand('unlink',false,null)" />
<input type="button" name="fontSize" value="字体大小" onclick="editor.document.execCommand('fontSize',false,'5')" />
<input type="button" name="foreColor" value="字体颜色" onclick="editor.document.execCommand('foreColor',false,'#00FFFF')" />
<input type="button" name="insertImage" value="图片" onclick="editor.document.execCommand('insertImage',false,'http://www.baidu.com/img/baidu_sylogo1.gif')" />
<br />
<input id="editortype" type="checkbox" onchange="switchEditor()" />HTML代码模式
<iframe id="editor"></iframe>
<br />
<script language="javascript">
function getIframeData() {
	document.getElementById('content').value = editor.document.body.innerHTML;
}
function sendIframeData(){
	editor.document.body.innerHTML = document.getElementById('content').value;
}
function insertHTML(html) {
	var editor = document.getElementById("editor").contentWindow;
	if (editor.document.selection.type.toLowerCase() != "none") {
		editor.document.selection.clear();
	}
	editor.document.selection.createRange().pasteHTML(html);
}
function handleSubmit() {
        if (document.getElementById('editortype').checked == false) {
                getIframeData();
        }
}
function switchEditor() {
	if (document.getElementById('editortype').checked == true) {
		document.getElementById('content').value = editor.document.body.innerHTML;
		document.getElementById('editor').style.display = "none";
		document.getElementById('content').style.display = "block";
	}
	else {
		editor.document.body.innerHTML = document.getElementById('content').value;
		document.getElementById('editor').style.display = "block";
		document.getElementById('content').style.display = "none";
	}
}
var editor = document.getElementById("editor").contentWindow;
editor.document.designMode = "on";
editor.document.contentEditable = true;
editor.document.open();
editor.document.writeln('<html><head><link rel="stylesheet" type="text/css" href="static/common.css" /><style>body{background:#FFF;margin:5px;}</style></head><body></body></html>');
editor.document.close();
</script>
