
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

<title>PHP filter_id() 函数</title>
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
<h2>PHP 基础</h2>
<ul>
<li><a href="index.asp" title="PHP 教程">PHP 教程</a></li>
<li><a href="php_intro.asp" title="PHP简介">PHP 简介</a></li>
<li><a href="php_install.asp" title="PHP 安装">PHP 安装</a></li>
<li><a href="php_syntax.asp" title="PHP 语法">PHP 语法</a></li>
<li><a href="php_variables.asp" title="PHP 变量">PHP 变量</a></li>
<li><a href="php_string.asp" title="PHP 字符串">PHP 字符串</a></li>
<li><a href="php_operators.asp" title="PHP 运算符">PHP 运算符</a></li>
<li><a href="php_if_else.asp" title="PHP If...Else 语句">PHP If...Else</a></li>
<li><a href="php_switch.asp" title="PHP Switch 语句">PHP Switch</a></li>
<li><a href="php_arrays.asp" title="PHP 数组">PHP 数组</a></li>
<li><a href="php_looping.asp" title="PHP 循环">PHP 循环</a></li>
<li><a href="php_functions.asp" title="PHP 函数">PHP 函数</a></li>
<li><a href="php_forms.asp" title="PHP 表单和用户输入">PHP 表单</a></li>
<li><a href="php_get.asp" title="PHP $_GET">PHP $_GET</a></li>
<li><a href="php_post.asp" title="PHP $_POST">PHP $_POST</a></li>
</ul>

<h2>PHP 高级</h2>
<ul>
<li><a href="php_date.asp" title="">PHP 日期</a></li>
<li><a href="php_includes.asp" title="">PHP 引用</a></li>
<li><a href="php_file.asp" title="">PHP 文件</a></li>
<li><a href="php_file_upload.asp" title="">PHP 文件上传</a></li>
<li><a href="php_cookies.asp" title="">PHP Cookies</a></li>
<li><a href="php_sessions.asp" title="">PHP Sessions</a></li>
<li><a href="php_mail.asp" title="">PHP E-mail</a></li>
<li><a href="php_secure_mail.asp" title="">PHP 安全 E-mail</a></li>
<li><a href="php_error.asp" title="">PHP Error</a></li>
<li><a href="php_exception.asp" title="">PHP Exception</a></li>
<li><a href="php_filter.asp" title="">PHP Filter</a></li>
</ul>

<h2>PHP 数据库</h2>
<ul class="small">
<li><a href="php_mysql_intro.asp" title="">MySQL 简介</a></li>
<li><a href="php_mysql_connect.asp" title="">MySQL Connect</a></li>
<li><a href="php_mysql_create.asp" title="">MySQL Create</a></li>
<li><a href="php_mysql_insert.asp" title="">MySQL Insert</a></li>
<li><a href="php_mysql_select.asp" title="">MySQL Select</a></li>
<li><a href="php_mysql_where.asp" title="">MySQL Where</a></li>
<li><a href="php_mysql_order_by.asp" title="">MySQL Order By</a></li>
<li><a href="php_mysql_update.asp" title="">MySQL Update</a></li>
<li><a href="php_mysql_delete.asp" title="">MySQL Delete</a></li>
<li><a href="php_db_odbc.asp" title="">PHP ODBC</a></li>
</ul>

<h2>PHP XML</h2>
<ul class="small">
<li><a href="php_xml_parser_expat.asp" title="">XML Expat Parser</a></li>
<li><a href="php_xml_dom.asp" title="">XML DOM</a></li>
<li><a href="php_xml_simplexml.asp" title="">XML SimpleXML</a></li>
</ul>

<h2>PHP 和 AJAX</h2>
<ul class="small">
<li><a href="php_ajax_intro.asp" title="AJAX 简介">AJAX 简介</a></li>
<li><a href="php_ajax_xmlhttprequest.asp" title="AJAX XMLHttpRequest">XMLHttpRequest</a></li>
<li><a href="php_ajax_suggest.asp" title="PHP 和 AJAX 请求">AJAX Suggest</a></li>
<li><a href="php_ajax_xml.asp" title="PHP 和 AJAX XML 实例">AJAX XML</a></li>
<li><a href="php_ajax_database.asp" title="PHP 和 AJAX MySQL 数据库实例">AJAX Database</a></li>
<li><a href="php_ajax_responsexml.asp" title="PHP 和 AJAX responseXML 实例">AJAX responseXML</a></li>
<li><a href="php_ajax_livesearch.asp" title="PHP 和 AJAX Live Search">AJAX Live Search</a></li>
<li><a href="php_ajax_rss_reader.asp" title="PHP 和 AJAX RSS 阅读器">AJAX RSS Reader</a></li>
<li><a href="php_ajax_poll.asp" title="PHP 和 AJAX 投票">AJAX Poll</a></li>
</ul>

<h2>PHP 参考手册</h2>
<ul class="small">
<li><a href="php_ref_array.asp" title="PHP Array 函数">PHP Array</a></li>
<li><a href="php_ref_calendar.asp" title="PHP Calendar 函数">PHP Calendar</a></li>
<li><a href="php_ref_date.asp" title="PHP Date / Time 函数">PHP Date</a></li>
<li><a href="php_ref_directory.asp" title="PHP Directory 函数">PHP Directory</a></li>
<li><a href="php_ref_error.asp" title="PHP Error 和 Logging 函数">PHP Error</a></li>
<li><a href="php_ref_filesystem.asp" title="PHP Filesystem 函数">PHP Filesystem</a></li>
<li><a href="php_ref_filter.asp" title="PHP Filter 函数">PHP Filter</a></li>
<li><a href="php_ref_ftp.asp" title="PHP FTP 函数">PHP FTP</a></li>
<li><a href="php_ref_http.asp" title="PHP HTTP 函数">PHP HTTP</a></li>
<li><a href="php_ref_libxml.asp" title="PHP libxml 函数">PHP LibXML</a></li>
<li><a href="php_ref_mail.asp" title="PHP Mail 函数">PHP Mail</a></li>
<li><a href="php_ref_math.asp" title="PHP Math 函数">PHP Math</a></li>
<li><a href="php_ref_mysql.asp" title="PHP MySQL 函数">PHP MySQL</a></li>
<li><a href="php_ref_simplexml.asp" title="PHP SimpleXML 函数">PHP SimpleXML</a></li>
<li><a href="php_ref_string.asp" title="PHP String 函数">PHP String</a></li>
<li><a href="php_ref_xml.asp" title="PHP XML Parser 函数">PHP XML</a></li>
<li><a href="php_ref_zip.asp" title="PHP Zip File 函数">PHP Zip</a></li>
<li><a href="php_ref_misc.asp" title="PHP 杂项函数">PHP 杂项</a></li>
</ul>

<h2>PHP 测验</h2>
<ul>
<li>PHP Quiz</li>
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

<h1>PHP filter_id() 函数</h1>

<div class="backtoreference">
<p><a href="php_ref_filter.asp" title="PHP Filter 函数">PHP Filter 函数</a></p>
</div>

<div>
<h2>定义和用法</h2>

<p>filter_id() 函数返回指定过滤器的 ID 号。</p>

<p>若成功，则返回过滤器的 ID 号。如果该过滤器不存在，则返回 NULL。</p>


<h3>语法</h3>
<pre>filter_id(filter_name)</pre>

<table class="dataintable">
  <tr>
    <th>参数</th>
    <th>描述</th>
  </tr>  
  <tr>
    <td>type</td>
    <td>
	<p>必需。规定被获取 ID 号的过滤器。必须是过滤器名称（不是过滤器 ID 名）。</p>
	<p>请使用 <a href="func_filter_list.asp" title="PHP filter_list() 函数">filter_list()</a> 函数来获取所有被支持的过滤器的名称。</p>
	</td>
  </tr>
</table>

</div>


<div>
<h2>例子</h2>


<pre>&lt;?php
echo(<code>filter_id(&quot;validate_email&quot;)</code>);
?&gt;</pre>

<p>输出类似：</p>

<pre>274</pre>
</div>


<div class="backtoreference">
<p><a href="php_ref_filter.asp" title="PHP Filter 函数">PHP Filter 函数</a></p>
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
<h5 id="tools_reference"><a href="php_ref.asp">PHP 参考手册</a></h5>
<h5 id="tools_quiz"><a href="php_quiz.asp">PHP 测验</a></h5>
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