
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

<title>ADO Property 对象</title>
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

<h1>ADO Property 对象</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="ado_ref_parameter.asp">Previous Page</a></li>

<li class="next"><a href="ado_ref_record.asp">Next Page</a></li>
</ul>

</div>

<div>
<h2>Property 对象</h2>

<p>ADO 对象有两种类型的属性：内置属性和动态属性。</p>

<p>内置属性是在 ADO 中实现并立即可用于任何新对象的属性，此时使用 MyObject.Property 语法。它们不会作为 Property 对象出现在对象的 Properties 集合中，因此，虽然可以更改它们的值，但无法更改它们的特性。</p>

<p>ADO Property 对象表示 ADO 对象的动态特性，这种动态特性是被 provider 定义的。</p>

<p>每个与 ADO 对话的 provider 拥有不同的方式与 ADO 进行交互。所以，ADO 需要通过某种方式来存储有关 provider 的信息。解决方法是 provider 为 ADO 提供具体的信息（动态属性）。ADO 把每个 provider 属性存储在一个 Property 对象中，而 Property 对象相应地也被存储在 Properties 集合中。此集合会被分配到 Command 对象、Connection 对象、Field 对象 或者 Recordset 对象。</p>

<p>例如，指定给提供者的属性可能会指示 Recordset 对象是否支持事务或更新。这些附加的属性将作为 Property 对象出现在该 Recordset 对象的 Properties 集合中。</p>

<h3>ProgID</h3>
<pre>set objProperty=Server.CreateObject(&quot;ADODB.property&quot;)</pre>
</div>

<div>
<h2>属性</h2>

<table class="dataintable">
<tr>
<th>属性</th>
<th>描述</th>
</tr>

<tr>
<td>Attributes</td>
<td>返回一个 Property 对象的属性</td>
</tr>

<tr>
<td>Name</td>
<td>设置或返回一个 Property 对象的名称</td>
</tr>

<tr>
<td>Type</td>
<td>返回 Property 的类型</td>
</tr>

<tr>
<td>Value</td>
<td>设置或返回 一个 Property 对象的值</td>
</tr>
</table>
</div>

<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="ado_ref_parameter.asp">Previous Page</a></li>

<li class="next"><a href="ado_ref_record.asp">Next Page</a></li>
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