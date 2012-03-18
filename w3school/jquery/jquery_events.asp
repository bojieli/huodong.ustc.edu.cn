
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

<title>jQuery 事件</title>
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

<h1>jQuery 事件</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="jquery_selectors.asp">Previous Page</a></li>

<li class="next"><a href="jquery_effects.asp">Next Page</a></li>
</ul>

</div>

<div id="intro">
<p><strong>jQuery 是为事件处理特别设计的。</strong></p>
</div>


<div>
<h2>jQuery 事件函数</h2>

<p>jQuery 事件处理方法是 jQuery 中的核心函数。</p>

<p>事件处理程序指的是当 HTML 中发生某些事件时所调用的方法。术语由事件“触发”（或“激发”）经常会被使用。</p>

<p>通常会把 jQuery 代码放到 &lt;head&gt;部分的事件处理方法中：</p>

<h3>实例</h3>

<pre>
&lt;html&gt;
&lt;head&gt;
&lt;script type=&quot;text/javascript&quot; src=&quot;jquery.js&quot;&gt;&lt;/script&gt;
&lt;script type=&quot;text/javascript&quot;&gt;
$(document).ready(function(){
  <code>$(&quot;button&quot;).click(function(){
    $(&quot;p&quot;).hide();
  });</code>
});
&lt;/script&gt;
&lt;/head&gt;

&lt;body&gt;
&lt;h2&gt;This is a heading&lt;/h2&gt;
&lt;p&gt;This is a paragraph.&lt;/p&gt;
&lt;p&gt;This is another paragraph.&lt;/p&gt;
&lt;button&gt;Click me&lt;/button&gt;
&lt;/body&gt;

&lt;/html&gt;
</pre>

<p><a href="../tiy/t.asp@f=jquery_hide_p">亲自试一试</a></p>

<p>在上面的例子中，当按钮的点击事件被触发时会调用一个函数：</p>

<pre>$(&quot;button&quot;).click(function() {<span>..some code...</span> } )</pre>

<p>该方法隐藏所有 &lt;p&gt; 元素：</p>

<pre>$(&quot;p&quot;).hide();</pre>
</div>


<div>
<h2>单独文件中的函数</h2>

<p>如果您的网站包含许多页面，并且您希望您的 jQuery 函数易于维护，那么请把您的 jQuery 函数放到独立的 .js 文件中。</p>

<p>当我们在教程中演示 jQuery 时，会将函数直接添加到 &lt;head&gt; 部分中。不过，把它们放到一个单独的文件中会更好，就像这样（通过 src 属性来引用文件）：</p>

<h3>实例</h3>

<pre>
&lt;head&gt;
&lt;script type=&quot;text/javascript&quot; src=&quot;jquery.js&quot;&gt;&lt;/script&gt;
&lt;script type=&quot;text/javascript&quot; src=&quot;my_jquery_functions.js&quot;&gt;&lt;/script&gt;
&lt;/head&gt;
</pre>
</div>


<div>
<h2>jQuery 名称冲突</h2>

<p>jQuery 使用 $ 符号作为 jQuery 的简介方式。</p>

<p>某些其他 JavaScript 库中的函数（比如 Prototype）同样使用 $ 符号。</p>

<p>jQuery 使用名为 noConflict() 的方法来解决该问题。</p>

<p><em>var jq=jQuery.noConflict()</em>，帮助您使用自己的名称（比如 jq）来代替 $ 符号。</p>

<p><a href="../tiy/t.asp@f=jquery_noconflict">亲自试一试</a></p>
</div>


<div>
<h2>结论</h2>

<p>由于 jQuery 是为处理 HTML 事件而特别设计的，那么当您遵循以下原则时，您的代码会更恰当且更易维护：</p>

<ul>
<li>把所有 jQuery 代码置于事件处理函数中</li>
<li>把所有事件处理函数置于文档就绪事件处理器中</li>
<li>把 jQuery 代码置于单独的 .js 文件中</li>
<li>如果存在名称冲突，则重命名 jQuery 库</li>
</ul>
</div>


<div>
<h2>jQuery 事件</h2>

<p>下面是 jQuery 中事件方法的一些例子：</p>

<table class="dataintable">
<tr>
<th>Event 函数</th>
<th>绑定函数至</th>
</tr>

<tr>
<td>$(document).ready(function)</td>
<td>将函数绑定到文档的就绪事件（当文档完成加载时）</td>
</tr>

<tr>
<td>$(selector).click(function)</td>
<td>触发或将函数绑定到被选元素的点击事件</td>
</tr>

<tr>
<td>$(selector).dblclick(function)</td>
<td>触发或将函数绑定到被选元素的双击事件</td>
</tr>

<tr>
<td>$(selector).focus(function)</td>
<td>触发或将函数绑定到被选元素的获得焦点事件</td>
</tr>

<tr>
<td>$(selector).mouseover(function)</td>
<td>触发或将函数绑定到被选元素的鼠标悬停事件</td>
</tr>
</table>

<p>如需完整的参考手册，请访问我们的 <a href="jquery_ref_events.asp" title="jQuery 参考手册 - 事件">jQuery 事件参考手册</a>。</p>
</div>


<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="jquery_selectors.asp">Previous Page</a></li>

<li class="next"><a href="jquery_effects.asp">Next Page</a></li>
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