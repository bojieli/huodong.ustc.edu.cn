
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="Content-Language" content="zh-cn" />

<meta name="robots" content="all" />
<meta name="keywords" content="ASP 文件引用,ASP Including Files" />
<meta name="description" content="本节向您讲解#include命令的作用、语法以及使用时的注意事项。" />

<meta name="author" content="w3school.com.cn" />
<meta name="Copyright" content="Copyright W3school.com.cn All Rights Reserved." />
<meta name="MSSmartTagsPreventParsing" content="true" />
<meta http-equiv="imagetoolbar" content="false" />

<link rel="stylesheet" type="text/css" href="../c3.css" />

<title>ASP 文件引用</title>
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

<h1>ASP 文件引用</h1>


<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="asp_applications.asp">Previous Page</a></li>

<li class="next"><a href="asp_globalasa.asp">Next Page</a></li>
</ul>

</div>


<div id="intro">
<p><strong>#include 指令用于在多重页面上创建需重复使用的函数、页眉、页脚或者其他元素等。</strong></p>
</div>


<div>
<h2>#include 指令</h2>
<p>通过使用 #include 指令，我们可以在服务器执行 ASP 文件之前，把另一个ASP文件插入这个文件中。#include 命令用于在多个页面上创建需要重复使用的函数、页眉、页脚或者其他元素等。</p>
</div>


<div>
<h2>如何使用 #include 指令</h2>

<p>这里有一个名为 &quot;mypage.asp&quot; 的文件:</p>
<pre>&lt;html&gt; 
&lt;body&gt; 
&lt;h2&gt;Words of Wisdom:&lt;/h2&gt;
&lt;p&gt;<code>&lt;!--#include file=&quot;wisdom.inc&quot;--&gt;</code>&lt;/p&gt; 
&lt;h2&gt;The time is:&lt;/h2&gt;
&lt;p&gt;<code>&lt;!--#include file=&quot;time.inc&quot;--&gt;</code>&lt;/p&gt;
&lt;/body&gt; 
&lt;/html&gt; </pre>

<p>这是 &quot;wisdom.inc&quot; 文件:</p>
<pre>&quot;One should never increase, beyond what is necessary,
the number of entities required to explain anything.&quot;</pre>

<p>这是 &quot;time.inc&quot; 文件:</p>
<pre>&lt;%
Response.Write(Time)
%&gt;</pre>

<p>在浏览器中查看的源代码应该类似这样：</p>
<pre>&lt;html&gt;
&lt;body&gt;
&lt;h2&gt;Words of Wisdom:&lt;/h2&gt;
&lt;p&gt;&quot;One should never increase, beyond what is necessary,
the number of entities required to explain anything.&quot;&lt;/p&gt;
&lt;h2&gt;The time is:&lt;/h2&gt;
&lt;p&gt;11:33:42 AM&lt;/p&gt;
&lt;/body&gt;
&lt;/html&gt;</pre>
</div>


<div>
<h2>Including 文件的语法：</h2>

<p>如需在 ASP 中引用文件，请把 #include 命令置于注释标签之中：</p>
<pre>&lt;!--#include virtual=&quot;somefilename&quot;--&gt;</pre>

<p>或者：</p>
<pre>&lt;!--#include file =&quot;somefilename&quot;--&gt;</pre>

<h3>关键词 Virtual</h3>

<p>关键词 virtual 指示路径以虚拟目录开始。</p>

<p>如果 &quot;header.inc&quot; 文件位于虚拟目录 /html 中，下面这行代码会插入文件 &quot;header.inc&quot; 中的内容：</p>

<pre>&lt;!-- #include <code>virtual</code> =&quot;/html/header.inc&quot; --&gt;</pre>

<h3>关键词 File</h3>

<p>关键词 File 指示一个相对的路径。相对路径起始于含有引用文件的目录。</p>

<p>假设文件位于 html 文件夹的子文件夹 headers 中，下面这段代码可引用 &quot;header.inc&quot; 文件的内容：</p>
<pre>&lt;!-- #include <code>file</code> =&quot;headers\header.inc&quot; --&gt;</pre>

<p class="important"><span>注意：</span>被引用文件的路径是相对于引用文件的。假如包含 #include 声明的文件不在 html 目录中，这个声明就不会起效。</p>

<p>您也可以使用关键词 file 和语法 (..\) 来引用上级目录中的文件。</p>
</div>


<div>
<h2>提示和注释</h2>

<p>在上面的一节中，我们使用 &quot;.inc&quot; 来作为被引用文件的后缀。注意：假如用户尝试直接浏览 INC 文件，这个文件中内容就会暴露。假如被引用的文件中的内容涉及机密，那么最好还是使用 &quot;asp&quot; 作为后缀。ASP 文件中的源代码被编译后是不可见的。被引用的文件也可引用其他文件，同时一个 ASP 文件可以对同一个文件引用多次。</p>

<p class="important"><span>重要事项：</span>在脚本执行前，被引用的文件就会被处理和插入。</p>

<p>下面的代码无法执行，这是由于 ASP 会在为变量赋值之前执行 #include 命令：</p>
<pre>&lt;%
fname=&quot;header.inc&quot;
%&gt;
&lt;!--#include file=&quot;&lt;%=fname%&gt;&quot;--&gt;</pre>

<p>不能在脚本分隔符之间包含文件引用：</p>
<pre>&lt;%
For i = 1 To n
  &lt;!--#include file=&quot;count.inc&quot;--&gt;
Next
%&gt;</pre>

<p>但是这段脚本可以工作：</p>
<pre>&lt;% For i = 1 to n %&gt;
&lt;!--#include file=&quot;count.inc&quot; --&gt;
&lt;% Next %&gt;</pre>
</div>


<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="asp_applications.asp">Previous Page</a></li>

<li class="next"><a href="asp_globalasa.asp">Next Page</a></li>
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