
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

<title>ASP ASPError 对象的属性</title>
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
<h1>ASP ASPError 对象的属性</h1>

<div><a href="asp_ref_error.asp">ASP ASPError 对象参考手册</a></div>

<div>
<h2>ASPCode</h2>
<p>ASPCode 属性返回由 IIS 生成的错误代码。</p>
</div>

<div>
<h2>ASPDescription</h2>
<p>ASPDescription 属性返回错误的详细描述。</p>
</div>

<div>
<h2>Category</h2>
<p>Category 属性返回错误源（错误是由 IIS 、脚本语言还是组件产生的？）</p>
</div>

<div>
<h2>Column</h2>
<p>Column 属性返回产生错误的 ASP 文件中的列位置。</p>
</div>

<div>
<h2>Description</h2>
<p>Description 属性返回关于错误的简要描述。</p>
</div>

<div>
<h2>File</h2>
<p>File 属性返回产生错误的 ASP 文件的名称。</p>
</div>

<div>
<h2>Line</h2>
<p>Line 属性返回产生错误的 ASP 文件中的行位置。</p>
</div>

<div>
<h2>Number</h2>
<p>Number 属性返回错误的标准 COM 错误代码。</p>
</div>

<div>
<h2>Source</h2>
<p>Source 属性返回错误发生行的实际源代码。</p>
</div>

<div>
<h2>语法</h2>
<pre>ASPError.ASPCode()
ASPError.ASPDescription()
ASPError.Category()
ASPError.Column()
ASPError.Description()
ASPError.File()
ASPError.Line()
ASPError.Number()
ASPError.Source()</pre>
</div>

<div>
<h2>实例</h2>
<pre>&lt;%
dim objErr
set objErr=Server.GetLastError()

response.write(&quot;ASPCode=&quot; &amp; objErr.ASPCode)
response.write(&quot;&lt;br /&gt;&quot;)
response.write(&quot;ASPDescription=&quot; &amp; objErr.ASPDescription)
response.write(&quot;&lt;br /&gt;&quot;)
response.write(&quot;Category=&quot; &amp; objErr.Category)
response.write(&quot;&lt;br /&gt;&quot;)
response.write(&quot;Column=&quot; &amp; objErr.Column)
response.write(&quot;&lt;br /&gt;&quot;)
response.write(&quot;Description=&quot; &amp; objErr.Description)
response.write(&quot;&lt;br /&gt;&quot;)
response.write(&quot;File=&quot; &amp; objErr.File)
response.write(&quot;&lt;br /&gt;&quot;)
response.write(&quot;Line=&quot; &amp; objErr.Line)
response.write(&quot;&lt;br /&gt;&quot;)
response.write(&quot;Number=&quot; &amp; objErr.Number)
response.write(&quot;&lt;br /&gt;&quot;)
response.write(&quot;Source=&quot; &amp; objErr.Source)
%&gt;</pre>
</div>

<div><a href="asp_ref_error.asp">ASP ASPError 对象参考手册</a></div>

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