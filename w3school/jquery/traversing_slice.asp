
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

<title>jQuery 遍历 - slice() 方法</title>
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

<h1>jQuery 遍历 - slice() 方法</h1>

<div class="backtoreference">
<p><a href="jquery_ref_traversing.asp" title="jQuery 参考手册 - 遍历">jQuery 遍历参考手册</a></p>
</div>


<div>
<h2>实例</h2>

<p>选中所有段落，然后将所选内容缩减为只包含第一和第二个段落：</p>

<pre>
$(&quot;p&quot;)<code>.slice(0, 2)</code>.wrapInner(&quot;<b></b>&quot;);
</pre>

<p><a href="../tiy/t.asp@f=jquery_traversing_slice">亲自试一试</a></p>
</div>


<div>
<h2>定义和用法</h2>

<p>slice() 把匹配元素集合缩减为指定的指数范围的子集。</p>

<h3>语法</h3>

<pre>.slice(<i>selector</i>,<i>end</i>)</pre>

<table class="dataintable">
<tr>
<th style="width:30%;">参数</th>

<th>描述</th>
</tr>

<tr>
<td><i>selector</i></td>
<td>
  <p>基于 0 的整数值，指示开始选取元素的位置。</p>
  <p>如果是负数，则指示从集合末端开始的偏移量。</p>
</td>
</tr>

<tr>
<td><i>end</i></td>
<td>
  <p>基于 0 的整数值，指示结束选取元素的位置。</p>
  <p>如果是负数，则指示从集合末端开始的偏移量。</p>
  <p>如果省略，则选取范围会在集合末端结束。</p>
</td>
</tr>
</table>

<h3>详细说明</h3>

<p>如果给定一个表示 DOM 元素集合的 jQuery 对象，.slice() 方法用匹配元素的子集构造一个新的 jQuery 对象。已应用的 index 参数集合中其中一个元素的位置；如果省略 end 参数，则 index 之后的所有的所有元素都会包含在结果中。</p>

<p>请思考这个带有简单列表的页面：</p>

<pre>
&lt;ul&gt;
  &lt;li&gt;list item 1&lt;/li&gt;
  &lt;li&gt;list item 2&lt;/li&gt;
  &lt;li&gt;list item 3&lt;/li&gt;
  &lt;li&gt;list item 4&lt;/li&gt;
  &lt;li&gt;list item 5&lt;/li&gt;
&lt;/ul&gt;
</pre>

<p>我们可以向列表项集合应用该方法：</p>

<pre>$('li')<code>.slice(2)</code>.css('background-color', 'red');</pre>

<p><a href="../tiy/t.asp@f=jquery_traversing_slice_2">亲自试一试</a></p>

<p>此次调用的结果是项目 3、4 和 5 的背景被设置为红色。请注意，已应用的 index 参数基于零，引用的是 jQuery 对象中元素的位置，而非 DOM 树中的。</p>

<p>end 参数允许我们更进一步地限制选取范围。比如：</p>

<pre>$('li')<code>.slice(2, 4)</code>.css('background-color', 'red');</pre>

<p><a href="../tiy/t.asp@f=jquery_traversing_slice_3">亲自试一试</a></p>

<p>现在，只有项目 3 和 4 会被选取。再次说明，index 是基于零的；范围会延伸到（但不包含）指定的 index。</p>


<h3>负的指数</h3>

<p>jQuery 的 .slice() 方法模仿了 JavaScript 数组对象的 .slice() 方法。它所模仿的特性之一是向 start 或 end 参数传递负数的能力。如果提供负数，则指示的是从集合结尾开始的一个位置，而非从开头。例如：</p>

<pre>$('li')<code>.slice(-2, -1)</code>.css('background-color', 'red');</pre>

<p><a href="../tiy/t.asp@f=jquery_traversing_slice_4">亲自试一试</a></p>

<p>这次，只有列表项 4 会变红，这是因为该项目是介于从结尾计数的二 (-2) 与从结尾计数的一 (-1) 的之间的范围中的唯一项目。</p>
</div>


<div class="backtoreference">
<p><a href="jquery_ref_traversing.asp" title="jQuery 参考手册 - 遍历">jQuery 遍历参考手册</a></p>
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