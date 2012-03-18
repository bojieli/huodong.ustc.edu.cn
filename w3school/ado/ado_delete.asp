
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

<title>ADO 删除记录</title>
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
<h2>ADO 教程</h2>
<ul>
<li><a href="index.asp" title="W3School ADO教程首页">ADO 首页</a></li>
<li><a href="ado_intro.asp" title="ADO 简介">ADO 简介</a></li>
<li><a href="ado_connect.asp" title="ADO 数据库连接">ADO 连接</a></li>
<li><a href="ado_recordset.asp" title="ADO Recordset（记录集）">ADO 记录集</a></li>
<li><a href="ado_display.asp" title="ADO 显示">ADO 显示</a></li>
<li><a href="ado_query.asp" title="ADO 查询">ADO 查询</a></li>
<li><a href="ado_sort.asp" title="ADO 排序">ADO 排序</a></li>
<li><a href="ado_add.asp" title="ADO 添加记录">ADO 添加</a></li>
<li><a href="ado_update.asp" title="ADO 更新记录">ADO 更新</a></li>
<li><a href="ado_delete.asp" title="ADO 删除记录">ADO 删除</a></li>
<li><a href="ado_getstring.asp" title="ADO 通过 GetString() 加速脚本">ADO 加速</a></li>
</ul>

<h2>ADO 对象</h2>
<ul class="small">
<li><a href="ado_ref_command.asp" title="ADO Command 对象">ADO Command</a></li>
<li><a href="ado_ref_connection.asp" title="ADO Connection 对象">ADO Connection</a></li>
<li><a href="ado_ref_error.asp" title="ADO Error 对象">ADO Error</a></li>
<li><a href="ado_ref_field.asp" title="ADO Field 对象">ADO Field</a></li>
<li><a href="ado_ref_parameter.asp" title="ADO Parameter 对象">ADO Parameter</a></li>
<li><a href="ado_ref_property.asp" title="ADO Property 对象">ADO Property</a></li>
<li><a href="ado_ref_record.asp" title="ADO Record 对象">ADO Record</a></li>
<li><a href="ado_ref_recordset.asp" title="ADO Recordset 对象">ADO Recordset</a></li>
<li><a href="ado_ref_stream.asp" title="ADO Stream 对象">ADO Stream</a></li>
</ul>

<h2>ADO 总结</h2>
<ul>
<li><a href="ado_datatypes.asp" title="ADO 数据类型">ADO 数据类型</a></li>
<li><a href="ado_summary.asp" title="您已经学习了 ADO，下一步呢？">ADO 总结</a></li>
</ul>

<h2>实例</h2>
<ul>
<li><a href="../example/adoe_examples.asp">ADO 实例</a></li>
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

<h1>ADO 删除记录</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="ado_update.asp">Previous Page</a></li>

<li class="next"><a href="ado_getstring.asp">Next Page</a></li>
</ul>

</div>

<div>
<p><strong>我们可使用 SQL 的 DELETE 命令来删除数据库表中的某条记录。</strong></p>
</div>

<div>
<h2>删除表中的记录</h2>
<p>我们希望删除 Northwind 数据库的 Customers 表中的一条记录。首先我们需要创建一个表格，来列出 Customers 中的所有记录。</p>
<pre>
&lt;html&gt;
&lt;body&gt;
&lt;%
set conn=Server.CreateObject(&quot;ADODB.Connection&quot;)
conn.Provider=&quot;Microsoft.Jet.OLEDB.4.0&quot;
conn.Open &quot;c:/webdata/northwind.mdb&quot;
set rs=Server.CreateObject(&quot;ADODB.Recordset&quot;)
rs.open &quot;SELECT * FROM customers&quot;,conn
%&gt;

&lt;h2&gt;List Database&lt;/h2&gt;
&lt;table border=&quot;1&quot; width=&quot;100%&quot;&gt;
&lt;tr&gt;
&lt;%
for each x in rs.Fields
  response.write(&quot;&lt;th&gt;&quot; &amp; ucase(x.name) &amp; &quot;&lt;/th&gt;&quot;)
next
%&gt;
&lt;/tr&gt;
&lt;% do until rs.EOF %&gt;
&lt;tr&gt;
&lt;form method=&quot;post&quot; action=&quot;demo_delete.asp&quot;&gt;
&lt;%
for each x in rs.Fields
  if x.name=&quot;customerID&quot; then%&gt;
    &lt;td&gt;
    &lt;input type=&quot;submit&quot; name=&quot;customerID&quot; value=&quot;&lt;%=x.value%&gt;&quot;&gt;
    &lt;/td&gt;
  &lt;%else%&gt;
    &lt;td&gt;&lt;%Response.Write(x.value)%&gt;&lt;/td&gt;
  &lt;%end if
next
%&gt;
&lt;/form&gt;
&lt;%rs.MoveNext%&gt;
&lt;/tr&gt;
&lt;%
loop
conn.close
%&gt;
&lt;/table&gt;

&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>假如用户点击 &quot;customerID&quot; 列中的按钮，会打开新文件 &quot;demo_delete.asp&quot;。此文件包含了创建输入域的源代码，这些输入域基于数据库中记录的字段，同时也含有一个删除当前记录的“删除按钮”：</p>
<pre>
&lt;html&gt;
&lt;body&gt;

&lt;h2&gt;Delete Record&lt;/h2&gt;
&lt;%
set conn=Server.CreateObject(&quot;ADODB.Connection&quot;)
conn.Provider=&quot;Microsoft.Jet.OLEDB.4.0&quot;
conn.Open &quot;c:/webdata/northwind.mdb&quot;

cid=Request.Form(&quot;customerID&quot;

if Request.form(&quot;companyname&quot;)=&quot;&quot; then
  set rs=Server.CreateObject(&quot;ADODB.Recordset&quot;)
  rs.open &quot;SELECT * FROM customers WHERE customerID='&quot; &amp; cid &amp; &quot;'&quot;,conn
  %&gt;
  &lt;form method=&quot;post&quot; action=&quot;demo_delete.asp&quot;&gt;
  &lt;table&gt;
  &lt;%for each x in rs.Fields%&gt;
  &lt;tr&gt;
  &lt;td&gt;&lt;%=x.name%&gt;&lt;/td&gt;
  &lt;td&gt;&lt;input name=&quot;&lt;%=x.name%&gt;&quot; value=&quot;&lt;%=x.value%&gt;&quot;&gt;&lt;/td&gt;
  &lt;%next%&gt;
  &lt;/tr&gt;
  &lt;/table&gt;
  &lt;br /&gt;&lt;br /&gt;
  &lt;input type=&quot;submit&quot; value=&quot;Delete record&quot;&gt;
  &lt;/form&gt;
&lt;%
else
  sql=&quot;DELETE FROM customers&quot;
  sql=sql &amp; &quot; WHERE customerID='&quot; &amp; cid &amp; &quot;'&quot;
  on error resume next
  conn.Execute sql
  if err&lt;&gt;0 then
    response.write(&quot;No update permissions!&quot;)
  else 
    response.write(&quot;Record &quot; &amp; cid &amp; &quot; was deleted!&quot;)
  end if 
end if
conn.close
%&gt;

&lt;/body&gt;
&lt;/html&gt;
</pre>
</div>

<div  id="bpn">
<ul class="prenext">

<li class="pre"><a href="ado_update.asp">Previous Page</a></li>

<li class="next"><a href="ado_getstring.asp">Next Page</a></li>
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
<h5 id="tools_reference"><a href="ado_reference.asp">ADO 参考手册</a></h5>
<h5 id="tools_example"><a href="../example/adoe_examples.asp">ADO 实例</a></h5>
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