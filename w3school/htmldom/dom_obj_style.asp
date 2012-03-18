
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="Content-Language" content="zh-cn" />

<meta name="robots" content="all" />
<meta name="description" content="HTML DOM Style 对象的定义、对其属性的简要描述，并提供了指向具体属性的链接。" />

<meta name="author" content="w3school.com.cn" />
<meta name="Copyright" content="Copyright W3school.com.cn All Rights Reserved." />
<meta name="MSSmartTagsPreventParsing" content="true" />
<meta http-equiv="imagetoolbar" content="false" />

<link rel="stylesheet" type="text/css" href="../c3.css" />

<title>HTML DOM Style 对象</title>
</head>

<body class="browserscripting">
<div id="wrapper">

<div id="header">
<a href="../index.html" title="w3school 在线教程" style="float:left;">w3school 在线教程</a>
<div id="ad_head">
<script type="text/javascript"><!--
google_ad_client = "pub-3381531532877742";
/* 728x90, 创建于 08-12-1 */
google_ad_slot = "7423315034";
google_ad_width = 728;
google_ad_height = 90;
//-->
</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
</div>
</div>

<div id="navfirst">
<ul id="menu">
<li id="h"><a href="../h.asp" title="HTML 系列教程">HTML教程</a></li>
<li id="x"><a href="../x.asp" title="XML 系列教程">XML教程</a></li>
<li id="b"><a href="../b.asp" title="浏览器脚本系列教程">浏览器脚本</a></li>
<li id="s"><a href="../s.asp" title="服务器脚本系列教程">服务器脚本</a></li>
<li id="d"><a href="../d.asp" title=".NET (dotnet) 教程">dot net教程</a></li>
<li id="m"><a href="../m.asp" title="多媒体系列教程">多媒体教程</a></li>
<li id="w"><a href="../w.asp" title="网站构建手册">建站手册</a></li>
</ul>
</div><div id="navsecond">

<div id="course">
<h2>HTML DOM</h2>
<ul>
<li><a href="index.asp" title="DOM教程首页">DOM 首页</a></li>
<li><a href="dom_intro.asp" title="DOM简介">DOM 简介</a></li>
<li><a href="dom_nodes.asp" title="HTML DOM 节点">DOM 节点</a></li>
<li><a href="dom_nodetree.asp" title="HTML DOM 节点树">DOM 节点树</a></li>
<li><a href="dom_nodes_access.asp" title="HTML DOM 访问节点">DOM 节点访问</a></li>
<li><a href="dom_nodes_info.asp" title="HTML DOM 节点信息">DOM 节点信息</a></li>
<li><a href="dom_example.asp" title="一个 HTML DOM 实例">DOM How To</a></li>
<li><a href="htmldom_reference.asp" title="">DOM 参考</a></li>
<li><a href="dom_summary.asp" title="">DOM 总结</a></li>
</ul>

<h2>DOM 实例</h2>
<ul>
<li><a href="../example/hdom_examples.asp" title="">DOM 实例</a></li>
</ul>

<h2>Browser 对象</h2>
<ul class="small">
<li><a href="dom_obj_window.asp" title="HTML DOM Window 对象">DOM Window</a></li>
<li><a href="dom_obj_navigator.asp" title="HTML DOM Navigator 对象">DOM Navigator</a></li>
<li><a href="dom_obj_screen.asp" title="HTML DOM Screen 对象">DOM Screen</a></li>
<li><a href="dom_obj_history.asp" title="HTML DOM History 对象">DOM History</a></li>
<li><a href="dom_obj_location.asp" title="HTML DOM Location 对象">DOM Location</a></li>
</ul>

<h2>HTML DOM 对象</h2>
<ul class="small">
<li><a href="dom_obj_document.asp" title="HTML DOM Document 对象">DOM Document</a></li>
<li><a href="dom_obj_anchor.asp" title="HTML DOM Anchor 对象">DOM Anchor</a></li>
<li><a href="dom_obj_area.asp" title="HTML DOM Area 对象">DOM Area</a></li>
<li><a href="dom_obj_base.asp" title="HTML DOM Base 对象">DOM Base</a></li>
<li><a href="dom_obj_body.asp" title="HTML DOM Body 对象">DOM Body</a></li>
<li><a href="dom_obj_pushbutton.asp" title="HTML DOM Button 对象">DOM Button</a></li>
<li><a href="dom_obj_canvas.asp" title="HTML DOM Canvas 对象">DOM Canvas</a></li>
<li><a href="dom_obj_event.asp" title="HTML DOM Event 对象">DOM Event</a></li>
<li><a href="dom_obj_form.asp" title="HTML DOM Form 对象">DOM Form</a></li>
<li><a href="dom_obj_frame.asp" title="HTML DOM Frame 对象">DOM Frame</a></li>
<li><a href="dom_obj_frameset.asp" title="HTML DOM Frameset 对象">DOM Frameset</a></li>
<li><a href="dom_obj_iframe.asp" title="HTML DOM IFrame 对象">DOM IFrame</a></li>
<li><a href="dom_obj_image.asp" title="HTML DOM Image 对象">DOM Image</a></li>
<li><a href="dom_obj_button.asp" title="HTML DOM Button 对象">DOM Input Button</a></li>
<li><a href="dom_obj_checkbox.asp" title="HTML DOM Checkbox 对象">DOM Input Checkbox</a></li>
<li><a href="dom_obj_fileupload.asp" title="HTML DOM FileUpload 对象">DOM Input File</a></li>
<li><a href="dom_obj_hidden.asp" title="HTML DOM Hidden 对象">DOM Input Hidden</a></li>
<li><a href="dom_obj_password.asp" title="HTML DOM Password 对象">DOM Input Password</a></li>
<li><a href="dom_obj_radio.asp" title="HTML DOM Radio 对象">DOM Input Radio</a></li>
<li><a href="dom_obj_reset.asp" title="HTML DOM Reset 对象">DOM Input Reset</a></li>
<li><a href="dom_obj_submit.asp" title="HTML DOM Submit 对象">DOM Input Submit</a></li>
<li><a href="dom_obj_text.asp" title="HTML DOM Text 对象">DOM Input Text</a></li>
<li><a href="dom_obj_link.asp" title="HTML DOM Link 对象">DOM Link</a></li>
<li><a href="dom_obj_meta.asp" title="HTML DOM Meta 对象">DOM Meta</a></li>
<li><a href="dom_obj_object.asp" title="HTML DOM Object 对象">DOM Object</a></li>
<li><a href="dom_obj_option.asp" title="HTML DOM Option 对象">DOM Option</a></li>
<li><a href="dom_obj_select.asp" title="HTML DOM Select 对象">DOM Select</a></li>
<li><a href="dom_obj_style.asp" title="HTML DOM Style 对象">DOM Style</a></li>
<li><a href="dom_obj_table.asp" title="HTML DOM Table 对象">DOM Table</a></li>
<li><a href="dom_obj_tabledata.asp" title="HTML DOM TableCell 对象">DOM TableCell</a></li>
<li><a href="dom_obj_tablerow.asp" title="HTML DOM TableRow 对象">DOM TableRow</a></li>
<li><a href="dom_obj_textarea.asp" title="HTML DOM Textarea 对象">DOM Textarea</a></li>
</ul>
</div>

<div id="selected">
<h2>建站手册</h2>
<ul>
<li><a href="../site/index.asp" title="网站构建">网站构建</a></li>
<li><a href="../w3c/index.asp" title="万维网联盟 (W3C)">万维网联盟 (W3C)</a></li>
<li><a href="../browsers/index.asp" title="浏览器信息">浏览器信息</a></li>
<li><a href="../quality/index.asp" title="网站品质">网站品质</a></li>
<li><a href="../semweb/index.asp" title="语义网">语义网</a></li>
<li><a href="../careers/index.asp" title="职业规划">职业规划</a></li>
<li><a href="../hosting/index.asp" title="网站主机">网站主机</a></li>
</ul>

<h2><a href="../about/index.asp" title="关于 W3School" id="link_about">关于 W3School</a></h2>
<h2><a href="../about/about_helping.asp" title="帮助 W3School" id="link_help">帮助 W3School</a></h2>

</div>

</div>

<div id="maincontent">

<h1>HTML DOM Style 对象</h1>


<div>
<h2>Style 对象</h2>

<p>Style 对象代表一个单独的样式声明。可从应用样式的文档或元素访问 Style 对象。</p>


<h3>使用 Style 对象属性的语法：</h3>
<pre>document.getElementById(&quot;id&quot;).style.property=&quot;值&quot;</pre>
</div>


<div>
<h2>Style 对象的属性：</h2>
<ul>
  <li><a href="dom_obj_style.asp#background">背景</a></li>
  <li><a href="dom_obj_style.asp#border">边框和边距</a></li>
  <li><a href="dom_obj_style.asp#layout">布局</a></li>
  <li><a href="dom_obj_style.asp#list">列表</a></li>
  <li><a href="dom_obj_style.asp#misc">杂项</a></li>
  <li><a href="dom_obj_style.asp#positioning">定位</a></li>
  <li><a href="dom_obj_style.asp#printing">打印</a></li>
  <li><a href="dom_obj_style.asp#scrollbar">滚动条</a></li>
  <li><a href="dom_obj_style.asp#table">表格</a></li>
  <li><a href="dom_obj_style.asp#text">文本</a></li>
  <li><a href="dom_obj_style.asp#std">规范</a></li>
</ul>


<p><em>IE:</em> Internet Explorer, <em>M:</em> 仅适用于 Mac IE, <em>W:</em> 仅适用于 Windows IE, <em>F:</em> Firefox, <em>O:</em> Opera</p>
<p><em>W3C:</em> 万维网联盟 World Wide Web Consortium (Internet 标准).</p>


<h3><a name="background">Background 属性</a></h3>
<table class="dataintable">
  <tr>
    <th style="width:29%">属性</th>
    <th>描述</th>
    <th style="width:7%">IE</th>
    <th style="width:7%">F</th>
    <th style="width:7%">O</th>
    <th style="width:7%">W3C</th>
  </tr>
  <tr>
    <td><a href="prop_style_background.asp">background</a></td>
    <td>在一行中设置所有的背景属性</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_backgroundattachment.asp">backgroundAttachment</a></td>
    <td>设置背景图像是否固定或随页面滚动</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_backgroundcolor.asp">backgroundColor</a></td>
    <td>设置元素的背景颜色</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_backgroundimage.asp">backgroundImage</a></td>
    <td>设置元素的背景图像</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_backgroundposition.asp">backgroundPosition</a></td>
    <td>设置背景图像的起始位置</td>
    <td>4</td>
    <td>No</td>
    <td>No</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_backgroundpositionx.asp">backgroundPositionX</a></td>
    <td>设置backgroundPosition属性的X坐标</td>
    <td>4</td>
    <td>No</td>
    <td>No</td>
    <td>No</td>
  </tr>
  <tr>
    <td><a href="prop_style_backgroundpositiony.asp">backgroundPositionY</a></td>
    <td>设置backgroundPosition属性的Y坐标</td>
    <td>4</td>
    <td>No</td>
    <td>No</td>
    <td>No</td>
  </tr>
  <tr>
    <td><a href="prop_style_backgroundrepeat.asp">backgroundRepeat</a></td>
    <td>设置是否及如何重复背景图像</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
</table>



<h3><a name="border">Border 和 Margin 属性</a></h3>
<table class="dataintable">
  <tr>
    <th style="width:29%">属性</th>
    <th>描述</th>
    <th style="width:7%">IE</th>
    <th style="width:7%">F</th>
    <th style="width:7%">O</th>
    <th style="width:7%">W3C</th>
  </tr>
  <tr>
    <td><a href="prop_style_border.asp">border</a></td>
    <td>在一行设置四个边框的所有属性</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_borderbottom.asp">borderBottom</a></td>
    <td>在一行设置底边框的所有属性</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_borderbottomcolor.asp">borderBottomColor</a></td>
    <td>设置底边框的颜色</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
	<tr>
    <td><a href="prop_style_borderbottomstyle.asp">borderBottomStyle</a></td>
    <td>设置底边框的样式</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
	<tr>
    <td><a href="prop_style_borderbottomwidth.asp">borderBottomWidth</a></td>
    <td>设置底边框的宽度</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
	<tr>
    <td><a href="prop_style_bordercolor.asp">borderColor</a></td>
    <td>设置所有四个边框的颜色 (可设置四种颜色)</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_borderleft.asp">borderLeft</a></td>
    <td>在一行设置左边框的所有属性</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_borderleftcolor.asp">borderLeftColor</a></td>
    <td>设置左边框的颜色</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
	<tr>
    <td><a href="prop_style_borderleftstyle.asp">borderLeftStyle</a></td>
    <td>设置左边框的样式</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
	<tr>
    <td><a href="prop_style_borderleftwidth.asp">borderLeftWidth</a></td>
    <td>设置左边框的宽度</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_borderright.asp">borderRight</a></td>
    <td>在一行设置右边框的所有属性</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_borderrightcolor.asp">borderRightColor</a></td>
    <td>设置右边框的颜色</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
	<tr>
    <td><a href="prop_style_borderrightstyle.asp">borderRightStyle</a></td>
    <td>设置右边框的样式</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
	<tr>
    <td><a href="prop_style_borderrightwidth.asp">borderRightWidth</a></td>
    <td>设置右边框的宽度</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
	<tr>
    <td><a href="prop_style_borderstyle.asp">borderStyle</a></td>
    <td>设置所有四个边框的样式 (可设置四种样式)</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_bordertop.asp">borderTop</a></td>
    <td>在一行设置顶边框的所有属性</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_bordertopcolor.asp">borderTopColor</a></td>
    <td>设置顶边框的颜色</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_bordertopstyle.asp">borderTopStyle</a></td>
    <td>设置顶边框的样式</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
	<tr>
    <td><a href="prop_style_bordertopwidth.asp">borderTopWidth</a></td>
    <td>设置顶边框的宽度</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_borderwidth.asp">borderWidth</a></td>
    <td>设置所有四条边框的宽度 (可设置四种宽度)</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_margin.asp">margin</a></td>
    <td>设置元素的边距 (可设置四个值)</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_marginbottom.asp">marginBottom</a></td>
    <td>设置元素的底边距</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_marginleft.asp">marginLeft</a></td>
    <td>设置元素的左边距</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_marginright.asp">marginRight</a></td>
    <td>设置元素的右边据</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_margintop.asp">marginTop</a></td>
    <td>设置元素的顶边距</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_outline.asp">outline</a></td>
    <td>在一行设置所有的outline属性</td>
    <td>5M</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_outlinecolor.asp">outlineColor</a></td>
    <td>设置围绕元素的轮廓颜色</td>
    <td>5M</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_outlinestyle.asp">outlineStyle</a></td>
    <td>设置围绕元素的轮廓样式</td>
    <td>5M</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_outlinewidth.asp">outlineWidth</a></td>
    <td>设置围绕元素的轮廓宽度</td>
    <td>5M</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_padding.asp">padding</a></td>
    <td>设置元素的填充 (可设置四个值)</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_paddingbottom.asp">paddingBottom</a></td>
    <td>设置元素的下填充</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_paddingleft.asp">paddingLeft</a></td>
    <td>设置元素的左填充</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_paddingright.asp">paddingRight</a></td>
    <td>设置元素的右填充</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_paddingtop.asp">paddingTop</a></td>
    <td>设置元素的顶填充</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
</table>



<h3><a name="layout">Layout 属性</a></h3>
<table class="dataintable">
  <tr>
    <th style="width:29%">属性</th>
    <th>描述</th>
    <th style="width:7%">IE</th>
    <th style="width:7%">F</th>
    <th style="width:7%">O</th>
    <th style="width:7%">W3C</th>
  </tr>
  <tr>
    <td><a href="prop_style_clear.asp">clear</a></td>
    <td>设置在元素的哪边不允许其他的浮动元素</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_clip.asp">clip</a></td>
    <td>设置元素的形状</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_content.asp">content</a></td>
    <td>设置元信息</td>
    <td>5M</td>
    <td>1</td>
    <td>&nbsp;</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td>counterIncrement</td>
    <td>设置其后是正数的计数器名称的列表。其中整数指示每当元素出现时计数器的增量。默认是1。</td>
    <td>5M</td>
    <td>1</td>
    <td>&nbsp;</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td>counterReset</td>
    <td>设置其后是正数的计数器名称的列表。其中整数指示每当元素出现时计数器被设置的值。默认是0。</td>
    <td>5M</td>
    <td>1</td>
    <td>&nbsp;</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_cssfloat.asp">cssFloat</a></td>
    <td>设置图像或文本将出现（浮动）在另一元素中的何处。</td>
    <td>5M</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_cursor.asp">cursor</a></td>
    <td>设置显示的指针类型</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_direction.asp">direction</a></td>
    <td>设置元素的文本方向</td>
    <td>5</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_display.asp">display</a></td>
    <td>设置元素如何被显示</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_height.asp">height</a></td>
    <td>设置元素的高度</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td>markerOffset</td>
    <td>设置marker box的principal box距离其最近的边框边缘的距离</td>
    <td>5M</td>
    <td>1</td>
    <td>&nbsp;</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td>marks</td>
    <td>设置是否cross marks或crop marks应仅仅被呈现于page box边缘之外</td>
    <td>5M</td>
    <td>1</td>
    <td>&nbsp;</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_maxheight.asp">maxHeight</a></td>
    <td>设置元素的最大高度</td>
    <td>5M</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_maxwidth.asp">maxWidth</a></td>
    <td>设置元素的最大宽度</td>
    <td>5M</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_minheight.asp">minHeight</a></td>
    <td>设置元素的最小高度</td>
    <td>5M</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_minwidth.asp">minWidth</a></td>
    <td>设置元素的最小宽度</td>
    <td>5M</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_overflow.asp">overflow</a></td>
    <td>规定如何处理不适合元素盒的内容</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_verticalalign.asp">verticalAlign</a></td>
    <td>设置对元素中的内容进行垂直排列</td>
    <td>4</td>
    <td>1</td>
    <td>No</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_visibility.asp">visibility</a></td>
    <td>设置元素是否可见</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_width.asp">width</a></td>
    <td>设置元素的宽度</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  </table>



<h3><a name="list">List 属性</a></h3>
<table class="dataintable">
  <tr>
    <th style="width:29%">属性</th>
    <th>描述</th>
    <th style="width:7%">IE</th>
    <th style="width:7%">F</th>
    <th style="width:7%">O</th>
    <th style="width:7%">W3C</th>
  </tr>
  <tr>
    <td><a href="prop_style_liststyle.asp">listStyle</a></td>
    <td>在一行设置列表的所有属性</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_liststyleimage.asp">listStyleImage</a></td>
    <td>把图像设置为列表项标记</td>
    <td>4</td>
    <td>1</td>
    <td>No</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_liststyleposition.asp">listStylePosition</a></td>
    <td>改变列表项标记的位置</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_liststyletype.asp">listStyleType</a></td>
    <td>设置列表项标记的类型</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  </table>



<h3><a name="positioning">Positioning 属性</a></h3>
<table class="dataintable">
  <tr>
    <th style="width:29%">属性</th>
    <th>描述</th>
    <th style="width:7%">IE</th>
    <th style="width:7%">F</th>
    <th style="width:7%">O</th>
    <th style="width:7%">W3C</th>
  </tr>
  <tr>
    <td><a href="prop_style_bottom.asp">bottom</a></td>
    <td>设置元素的底边缘距离父元素底边缘的之上或之下的距离</td>
    <td>5</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_left.asp">left</a></td>
    <td>置元素的左边缘距离父元素左边缘的左边或右边的距离</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_position.asp">position</a></td>
    <td>把元素放置在static, relative, absolute 或 fixed 的位置</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_right.asp">right</a></td>
    <td>置元素的右边缘距离父元素右边缘的左边或右边的距离</td>
    <td>5</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_top.asp">top</a></td>
    <td>设置元素的顶边缘距离父元素顶边缘的之上或之下的距离</td>

    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_zindex.asp">zIndex</a></td>
    <td>设置元素的堆叠次序</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
</table>



<h3><a name="printing">Printing 属性</a></h3>
<table class="dataintable">
  <tr>
    <th style="width:29%">属性</th>
    <th>描述</th>
    <th style="width:7%">IE</th>
    <th style="width:7%">F</th>
    <th style="width:7%">O</th>
    <th style="width:7%">W3C</th>
  </tr>
  <tr>
    <td>orphans</td>
    <td>设置段落留到页面底部的最小行数</td>
    <td>5M</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td>page</td>
    <td>设置显示某元素时使用的页面类型</td>
    <td>5M</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_pagebreakafter.asp">pageBreakAfter</a></td>
    <td>设置某元素之后的分页行为</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_pagebreakbefore.asp">pageBreakBefore</a></td>
    <td>设置某元素之前的分页行为</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_pagebreakinside.asp">pageBreakInside</a></td>
    <td>设置某元素内部的分页行为</td>
    <td>5M</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td>size</td>
    <td>设置页面的方向和尺寸</td>
    <td>&nbsp;</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td>widows</td>
    <td>设置段落必须留到页面顶部的最小行数</td>
    <td>5M</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  </table>



<h3><a name="scrollbar">Scrollbar 属性</a> (IE-only)</h3>
<table class="dataintable">
  <tr>
    <th style="width:29%">属性</th>
    <th>描述</th>
    <th style="width:7%">IE</th>
    <th style="width:7%">F</th>
    <th style="width:7%">O</th>
    <th style="width:7%">W3C</th>
  </tr>
  <tr>
    <td><a href="prop_style_scrollbar3dlightcolor.asp">scrollbar3dLightColor</a></td>
    <td>设置箭头和滚动条左侧和顶边的颜色</td>
    <td>5W</td>
    <td>No</td>
    <td>No</td>
    <td>No</td>
  </tr>
  <tr>
    <td><a href="prop_style_scrollbararrowcolor.asp">scrollbarArrowColor</a></td>
    <td>设置滚动条上的箭头颜色</td>
    <td>5W</td>
    <td>No</td>
    <td>No</td>
    <td>No</td>
  </tr>
  <tr>
    <td><a href="prop_style_scrollbarbasecolor.asp">scrollbarBaseColor</a></td>
    <td>设置滚动条的底色</td>
    <td>5W</td>
    <td>No</td>
    <td>No</td>
    <td>No</td>
  </tr>
  <tr>
    <td><a href="prop_style_scrollbardarkshadowcolor.asp">scrollbarDarkShadowColor</a></td>
    <td>设置箭头和滚动条右侧和底边的颜色</td>
    <td>5W</td>
    <td>No</td>
    <td>No</td>
    <td>No</td>
  </tr>
  <tr>
    <td><a href="prop_style_scrollbarfacecolor.asp">scrollbarFaceColor</a></td>
    <td>设置滚动条的表色</td>
    <td>5W</td>
    <td>No</td>
    <td>No</td>
    <td>No</td>
  </tr>
  <tr>
    <td><a href="prop_style_scrollbarhighlightcolor.asp">scrollbarHighlightColor</a></td>
    <td>设置箭头和滚动条左侧和顶边的颜色，以及滚动条的背景</td>
    <td>5W</td>
    <td>No</td>
    <td>No</td>
    <td>No</td>
  </tr>
  <tr>
    <td><a href="prop_style_scrollbarshadowcolor.asp">scrollbarShadowColor</a></td>
    <td>设置箭头和滚动条右侧和底边的颜色</td>
    <td>5W</td>
    <td>No</td>
    <td>No</td>
    <td>No</td>
  </tr>
  <tr>
    <td><a href="prop_style_scrollbartrackcolor.asp">scrollbarTrackColor</a></td>
    <td>设置滚动条的背景色</td>
    <td>5W</td>
    <td>No</td>
    <td>No</td>
    <td>No</td>
  </tr>
  </table>



<h3><a name="table">Table 属性</a></h3>
<table class="dataintable">
  <tr>
    <th style="width:29%">属性</th>
    <th>描述</th>
    <th style="width:7%">IE</th>
    <th style="width:7%">F</th>
    <th style="width:7%">O</th>
    <th style="width:7%">W3C</th>
  </tr>
  <tr>
    <td><a href="prop_style_bordercollapse.asp">borderCollapse</a></td>
    <td>设置表格边框是否合并为单边框，或者像在标准的HTML中那样分离。</td>
    <td>5</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_borderspacing.asp">borderSpacing</a></td>
    <td>设置分隔单元格边框的距离</td>
    <td>5M</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_captionside.asp">captionSide</a></td>
    <td>设置表格标题的位置</td>
    <td>5M</td>
    <td>No</td>
    <td>No</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_emptycells.asp">emptyCells</a></td>
    <td>设置是否显示表格中的空单元格</td>
    <td>5M</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_tablelayout.asp">tableLayout</a></td>
    <td>设置用来显示表格单元格、行以及列的算法</td>
    <td>5</td>
    <td>No</td>
    <td>No</td>
    <td>Yes</td>
  </tr>
</table>



<h3><a name="text">Text 属性</a></h3>
<table class="dataintable">
  <tr>
    <th style="width:29%">属性</th>
    <th>描述</th>
    <th style="width:7%">IE</th>
    <th style="width:7%">F</th>
    <th style="width:7%">O</th>
    <th style="width:7%">W3C</th>
  </tr>
  <tr>
    <td><a href="prop_style_color.asp">color</a></td>
    <td>设置文本的颜色</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_font.asp">font</a></td>
    <td>在一行设置所有的字体属性</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_fontfamily.asp">fontFamily</a></td>
    <td>设置元素的字体系列。</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_fontsize.asp">fontSize</a></td>
    <td>设置元素的字体大小。</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_fontsizeadjust.asp">fontSizeAdjust</a></td>
    <td>设置/调整文本的尺寸</td>
    <td>5M</td>
    <td>1</td>
    <td>No</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_fontstretch.asp">fontStretch</a></td>
    <td>设置如何紧缩或伸展字体</td>
    <td>5M</td>
    <td>No</td>
    <td>No</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_fontstyle.asp">fontStyle</a></td>
    <td>设置元素的字体样式</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_fontvariant.asp">fontVariant</a></td>
    <td>用小型大写字母字体来显示文本</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_fontweight.asp">fontWeight</a></td>
    <td>设置字体的粗细</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_letterspacing.asp">letterSpacing</a></td>
    <td>设置字符间距</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_lineheight.asp">lineHeight</a></td>
    <td>设置行间距</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_quotes.asp">quotes</a></td>
    <td>设置在文本中使用哪种引号</td>
    <td>5M</td>
    <td>1</td>
    <td>&nbsp;</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_textalign.asp">textAlign</a></td>
    <td>排列文本</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_textdecoration.asp">textDecoration</a></td>
    <td>设置文本的修饰</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_textindent.asp">textIndent</a></td>
    <td>缩紧首行的文本</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td>textShadow</td>
    <td>设置文本的阴影效果</td>
    <td>5M</td>
    <td>1</td>
    <td>&nbsp;</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_texttransform.asp">textTransform</a></td>
    <td>对文本设置大写效果</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td>unicodeBidi</td>
    <td>&nbsp;</td>
    <td>5</td>
    <td>1</td>
    <td>&nbsp;</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_whitespace.asp">whiteSpace</a></td>
    <td>设置如何设置文本中的折行和空白符</td>
    <td>4</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_style_wordspacing.asp">wordSpacing</a></td>
    <td>设置文本中的词间距</td>
    <td>6</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  </table>



<h3><a name="std">标准属性</a></h3>
<table class="dataintable">
  <tr>
    <th style="width:29%">属性</th>
    <th>描述</th>
    <th style="width:7%">IE</th>
    <th style="width:7%">F</th>
    <th style="width:7%">O</th>
    <th style="width:7%">W3C</th>
  </tr>
  <tr>
    <td><a href="prop_dir.asp">dir</a></td>
    <td>设置或返回文本的方向</td>
    <td>5</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_lang.asp">lang</a></td>
    <td>设置或返回元素的语言代码</td>
    <td>5</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td><a href="prop_title.asp">title</a></td>
    <td>设置或返回元素的咨询性的标题</td>
    <td>5</td>
    <td>1</td>
    <td>9</td>
    <td>Yes</td>
  </tr>
</table>


<h3>cssText 属性</h3>

<p>它是一组样式属性及其值的文本表示。这个文本格式化为一个 CSS 样式表，去掉了包围属性和值的元素选择器的花括号。</p>

<p>将这一属性设置为非法的值将会抛出一个代码为 SYNTAX_ERR 的 <a href="../xmldom/dom_domexception.asp" title="XML DOM - DOMException 对象">DOMException 异常</a>。当 CSS2Properties 对象是只读的时候，试图设置这一属性将会抛出一个代码为 NO_MODIFICATION_ALLOWED_ERR 的 <a href="../xmldom/dom_domexception.asp" title="XML DOM - DOMException 对象">DOMException 异常</a>。</p>
</div>

<div>
<h2>关于 CSS2Properties 对象</h2>

<p>CSS2Properties 对象表示一组 CSS 样式属性及其值。它为 CSS 规范定义的每一个 CSS 属性都定义一个 JavaScript 属性。</p>

<p>一个 HTMLElement 的 style 属性是一个可读可写的 CSS2Properties 对象，就好像 CSSRule 对象的 style 属性一样。不过，Window.getComputedStyle() 的返回值是一个 CSS2Properties 对象，其属性是只读的。</p>
</div>


<div>
<h2>相关页面</h2>
<p>XML DOM 参考手册：<a href="../xmldom/dom_css2properties.asp" title="XML DOM CSS2Properties 对象">CSS2Properties 对象</a></p>
<p>参考手册：<a href="../css/css_reference.asp">CSS 参考手册</a></p>
</div>

</div>

<div id="sidebar">

<div id="searchui">
<form method="get" id="searchform" action="http://www.google.com.hk/search">
<p><label for="searched_content">Search:</label></p>
<p><input type="hidden" name="sitesearch" value="w3school.com.cn" /></p>
<p>
<input type="text" name="as_q" class="box"  id="searched_content" title="在此输入搜索内容。" />
<input type="submit" value="Go" class="button" title="搜索！" />
</p>
</form>
</div>

<div id="tools">
<h5 id="tools_reference"><a href="htmldom_reference.asp">HTML DOM 参考手册</a></h5>
<h5 id="tools_example"><a href="../example/hdom_examples.asp">HTML DOM 实例</a></h5>
</div>

<div id="ad">
<h2>赞助商链接</h2>
<script type="text/javascript"><!--
google_ad_client = "pub-3381531532877742";
/* 120x600, sidebar_big */
google_ad_slot = "9995842720";
google_ad_width = 120;
google_ad_height = 600;
//-->
</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
</div>

</div><div id="footer">
<p>W3School提供的内容仅用于培训。我们不保证内容的正确性。通过使用本站内容随之而来的风险与本站无关。当使用本站时，代表您已接受了本站的<a href="../about/about_use.asp" title="关于使用">使用条款</a>和<a href="../about/about_privacy.asp" title="关于隐私">隐私条款</a>。</p>
<p>版权所有，保留一切权利。未经书面许可，不得转载。W3School 简体中文版的所有内容仅供测试，对任何法律问题及风险不承担任何责任。<a href="http://www.yktz.net/" title="上海赢科投资有限公司">上海赢科投资公司</a>。</p>
</div>

</div>
</body>
</html>