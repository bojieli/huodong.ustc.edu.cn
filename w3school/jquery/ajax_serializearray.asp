
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

<title>jQuery ajax - serializeArray() 方法</title>
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

<h1>jQuery ajax - serializeArray() 方法</h1>

<div class="backtoreference">
<p><a href="jquery_ref_ajax.asp" title="jQuery 参考手册 - Ajax">jQuery Ajax 参考手册</a></p>
</div>


<div>
<h2>实例</h2>

<p>输出以数组形式序列化表单值的结果：</p>

<pre>
$("button").click(function(){
  x=$("form").serializeArray();
  $.each(x, function(i, field){
    $("#results").append(field.name + ":" + field.value + " ");
  });
});
</pre>

<p><a href="../tiy/t.asp@f=jquery_ajax_serializearray">亲自试一试</a></p>
</div>


<div>
<h2>定义和用法</h2>

<p>serializeArray() 方法通过序列化表单值来创建对象数组（名称和值）。</p>

<p>您可以选择一个或多个表单元素（比如 input 及/或 textarea），或者 form 元素本身。</p>

<h3>语法</h3>

<pre>$(<i>selector</i>).serializeArray()</pre>

<h3>详细说明</h3>

<p>serializeArray() 方法序列化表单元素（类似 <a href="ajax_serialize.asp">.serialize() 方法</a>），返回 JSON 数据结构数据。</p>

<p class="important"><span>注意：</span>此方法返回的是 JSON 对象而非 JSON 字符串。需要使用插件或者第三方库进行字符串化操作。</p>

<p>返回的 JSON 对象是由一个对象数组组成的，其中每个对象包含一个或两个名值对 —— name 参数和 value 参数（如果 value 不为空的话）。举例来说：</p>

<pre>
[ 
  {name: 'firstname', value: 'Hello'}, 
  {name: 'lastname', value: 'World'},
  {name: 'alias'}, <span>// 值为空</span>
]
</pre>

<p>.serializeArray() 方法使用了 W3C 关于 <a href="http://www.w3.org/TR/html401/interact/forms.html#h-17.13.2">successful controls</a>（有效控件） 的标准来检测哪些元素应当包括在内。特别说明，元素不能被禁用（禁用的元素不会被包括在内），并且元素应当有含有 name 属性。提交按钮的值也不会被序列化。文件选择元素的数据也不会被序列化。

<p>该方法可以对已选择单独表单元素的对象进行操作，比如 &lt;input&gt;, &lt;textarea&gt;, 和 &lt;select&gt;。不过，更方便的方法是，直接选择 &lt;form&gt; 标签自身来进行序列化操作。

<pre>
$(&quot;form&quot;).submit(function() {
  console.log($(this).serializeArray());
  return false;
});
</pre>

<p>上面的代码产生下面的数据结构（假设浏览器支持 console.log）：</p>

<pre>
[
  {
    name: a
    value: 1
  },
  {
    name: b
    value: 2
  },
  {
    name: c
    value: 3
  },
  {
    name: d
    value: 4
  },
  {
    name: e
    value: 5
  }
]
</pre>

<h3>示例</h3>

<p>取得表单内容并插入到网页中：</p>

<p>HTML 代码：</p>

<pre>
&lt;p id=&quot;results&quot;&gt;&lt;b&gt;Results:&lt;/b&gt; &lt;/p&gt;
&lt;form&gt;
  &lt;select name=&quot;single&quot;&gt;
    &lt;option&gt;Single&lt;/option&gt;
    &lt;option&gt;Single2&lt;/option&gt;
  &lt;/select&gt;
  &lt;select name=&quot;multiple&quot; multiple=&quot;multiple&quot;&gt;
    &lt;option selected=&quot;selected&quot;&gt;Multiple&lt;/option&gt;
    &lt;option&gt;Multiple2&lt;/option&gt;
    &lt;option selected=&quot;selected&quot;&gt;Multiple3&lt;/option&gt;
  &lt;/select&gt;&lt;br/&gt;
  &lt;input type=&quot;checkbox&quot; name=&quot;check&quot; value=&quot;check1&quot;/&gt; check1
  &lt;input type=&quot;checkbox&quot; name=&quot;check&quot; value=&quot;check2&quot; checked=&quot;checked&quot;/&gt; check2
  &lt;input type=&quot;radio&quot; name=&quot;radio&quot; value=&quot;radio1&quot; checked=&quot;checked&quot;/&gt; radio1
  &lt;input type=&quot;radio&quot; name=&quot;radio&quot; value=&quot;radio2&quot;/&gt; radio2
&lt;/form&gt;
</pre>

<p>jQuery 代码：</p>

<pre>
var fields = <code>$(&quot;select, :radio&quot;).serializeArray()</code>;
jQuery.each( fields, function(i, field){
  $(&quot;#results&quot;).append(field.value + &quot; &quot;);
});
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