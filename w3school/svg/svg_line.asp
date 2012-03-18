
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

<title>SVG &lt;line&gt;</title>
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
<h2>SVG 基础</h2>
<ul>
<li><a href="index.asp" title="SVG 首页">SVG 首页</a></li>
<li><a href="svg_intro.asp" title="SVG 简介">SVG 简介</a></li>
<li><a href="svg_example.asp" title="SVG 实例">SVG 实例</a></li>
<li><a href="svg_inhtml.asp" title="在HTML文档中的SVG">SVG in HTML</a></li>
</ul>

<h2>SVG 形状</h2>
<ul>
<li><a href="svg_rect.asp" title="SVG 矩形">SVG 矩形</a></li>
<li><a href="svg_circle.asp" title="SVG 圆形">SVG 圆形</a></li>
<li><a href="svg_ellipse.asp" title="SVG 椭圆">SVG 椭圆</a></li>
<li><a href="svg_line.asp" title="SVG 线条">SVG 线条</a></li>
<li><a href="svg_polygon.asp" title="SVG 多边形">SVG 多边形</a></li>
<li><a href="svg_polyline.asp" title="SVG 折线">SVG 折线</a></li>
<li><a href="svg_path.asp" title="SVG 路径">SVG 路径</a></li>
</ul>

<h2>SVG 滤镜</h2>
<ul>
<li><a href="svg_filters_intro.asp" title="SVG 滤镜简介">SVG 滤镜简介</a></li>
<li><a href="svg_filters_gaussian.asp" title="SVG 高斯滤镜">SVG 高斯滤镜</a></li>
</ul>

<h2>SVG 渐变</h2>
<ul>
<li><a href="svg_grad_linear.asp" title="SVG 线形渐变">SVG 线形渐变</a></li>
<li><a href="svg_grad_radial.asp" title="SVG 放射渐变">SVG 放射渐变</a></li>
</ul>

<h2>SVG 实例</h2>
<ul>
<li><a href="svg_examples.asp" title="SVG 实例">SVG 实例</a></li>
</ul>

<h2>SVG 参考</h2>
<ul>
<li><a href="svg_reference.asp" title="SVG 元素">SVG 元素</a></li>
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

<h1>SVG &lt;line&gt;</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="svg_ellipse.asp">Previous Page</a></li>

<li class="next"><a href="svg_polygon.asp">Next Page</a></li>
</ul>

</div>

<div class="intro">
<p><strong>&lt;line&gt; 标签用来创建线条。</strong></p>
</div>

<div>
<h2>&lt;line&gt; 标签</h2>
<p>&lt;line&gt; 标签用来创建线条。</p>
<p>请把下面的代码拷贝到记事本，然后把文件保存为 &quot;line1.svg&quot;。把此文件放入您的 web 目录：</p>
<pre>&lt;?xml version=&quot;1.0&quot; standalone=&quot;no&quot;?&gt;
&lt;!DOCTYPE svg PUBLIC &quot;-//W3C//DTD SVG 1.1//EN&quot; 
&quot;http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd&quot;&gt;

&lt;svg width=&quot;100%&quot; height=&quot;100%&quot; version=&quot;1.1&quot;
xmlns=&quot;http://www.w3.org/2000/svg&quot;&gt;

&lt;line x1=&quot;0&quot; y1=&quot;0&quot; x2=&quot;300&quot; y2=&quot;300&quot;
style=&quot;stroke:rgb(99,99,99);stroke-width:2&quot;/&gt;

&lt;/svg&gt;</pre>

<h3>代码解释：</h3>
<ul>
<li>x1 属性在 x 轴定义线条的开始</li>
<li>y1 属性在 y 轴定义线条的开始</li>
<li>x2 属性在 x 轴定义线条的结束</li>
<li>y2 属性在 y 轴定义线条的结束</li>
</ul>
<p><a href="line1.svg">查看例子</a></p>
</div>

<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="svg_ellipse.asp">Previous Page</a></li>

<li class="next"><a href="svg_polygon.asp">Next Page</a></li>
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
<h5 id="tools_reference"><a href="svg_reference.asp">SVG 参考手册</a></h5>
<h5 id="tools_example"><a href="svg_examples.asp">SVG 实例</a></h5>
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