
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

<title>SOAP 语法</title>
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
<h2>SOAP 教程</h2>
<ul>
<li><a href="index.asp" title="SOAP教程首页">SOAP 首页</a></li>
<li><a href="soap_intro.asp" title="SOAP简介">SOAP 简介</a></li>
<li><a href="soap_syntax.asp" title="SOAP 语法">SOAP 语法</a></li>
<li><a href="soap_envelope.asp" title="SOAP Envelope 元素">SOAP Envelope</a></li>
<li><a href="soap_header.asp" title="SOAP Header 元素">SOAP Header</a></li>
<li><a href="soap_body.asp" title="SOAP Body 元素">SOAP Body</a></li>
<li><a href="soap_fault.asp" title="SOAP Fault 元素">SOAP Fault</a></li>
<li><a href="soap_httpbinding.asp" title="SOAP HTTP Binding">SOAP HTTP Binding</a></li>
<li><a href="soap_example.asp" title="SOAP 实例">SOAP 实例</a></li>
<li><a href="soap_summary.asp" title="您已经学习了 SOAP，下一步呢？">SOAP 总结</a></li>
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

<h1>SOAP 语法</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="soap_intro.asp">Previous Page</a></li>

<li class="next"><a href="soap_envelope.asp">Next Page</a></li>
</ul>

</div>

<div>
<h2>SOAP 构建模块</h2>

<p>一条 SOAP 消息就是一个普通的 XML 文档，包含下列元素：</p>
<ul>
<li>必需的 Envelope 元素，可把此 XML 文档标识为一条 SOAP 消息</li>
<li>可选的 Header 元素，包含头部信息</li>
<li>必需的 Body 元素，包含所有的调用和响应信息</li>
<li>可选的 Fault 元素，提供有关在处理此消息所发生错误的信息</li>
</ul>

<p>所有以上的元素均被声明于针对 SOAP 封装的默认命名空间中：</p>
<p><a href="http://www.w3.org/2001/12/soap-envelope" title="soap-envelope.xml">http://www.w3.org/2001/12/soap-envelope</a></p>

<p>以及针对 SOAP 编码和数据类型的默认命名空间：</p>
<p><a href="http://www.w3.org/2001/12/soap-encoding" title="soap-encoding.xml">http://www.w3.org/2001/12/soap-encoding</a></p>
</div>

<div>
<h2>语法规则</h2>

<p>这里是一些重要的语法规则：</p>
<ul>
<li>SOAP 消息必须用 XML 来编码</li>
<li>SOAP 消息必须使用 SOAP Envelope 命名空间</li>
<li>SOAP 消息必须使用 SOAP Encoding 命名空间</li>
<li>SOAP 消息不能包含 DTD 引用</li>
<li>SOAP 消息不能包含 XML 处理指令</li>
</ul>
</div>

<div>
<h2>SOAP 消息的基本结构</h2>
<pre>&lt;?xml version=&quot;1.0&quot;?&gt;
&lt;soap:Envelope
xmlns:soap=&quot;http://www.w3.org/2001/12/soap-envelope&quot;
soap:encodingStyle=&quot;http://www.w3.org/2001/12/soap-encoding&quot;&gt;

&lt;soap:Header&gt;
  ...
  ...
&lt;/soap:Header&gt;

&lt;soap:Body&gt;
  ...
  ...
  &lt;soap:Fault&gt;
    ...
    ...
  &lt;/soap:Fault&gt;
&lt;/soap:Body&gt;

&lt;/soap:Envelope&gt;</pre>
</div>

<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="soap_intro.asp">Previous Page</a></li>

<li class="next"><a href="soap_envelope.asp">Next Page</a></li>
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