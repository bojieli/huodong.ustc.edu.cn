
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

<title>在 Web 上播放视频</title>
</head>

<body class="multimedia">
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
<h2>Web 多媒体基础教程</h2>
<ul>
<li><a href="index.asp" title="">媒介首页</a></li>
<li><a href="media_intro.asp" title="Web 多媒体 简介">媒介简介</a></li>
<li><a href="media_soundformats.asp" title="多媒体 音频格式">音频格式</a></li>
<li><a href="media_videoformats.asp" title="多媒体 视频格式">视频格式</a></li>
<li><a href="media_browsersounds.asp" title="在 Web 上播放音频">音频播放</a></li>
<li><a href="media_browservideos.asp" title="在 Web 上播放视频">视频播放</a></li>
<li><a href="media_windowsformats.asp" title="Windows 多媒体格式">视窗格式</a></li>
</ul>

<h2>图像基础教程</h2>
<ul>
<li><a href="media_gif.asp" title="多媒体教程 - GIF 图像">GIF 图像</a></li>
<li><a href="media_jpeg.asp" title="多媒体教程 - JPEG 图像">JPEG 图像</a></li>
<li><a href="media_browserimages.asp" title="多媒体教程 - 在 Web 上使用图像">使用图像</a></li>
</ul>

<h2>Object 元素</h2>
<ul>
<li><a href="media_object.asp" title="Object 元素">Object 简介</a></li>
<li><a href="media_quicktime.asp" title="播放 QuickTime 影片">Object QuickTime</a></li>
<li><a href="media_realvideo.asp" title="播放 Real Video 影片">Object RealVideo</a></li>
</ul>

<h2>参考手册</h2>
<ul>
<li><a href="media_tagref.asp" title="Web 多媒体元素参考手册">标签参考</a></li>
<li><a href="media_playerref.asp" title="Windows Media Player 参考手册">播放器参考</a></li>
<li><a href="media_mimeref.asp" title="MIME 参考手册">MIME 参考</a></li>
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

<h1>在 Web 上播放视频</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="media_browsersounds.asp">Previous Page</a></li>

<li class="next"><a href="media_windowsformats.asp">Next Page</a></li>
</ul>

</div>

<div id="intro">
<p><strong>根据您所使用的 HTML 元素，视频可“内联地”或通过某种“助手”进行播放。</strong></p>
</div>

<div>
<h2>内联视频（Inline Videos）</h2>

<p>当视频被包含在网页中，或作为网页的一部份，它就被称为内联视频。</p>

<p>通过使用 &lt;img&gt; 元素，可向网页添加内联视频。</p>

<p>如果你计划在 web 应用程序中使用内联视频，您需要清楚一点，就是许多人对内联视频非常讨厌。也请注意，一些用户也许已经在他们的浏览器中关闭了内联视频的选项。</p>

<p>我们的建议是，最近仅仅在用户希望听到声音的地方包含内联视频。比方说在用户打开页面后，点击某个链接来观看视频。</p>
</div>

<div>
<h2>使用助手（Plug-In，插件）</h2>

<p>助手应用程序，是一种可通过浏览器启动来“帮助”浏览器播放视频的程序。助手应用程序也称为插件（Plug-Ins）。</p>

<p>助手应用程序可通过使用 &lt;embed&gt; 元素来启动，或者 &lt;applet&gt; 元素及 &lt;object&gt; 元素。</p>

<p>使用助手应用程序的一项巨大优势是，允许用户控制播放器的某些设置。</p>

<p>大多数助手应用程序允许手动地或通过编程控制音量设置以及播放功能，比如回放、暂停、停止和播放。</p>
</div>

<div>
<h2>使用 &lt;img&gt; 元素</h2>

<p>Internet Explorer 支持 &lt;img&gt; 元素中的 dynsrc 属性。</p>

<p>该元素的作用是在网页中嵌入多媒体元素：</p>

<pre>&lt;img dynsrc=&quot;video.avi&quot; /&gt;</pre>

<p>上面的代码片断为网页设置了一个嵌入的 AVI 文件。</p>

<p class="note"><span>注释：</span>dynsrc 属性不是标准的 HTML 或 XHTML 元素。仅有 Internet Explorer 支持该属性。</p>
</div>

<div>
<h2>使用 &lt;embed&gt; 元素</h2>

<p>Internet Explorer 和 Netscape 都支持 &lt;embed&gt; 元素。</p>

<p>该元素的作用是在网页中嵌入多媒体元素：</p>

<pre>&lt;embed src=&quot;video.avi&quot; /&gt;</pre>

<p>上面的代码片断为网页设置了一个嵌入的 AVI 文件。</p>

<p>您可在本教程的最后一节找到 &lt;embed&gt; 元素的属性列表。</p>

<p class="note"><span>注释：</span>Internet Explorer 和 Netscape 都支持 &lt;embed&gt; 元素，但它不是标准的 HTML 或 XHTML 元素。万维网联盟 (W3C) 推荐使用 &lt;object&gt; 元素来代替它。</p>
</div>

<div>
<h2>使用 &lt;object&gt; 元素</h2>

<p>Internet Explorer 和 Netscape 都支持 &lt;object&gt; 元素。</p>

<p>该元素的作用是在网页中嵌入多媒体元素：</p>

<pre>&lt;object data=&quot;video.avi&quot; type=&quot;video/avi&quot; /&gt;</pre>

<p>上面的代码片断在网页设置了一个嵌入的的 AVI 文件。</p>

<p>您可在本教程的最后一节找到 &lt;object&gt; 元素的属性列表。</p>
</div>

<div>
<h2>使用超链接</h2>

<p>如果网页包含了一个指向某个媒介文件的超链接，大多数浏览器都会使用“助手程序”来播放该文件：</p>

<pre>&lt;a href=&quot;video.avi&quot;&gt;点击此处来播放视频文件&lt;/a&gt;</pre>

<p>上面的代码片段设置了一个指向 AVI 文件的链接。如果用户点击该链接，浏览器将启动助手程序（比如 Windows Media Player）来播放该 AVI 文件。</p>
</div>

<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="media_browsersounds.asp">Previous Page</a></li>

<li class="next"><a href="media_windowsformats.asp">Next Page</a></li>
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
<h5 id="tools_reference"><a href="media_tagref.asp">Web 多媒体元素参考手册</a></h5>
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