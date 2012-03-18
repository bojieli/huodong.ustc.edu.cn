
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

<title>XForms 实例</title>
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
<h2>XForms 教程</h2>
<ul>
<li><a href="index.asp" title="XForms 教程">XForms 首页</a></li>
<li><a href="xforms_intro.asp" title="XForms 简介">XForms 简介</a></li>
<li><a href="xforms_model.asp" title="XForms 模型">XForms 模型</a></li>
<li><a href="xforms_namespace.asp" title="XForms 命名空间">XForms 命名空间</a></li>
<li><a href="xforms_example.asp" title="XForms 实例">XForms 实例</a></li>
<li><a href="xforms_xpath.asp" title="XForms 和 XPath">XForms XPath</a></li>
<li><a href="xforms_input.asp" title="XForms 输入控件">XForms 输入</a></li>
<li><a href="xforms_selections.asp" title="XForms 选择控件">XForms 选择</a></li>
<li><a href="xforms_datatypes.asp" title="XForms 数据类型">XForms 数据类型</a></li>
<li><a href="xforms_properties.asp" title="XForms 属性">XForms 属性</a></li>
<li><a href="xforms_actions.asp" title="XForms 行为（Actions）">XForms 行为</a></li>
<li><a href="xforms_functions.asp" title="XForms 函数">XForms 函数</a></li>
</ul>

<h2>参考手册</h2>
<ul>
<li><a href="xforms_typeref.asp" title="XForms 数据类型参考手册">XForms 数据类型</a></li>
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

<h1>XForms 实例</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="xforms_namespace.asp">Previous Page</a></li>

<li class="next"><a href="xforms_xpath.asp">Next Page</a></li>
</ul>

</div>

<div id="intro">
<p><strong>通过 Internet Explorer 进行测试</strong></p>
<p><strong>您可以使用 Internet Explorer 5 或更高的版本来测试这个例子。</strong></p>
<p><strong>请点击例子下面的链接。</strong></p>
</div>

<div>
<h2>一个 XForms 实例</h2>
<p>请看这个使用 XForms 的文档：</p>
<pre>&lt;xforms&gt;

&lt;model&gt;
  &lt;instance&gt;
  &lt;person&gt;
    &lt;fname/&gt;
    &lt;lname/&gt;
  &lt;/person&gt;
  &lt;/instance&gt;
  &lt;submission id=&quot;form1&quot; method=&quot;get&quot;
   action=&quot;submit.asp&quot;/&gt;
&lt;/model&gt;

&lt;input ref=&quot;fname&quot;&gt;
&lt;label&gt;First Name&lt;/label&gt;&lt;/input&gt;&lt;br /&gt;

&lt;input ref=&quot;lname&quot;&gt;
&lt;label&gt;Last Name&lt;/label&gt;&lt;/input&gt;&lt;br /&gt;&lt;br /&gt;

&lt;submit submission=&quot;form1&quot;&gt;
&lt;label&gt;Submit&lt;/label&gt;&lt;/submit&gt;

&lt;/xforms&gt;</pre>

<p>页面会显示为这样：</p>
<img src="i/xforms_model_01.gif" alt="xforms_example" />

<p>在您的计算机上测试这个例子</p>
</div>

<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="xforms_namespace.asp">Previous Page</a></li>

<li class="next"><a href="xforms_xpath.asp">Next Page</a></li>
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
<h5 id="tools_reference"><a href="xforms_typeref.asp">XForms 参考手册</a></h5>
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