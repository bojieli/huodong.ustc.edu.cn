
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

<title>应用程序必须是服务</title>
</head>

<body class="dotnet">
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
<h2>Microsoft.NET</h2>
<ul>
<li><a href="index.asp" title="Microsoft.NET教程">.NET 首页</a></li>
<li><a href="msnet_intro.asp" title=".NET简介">.NET 简介</a></li>
<li><a href="msnet_core.asp" title=".NET 构建模块（Building Blocks）">.NET 核心</a></li>
<li><a href="msnet_tools.asp" title=".NET软件">.NET 软件</a></li>
<li><a href="msnet_webservices.asp" title=".NET Web Services">.NET 网络服务</a></li>
<li><a href="msnet_standards.asp" title="客户端和服务器标准">.NET 标准</a></li>
<li><a href="msnet_services.asp" title="应用程序必须是服务">.NET 服务</a></li>
<li><a href="msnet_futureproof.asp" title="经得起未来考验的应用程序">.NET 未来</a></li>
</ul>

<h2>.NET 教程</h2>
<ul>
<li><a href="../aspnet/index.asp" title="ASP.NET教程">.NET ASP</a></li>
<li><a href="../dotnetmobile/index.asp" title=".NET Mobile教程">.NET Mobile</a></li>
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

<h1>应用程序必须是服务</h1>

<div  id="tpn">
<ul class="prenext">

<li class="pre"><a href="msnet_standards.asp">Previous Page</a></li>

<li class="next"><a href="msnet_futureproof.asp">Next Page</a></li>
</ul>

</div>

<div id="intro">
<p><strong>下面的段落描述了 W3School 对未来的因特网分布式应用程序的展望。</strong></p>
</div>

<div>
<h2>应用程序必须是一系列的服务</h2>
<p>应用程序不再被允许包含大量已编辑的可执行代码。应用程序应被分为一系列更小的专门的服务，这样就更易创建和维护。这些专门的服务可由更精简的团队进行开发和维护。服务（Services）与可执行文件、组件或者 DLL 文件不同。服务可对提交的请求进行应答，也可返回数据。我们的建议是把服务作为一系列服务器端的 HTML 以及（或者）XML 页面来进行开发。</p>
</div>

<div>
<h2>服务不能为某个特殊的目的创建</h2>
<p>在历史上，充斥着为完成某个单一的任务而创建的应用程序。这些应用程序中的许多在它们被发布前就已经失败了，这是由于它们无法根据需求的变化而进行改变。这是对金钱和时间的巨大浪费。我们（以及那些为我们的应用程序买单的人们）都希望可以创建更灵活的应用程序，这些应用程序具有很强的普适性，可以更好地应对未来的改变。未来 - 即使（在过去）没有考虑过 - 应用程序应当在保持完整性的同时更容易适应变化。我们的建议是创建灵活的标准服务来服务于大量的不同的请求。</p>
</div>

<div>
<h2>服务必须易于创建和编辑</h2>
<p>只要可以避免，服务（Services）就不应被代码化。即使需要被代码化，我们的建议是最好使用脚本。服务不应被编译为可执行文件。这样做会令服务难于访问和编辑。任何在应用程序中使用的预编译组件都会威胁到创建可移动、可伸缩以及良好支持未来扩展和变化的应用程序的可能性。应用程序应该通过编辑其属性和方法来创建和修改，而不是改变它们的可执行代码。我们的建议是使用某个 XML 编辑器来创建和编辑服务，并使用标准的服务引擎通过执行服务描述来提供服务。服务描述应当存储于类似数据库的数据仓库中或者某个 XML/HTML 文件中。</p>
</div>

<div>
<h2>服务和数据必须能自我描述</h2>
<p>应用程序客户端应当有能力为某个服务查询服务器，以及有能力请求当前的服务器功能。客户端和服务器也应当有能力通过某种可理解数据中每个元素的方法来交换数据。我们的建议是使用带有 DTD 的信息词表来交换服务器函数，并使用 XML 来交换数据。</p>
</div>

<div  id="bpn">
<ul class="prenext">

<li class="pre"><a href="msnet_standards.asp">Previous Page</a></li>

<li class="next"><a href="msnet_futureproof.asp">Next Page</a></li>
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
</div><div id="ad">
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