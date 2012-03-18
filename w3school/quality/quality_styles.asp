
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

<title>Web Quality - 样式表</title>
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

<h1>Web 品质 - 样式表</h1>

<div  id="tpn">
<ul class="prenext">

<li class="pre"><a href="quality_elements.asp">Previous Page</a></li>

<li class="next"><a href="quality_readability.asp">Next Page</a></li>
</ul>

</div>

<div id="intro">
<p><strong>使用样式表对于提升网页品质至关重要。</strong></p>
</div>

<div>
<h2>请勿使用 font 标签</h2>
<p>应使用 CSS 来设置显示网页上的字体尺寸。请不要使用 font 标签。</p>
<p>使用 &lt;font&gt; 标签会增加文档的规模，而且使您每次改变标准文字尺寸的工作成为一场梦魇。</p>
<p>请设想一下下面的情况：</p>
<p>一天您决定修改网站中所有标题的颜色和尺寸。通过 CSS，您只需要修改一行就可以做到这一点。假如您使用了 &lt;font&gt;标签，那么您需要把网站中所有页面的所有标题都修改一遍。</p>
<p>使用样式替代 &lt;font&gt; 标签可使我们更轻松地为网页制作高质量的界面。</p>
</div>

<div>
<h2>请勿使用固定的字体尺寸</h2>
<p>不要使用固定的尺寸值。请始终使用相对的尺寸值。</p>
<p>这项建议最重要的理由是无法通过浏览器重新调整固定尺寸的大小。</p>
<p>您的访问者会使用不同的设备（显示器）、不同的浏览环境（光线）以及可能的残疾（弱视）。</p>
<p>例如，可以把某人的文字尺寸设置为100%（或者 medium ），主标题设置为140%（或者 x-large ），而次级的标题设置为120%（或者 large ），这样用户就可以使用浏览器来重新设定最喜欢的尺寸了。</p>
<p>通过调整网页的文本尺寸的功能，也可以改变打印页面的文字数目。</p>
</div>

<div>
<h2>请勿使用很小的默认字体尺寸</h2>
<p>一些网站会使用很小的文字尺寸，这样就可以向每张页面“塞”入更多的内容，或者使页面看上去更“时髦”。</p>
<p>再次重申，使用不同的设备（显示器）、不同的浏览环境（光线）以及可能的残疾（弱视），都可能对用户造成阅读障碍。</p>
<p>请不要逼迫用户每次访问你的站点时都要放大文本的尺寸。</p>
</div>

<div>
<h2>始终使用一致的背景颜色</h2>
<p>大部分网页都会为不同的文本元素使用颜色。标题和链接的颜色通常与正文的文本颜色是不同的。</p>
<p>作为一位 web 设计者，您应当意识到的事实是，您的访问者能够修改默认的颜色选项。</p>
<p>如果您为 web 元素定义了颜色，那么同样应当定义背景颜色。</p>
<p>如果不定义背景颜色，那么您的网站可能会被糟糕的颜色组合搞砸（比如红色背景上面的亮红文字，或者深色文本搭配的深色背景）。</p>
<p>如果您不规定背景颜色，可能会使文本很难被识别。</p>
</div>

<div  id="bpn">
<ul class="prenext">

<li class="pre"><a href="quality_elements.asp">Previous Page</a></li>

<li class="next"><a href="quality_readability.asp">Next Page</a></li>
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