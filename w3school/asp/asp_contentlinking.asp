
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="Content-Language" content="zh-cn" />

<meta name="robots" content="all" />
<meta name="keywords" content="ASP Content Linking Component" />
<meta name="description" content="Content Linking组件的应用例子、语法、用法以及相关方法（Method）。" />

<meta name="author" content="w3school.com.cn" />
<meta name="Copyright" content="Copyright W3school.com.cn All Rights Reserved." />
<meta name="MSSmartTagsPreventParsing" content="true" />
<meta http-equiv="imagetoolbar" content="false" />

<link rel="stylesheet" type="text/css" href="../c3.css" />

<title>ASP Content Linking 组件</title>
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

<h1>ASP Content Linking 组件</h1>

<div  id="tpn">
<ul class="prenext">

<li class="pre"><a href="asp_browser.asp">Previous Page</a></li>

<li class="next"><a href="asp_contentrotator.asp">Next Page</a></li>
</ul>

</div>

<div class="example">
<h2>实例</h2>
<dl>
<dt><a href="../tiy/s.asp@f=demo_aspe_contentlinking">Content Linking 组件</a></dt>
<dd>本例会构建一个内容列表。</dd>

<dt><a href="../tiy/s.asp@f=demo_aspe_contentlinking2">Content Linking 组件 2</a></dt>
<dd>本例使用 Content Linking 组件在一个文本文件所列的页面间进行导航。</dd>
</dl>
</div>

<div>
<h2>ASP Content Linking 组件</h2>

<p>ASP Content Linking 组件用于创建快捷便利的导航系统。</p>
<p>Content Linking 组件会返回一个 Nextlink 对象，这个对象用于容纳需要导航网页的一个列表。</p>

<h3>语法</h3>
<pre>&lt;%
Set nl=Server.CreateObject( &quot;MSWC.NextLink&quot; )
%&gt;</pre>

<p>首先，我们会创建文本文件 - &quot;links.txt&quot;。此文件包含需要导航的页面的相关信息。页面的排列顺序应该与它们的显示顺序相同，并包含对每个文件的描述（使用制表符来分隔文件名和描述信息）。</p>

<p class="note"><span>注释：</span>如果你希望向列表添加文件信息，或者改变在列表中的页面顺序，那么你需要做的所有事情仅仅是修改这个文本文件而已！然后导航系统会自动地更新！</p>

<p>&quot;links.txt&quot;:</p>
<pre>
asp_intro.asp ASP 简介
asp_syntax.asp ASP 语法
asp_variables.asp ASP 变量
asp_procedures.asp ASP 程序 
</pre>

<p>请在上面列出的页面中放置这行代码：&lt;!-- #include file=&quot;nlcode.inc&quot;--&gt;。这行代码会在 &quot;links.txt&quot; 中列出每个页面上引用下面这段代码，这样导航就可以工作了。</p>

<p>&quot;nlcode.inc&quot;:</p>

<pre>&lt;%
'Use the Content Linking Component 
'to navigate between the pages listed
'in links.txt

dim nl
Set nl=Server.CreateObject(&quot;MSWC.NextLink&quot;)
if (nl.GetListIndex(&quot;links.txt&quot;)&gt;1) then
  Response.Write(&quot;&lt;a href='&quot; &amp; nl.GetPreviousURL(&quot;links.txt&quot;))
  Response.Write(&quot;'&gt;Previous Page&lt;/a&gt;&quot;)
end if
Response.Write(&quot;&lt;a href='&quot; &amp; nl.GetNextURL(&quot;links.txt&quot;))
Response.Write(&quot;'&gt;Next Page&lt;/a&gt;&quot;)
%&gt;</pre>
</div>

<div>
<h2>ASP Content Linking 组件的方法</h2>

<h3>GetListCount 方法</h3>

<p>返回内容链接列表文件中所列项目的数目：</p>
<pre>&lt;%
dim nl,c
Set nl=Server.CreateObject(&quot;MSWC.NextLink&quot;) 
c=nl.GetListCount(&quot;links.txt&quot;) 
Response.Write(&quot;There are &quot;)
Response.Write(c)
Response.Write(&quot; items in the list&quot;)
%&gt;</pre>
<p>输出：</p>
<p>There are 4 items in the list</p>


<h3>GetListIndex 方法</h3>
<p>返回在内容链接列表文件中当前文件的索引号。第一个条目的索引号是 1。假如当前页面不在列表文件中，则返回 0。</p>
<h4>例子</h4>
<pre>&lt;%
dim nl,c
Set nl=Server.CreateObject(&quot;MSWC.NextLink&quot;) 
c=nl.GetListIndex(&quot;links.txt&quot;) 
Response.Write(&quot;Item number &quot;)
Response.Write(c)
%&gt;</pre>
<p>输出：</p>
<p>Item number 3</p>


<h3>GetNextDescription 方法</h3>
<p>返回在内容链接列表文件中所列的下一个条目的文本描述。假如在列表文件中没有找到当前文件，则列表中最后一个页面的文本描述。</p>
<h4>例子</h4>
<pre>
&lt;%
dim nl,c
Set nl=Server.CreateObject(&quot;MSWC.NextLink&quot;) 
c=nl.GetNextDescription(&quot;links.txt&quot;) 
Response.Write(&quot;Next &quot;)
Response.Write(&quot;description is: &quot;)
Response.Write(c)
%&gt;
</pre>
<p>输出：Next description is: ASP Variables</p>


<h3>GetNextURL 方法</h3>
<p>返回在内容链接列表文件中所列的下一个条目的 URL。假如在列表文件中没有找到当前文件，则列表中最后一个页面的 URL。</p>
<h4>例子</h4>
<pre>&lt;%
dim nl,c
Set nl=Server.CreateObject(&quot;MSWC.NextLink&quot;) 
c=nl.GetNextURL(&quot;links.txt&quot;) 
Response.Write(&quot;Next &quot;)
Response.Write(&quot;URL is: &quot;)
Response.Write(c)
%&gt;</pre>
<p>输出：Next URL is: asp_variables.asp</p>


<h3>GetNthDescription 方法</h3>
<p>返在内容链接列表文件中所列的第 N 个页面的描述信息。</p>
<h4>例子</h4>
<pre>&lt;%
dim nl,c
Set nl=Server.CreateObject(&quot;MSWC.NextLink&quot;) 
c=nl.GetNthDescription(&quot;links.txt&quot;,3) 
Response.Write(&quot;Third &quot;)
Response.Write(&quot;description is: &quot;)
Response.Write(c)
%&gt;</pre>
<p>输出：Third description is: ASP Variables</p>


<h3>GetNthURL 方法</h3>
<p>返在内容链接列表文件中所列的第 N 个页面的 URL。</p>
<h4>例子</h4>
<pre>&lt;%
dim nl,c
Set nl=Server.CreateObject(&quot;MSWC.NextLink&quot;) 
c=nl.GetNthURL(&quot;links.txt&quot;,3) 
Response.Write(&quot;Third &quot;)
Response.Write(&quot;URL is: &quot;)
Response.Write(c)
%&gt;</pre>
<p>输出：Third URL is: asp_variables.asp</p>



<h3>GetPreviousDescription 方法</h3>
<p>返回在内容链接列表文件中所列前一个条目的文本描述。假如在列表文件中没有找到当前文件，则列表中第一个页面的文本描述。</p>
<h4>例子</h4>
<pre>&lt;%
dim nl,c
Set nl=Server.CreateObject(&quot;MSWC.NextLink&quot;) 
c=nl.GetPreviousDescription(&quot;links.txt&quot;) 
Response.Write(&quot;Previous &quot;)
Response.Write(&quot;description is: &quot;)
Response.Write(c)
%&gt;</pre>
<p>输出：Previous description is: ASP Variables</p>


<h3>GetPreviousURL 方法</h3>
<p>返回在内容链接列表文件中所列前一个条目的 URL。假如在列表文件中没有找到当前文件，则列表中第一个页面的URL。</p>
<h4>例子</h4>
<pre>&lt;%
dim nl,c
Set nl=Server.CreateObject(&quot;MSWC.NextLink&quot;) 
c=nl.GetPreviousURL(&quot;links.txt&quot;) 
Response.Write(&quot;Previous &quot;)
Response.Write(&quot;URL is: &quot;)
Response.Write(c)
%&gt;</pre>
<p>输出：Previous URL is: asp_variables.asp</p>
</div>

<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="asp_browser.asp">Previous Page</a></li>

<li class="next"><a href="asp_contentrotator.asp">Next Page</a></li>
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