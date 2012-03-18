
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="Content-Language" content="zh-cn" />

<meta name="robots" content="all" />
<meta name="keywords" content="ASP Forms,User Input" />
<meta name="description" content="本节向您讲解如何使用ASP命令从表单中取回数据。" />

<meta name="author" content="w3school.com.cn" />
<meta name="Copyright" content="Copyright W3school.com.cn All Rights Reserved." />
<meta name="MSSmartTagsPreventParsing" content="true" />
<meta http-equiv="imagetoolbar" content="false" />

<link rel="stylesheet" type="text/css" href="../c3.css" />

<title>ASP 表单和用户输入</title>
</head>

<body class="serverscripting">
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
<h2>ASP 教程</h2>
<ul>
<li><a href="index.asp" title="ASP教程首页">ASP 首页</a></li>
<li><a href="asp_intro.asp" title="ASP 简介">ASP 简介</a></li>
<li><a href="asp_install.asp" title="如何安装ASP的运行环境">ASP 安装</a></li>
<li><a href="asp_syntax.asp" title="ASP 语法">ASP 语法</a></li>
<li><a href="asp_variables.asp" title="ASP 变量">ASP 变量</a></li>
<li><a href="asp_procedures.asp" title="ASP子程序">ASP 程序</a></li>
<li><a href="asp_inputforms.asp" title="ASP 表单">ASP 表单</a></li>
<li><a href="asp_cookies.asp" title="ASP Cookies">ASP Cookies</a></li>
<li><a href="asp_sessions.asp" title="ASP Session">ASP Session</a></li>
<li><a href="asp_applications.asp" title="ASP Application">ASP Application</a></li>
<li><a href="asp_incfiles.asp" title="ASP #include">ASP #include</a></li>
<li><a href="asp_globalasa.asp" title="ASP Global.asa">ASP Global.asa</a></li>
<li><a href="asp_send_email.asp" title="ASP e-mail">ASP e-mail</a></li>
</ul>

<h2>ASP 对象</h2>
<ul class="small">
<li><a href="asp_ref_response.asp" title="ASP Response">ASP Response</a></li>
<li><a href="asp_ref_request.asp" title="ASP Request">ASP Request</a></li>
<li><a href="asp_ref_application.asp" title="ASP Application">ASP Application</a></li>
<li><a href="asp_ref_session.asp" title="ASP Session">ASP Session</a></li>
<li><a href="asp_ref_server.asp" title="ASP Server">ASP Server</a></li>
<li><a href="asp_ref_error.asp" title="ASP Error">ASP Error</a></li>
<li class="list_apart"><a href="asp_ref_filesystem.asp" title="ASP FileSystem">ASP FileSystem</a></li>
<li><a href="asp_ref_textstream.asp" title="ASP TextStream">ASP TextStream</a></li>
<li><a href="asp_ref_drive.asp" title="ASP Drive">ASP Drive</a></li>
<li><a href="asp_ref_file.asp" title="ASP File">ASP File</a></li>
<li><a href="asp_ref_folder.asp" title="ASP Folder">ASP Folder</a></li>
<li><a href="asp_ref_dictionary.asp" title="ASP Dictionary">ASP Dictionary</a></li>
<li><a href="asp_ado.asp" title="ASP ADO">ASP ADO</a></li>
</ul>

<h2>ASP 组件</h2>
<ul class="small">
<li><a href="asp_adrotator.asp" title="ASP AdRotator">ASP AdRotator</a></li>
<li><a href="asp_browser.asp" title="ASP BrowserCap">ASP BrowserCap</a></li>
<li><a href="asp_contentlinking.asp" title="ASP Content Linking">ASP Content Linking</a></li>
<li><a href="asp_contentrotator.asp" title="ASP Content Rotator">ASP Content Rotator</a></li>
</ul>

<h2>ASP 教程总结</h2>
<ul>
<li><a href="asp_quickref.asp" title="ASP 快速参考">ASP 快速参考</a></li>
<li><a href="asp_summary.asp" title="ASP 总结">ASP 总结</a></li>
</ul>

<h2>实例/测验</h2>
<ul>
<li><a href="../example/aspe_examples.asp" title="ASP 实例">ASP 实例</a></li>
<li><a href="asp_quiz.asp" title="ASP 测验">ASP 测验</a></li>
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

<h1>ASP 表单和用户输入</h1>

<div  id="tpn">
<ul class="prenext">

<li class="pre"><a href="asp_procedures.asp">Previous Page</a></li>

<li class="next"><a href="asp_cookies.asp">Next Page</a></li>
</ul>

</div>

<div id="intro">
<p><strong>Request.QueryString 和 Request.Form 命令可用于从表单取回信息，比如用户的输入。</strong></p>
</div>


<div class="example">
<h2>实例：</h2>
<dl>
<dt><a href="../tiy/s.asp@f=demo_aspe_reqquery">使用 method=&quot;get&quot; 的表单</a></dt>
<dd>如何使用 Request.QueryString 命令与用户进行交互。</dd>

<dt><a href="../tiy/s.asp@f=demo_aspe_simpleform">使用 method=&quot;post&quot; 的表单</a></dt>
<dd>如何使用 Request.Form 命令与用户进行交互。</dd>

<dt><a href="../tiy/s.asp@f=demo_aspe_radiob">使用单选按钮的表单</a></dt>
<dd>如何使用 Request.Form 通过单选按钮与用户进行交互。</dd>
</dl>
</div>

<div>
<h2>用户输入</h2>
<p>Request 对象可用于从表单取回用户信息。</p>
<h3>表单实例：</h3>
<pre>&lt;form method=&quot;get&quot; action=&quot;simpleform.asp&quot;&gt;
First Name: &lt;input type=&quot;text&quot; name=&quot;fname&quot; /&gt;
&lt;br /&gt;
Last Name: &lt;input type=&quot;text&quot; name=&quot;lname&quot; /&gt;
&lt;br /&gt;&lt;br /&gt;
&lt;input type=&quot;submit&quot; value=&quot;Submit&quot; /&gt;
&lt;/form&gt;</pre>
<p>用户输入的信息可通过两种方式取回：Request.QueryString 或 Request.Form。</p>
</div>

<div>
<h2>Request.QueryString</h2>
<p>Request.QueryString 命令用于搜集使用 method=&quot;get&quot; 的表单中的值。使用 GET 方法从表单传送的信息对所有的用户都是可见的（出现在浏览器的地址栏），并且对所发送信息的量也有限制。</p>
<p>如果用户在上面的表单实例中输入 &quot;Bill&quot; 和 &quot;Gates&quot;，发送至服务器的 URL 会类似这样：</p>
<pre>http://www.w3school.com.cn/simpleform.asp?<code>fname=Bill</code>&amp;<code>lname=Gates</code></pre>
<p>假设 ASP 文件 &quot;simpleform.asp&quot; 包含下面的代码：</p>
<pre>&lt;body&gt;
Welcome
&lt;%
response.write(<code>request.querystring(&quot;fname&quot;)</code>)
response.write(&quot; &quot; &amp; <code>request.querystring(&quot;lname&quot;)</code>)
%&gt;
&lt;/body&gt;</pre>
<p>浏览器将显示如下：</p>
<pre>Welcome Bill Gates</pre>
</div>

<div>
<h2>Request.Form</h2>
<p>Request.Form 命令用于搜集使用 &quot;post&quot; 方法的表单中的值。使用 POST 方法从表单传送的信息对用户是不可见的，并且对所发送信息的量也没有限制。</p>
<p>如果用户在上面的表单实例中输入 &quot;Bill&quot; 和 &quot;Gates&quot;，发送至服务器的 URL 会类似这样：</p>
<pre>http://www.w3school.com.cn/simpleform.asp</pre>
<p>假设 ASP 文件 &quot;simpleform.asp&quot; 包含下面的代码：</p>
<pre>&lt;body&gt;
Welcome
&lt;%
response.write(<code>request.form(&quot;fname&quot;)</code>)
response.write(&quot; &quot; &amp; <code>request.form(&quot;lname&quot;)</code>)
%&gt;
&lt;/body&gt;</pre>
<p>浏览器将显示如下：</p>
<pre>Welcome Bill Gates</pre>
</div>

<div>
<h2>表单验证</h2>
<p>只要有可能，就应该对用户输入的数据进行验证（通过客户端的脚本）。浏览器端的验证速度更快，并可以减少服务器的负载。</p>
<p>如果用户数据会输入到数据库中，那么你应该考虑使用服务器端的验证。有一种在服务器端验证表单的好的方式，就是将（验证过的）表单传回表单页面，而不是转至不同的页面。用户随后就可以在同一个页面中得到错误的信息。这样做的话，用户就更容易发现错误了。</p>
</div>

<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="asp_procedures.asp">Previous Page</a></li>

<li class="next"><a href="asp_cookies.asp">Next Page</a></li>
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
<h5 id="tools_reference"><a href="asp_ref.asp">ASP 参考手册</a></h5>
<h5 id="tools_example"><a href="../example/aspe_examples.asp">ASP 实例</a></h5>
<h5 id="tools_quiz"><a href="asp_quiz.asp">ASP 测验</a></h5>
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