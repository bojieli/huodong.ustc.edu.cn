
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

<title>jQuery ajax - param() 方法</title>
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

<h1>jQuery ajax - param() 方法</h1>

<div class="backtoreference">
<p><a href="jquery_ref_ajax.asp" title="jQuery 参考手册 - Ajax">jQuery Ajax 参考手册</a></p>
</div>


<div>
<h2>实例</h2>

<p>序列化一个 <i>key/value</i> 对象：</p>

<pre>
var params = { width:1900, height:1200 };
var str = jQuery.param(params);
$(&quot;#results&quot;).text(str);
</pre>

<p>结果:</p>

<pre>width=1680&amp;height=1050</pre>

<h3>TIY 实例</h3>

<p>输出序列化对象的结果：</p>

<pre>
$(&quot;button&quot;).click(function(){
  $(&quot;div&quot;).text($.param(personObj));
});
</pre>

<p><a href="../tiy/t.asp@f=jquery_ajax_param">亲自试一试</a></p>
</div>


<div>
<h2>定义和用法</h2>


<p>param() 方法创建数组或对象的序列化表示。</p>

<p>该序列化值可在进行 AJAX 请求时在 URL 查询字符串中使用。</p>


<h3>语法</h3>

<pre>jQuery.param(<i>object</i>,<i>traditional</i>)</pre>

<table class="dataintable">
<tr>
<th style="width:25%;">参数</th>
<th>描述</th>
</tr>

<tr>
<td><i>object</i></td>
<td>要进行序列化的数组或对象。</td>
</tr>

<tr>
<td><i>traditional</i></td>
<td>规定是否使用传统的方式浅层进行序列化（参数序列化）。</td>
</tr>
</table>

<h3>详细说明</h3>

<p>param() 方法用于在内部将元素值转换为序列化的字符串表示。请参阅 <a href="ajax_serialize.asp" title="jQuery ajax - serialize() 方法">.serialize()</a> 了解更多信息。</p>

<p>对于 jQuery 1.3，如果传递的参数是一个函数，那么用 .param() 会得到这个函数的返回值，而不是把这个函数作为一个字符串来返回。</p>

<p>对于 jQuery 1.4，.param() 方法将会通过深度递归的方式序列化对象，以便符合现代化脚本语言的需求，比如 PHP、Ruby on Rails 等。你可以通过设置 jQuery.ajaxSettings.traditional = true; 来全局地禁用这个功能。</p>

<p>如果被传递的对象在数组中，则必须是以 <a href="ajax_serializearray.asp" title="jQuery ajax - serializeArray() 方法">.serializeArray()</a> 的返回值为格式的对象数组：</p>

<pre>
[{name:&quot;first&quot;,value:&quot;Rick&quot;},
{name:&quot;last&quot;,value:&quot;Astley&quot;},
{name:&quot;job&quot;,value:&quot;Rock Star&quot;}]
</pre>

<p class="important"><span>注意：</span>因为有些框架在解析序列化数字的时候能力有限，所以当传递一些含有对象或嵌套数组的数组作为参数时，请务必小心！</p>

<p>在 jQuery 1.4 中，HTML5 的 input 元素也会被序列化。</p>

</div>


<div>
<h2>更多实例</h2>

<p>我们可以如下显示对象的查询字符串表示以及 URI 编码版本：</p>

<pre>
var myObject = {
  a: {
    one: 1, 
    two: 2, 
    three: 3
  }, 
  b: [1,2,3]
};
var recursiveEncoded = <code>$.param(myObject)</code>;
var recursiveDecoded = decodeURIComponent($.param(myObject));

alert(recursiveEncoded);
alert(recursiveDecoded);
</pre>

<p>recursiveEncoded 和 recursiveDecoded 的值输出如下：</p>

<pre>
a%5Bone%5D=1&amp;a%5Btwo%5D=2&amp;a%5Bthree%5D=3&amp;b%5B%5D=1&amp;b%5B%5D=2&amp;b%5B%5D=3
a[one]=1&amp;a[two]=2&amp;a[three]=3&amp;b[]=1&amp;b[]=2&amp;b[]=3
</pre>

<p>可以将 traditional 参数设置为 true，来模拟 jQuery 1.4 之前版本中 $.param() 的行为：</p>

<pre>
var myObject = {
  a: {
    one: 1, 
    two: 2, 
    three: 3
  }, 
  b: [1,2,3]
};
var shallowEncoded = <code>$.param(myObject, true)</code>;
var shallowDecoded = decodeURIComponent(shallowEncoded);

alert(shallowEncoded);
alert(shallowDecoded);
</pre>

<p>recursiveEncoded 和 recursiveDecoded 的值输出如下：</p>

<pre>
a=%5Bobject+Object%5D&amp;b=1&amp;b=2&amp;b=3
a=[object+Object]&amp;b=1&amp;b=2&amp;b=3
</pre>
</div>


<div class="backtoreference">
<p><a href="jquery_ref_ajax.asp" title="jQuery 参考手册 - Ajax">jQuery Ajax 参考手册</a></p>
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