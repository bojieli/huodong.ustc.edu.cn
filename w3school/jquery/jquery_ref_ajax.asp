
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="Content-Language" content="zh-cn" />

<meta name="robots" content="all" />

<meta name="author" content="w3school.com.cn" />
<meta name="Copyright" content="Copyright W3school.com.cn All Rights Reserved." />
<meta name="MSSmartTagsPreventParsing" content="true" />
<meta http-equiv="imagetoolbar" content="false" />

<link rel="stylesheet" type="text/css" href="../c3.css" />

<title>jQuery 参考手册 - Ajax</title>
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
<h2>jQuery 教程</h2>
<ul>
<li><a href="index.asp" title="jQuery 教程">jQuery 教程</a></li>
<li><a href="jquery_intro.asp" title="jQuery 简介">jQuery 简介</a></li>
<li><a href="jquery_syntax.asp" title="jQuery 语法">jQuery 语法</a></li>
<li><a href="jquery_selectors.asp" title="jQuery 选择器">jQuery 选择器</a></li>
<li><a href="jquery_events.asp" title="jQuery 事件">jQuery 事件</a></li>
<li><a href="jquery_effects.asp" title="jQuery 效果">jQuery 效果</a></li>
<li><a href="jquery_callback.asp" title="jQuery Callback">jQuery Callback</a></li>
<li><a href="jquery_html.asp" title="jQuery HTML">jQuery HTML</a></li>
<li><a href="jquery_css.asp" title="jQuery CSS">jQuery CSS</a></li>
<li><a href="jquery_ajax.asp" title="jQuery AJAX 函数">jQuery AJAX</a></li>
<li><a href="jquery_examples.asp" title="jQuery 实例">jQuery 实例</a></li>
</ul>

<h2>jQuery 参考手册</h2>
<ul>
<li><a href="jquery_reference.asp" title="jQuery 参考手册">jQuery 参考手册</a></li>
<li><a href="jquery_ref_selectors.asp" title="jQuery 参考手册 - 选择器">jQuery 选择器</a></li>
<li><a href="jquery_ref_events.asp" title="jQuery 参考手册 - 事件">jQuery 事件</a></li>
<li><a href="jquery_ref_effects.asp" title="jQuery 参考手册 - 效果">jQuery 效果</a></li>
<li><a href="jquery_ref_manipulation.asp" title="jQuery 参考手册 - 文档操作">jQuery 文档操作</a></li>
<li><a href="jquery_ref_attributes.asp" title="jQuery 参考手册 - 属性">jQuery 属性</a></li>
<li><a href="jquery_ref_css.asp" title="jQuery 参考手册 - CSS">jQuery CSS</a></li>
<li><a href="jquery_ref_ajax.asp" title="jQuery Ajax 参考手册">jQuery Ajax</a></li>
<li><a href="jquery_ref_traversing.asp" title="jQuery 遍历 参考手册">jQuery 遍历</a></li>
<li><a href="jquery_ref_data.asp" title="jQuery 参考手册 - 数据">jQuery 数据</a></li>
<li><a href="jquery_ref_dom_element_methods.asp" title="jQuery 参考手册 - DOM 元素方法">jQuery DOM 元素</a></li>
<li><a href="jquery_ref_core.asp" title="jQuery 参考手册 - 核心">jQuery 核心</a></li>
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

<h1>jQuery 参考手册 - Ajax</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="jquery_ref_css.asp">Previous Page</a></li>

<li class="next"><a href="jquery_ref_traversing.asp">Next Page</a></li>
</ul>

</div>


<div>
<h2>jQuery Ajax 操作函数</h2>

<p>jQuery 库拥有完整的 Ajax 兼容套件。其中的函数和方法允许我们在不刷新浏览器的情况下从服务器加载数据。</p>

<table class="dataintable">
<tr>
<th>函数</th>
<th>描述</th>
</tr>

<tr>
<td><a href="ajax_ajax.asp" title="jQuery ajax - ajax() 方法">jQuery.ajax()</a></td>
<td>执行异步 HTTP (Ajax) 请求。</td>
</tr>

<tr>
<td><a href="ajax_ajaxcomplete.asp" title="jQuery ajax - ajaxComplete() 方法">.ajaxComplete()</a></td>
<td>当 Ajax 请求完成时注册要调用的处理程序。这是一个 Ajax 事件。</td>
</tr>

<tr>
<td><a href="ajax_ajaxerror.asp" title="jQuery ajax - ajaxError() 方法">.ajaxError()</a></td>
<td>当 Ajax 请求完成且出现错误时注册要调用的处理程序。这是一个 Ajax 事件。</td>
</tr>

<tr>
<td><a href="ajax_ajaxsend.asp" title="jQuery ajax - ajaxSend() 方法">.ajaxSend()</a></td>
<td>在 Ajax 请求发送之前显示一条消息。</td>
</tr>

<tr>
<td><a href="ajax_ajaxsetup.asp" title="jQuery ajax - ajaxSetup() 方法">jQuery.ajaxSetup()</a></td>
<td>设置将来的 Ajax 请求的默认值。</td>
</tr>

<tr>
<td><a href="ajax_ajaxstart.asp" title="jQuery ajax - ajaxStart() 方法">.ajaxStart()</a></td>
<td>当首个 Ajax 请求完成开始时注册要调用的处理程序。这是一个 Ajax 事件。</td>
</tr>

<tr>
<td><a href="ajax_ajaxstop.asp" title="jQuery ajax - ajaxStop() 方法">.ajaxStop()</a></td>
<td>当所有 Ajax 请求完成时注册要调用的处理程序。这是一个 Ajax 事件。</td>
</tr>

<tr>
<td><a href="ajax_ajaxsuccess.asp" title="jQuery ajax - ajaxSuccess() 方法">.ajaxSuccess()</a></td>
<td>当 Ajax 请求成功完成时显示一条消息。</td>
</tr>

<tr>
<td><a href="ajax_get.asp" title="jQuery ajax - get() 方法">jQuery.get()</a></td>
<td>使用 HTTP GET 请求从服务器加载数据。</td>
</tr>

<tr>
<td><a href="ajax_getjson.asp" title="jQuery ajax - getJSON() 方法">jQuery.getJSON()</a></td>
<td>使用 HTTP GET 请求从服务器加载 JSON 编码数据。</td>
</tr>

<tr>
<td><a href="ajax_getscript.asp" title="jQuery ajax - getScript() 方法">jQuery.getScript()</a></td>
<td>使用 HTTP GET 请求从服务器加载 JavaScript 文件，然后执行该文件。</td>
</tr>

<tr>
<td><a href="ajax_load.asp" title="jQuery ajax - load() 方法">.load()</a></td>
<td>从服务器加载数据，然后把返回到 HTML 放入匹配元素。</td>
</tr>

<tr>
<td><a href="ajax_param.asp" title="jQuery ajax - param() 方法">jQuery.param()</a></td>
<td>创建数组或对象的序列化表示，适合在 URL 查询字符串或 Ajax 请求中使用。</td>
</tr>

<tr>
<td><a href="ajax_post.asp" title="jQuery ajax - post() 方法">jQuery.post()</a></td>
<td>使用 HTTP POST 请求从服务器加载数据。</td>
</tr>

<tr>
<td><a href="ajax_serialize.asp" title="jQuery ajax - serialize() 方法">.serialize()</a></td>
<td>将表单内容序列化为字符串。</td>
</tr>

<tr>
<td><a href="ajax_serializearray.asp" title="jQuery ajax - serializeArray() 方法">.serializeArray()</a></td>
<td>序列化表单元素，返回 JSON 数据结构数据。</td>
</tr>
</table>
</div>


<div>
<h2>参阅</h2>

<p>教程：<a href="../ajax/index.asp">Ajax 教程</a></p>
</div>


<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="jquery_ref_css.asp">Previous Page</a></li>

<li class="next"><a href="jquery_ref_traversing.asp">Next Page</a></li>
</ul>

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
<h5 id="tools_reference"><a href="jquery_reference.asp" title="jQuery 参考手册">jQuery 参考手册</a></h5>
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