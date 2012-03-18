
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

<title>PHP array_product() ����</title>
</head>

<body class="serverscripting">
<div id="wrapper">

<div id="header">
<a href="../index.html" title="w3school ���߽̳�" style="float:left;">w3school ���߽̳�</a>
<div id="ad_head">
<script type="text/javascript"><!--
google_ad_client = "pub-3381531532877742";
/* 728x90, ������ 08-12-1 */
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
<li id="h"><a href="../h.asp" title="HTML ϵ�н̳�">HTML�̳�</a></li>
<li id="x"><a href="../x.asp" title="XML ϵ�н̳�">XML�̳�</a></li>
<li id="b"><a href="../b.asp" title="������ű�ϵ�н̳�">������ű�</a></li>
<li id="s"><a href="../s.asp" title="�������ű�ϵ�н̳�">�������ű�</a></li>
<li id="d"><a href="../d.asp" title=".NET (dotnet) �̳�">dot net�̳�</a></li>
<li id="m"><a href="../m.asp" title="��ý��ϵ�н̳�">��ý��̳�</a></li>
<li id="w"><a href="../w.asp" title="��վ�����ֲ�">��վ�ֲ�</a></li>
</ul>
</div><div id="navsecond">

<div id="course">
<h2>PHP ����</h2>
<ul>
<li><a href="index.asp" title="PHP �̳�">PHP �̳�</a></li>
<li><a href="php_intro.asp" title="PHP���">PHP ���</a></li>
<li><a href="php_install.asp" title="PHP ��װ">PHP ��װ</a></li>
<li><a href="php_syntax.asp" title="PHP �﷨">PHP �﷨</a></li>
<li><a href="php_variables.asp" title="PHP ����">PHP ����</a></li>
<li><a href="php_string.asp" title="PHP �ַ���">PHP �ַ���</a></li>
<li><a href="php_operators.asp" title="PHP �����">PHP �����</a></li>
<li><a href="php_if_else.asp" title="PHP If...Else ���">PHP If...Else</a></li>
<li><a href="php_switch.asp" title="PHP Switch ���">PHP Switch</a></li>
<li><a href="php_arrays.asp" title="PHP ����">PHP ����</a></li>
<li><a href="php_looping.asp" title="PHP ѭ��">PHP ѭ��</a></li>
<li><a href="php_functions.asp" title="PHP ����">PHP ����</a></li>
<li><a href="php_forms.asp" title="PHP �������û�����">PHP ����</a></li>
<li><a href="php_get.asp" title="PHP $_GET">PHP $_GET</a></li>
<li><a href="php_post.asp" title="PHP $_POST">PHP $_POST</a></li>
</ul>

<h2>PHP �߼�</h2>
<ul>
<li><a href="php_date.asp" title="">PHP ����</a></li>
<li><a href="php_includes.asp" title="">PHP ����</a></li>
<li><a href="php_file.asp" title="">PHP �ļ�</a></li>
<li><a href="php_file_upload.asp" title="">PHP �ļ��ϴ�</a></li>
<li><a href="php_cookies.asp" title="">PHP Cookies</a></li>
<li><a href="php_sessions.asp" title="">PHP Sessions</a></li>
<li><a href="php_mail.asp" title="">PHP E-mail</a></li>
<li><a href="php_secure_mail.asp" title="">PHP ��ȫ E-mail</a></li>
<li><a href="php_error.asp" title="">PHP Error</a></li>
<li><a href="php_exception.asp" title="">PHP Exception</a></li>
<li><a href="php_filter.asp" title="">PHP Filter</a></li>
</ul>

<h2>PHP ���ݿ�</h2>
<ul class="small">
<li><a href="php_mysql_intro.asp" title="">MySQL ���</a></li>
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

<h2>PHP �� AJAX</h2>
<ul class="small">
<li><a href="php_ajax_intro.asp" title="AJAX ���">AJAX ���</a></li>
<li><a href="php_ajax_xmlhttprequest.asp" title="AJAX XMLHttpRequest">XMLHttpRequest</a></li>
<li><a href="php_ajax_suggest.asp" title="PHP �� AJAX ����">AJAX Suggest</a></li>
<li><a href="php_ajax_xml.asp" title="PHP �� AJAX XML ʵ��">AJAX XML</a></li>
<li><a href="php_ajax_database.asp" title="PHP �� AJAX MySQL ���ݿ�ʵ��">AJAX Database</a></li>
<li><a href="php_ajax_responsexml.asp" title="PHP �� AJAX responseXML ʵ��">AJAX responseXML</a></li>
<li><a href="php_ajax_livesearch.asp" title="PHP �� AJAX Live Search">AJAX Live Search</a></li>
<li><a href="php_ajax_rss_reader.asp" title="PHP �� AJAX RSS �Ķ���">AJAX RSS Reader</a></li>
<li><a href="php_ajax_poll.asp" title="PHP �� AJAX ͶƱ">AJAX Poll</a></li>
</ul>

<h2>PHP �ο��ֲ�</h2>
<ul class="small">
<li><a href="php_ref_array.asp" title="PHP Array ����">PHP Array</a></li>
<li><a href="php_ref_calendar.asp" title="PHP Calendar ����">PHP Calendar</a></li>
<li><a href="php_ref_date.asp" title="PHP Date / Time ����">PHP Date</a></li>
<li><a href="php_ref_directory.asp" title="PHP Directory ����">PHP Directory</a></li>
<li><a href="php_ref_error.asp" title="PHP Error �� Logging ����">PHP Error</a></li>
<li><a href="php_ref_filesystem.asp" title="PHP Filesystem ����">PHP Filesystem</a></li>
<li><a href="php_ref_filter.asp" title="PHP Filter ����">PHP Filter</a></li>
<li><a href="php_ref_ftp.asp" title="PHP FTP ����">PHP FTP</a></li>
<li><a href="php_ref_http.asp" title="PHP HTTP ����">PHP HTTP</a></li>
<li><a href="php_ref_libxml.asp" title="PHP libxml ����">PHP LibXML</a></li>
<li><a href="php_ref_mail.asp" title="PHP Mail ����">PHP Mail</a></li>
<li><a href="php_ref_math.asp" title="PHP Math ����">PHP Math</a></li>
<li><a href="php_ref_mysql.asp" title="PHP MySQL ����">PHP MySQL</a></li>
<li><a href="php_ref_simplexml.asp" title="PHP SimpleXML ����">PHP SimpleXML</a></li>
<li><a href="php_ref_string.asp" title="PHP String ����">PHP String</a></li>
<li><a href="php_ref_xml.asp" title="PHP XML Parser ����">PHP XML</a></li>
<li><a href="php_ref_zip.asp" title="PHP Zip File ����">PHP Zip</a></li>
<li><a href="php_ref_misc.asp" title="PHP �����">PHP ����</a></li>
</ul>

<h2>PHP ����</h2>
<ul>
<li>PHP Quiz</li>
</ul>
</div>

<div id="selected">
<h2>��վ�ֲ�</h2>
<ul>
<li><a href="../site/index.asp" title="��վ����">��վ����</a></li>
<li><a href="../w3c/index.asp" title="��ά������ (W3C)">��ά������ (W3C)</a></li>
<li><a href="../browsers/index.asp" title="�������Ϣ">�������Ϣ</a></li>
<li><a href="../quality/index.asp" title="��վƷ��">��վƷ��</a></li>
<li><a href="../semweb/index.asp" title="������">������</a></li>
<li><a href="../careers/index.asp" title="ְҵ�滮">ְҵ�滮</a></li>
<li><a href="../hosting/index.asp" title="��վ����">��վ����</a></li>
</ul>

<h2><a href="../about/index.asp" title="���� W3School" id="link_about">���� W3School</a></h2>
<h2><a href="../about/about_helping.asp" title="���� W3School" id="link_help">���� W3School</a></h2>

</div>

</div>

<div id="maincontent">

<h1>PHP array_product() ����</h1>

<div class="backtoreference">
<p><a href="php_ref_array.asp" title="PHP Array ����">PHP Array ����</a></p>
</div>

<div>
<h2>������÷�</h2>

<p>array_product() �������㲢��������������ֵ�ĳ˻���</p>

<h3>�﷨</h3>
<pre>array_product(array)</pre>

<table class="dataintable">
<tr>
<th>����</th>
<th>����</th>
</tr>

<tr>
<td>array</td>
<td>���衣�涨��������������</td>
</tr>
</table>
</div>

<div>
<h2>����</h2>

<pre>&lt;?php
$a=array(5,5);
echo(array_product($a));
?&gt;</pre>

<p>�����</p>

<pre>25</pre>
</div>

<div class="backtoreference">
<p><a href="php_ref_array.asp" title="PHP Array ����">PHP Array ����</a></p>
</div>
</div>

<div id="sidebar">

<div id="searchui">
<form method="get" id="searchform" action="http://www.google.com.hk/search">
<p><label for="searched_content">Search:</label></p>
<p><input type="hidden" name="sitesearch" value="w3school.com.cn" /></p>
<p>
<input type="text" name="as_q" class="box"  id="searched_content" title="�ڴ������������ݡ�" />
<input type="submit" value="Go" class="button" title="������" />
</p>
</form>
</div>

<div id="tools">
<h5 id="tools_reference"><a href="php_ref.asp">PHP �ο��ֲ�</a></h5>
<h5 id="tools_quiz"><a href="php_quiz.asp">PHP ����</a></h5>
</div>

<div id="ad">
<h2>����������</h2>
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
<p>W3School�ṩ�����ݽ�������ѵ�����ǲ���֤���ݵ���ȷ�ԡ�ͨ��ʹ�ñ�վ������֮�����ķ����뱾վ�޹ء���ʹ�ñ�վʱ���������ѽ����˱�վ��<a href="../about/about_use.asp" title="����ʹ��">ʹ������</a>��<a href="../about/about_privacy.asp" title="������˽">��˽����</a>��</p>
<p>��Ȩ���У�����һ��Ȩ����δ���������ɣ�����ת�ء�W3School �������İ���������ݽ������ԣ����κη������⼰���ղ��е��κ����Ρ�<a href="http://www.yktz.net/" title="�Ϻ�Ӯ��Ͷ�����޹�˾">�Ϻ�Ӯ��Ͷ�ʹ�˾</a>��</p>
</div>

</div>
</body>
</html>