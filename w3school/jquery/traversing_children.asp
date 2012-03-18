
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

<title>jQuery 遍历 - children() 方法</title>
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

<h1>jQuery 遍历 - children() 方法</h1>

<div class="backtoreference">
<p><a href="jquery_ref_traversing.asp" title="jQuery 参考手册 - 遍历">jQuery 遍历参考手册</a></p>
</div>


<div>
<h2>实例</h2>

<p>找到类名为 &quot;selected&quot; 的所有 div 的子元素，并将其设置为蓝色：</p>

<pre>
$(&quot;div&quot;)<code>.children(&quot;.selected&quot;)</code>.css(&quot;color&quot;, &quot;blue&quot;);
</pre>

<p><a href="../tiy/t.asp@f=jquery_traversing_children">亲自试一试</a></p>
</div>


<div>
<h2>定义和用法</h2>

<p>add() 方法返回匹配元素集合中每个元素的子元素，添加可选参数可通过选择器进行过滤。</p>

<h3>语法</h3>

<pre>.children(<i>selector</i>)</pre>

<table class="dataintable">
<tr>
<th style="width:30%;">参数</th>
<th>描述</th>
</tr>

<tr>
<td><i>selector</i></td>
<td>字符串值，包含匹配元素的选择器表达式。</td>
</tr>
</table>


<h3>详细说明</h3>

<p>如果给定表示 DOM 元素集合的 jQuery 对象，.children() 方法允许我们检索 DOM 树中的这些元素，并用匹配元素构造新的 jQuery 对象。<a href="traversing_find.asp" title="">.find()</a> 和 .children() 方法类似，不过后者只沿着 DOM 树向下遍历单一层级。</p>

<p>请注意，与大多数 jQuery 方法一样，.children() 不返回文本节点；如果需要获得包含文本和注释节点在内的所有子节点，请使用 .contents()。</p>

<p>该方法接受一个选择器表达式作为可选参数，与我们传递到 $() 的参数的类型是相同的。如果应用该选择器，将测试元素是否匹配该表达式，以此筛选这些元素。</p>

<p>请思考这个带有基础的嵌套列表的页面：</p>

<pre>
&lt;ul class=&quot;level-1&quot;&gt;
  &lt;li class=&quot;item-i&quot;&gt;I&lt;/li&gt;
  &lt;li class=&quot;item-ii&quot;&gt;II
    <span class="marked">&lt;ul class=&quot;level-2&quot;&gt;</span>
      &lt;li class=&quot;item-a&quot;&gt;A&lt;/li&gt;
      &lt;li class=&quot;item-b&quot;&gt;B
        &lt;ul class=&quot;level-3&quot;&gt;
          &lt;li class=&quot;item-1&quot;&gt;1&lt;/li&gt;
          &lt;li class=&quot;item-2&quot;&gt;2&lt;/li&gt;
          &lt;li class=&quot;item-3&quot;&gt;3&lt;/li&gt;
        &lt;/ul&gt;
      &lt;/li&gt;
      &lt;li class=&quot;item-c&quot;&gt;C&lt;/li&gt;
    &lt;/ul&gt;
  &lt;/li&gt;
  &lt;li class=&quot;item-iii&quot;&gt;III&lt;/li&gt;
&lt;/ul&gt;
</pre>

<p><a href="../tiy/t.asp@f=jquery_traversing_children_2">亲自试一试</a></p>

<p>如果我们从 level-2 列表开始，我们可以找到它的子元素：</p>

<pre>$('ul.level-2').children().css('background-color', 'red');</pre>

<p>这行代码的结果是，项目 A, B, C 得到红色背景。由于我们没有应用选择器表达式，返回的 jQuery 对象包含了所有子元素。如果应用一个选择器的话，那么只会包括匹配的项目。</p>

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