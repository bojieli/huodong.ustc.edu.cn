
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

<title>XPointer 实例</title>
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
<h2>XLINK 基础</h2>
<ul>
<li><a href="index.asp" title="XLink 和 XPointer 教程">XLink 首页</a></li>
<li><a href="xlink_intro.asp" title="XLink 以及 XPointer 简介">XLink 简介</a></li>
<li><a href="xlink_syntax.asp" title="XLink 和 XPointer 语法">XLink 语法</a></li>
<li><a href="xlink_example.asp" title="XLink 实例">XLink 实例</a></li>
<li><a href="xpointer_example.asp" title="XPointer 实例">XPointer 实例</a></li>
<li><a href="xlink_summary.asp" title="您已经学习了 XLink，下一步呢？">XLink 总结</a></li>
</ul>

<h2>参考手册</h2>
<ul>
<li><a href="xlink_reference.asp" title="XLink 参考手册">XLink 属性</a></li>
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

<h1>XPointer 实例</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="xlink_example.asp">Previous Page</a></li>

<li class="next"><a href="xlink_summary.asp">Next Page</a></li>
</ul>

</div>

<div id="intro">
<p><strong>让我们通过研究一个实例来学习一些基础的 XPointer 语法。</strong></p>
</div>

<div>
<h2>XPointer 实例</h2>
<p>在本例中，我们会为您展示如何使用 XPointer 并结合 XLink 来指向另外一个文档的某个具体的部分。</p>
<p>我们将通过研究目标 XML 文档开始（即我们要链接的那个文档）。</p>
</div>

<div>
<h2>目标XML文档</h2>
<p>目标XML文档名为 &quot;dogbreeds.xml&quot;，它列出了一些不同的狗种类：</p>

<pre>&lt;?xml version=&quot;1.0&quot; encoding=&quot;ISO-8859-1&quot;?&gt;

&lt;dogbreeds&gt;

&lt;dog breed=&quot;Rottweiler&quot; id=&quot;Rottweiler&quot;&gt;
  &lt;picture url=&quot;http://dog.com/rottweiler.gif&quot; /&gt;
  &lt;history&gt;
  The Rottweiler's ancestors were probably Roman
  drover dogs.....
  &lt;/history&gt;
  &lt;temperament&gt;
  Confident, bold, alert and imposing, the Rottweiler
  is a popular choice for its ability to protect....
  &lt;/temperament&gt;
&lt;/dog&gt;

&lt;dog breed=&quot;FCRetriever&quot; id=&quot;FCRetriever&quot;&gt;
  &lt;picture url=&quot;http://dog.com/fcretriever.gif&quot; /&gt;
  &lt;history&gt;
  One of the earliest uses of retrieving dogs was to
  help fishermen retrieve fish from the water....
  &lt;/history&gt;
  &lt;temperament&gt;
  The flat-coated retriever is a sweet, exuberant,
  lively dog that loves to play and retrieve....
  &lt;/temperament&gt;
&lt;/dog&gt;

&lt;/dogbreeds&gt;</pre>

<p><a href="dogbreeds.xml">在您的浏览器查看 &quot;dogbreeds.xml&quot; 文件</a>。</p>
<p class="note"><span>注释：</span>上面的 XML 文档在每个我们需要链接的元素上使用了 id 属性！</p>
</div>

<div>
<h2>XML 链接文档</h2>
<p>不止能够链接到整个文档（当使用 XLink 时），XPointer 允许您链接到文档的特定部分。如需链接到页面的某个具体的部分，请在 xlink:href 属性中的 URL 后添加一个井号 (#) 以及一个 XPointer 表达式。</p>
<p>表达式：<em>#xpointer(id(&quot;Rottweiler&quot;))</em> 可引用目标文档中 id 值为 &quot;Rottweiler&quot; 的元素。</p>
<p>因此，xlink:href 属性会类似这样：<em>xlink:href=&quot;http://dog.com/dogbreeds.xml#xpointer(id('Rottweiler'))&quot;</em></p>
<p>不过，当使用 id 链接到某个元素时，XPointer 允许简写形式。您可以直接使用 id 的值，就像这样：<em>xlink:href=&quot;http://dog.com/dogbreeds.xml#Rottweiler&quot;</em>。</p>
<p>下面的 XML 文档可引用每条狗的品种信息，均通过 XLink 和 XPointer 来引用：</p>

<pre>&lt;?xml version=&quot;1.0&quot; encoding=&quot;ISO-8859-1&quot;?&gt;

&lt;mydogs xmlns:xlink=&quot;http://www.w3.org/1999/xlink&quot;&gt;

&lt;mydog xlink:type=&quot;simple&quot;
  <code>xlink:href=&quot;http://dog.com/dogbreeds.xml#Rottweiler&quot;</code>&gt;
  &lt;description xlink:type=&quot;simple&quot;
  xlink:href=&quot;http://myweb.com/mydogs/anton.gif&quot;&gt;
  Anton is my favorite dog. He has won a lot of.....
  &lt;/description&gt;
&lt;/mydog&gt;

&lt;mydog xlink:type=&quot;simple&quot;
  <code>xlink:href=&quot;http://dog.com/dogbreeds.xml#FCRetriever&quot;</code>&gt;
  &lt;description xlink:type=&quot;simple&quot;
  xlink:href=&quot;http://myweb.com/mydogs/pluto.gif&quot;&gt;
  Pluto is the sweetest dog on earth......
  &lt;/description&gt;
&lt;/mydog&gt;

&lt;/mydogs&gt;</pre>
</div>

<div  id="bpn">
<ul class="prenext">

<li class="pre"><a href="xlink_example.asp">Previous Page</a></li>

<li class="next"><a href="xlink_summary.asp">Next Page</a></li>
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
<h5 id="tools_reference"><a href="xlink_reference.asp">XLink 参考手册</a></h5>
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