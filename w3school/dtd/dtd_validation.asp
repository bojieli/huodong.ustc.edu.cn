
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

<title>DTD 验证</title>
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
<h2>DTD 教程</h2>
<ul>
<li><a href="index.asp" title="DTD 教程">DTD 首页</a></li>
<li><a href="dtd_intro.asp" title="DTD 简介">DTD 简介</a></li>
<li><a href="dtd_building.asp" title="DTD - XML 构建模块">DTD 构建模块</a></li>
<li><a href="dtd_elements.asp" title="DTD - 元素">DTD 元素</a></li>
<li><a href="dtd_attributes.asp" title="DTD - 属性">DTD 属性</a></li>
<li><a href="dtd_entities.asp" title="DTD - 实体">DTD 实体</a></li>
<li><a href="dtd_validation.asp" title="DTD 验证">DTD 验证</a></li>
<li><a href="dtd_examples.asp" title="DTD - 来自网络的实例">DTD 实例</a></li>
<li><a href="dtd_summary.asp" title="您已经学习了DTD，下一步呢？">DTD 总结</a></li>
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

<h1>DTD 验证</h1>

<div  id="tpn">
<ul class="prenext">

<li class="pre"><a href="dtd_entities.asp">Previous Page</a></li>

<li class="next"><a href="dtd_examples.asp">Next Page</a></li>
</ul>

</div>

<div id="intro">
<p><strong>Internet Explorer 5.0 可根据某个 DTD 来验证您的 XML。</strong></p>
</div>

<div>
<h2>通过 XML 解析器进行验证</h2>

<p>当您试图打开某个 XML 文档时，XML 解析器有可能会产生错误。通过访问 parseError 对象，就可以取回引起错误的确切代码、文本甚至所在的行。</p>

<p class="note"><span>注释：</span>load( ) 方法用于文件，而 loadXML( ) 方法用于字符串。</p>

<pre>var xmlDoc = new ActiveXObject(&quot;Microsoft.XMLDOM&quot;)
xmlDoc.async=&quot;false&quot;
xmlDoc.validateOnParse=&quot;true&quot;
xmlDoc.load(&quot;note_dtd_error.xml&quot;)

document.write(&quot;&lt;br&gt;Error Code: &quot;)
document.write(xmlDoc.parseError.errorCode)
document.write(&quot;&lt;br&gt;Error Reason: &quot;)
document.write(xmlDoc.parseError.reason)
document.write(&quot;&lt;br&gt;Error Line: &quot;)
document.write(xmlDoc.parseError.line)</pre>

<p><a href="../tiy/t.asp@f=dtde_note_error_three">Try it Yourself</a> 或者 <a href="../example/dtde/note_dtd_error.xml">仅仅看一下这个 XML 文件</a>。</p>
</div>

<div>
<h2>关闭验证</h2>
<p>通过把 XML 解析器的 validateOnParse 设置为 &quot;false&quot;，就可以关闭验证。</p>

<pre>var xmlDoc = new ActiveXObject(&quot;Microsoft.XMLDOM&quot;)
xmlDoc.async=&quot;false&quot;
xmlDoc.validateOnParse=&quot;false&quot;
xmlDoc.load(&quot;note_dtd_error.xml&quot;)

document.write(&quot;&lt;br&gt;Error Code: &quot;)
document.write(xmlDoc.parseError.errorCode)
document.write(&quot;&lt;br&gt;Error Reason: &quot;)
document.write(xmlDoc.parseError.reason)
document.write(&quot;&lt;br&gt;Error Line: &quot;)
document.write(xmlDoc.parseError.line)</pre>

<p><a href="../tiy/t.asp@f=dtde_note_error_four">Try it Yourself</a></p>
</div>

<div>
<h2>通用的 XML 验证器</h2>
<p>为了帮助您验证 XML 文件，我们创建了此链接，这样你就可以验证任何 XML 文件了。</p>
</div>

<div>
<h2>parseError 对象</h2>
<p>您可以在我们的《<a href="../xmldom/index.asp" title="XML DOM 教程">XML DOM 教程</a>》中阅读更多有关 parseError 对象的信息。</p>
</div>

<div  id="bpn">
<ul class="prenext">

<li class="pre"><a href="dtd_entities.asp">Previous Page</a></li>

<li class="next"><a href="dtd_examples.asp">Next Page</a></li>
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