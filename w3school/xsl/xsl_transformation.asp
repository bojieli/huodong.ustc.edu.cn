
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

<title>XSLT - 转换</title>
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
<h2>XSLT 基础</h2>
<ul>
<li><a href="index.asp" title="XSLT教程首页">XSLT 首页</a></li>
<li><a href="xsl_languages.asp" title="XSL语言">XSL  语言</a></li>
<li><a href="xsl_intro.asp" title="XSLT简介">XSLT 简介</a></li>
<li><a href="xsl_browsers.asp" title="对XSLT的浏览器支持">XSLT 浏览器</a></li>
<li><a href="xsl_transformation.asp" title="使用XSLT转换XML">XSLT 转换</a></li>
<li><a href="xsl_templates.asp" title="xsl:template元素">XSLT &lt;template&gt;</a></li>
<li><a href="xsl_value_of.asp" title="xsl:value-of元素">XSLT &lt;xsl:value-of&gt;</a></li>
<li><a href="xsl_for_each.asp" title="xsl:for-each元素">XSLT &lt;for-each&gt;</a></li>
<li><a href="xsl_sort.asp" title="xsl:sort元素">XSLT &lt;sort&gt;</a></li>
<li><a href="xsl_if.asp" title="xsl:if元素">XSLT &lt;if&gt;</a></li>
<li><a href="xsl_choose.asp" title="xsl:choose元素">XSLT &lt;choose&gt;</a></li>
<li><a href="xsl_apply_templates.asp" title="xsl:apply-templates元素">XSLT apply</a></li>
</ul>

<h2>XSLT 高级</h2>
<ul>
<li><a href="xsl_client.asp" title="在客户端的XSLT">XSLT 在客户端</a></li>
<li><a href="xsl_server.asp" title="在服务器上的XSLT">XSLT 在服务器端</a></li>
<li><a href="xsl_editxml.asp" title="编辑XML">XSLT 编辑XML</a></li>
<li><a href="xsl_editors.asp" title="XSLT编辑器">XSLT 编辑器</a></li>
<li><a href="xsl_summary.asp" title="XSLT教程总结">XSLT 总结</a></li>
</ul>

<h2>参考手册</h2>
<ul>
<li><a href="xsl_w3celementref.asp" title="XSLT元素">XSLT 元素</a></li>
<li><a href="xsl_functions.asp" title="XSLT函数">XSLT 函数</a></li>
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

<h1>XSLT - 转换</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="xsl_browsers.asp">Previous Page</a></li>

<li class="next"><a href="xsl_templates.asp">Next Page</a></li>
</ul>

</div>

<div id="intro">
<p><strong>实例研究：如何使用 XSLT 将 XML 转换为 XHTML。</strong></p>
<p><strong>我们会在下一节对本例的细节进行解释。</strong></p>
</div>

<div>
<h2>正确的样式表声明</h2>
<p>把文档声明为 XSL 样式表的根元素是 &lt;xsl:stylesheet&gt; 或 &lt;xsl:transform&gt;。</p>
<p class="note"><span>注释：</span> &lt;xsl:stylesheet&gt; 和 &lt;xsl:transform&gt; 是完全同义的，均可被使用！</p>
<p>根据 W3C 的 XSLT 标准，声明 XSL 样式表的正确方法是：</p>
<pre>&lt;xsl:stylesheet version=&quot;1.0&quot; xmlns:xsl=&quot;http://www.w3.org/1999/XSL/Transform&quot;&gt;</pre>

<p>或者：</p>
<pre>&lt;xsl:transform version=&quot;1.0&quot; xmlns:xsl=&quot;http://www.w3.org/1999/XSL/Transform&quot;&gt;</pre> 

<p>如需访问 XSLT 的元素、属性以及特性，我们必须在文档顶端声明 XSLT 命名空间。</p>
<p>xmlns:xsl=&quot;http://www.w3.org/1999/XSL/Transform&quot; 指向了官方的 W3C XSLT 命名空间。如果您使用此命名空间，就必须包含属性 version=&quot;1.0&quot;。</p>
</div>

<div>
<h2>从一个原始的 XML 文档开始</h2>
<p>我们现在要把下面这个 XML 文档（&quot;cdcatalog.xml&quot;）转换为 XHTML：</p>
<pre>&lt;?xml version=&quot;1.0&quot; encoding=&quot;ISO-8859-1&quot;?&gt;
&lt;catalog&gt;
  &lt;cd&gt;
    &lt;title&gt;Empire Burlesque&lt;/title&gt;
    &lt;artist&gt;Bob Dylan&lt;/artist&gt;
    &lt;country&gt;USA&lt;/country&gt;
    &lt;company&gt;Columbia&lt;/company&gt;
    &lt;price&gt;10.90&lt;/price&gt;
    &lt;year&gt;1985&lt;/year&gt;
  &lt;/cd&gt;
.
.
.
&lt;/catalog&gt;</pre>

<h3>在 Internet Explorer 和 Firefox 中查看 XML 文件：</h3>
<p>打开 XML 文件（通常通过点击某个链接） - XML 文档会以颜色化的代码方式来显示根元素及子元素。点击元素左侧的加号或减号可展开或收缩元素的结构。如需查看原始的XML源文件（不带有加号和减号），请在浏览器菜单中选择“查看页面源代码”。</p>

<h3>在 Netscape 6 中查看 XML 文件：</h3>
<p>打开 XML 文件，然后在 XML 文件中右击，并选择“查看页面源代码”。XML文档会以颜色化的代码方式来显示根元素及子元素。</p>

<h3>在 Opera 7 中查看 XML 文件：</h3>
<p>打开 XML 文件，然后在XML文件中右击，选择“框架”/“查看源代码”。XML文档将显示为纯文本。</p>
<p><a href="cdcatalog.xml">查看&quot;cdcatalog.xml&quot;</a>。</p>
</div>

<div>
<h2>创建 XSL 样式表</h2>
<p>然后创建一个带有转换模板的 XSL 样式表（&quot;cdcatalog.xsl&quot;）：</p>
<pre>&lt;?xml version=&quot;1.0&quot; encoding=&quot;ISO-8859-1&quot;?&gt;

&lt;xsl:stylesheet version=&quot;1.0&quot; xmlns:xsl=&quot;http://www.w3.org/1999/XSL/Transform&quot;&gt;

&lt;xsl:template match=&quot;/&quot;&gt;
  &lt;html&gt;
  &lt;body&gt;
    &lt;h2&gt;My CD Collection&lt;/h2&gt;
    &lt;table border=&quot;1&quot;&gt;
    &lt;tr bgcolor=&quot;#9acd32&quot;&gt;
      &lt;th align=&quot;left&quot;&gt;Title&lt;/th&gt;
      &lt;th align=&quot;left&quot;&gt;Artist&lt;/th&gt;
    &lt;/tr&gt;
    &lt;xsl:for-each select=&quot;catalog/cd&quot;&gt;
    &lt;tr&gt;
      &lt;td&gt;&lt;xsl:value-of select=&quot;title&quot;/&gt;&lt;/td&gt;
      &lt;td&gt;&lt;xsl:value-of select=&quot;artist&quot;/&gt;&lt;/td&gt;
    &lt;/tr&gt;
    &lt;/xsl:for-each&gt;
    &lt;/table&gt;
  &lt;/body&gt;
  &lt;/html&gt;
&lt;/xsl:template&gt;

&lt;/xsl:stylesheet&gt;</pre>
<p><a href="cdcatalog.xsl">查看 &quot;cdcatalog.xsl&quot;</a></p>
</div>

<div>
<h2>把 XSL 样式表链接到 XML 文档</h2>
<p>向 XML 文档（&quot;cdcatalog.xml&quot;）添加 XSL 样式表引用：</p>
<pre>&lt;?xml version=&quot;1.0&quot; encoding=&quot;ISO-8859-1&quot;?&gt;
<code>&lt;?xml-stylesheet type=&quot;text/xsl&quot; href=&quot;cdcatalog.xsl&quot;?&gt;</code>
&lt;catalog&gt;
  &lt;cd&gt;
    &lt;title&gt;Empire Burlesque&lt;/title&gt;
    &lt;artist&gt;Bob Dylan&lt;/artist&gt;
    &lt;country&gt;USA&lt;/country&gt;
    &lt;company&gt;Columbia&lt;/company&gt;
    &lt;price&gt;10.90&lt;/price&gt;
    &lt;year&gt;1985&lt;/year&gt;
  &lt;/cd&gt;
.
.
.
&lt;/catalog&gt;</pre>
<p>如果您使用的浏览器兼容 XSLT，它会很顺利地把您的 XML <em>转换为</em> XHTML。</p>
<p><a href="cdcatalog_with_xsl.xml">查看结果</a>。</p>
<p>我们会在下一节对上面的例子中的细节进行解释。</p>
</div>

<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="xsl_browsers.asp">Previous Page</a></li>

<li class="next"><a href="xsl_templates.asp">Next Page</a></li>
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
<h5 id="tools_reference"><a href="xsl_w3celementref.asp">XSLT 参考手册</a></h5>
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