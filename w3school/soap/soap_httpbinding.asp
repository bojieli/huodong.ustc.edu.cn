
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

<title>SOAP HTTP Binding</title>
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

<h1>SOAP HTTP Binding</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="soap_fault.asp">Previous Page</a></li>

<li class="next"><a href="soap_example.asp">Next Page</a></li>
</ul>

</div>

<div>
<h2>HTTP 协议</h2>

<p>HTTP 在 TCP/IP 之上进行通信。HTTP 客户机使用 TCP 连接到 HTTP 服务器。在建立连接之后，客户机可向服务器发送 HTTP 请求消息：</p>
<pre>
POST /item HTTP/1.1
Host: 189.123.345.239
Content-Type: text/plain
Content-Length: 200
</pre>

<p>随后服务器会处理此请求，然后向客户机发送一个 HTTP 响应。此响应包含了可指示请求状态的状态代码：</p>
<pre>
200 OK
Content-Type: text/plain
Content-Length: 200
</pre>

<p>在上面的例子中，服务器返回了一个 200 的状态代码。这是 HTTP 的标准成功代码。</p>
<p>假如服务器无法对请求进行解码，它可能会返回类似这样的信息：</p>
<pre>
400 Bad Request
Content-Length: 0
</pre>
</div>

<div>
<h2>SOAP HTTP Binding</h2>
<p>SOAP 方法指的是遵守 SOAP 编码规则的 HTTP 请求/响应。</p>
<p><strong>HTTP + XML = SOAP</strong></p>
<p>SOAP 请求可能是 HTTP POST 或 HTTP GET 请求。</p>
<p>HTTP POST 请求规定至少两个 HTTP 头：Content-Type 和 Content-Length。</p>
</div>

<div>
<h2>Content-Type</h2>
<p>SOAP 的请求和响应的 Content-Type 头可定义消息的 MIME 类型，以及用于请求或响应的 XML 主体的字符编码（可选）。</p>

<h3>语法</h3>
<pre>Content-Type: MIMEType; charset=character-encoding </pre>

<h3>例子</h3>
<pre>POST /item HTTP/1.1
Content-Type: application/soap+xml; charset=utf-8</pre>
</div>

<div>
<h2>Content-Length</h2>

<p>SOAP 的请求和响应的 Content-Length 头规定请求或响应主体的字节数。</p>

<h3>语法</h3>
<pre>Content-Length: bytes </pre>

<h3>例子</h3>
<pre>POST /item HTTP/1.1
Content-Type: application/soap+xml; charset=utf-8
Content-Length: 250</pre>
</div>

<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="soap_fault.asp">Previous Page</a></li>

<li class="next"><a href="soap_example.asp">Next Page</a></li>
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