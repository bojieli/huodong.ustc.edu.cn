
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

<title>XSL-FO 区域</title>
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
<h2>XSLFO 教程</h2>
<ul>
<li><a href="index.asp" title="XSLFO教程首页">XSLFO 首页</a></li>
<li><a href="xslfo_intro.asp" title="XSL-FO简介">XSLFO 简介</a></li>
<li><a href="xslfo_documents.asp" title="XSL-FO文档">XSLFO 文档</a></li>
<li><a href="xslfo_areas.asp" title="XSL-FO Areas">XSLFO 区域</a></li>
<li><a href="xslfo_output.asp" title="XSLFO Output">XSLFO 输出</a></li>
<li><a href="xslfo_flow.asp" title="XSLFO Flow">XSLFO 流</a></li>
<li><a href="xslfo_pages.asp" title="XSLFO页面">XSLFO 页面</a></li>
<li><a href="xslfo_blocks.asp" title="XSL-FO Blocks">XSLFO 块</a></li>
<li><a href="xslfo_lists.asp" title="XSL-FO列表">XSLFO 列表</a></li>
<li><a href="xslfo_tables.asp" title="XSLFO表格">XSLFO 表格</a></li>
<li><a href="xslfo_xslt.asp" title="XSL-FO与XSLT的关系">XSLFO 与 XSLT</a></li>
</ul>

<h2>XSLFO 参考手册</h2>
<ul>
<li><a href="xslfo_reference.asp" title="XSL-FO对象参考手册">XSLFO 对象</a></li>
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

<h1>XSL-FO 区域</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="xslfo_documents.asp">Previous Page</a></li>

<li class="next"><a href="xslfo_output.asp">Next Page</a></li>
</ul>

</div>

<div id="intro">
<p><strong>XSL-FO 使用矩形框（区域）来显示输出。</strong></p>
</div>

<div>
<h2>XSL-FO 区域</h2>
<p>XSL 格式化模型定义了一系列的矩形（区域）框来显示输出。</p>
<p>所有的输出都会被格式化到这些框中，然后会被显示或打印到某个目标媒介。</p>
<p>让我们研究一下下面这些区域：</p>
<ul>
<li>Pages（页面）</li>
<li>Regions（区）</li>
<li>Block areas（块区域）</li>
<li>Line areas（行区域）</li>
<li>Inline areas（行内区域）</li>
</ul>
</div>

<div>
<h2>XSL-FO Pages（页面）</h2>
<p>XSL-FO 输出会被格式化到页面中。打印输出通常会进入分为许多分割的页面。浏览器输出经常会成为一个长的页面。</p>
<p>XSL-FO 页面包含区域（Region）。</p>
</div>

<div>
<h2>XSL-FO Regions（区）</h2>
<p>每个 XSL-FO 页面均包含一系列的 Regions（区）：</p>
<ul>
<li>region-body (页面的主体) </li>
<li>region-before (页面的页眉) </li>
<li>region-after (页面的页脚) </li>
<li>region-start (左侧栏) </li>
<li>region-end (右侧栏)</li>
</ul>
<p>XSL-FO Regions 包含块区域（Block Area）。</p>
</div>

<div>
<h2>XSL-FO Block Areas（块区域）</h2>
<p>XSL-FO 块区域可定义小的块元素（通常由一个新行开始），比如段落、表格以及列表。</p>
<p>XSL-FO 块区域可包含其他的块区域，不过大多数时候它们包含的是行区域（Line Area）。</p>
</div>

<div>
<h2>XSL-FO Line Areas（行区域）</h2>
<p>XSL-FO 行区域定义了块区域内部的文本行。</p>
<p>XSL-FO 行区域包含行内区域（Inline Area）。</p>
</div>

<div>
<h2>XSL-FO Inline Areas（行内区域）</h2>
<p>XSL-FO 行内区域定了行内部的文本（着重号、单字符以及图像等等）。</p>
</div>

<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="xslfo_documents.asp">Previous Page</a></li>

<li class="next"><a href="xslfo_output.asp">Next Page</a></li>
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
<h5 id="tools_reference"><a href="xslfo_reference.asp">XSL-FO 参考手册</a></h5>
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