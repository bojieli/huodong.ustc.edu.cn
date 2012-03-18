
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

<title>Web 品质 - 国际化</title>
</head>

<body class="webbuilding">
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
<h2>网站品质</h2>
<ul>
<li><a href="index.asp">教程首页</a></li>
<li><a href="quality_standards.asp">Web 标准</a></li>
<li><a href="quality_elements.asp">HTML 元素</a></li>
<li><a href="quality_styles.asp">样式表</a></li>
<li><a href="quality_readability.asp">可读性</a></li>
<li><a href="quality_accessibility.asp">易用性</a></li>
<li><a href="quality_international.asp">国际化</a></li>
</ul>
</div>

<div id="selected">
<h2>建站手册</h2>
<ul>
<li><a href="../site/index.asp" title="网站构建">网站构建</a></li>
<li><a href="../w3c/index.asp" title="万维网联盟 (W3C)">万维网联盟 (W3C)</a></li>
<li><a href="../browsers/index.asp" title="浏览器信息">浏览器信息</a></li>
<li><a href="index.asp" title="网站品质">网站品质</a></li>
<li><a href="../semweb/index.asp" title="语义网">语义网</a></li>
<li><a href="../careers/index.asp" title="职业规划">职业规划</a></li>
<li><a href="../hosting/index.asp" title="网站主机">网站主机</a></li>
</ul>

<h2><a href="../about/index.asp" title="关于 W3School" id="link_about">关于 W3School</a></h2>
<h2><a href="../about/about_helping.asp" title="帮助 W3School" id="link_help">帮助 W3School</a></h2>

</div>

</div>

<div id="maincontent">

<h1>Web 品质 - 国际化</h1>

<div  id="tpn">
<ul class="prenext">

<li class="pre"><a href="quality_accessibility.asp">Previous Page</a></li>

<li class="next"><a href="index.asp">Next Page</a></li>
</ul>

</div>

<div id="intro">
<p><strong>网络无国界。</strong></p>
</div>

<div>
<h2>网络无国界</h2>
<blockquote>With the Internet follows an absolute requirement to interchange data in a multiplicity of languages, which in turn utilize a bewildering number of characters. </blockquote>
<p>--- H. Alvestrand,  Internet工程工作小组 (IETF), 1998年1月。</p>
</div>

<div>
<h2>国际字符集</h2>
<p>所有的 W3C 标准（自从1996年），包括 HTML、XHTML 和 XML 都定义了一个名为 Unicode (ISO 10646) 内部的内部字符集。</p>
<p>所有现代 web 浏览器都在原生地使用此字符集。而大多数在 internet 上传输的文档并没有使用这个 Unicode 字符集。</p>
<p>正因如此，Internet 客户（浏览器）与 Internet 服务器 之间必须有一种在通信中一致使用字符集的方法。</p>
<p>对每个文档在用的字符集进行标记，对于提升网站的品质来说至关重要。</p>
<p>请始终在 &lt;head&gt; 元素内 使用下面的的元元素：</p>
<pre>&lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html;charset=X&quot; /&gt;</pre>
<p>把 X 替换为你所使用的字符集，比如ISO-8859-1、UTF-8 或者 UTF-16。</p>
</div>

<div>
<h2>国际日期</h2>
<p>请不要使用类似 &quot;04-03-02&quot; 的日期格式。</p>
<p>上面的日期可以表示为2004年3月2日，或者2002年3月4日，亦或者2002年4月3日。</p>
<p>国际标准化 (ISO) 为日期定义的国际标准格式是 &quot;yyyy-mm-dd&quot;，yyyy 是年，mm 是月，dd 是日。</p>
<p>如果您使用了 ISO 的格式，那么大多数访问者都能明白你的日期。</p>
</div>

<div  id="bpn">
<ul class="prenext">

<li class="pre"><a href="quality_accessibility.asp">Previous Page</a></li>

<li class="next"><a href="index.asp">Next Page</a></li>
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