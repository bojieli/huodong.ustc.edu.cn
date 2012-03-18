
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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

<title>SQL DELETE ���</title>
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
<h2>SQL ����</h2>
<ul>
<li><a href="index.asp" title="SQL �̳�">SQL ��ҳ</a></li>
<li><a href="sql_intro.asp" title="SQL ���">SQL ���</a></li>
<li><a href="sql_syntax.asp" title="SQL �﷨">SQL �﷨</a></li>
<li><a href="sql_select.asp" title="SQL SELECT ���">SQL select</a></li>
<li><a href="sql_distinct.asp" title="SQL SELECT DISTINCT ���">SQL distinct</a></li>
<li><a href="sql_where.asp" title="SQL WHERE �Ӿ�">SQL where</a></li>
<li><a href="sql_and_or.asp" title="SQL AND &amp; OR">SQL AND &amp; OR</a></li>
<li><a href="sql_orderby.asp" title="SQL ORDER BY ���">SQL Order By</a></li>
<li><a href="sql_insert.asp" title="SQL INSERT INTO ���">SQL insert</a></li>
<li><a href="sql_update.asp" title="SQL UPDATE ���">SQL update</a></li>
<li><a href="sql_delete.asp" title="SQL DELETE ���">SQL delete</a></li>
</ul>

<h2>SQL �߼�</h2>
<ul>
<li><a href="sql_top.asp" title="SQL TOP �Ӿ�">SQL Top</a></li>
<li><a href="sql_like.asp" title="SQL LIKE �����">SQL Like</a></li>
<li><a href="sql_wildcards.asp" title="SQL ͨ���">SQL ͨ���</a></li>
<li><a href="sql_in.asp" title="SQL IN">SQL In</a></li>
<li><a href="sql_between.asp" title="SQL BETWEEN">SQL Between</a></li>
<li><a href="sql_alias.asp" title="SQL Alias��������">SQL Aliases</a></li>
<li><a href="sql_join.asp" title="SQL JOIN">SQL Join</a></li>
<li><a href="sql_join_inner.asp" title="SQL INNER JOIN �ؼ���">SQL Inner Join</a></li>
<li><a href="sql_join_left.asp" title="SQL LEFT JOIN �ؼ���">SQL Left Join</a></li>
<li><a href="sql_join_right.asp" title="SQL RIGHT JOIN �ؼ���">SQL Right Join</a></li>
<li><a href="sql_join_full.asp" title="SQL FULL JOIN �ؼ���">SQL Full Join</a></li>
<li><a href="sql_union.asp" title="SQL UNION �� UNION ALL">SQL Union</a></li>
<li><a href="sql_select_into.asp" title="SQL SELECT INTO ���">SQL Select Into</a></li>
<li><a href="sql_create_db.asp" title="SQL CREATE DATABASE ���">SQL Create DB</a></li>
<li><a href="sql_create_table.asp" title="SQL CREATE TABLE ���">SQL Create Table</a></li>
<li><a href="sql_constraints.asp" title="SQL Լ��">SQL Constraints</a></li>
<li><a href="sql_notnull.asp" title="SQL NOT NULL Լ��">SQL Not Null</a></li>
<li><a href="sql_unique.asp" title="SQL UNIQUE Լ��">SQL Unique</a></li>
<li><a href="sql_primarykey.asp" title="SQL PRIMARY KEY Լ��">SQL Primary Key</a></li>
<li><a href="sql_foreignkey.asp" title="SQL FOREIGN KEY Լ��">SQL Foreign Key</a></li>
<li><a href="sql_check.asp" title="SQL CHECK Լ��">SQL Check</a></li>
<li><a href="sql_default.asp" title="SQL DEFAULT Լ��">SQL Default</a></li>
<li><a href="sql_create_index.asp" title="SQL CREATE INDEX ���">SQL Create Index</a></li>
<li><a href="sql_drop.asp" title="SQL �������������Լ����ݿ�">SQL Drop</a></li>
<li><a href="sql_alter.asp" title="SQL ALTER TABLE">SQL Alter</a></li>
<li><a href="sql_autoincrement.asp" title="SQL AUTO INCREMENT �ֶ�">SQL Increment</a></li>
<li><a href="sql_view.asp" title="SQL VIEW����ͼ��">SQL View</a></li>
<li><a href="sql_dates.asp" title="SQL Date ����">SQL Date</a></li>
<li><a href="sql_null_values.asp" title="SQL NULL ֵ">SQL Nulls</a></li>
<li><a href="sql_isnull.asp" title="SQL NULL ����">SQL isnull()</a></li>
<li><a href="sql_datatypes.asp" title="SQL ��������">SQL ��������</a></li>
<li><a href="sql_server.asp" title="SQL ������ - RDBMS">SQL ������</a></li>
</ul>

<h2>SQL ����</h2>
<ul class="small">
<li><a href="sql_functions.asp" title="SQL ����">SQL functions</a></li>
<li><a href="sql_func_avg.asp" title="SQL AVG() ����">SQL avg()</a></li>
<li><a href="sql_func_count.asp" title="SQL COUNT() ����">SQL count()</a></li>
<li><a href="sql_func_first.asp" title="SQL FIRST() ����">SQL first()</a></li>
<li><a href="sql_func_last.asp" title="SQL LAST() ����">SQL last()</a></li>
<li><a href="sql_func_max.asp" title="SQL MAX() ����">SQL max()</a></li>
<li><a href="sql_func_min.asp" title="SQL MIN() ����">SQL min()</a></li>
<li><a href="sql_func_sum.asp" title="SQL SUM() ����">SQL sum()</a></li>
<li><a href="sql_groupby.asp" title="SQL GROUP BY ���">SQL Group By</a></li>
<li><a href="sql_having.asp" title="SQL HAVING �Ӿ�">SQL Having</a></li>
<li><a href="sql_func_ucase.asp" title="SQL UCASE() ����">SQL ucase()</a></li>
<li><a href="sql_func_lcase.asp" title="SQL LCASE() ����">SQL lcase()</a></li>
<li><a href="sql_func_mid.asp" title="SQL MID() ����">SQL mid()</a></li>
<li><a href="sql_func_len.asp" title="SQL LEN() ����">SQL len()</a></li>
<li><a href="sql_func_round.asp" title="SQL ROUND() ����">SQL round()</a></li>
<li><a href="sql_func_now.asp" title="SQL NOW() ����">SQL now()</a></li>
<li><a href="sql_func_format.asp" title="SQL FORMAT() ����">SQL format()</a></li>
</ul>

<h2>SQL �ܽ�</h2>
<ul>
<li><a href="sql_quickref.asp" title="SQL ���ٲο�">SQL ��������</a></li>
<li><a href="sql_summary.asp" title="�����Ѿ�ѧϰ�� SQL����һ��ѧϰʲô�أ�">SQL �ܽ�</a></li>
</ul>

<h2>ʵ��/����</h2>
<ul>
<li><a href="sql_quiz.asp" title="SQL ����">SQL ����</a></li>
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

<h1>SQL DELETE ���</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="sql_update.asp">Previous Page</a></li>

<li class="next"><a href="sql_top.asp">Next Page</a></li>
</ul>

</div>


<div>
<h2>DELETE ���</h2>

<p>DELETE �������ɾ�����е��С�</p>


<h3>�﷨</h3>
<pre>DELETE FROM ������ WHERE ������ = ֵ</pre>
</div>


<div>
<h2>Person:</h2>
<table class="dataintable">
    <tr>
      <th>LastName</th>
      <th>FirstName</th>
      <th>Address</th>
      <th>City</th>
    </tr>
    <tr>
      <td>Gates</td>
      <td>Bill</td>
      <td>Xuanwumen 10</td>
      <td>Beijing</td>
    </tr>
    <tr>
      <td>Wilson</td>
      <td>Fred</td>
      <td>Zhongshan 23</td>
      <td>Nanjing</td>
    </tr>
</table>
</div>


<div>
<h2>ɾ��ĳ��</h2>

<p>&quot;Fred Wilson&quot; �ᱻɾ����</p>
<pre>DELETE FROM Person WHERE LastName = 'Wilson' </pre>


<h3>���:</h3>
<table class="dataintable">
    <tr>
      <th>LastName</th>
      <th>FirstName</th>
      <th>Address</th>
      <th>City</th>
    </tr>
    <tr>
      <td>Gates</td>
      <td>Bill</td>
      <td>Xuanwumen 10</td>
      <td>Beijing</td>
    </tr>
</table>
</div>


<div>
<h2>ɾ��������</h2>

<p>�����ڲ�ɾ�����������ɾ�����е��С�����ζ�ű��Ľṹ�����Ժ��������������ģ�</p>
<pre>DELETE FROM table_name</pre>
<p>���ߣ�</p>
<pre>DELETE * FROM table_name</pre>
</div>


<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="sql_update.asp">Previous Page</a></li>

<li class="next"><a href="sql_top.asp">Next Page</a></li>
</ul>

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
<h5 id="tools_quiz"><a href="sql_quiz.asp">SQL ����</a></h5>
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