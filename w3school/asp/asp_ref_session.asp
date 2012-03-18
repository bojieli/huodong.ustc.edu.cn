
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="Content-Language" content="zh-cn" />

<meta name="robots" content="all" />
<meta name="keywords" content="ASP Application Object" />
<meta name="description" content="Session对象的概念、作用和相关的集合、属性、方法以及事件。" />

<meta name="author" content="w3school.com.cn" />
<meta name="Copyright" content="Copyright W3school.com.cn All Rights Reserved." />
<meta name="MSSmartTagsPreventParsing" content="true" />
<meta http-equiv="imagetoolbar" content="false" />

<link rel="stylesheet" type="text/css" href="../c3.css" />

<title>ASP Session 对象</title>
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

<h1>ASP Session 对象</h1>

<div  id="tpn">
<ul class="prenext">

<li class="pre"><a href="asp_ref_application.asp">Previous Page</a></li>

<li class="next"><a href="asp_ref_server.asp">Next Page</a></li>
</ul>

</div>

<div id="intro">
<p><strong>Session 对象用于存储关于某个用户会话（session）的信息，或者修改相关的设置。存储在 session 对象中的变量掌握着单一用户的信息，同时这些信息对于页面中的所有页面都是可用的。</strong></p>
</div>

<div class="example">
<h2>实例</h2>
<dl>
<dt><a href="../tiy/s.asp@f=demo_aspe_lcid">设置并返回 LCID</a></dt>
<dd>本例演示 &quot;LCID&quot; 属性。此属性设置并返回一个指示位置或者地区的整数。类似于日期、时间以及货币等内容都要根据位置或者地区来显示。</dd>

<dt><a href="../tiy/s.asp@f=demo_aspe_sessionid">返回 SessionID</a></dt>
<dd>本例演示 &quot;SessionID&quot; 属性。该属性为每位用户返回一个唯一的 id。这个 id 由服务器生成。</dd>

<dt><a href="../tiy/s.asp@f=demo_aspe_gettimeout">session 的超时</a></dt>
<dd>本例演示 &quot;Timeout&quot; 属性。这个例子设置并返回 session 的超时时间（分钟）。</dd>
</dl>
</div>

<div>
<h2>Session 对象</h2>

<p>当您正在操作一个应用程序时，您会启动它，然后做些改变，随后关闭它。这个过程很像一次对话（Session）。计算机知道你是谁。它也知道你在何时启动和关闭这个应用程序。但是在因特网上，问题出现了：web 服务器不知道你是谁，也不知道你做什么，这是由于 HTTP 地址无法留存状态（信息）。</p>

<p>ASP 通过为每个用户创一个唯一的 cookie 解决了这个问题。cookie 发送到服务器，它包含了可识别用户的信息。这个接口称作 Session 对象。</p>

<p>Session 对象用于存储关于某个用户会话（session）的信息，或者修改相关的设置。存储在 session 对象中的变量掌握着单一用户的信息，同时这些信息对于页面中的所有页面都是可用的。存储于 session 变量中的信息通常是 name、id 以及参数等。服务器会为每位新用户创建一个新的 Session 对象，并在 session 到期后撤销这个对象。</p>

<p>下面是 Session 对象的集合、属性、方法以及事件：</p>


<h3>集合</h3>
<table class="dataintable">

<tr>
<th style="width:30%">集合</th>
<th>描述</th>
</tr>

<tr>
<td><a href="coll_contents.asp">Contents</a></td>
<td>包含所有通过脚本命令追加到 session 的条目。</td>
</tr>

<tr>
<td><a href="coll_staticobjects.asp">StaticObjects</a></td>
<td>包含了所有使用 HTML 的 &lt;object&gt; 标签追加到 session 的对象。</td>
</tr>
</table>

<h3>属性</h3>
<table class="dataintable">
<tr>
<th style="width:30%">属性</th>
<th>描述</th>
</tr>

<tr>
<td><a href="prop_codepage.asp">CodePage</a></td>
<td>规定显示动态内容时使用的字符集</td>
</tr>

<tr>
<td><a href="prop_lcid.asp">LCID</a></td>
<td>设置或返回指定位置或者地区的一个整数。诸如日期、时间以及货币的内容会根据位置或者地区来显示。</td>
</tr>

<tr>
<td><a href="prop_sessionid.asp">SessionID</a></td>
<td>为每个用户返回一个唯一的 id。此 id 由服务器生成。</td>
</tr>

<tr>
<td><a href="prop_timeout.asp">Timeout</a></td>
<td>设置或返回应用程序中的 session 对象的超时时间（分钟）。</td>
</tr>
</table>

<h3>方法</h3>
<table class="dataintable">
<tr>
<th style="width:30%">方法</th>
<th>描述</th>
</tr>

<tr>
<td><a href="met_abandon.asp">Abandon</a></td>
<td>撤销一个用户的 session。</td>
</tr>

<tr>
<td><a href="met_contents_remove.asp">Contents.Remove</a></td>
<td>从 Contents 集合删除一个项目。</td>
</tr>

<tr>
<td><a href="met_contents_removeall.asp">Contents.RemoveAll()</a></td>
<td>从 Contents 集合删除全部项目。</td>
</tr>
</table>

<h3>事件</h3>
<table class="dataintable">
<tr>
<th style="width:30%">事件</th>
<th>描述</th>
</tr>

<tr>
<td><a href="ev_sess_onend_onstart.asp">Session_OnEnd</a></td>
<td>当一个会话结束时此事件发生。</td>
</tr>

<tr>
<td><a href="ev_sess_onend_onstart.asp">Session_OnStart</a></td>
<td>当一个会话开始时此事件发生。</td>
</tr>
</table>
</div>

<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="asp_ref_application.asp">Previous Page</a></li>

<li class="next"><a href="asp_ref_server.asp">Next Page</a></li>
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