
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

<title>XQuery 添加元素和属性</title>
</head>

<body class="xml">
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
<h2>XQuery 基础</h2>
<ul>
<li><a href="index.asp" title="XQuery 教程">XQuery 首页</a></li>
<li><a href="xquery_intro.asp" title="XQuery 简介">XQuery 简介</a></li>
<li><a href="xquery_example.asp" title="XQuery 实例">XQuery 实例</a></li>
<li><a href="xquery_flwor.asp" title="XQuery FLWOR 表达式">XQuery FLWOR</a></li>
<li><a href="xquery_flwor_html.asp" title="XQuery FLWOR + HTML">XQuery HTML</a></li>
<li><a href="xquery_terms.asp" title="XQuery 术语">XQuery 术语</a></li>
<li><a href="xquery_syntax.asp" title="XQuery 语法">XQuery 语法</a></li>
</ul>

<h2>XQuery 高级</h2>
<ul>
<li><a href="xquery_add.asp" title="XQuery 添加元素和属性">XQuery 添加</a></li>
<li><a href="xquery_select.asp" title="XQuery 选择和过滤">XQuery 选取</a></li>
<li><a href="xquery_functions.asp" title="XQuery 函数">XQuery 函数</a></li>
<li><a href="xquery_summary.asp" title="您已经学习了 XQuery，下一步呢？">XQuery 总结</a></li>
</ul>

<h2>XQuery 参考手册</h2>
<ul>
<li><a href="xquery_reference.asp" title="XQuery 参考手册">XQuery 参考手册</a></li>
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

<h1>XQuery 添加元素和属性</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="xquery_syntax.asp">Previous Page</a></li>

<li class="next"><a href="xquery_select.asp">Next Page</a></li>
</ul>

</div>

<div>
<h2>XML 实例文档</h2>
<p>我们将在下面的例子中使用这个 &quot;books.xml&quot; 文档（和上面的章节所使用的 XML 文件相同）。</p>
<p><a href="books.xml">在您的浏览器中查看 &quot;books.xml&quot; 文件</a>。</p>
</div>

<div>
<h2>向结果添加元素和属性</h2>
<p>正如在前面一节看到的，我们可以在结果中引用输入文件中的元素和属性：</p>
<pre>for $x in doc(&quot;books.xml&quot;)/bookstore/book/title
order by $x
return $x</pre>

<p>上面的 XQuery 表达式会在结果中引用 title 元素和 lang 属性，就像这样：</p>
<pre>&lt;title lang=&quot;en&quot;&gt;Everyday Italian&lt;/title&gt;
&lt;title lang=&quot;en&quot;&gt;Harry Potter&lt;/title&gt;
&lt;title lang=&quot;en&quot;&gt;Learning XML&lt;/title&gt;
&lt;title lang=&quot;en&quot;&gt;XQuery Kick Start&lt;/title&gt;</pre>

<p>以上 XQuery 表达式返回 title 元素的方式和它们在输入文档中被描述的方式的相同的。</p>
<p>现在我们要向结果添加我们自己的元素和属性！</p>

<h3>添加 HTML 元素和文本</h3>
<p>现在，我们要向结果添加 HTML 元素。我们会把结果放在一个 HTML 列表中：</p>
<pre>&lt;html&gt;
&lt;body&gt;

&lt;h1&gt;Bookstore&lt;/h1&gt;

<code>&lt;ul&gt;</code>
{
for $x in doc(&quot;books.xml&quot;)/bookstore/book
order by $x/title
return <code>&lt;li&gt;{data($x/title)}. Category: {data($x/@category)}&lt;/li&gt;</code>
}
<code>&lt;/ul&gt;</code>

&lt;/body&gt;
&lt;/html&gt;</pre>

<p>以上 XQuery 表达式会生成下面的结果：</p>
<pre>&lt;html&gt;
&lt;body&gt;

&lt;h1&gt;Bookstore&lt;/h1&gt;

&lt;ul&gt;
&lt;li&gt;Everyday Italian. Category: COOKING&lt;/li&gt;
&lt;li&gt;Harry Potter. Category: CHILDREN&lt;/li&gt;
&lt;li&gt;Learning XML. Category: WEB&lt;/li&gt;
&lt;li&gt;XQuery Kick Start. Category: WEB&lt;/li&gt;
&lt;/ul&gt;

&lt;/body&gt;
&lt;/html&gt;</pre>

<h3>向 HTML 元素添加属性</h3>
<p>接下来，我们要把 category 属性作为 HTML 列表中的 class 属性来使用：</p>
<pre>&lt;html&gt;
&lt;body&gt;

&lt;h1&gt;Bookstore&lt;/h1&gt;

<code>&lt;ul&gt;</code>
{
for $x in doc(&quot;books.xml&quot;)/bookstore/book
order by $x/title
<code>return &lt;li class=&quot;{data($x/@category)}&quot;&gt;{data($x/title)}&lt;/li&gt;</code>
}
<code>&lt;/ul&gt;</code>

&lt;/body&gt;
&lt;/html&gt;</pre>

<p>上面的 XQuery 表达式可生成以下结果：</p>
<pre>&lt;html&gt;
&lt;body&gt;

&lt;h1&gt;Bookstore&lt;/h1&gt;

&lt;ul&gt;
&lt;li class=&quot;COOKING&quot;&gt;Everyday Italian&lt;/li&gt;
&lt;li class=&quot;CHILDREN&quot;&gt;Harry Potter&lt;/li&gt;
&lt;li class=&quot;WEB&quot;&gt;Learning XML&lt;/li&gt;
&lt;li class=&quot;WEB&quot;&gt;XQuery Kick Start&lt;/li&gt;
&lt;/ul&gt;

&lt;/body&gt;
&lt;/html&gt;</pre>
</div>

<div  id="bpn">
<ul class="prenext">

<li class="pre"><a href="xquery_syntax.asp">Previous Page</a></li>

<li class="next"><a href="xquery_select.asp">Next Page</a></li>
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
<h5 id="tools_reference"><a href="xquery_reference.asp">XQuery 参考手册</a></h5>
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