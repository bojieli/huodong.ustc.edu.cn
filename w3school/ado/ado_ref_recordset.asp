
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

<title>ADO Recordset 对象</title>
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

<h1>ADO Recordset 对象</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="ado_ref_record.asp">Previous Page</a></li>

<li class="next"><a href="ado_ref_stream.asp">Next Page</a></li>
</ul>

</div>

<div class="example">
<h2>实例</h2>
<dl>
<dt>GetRows</dt>
<dd>本例演示如何使用 GetRows 方法。</dd>
</dl>
</div>

<div>
<h2>Recordset 对象</h2>

<p>ADO Recordset 对象用于容纳一个来自数据库表的记录集。一个 Recordset 对象由记录和列（字段）组成。</p>

<p>在 ADO 中，此对象是最重要且最常用于对数据库的数据进行操作的对象。</p>

<h3>ProgID</h3>
<pre>set objRecordset=Server.CreateObject(&quot;ADODB.recordset&quot;) </pre>

<p>当您首次打开一个 Recordset 时，当前记录指针将指向第一个记录，同时 BOF 和 EOF 属性为 False。如果没有记录，BOF 和 EOF 属性为 True。</p>

<p>Recordset 对象能够支持两种更新类型：</p>
<ul>
立即更新 - 一旦调用 Update 方法，所有更改被立即写入数据库。
批更新 - provider 将缓存多个更改，然后使用 UpdateBatch 方法把这些更改传送到数据库。
</ul>

<p>在 ADO，定义了 4 中不同的游标（指针）类型：</p>
<ul>
<li>动态游标 - 允许您查看其他用户所作的添加、更改和删除</li>
<li>键集游标 - 类似动态游标，不同的是您无法查看有其他用户所做的添加，并且它会防止您访问其他用户已删除的记录。其他用户所做的数据更改仍然是可见的。</li>
<li>静态游标 - 提供记录集的静态副本，可用来查找数据或生成报告。此外，由其他用户所做的添加、更改和删除将是不可见的。当您打开一个客户端 Recordset 对象时，这是唯一被允许的游标类型。</li>
<li>仅向前游标 - 只允许在 Recordset 中向前滚动。此外，由其他用户所做的添加、更改和删除将是不可见的。</li>
</ul>

<p>可通过 CursorType 属性或 Open 方法中的 CursorType 参数来设置游标的类型。</p>

<p class="note"><span>注释：</span>并非所有的提供者（providers）支持 Recordset 对象的所有方法和属性。</p>
</div>

<div>
<h2>属性</h2>

<table class="dataintable">
<tr>
<th>属性</th>
<th>描述</th>
</tr>

<tr>
<td>AbsolutePage</td>
<td>设置或返回一个可指定 Recordset 对象中页码的值。</td>
</tr>

<tr>
<td>AbsolutePosition</td>
<td>设置或返回一个值，此值可指定 Recordset 对象中当前记录的顺序位置（序号位置）。</td>
</tr>

<tr>
<td>ActiveCommand</td>
<td>返回与 Recordset 对象相关联的 Command 对象。</td>
</tr>

<tr>
<td>ActiveConnection</td>
<td>如果连接被关闭，设置或返回连接的定义，如果连接打开，设置或返回当前的 Connection 对象。</td>
</tr>

<tr>
<td>BOF</td>
<td>如果当前的记录位置在第一条记录之前，则返回 true，否则返回 fasle。</td>
</tr>

<tr>
<td>Bookmark</td>
<td>设置或返回一个书签。此书签保存当前记录的位置。</td>
</tr>

<tr>
<td>CacheSize</td>
<td>设置或返回能够被缓存的记录的数目。</td>
</tr>

<tr>
<td>CursorLocation</td>
<td>设置或返回游标服务的位置。</td>
</tr>

<tr>
<td>CursorType</td>
<td>设置或返回一个 Recordset 对象的游标类型。</td>
</tr>

<tr>
<td>DataMember</td>
<td>设置或返回要从 DataSource 属性所引用的对象中检索的数据成员的名称。</td>
</tr>

<tr>
<td>DataSource</td>
<td>指定一个包含要被表示为 Recordset 对象的数据的对象。</td>
</tr>

<tr>
<td>EditMode</td>
<td>返回当前记录的编辑状态。</td>
</tr>

<tr>
<td>EOF</td>
<td>如果当前记录的位置在最后的记录之后，则返回 true，否则返回 fasle。</td>
</tr>

<tr>
<td>Filter</td>
<td>返回一个针对 Recordset 对象中数据的过滤器。</td>
</tr>

<tr>
<td>Index</td>
<td>设置或返回 Recordset 对象的当前索引的名称。</td>
</tr>

<tr>
<td>LockType</td>
<td>设置或返回当编辑 Recordset 中的一条记录时，可指定锁定类型的值。</td>
</tr>

<tr>
<td>MarshalOptions</td>
<td>设置或返回一个值，此值指定哪些记录被返回服务器。</td>
</tr>

<tr>
<td>MaxRecords</td>
<td>设置或返回从一个查询返回 Recordset 对象的的最大记录数目。</td>
</tr>

<tr>
<td>PageCount</td>
<td>返回一个 Recordset 对象中的数据页数。</td>
</tr>

<tr>
<td>PageSize</td>
<td>设置或返回 Recordset 对象的一个单一页面上所允许的最大记录数。</td>
</tr>

<tr>
<td>RecordCount</td>
<td>返回一个 Recordset 对象中的记录数目。</td>
</tr>

<tr>
<td>Sort</td>
<td>设置或返回一个或多个作为 Recordset 排序基准的字段名。</td>
</tr>

<tr>
<td>Source</td>
<td>设置一个字符串值，或一个 Command 对象引用，或返回一个字符串值，此值可指示 Recordset 对象的数据源。</td>
</tr>

<tr>
<td>State</td>
<td>返回一个值，此值可描述是否 Recordset 对象是打开、关闭、正在连接、正在执行或正在取回数据。</td>
</tr>

<tr>
<td>Status</td>
<td>返回有关批更新或其他大量操作的当前记录的状态。</td>
</tr>

<tr>
<td>StayInSync</td>
<td>设置或返回当父记录位置改变时对子记录的引用是否改变。</td>
</tr>
</table>
</div>

<div>
<h2>方法</h2>

<table class="dataintable">
<tr>
<th>方法</th>
<th>描述</th>
</tr>

<tr>
<td>AddNew</td>
<td>创建一条新记录。</td>
</tr>

<tr>
<td>Cancel</td>
<td>撤销一次执行。</td>
</tr>

<tr>
<td>CancelBatch</td>
<td>撤销一次批更新。</td>
</tr>

<tr>
<td>CancelUpdate</td>
<td>撤销对 Recordset 对象的一条记录所做的更改。</td>
</tr>

<tr>
<td>Clone</td>
<td>创建一个已有 Recordset 的副本。</td>
</tr>

<tr>
<td>Close</td>
<td>关闭一个 Recordset。</td>
</tr>

<tr>
<td>CompareBookmarks</td>
<td>比较两个书签。</td>
</tr>

<tr>
<td>Delete</td>
<td>删除一条记录或一组记录。</td>
</tr>

<tr>
<td>Find</td>
<td>搜索一个 Recordset 中满足指定某个条件的一条记录。</td>
</tr>

<tr>
<td>GetRows</td>
<td>把多条记录从一个 Recordset 对象中拷贝到一个二维数组中。</td>
</tr>

<tr>
<td>GetString</td>
<td>将 Recordset 作为字符串返回。</td>
</tr>

<tr>
<td>Move</td>
<td>在 Recordset 对象中移动记录指针。</td>
</tr>

<tr>
<td>MoveFirst</td>
<td>把记录指针移动到第一条记录。</td>
</tr>

<tr>
<td>MoveLast</td>
<td>把记录指针移动到最后一条记录。</td>
</tr>

<tr>
<td>MoveNext</td>
<td>把记录指针移动到下一条记录。</td>
</tr>

<tr>
<td>MovePrevious
<td>把记录指针移动到上一条记录。
</tr>

<tr>
<td>NextRecordset</td>
<td>通过执行一系列命令清除当前 Recordset 对象并返回下一个 Recordset。</td>
</tr>

<tr>
<td>Open</td>
<td>打开一个数据库元素，此元素可提供对表的记录、查询的结果或保存的 Recordset 的访问。</td>
</tr>

<tr>
<td>Requery</td>
<td>通过重新执行对象所基于的查询来更新 Recordset 对象中的数据。</td>
</tr>

<tr>
<td>Resync</td>
<td>从原始数据库刷新当前 Recordset 中的数据。</td>
</tr>

<tr>
<td>Save</td>
<td>把 Recordset 对象保存到 file 或 Stream 对象中。</td>
</tr>

<tr>
<td>Seek</td>
<td>搜索 Recordset 的索引以快速定位与指定的值相匹配的行，并使其成为当前行。</td>
</tr>

<tr>
<td>Supports</td>
<td>返回一个布尔值，此值可定义 Recordset 对象是否支持特定类型的功能。</td>
</tr>

<tr>
<td>Update</td>
<td>保存所有对 Recordset 对象中的一条单一记录所做的更改。</td>
</tr>

<tr>
<td>UpdateBatch</td>
<td>把所有 Recordset 中的更改存入数据库。请在批更新模式中使用。</td>
</tr>
</table>
</div>

<div>
<h2>事件</h2>
<p>Note: You cannot handle events using VBScript or JScript (only Visual Basic, Visual C++, and Visual J++ languages can handle events).</p>

<table class="dataintable">
<tr>
<th>事件</th>
<th>描述</th>
</tr>

<tr>
<td>EndOfRecordset</td>
<td>当试图移动到超过 Recordset 结尾的行时被触发。</td>
</tr>

<tr>
<td>FetchComplete</td>
<td>当异步操作中的所有记录均被读取后被触发。</td>
</tr>

<tr>
<td>FetchProgress</td>
<td>在异步操作期间被定期地触发，报告已读取多少记录。</td>
</tr>

<tr>
<td>FieldChangeComplete</td>
<td>Field 对象的值更改被触发。</td>
</tr>

<tr>
<td>MoveComplete</td>
<td>Recordset 中的当前位置更改后被触发。</td>
</tr>

<tr>
<td>RecordChangeComplete</td>
<td>一条记录更改之后被触发。</td>
</tr>

<tr>
<td>RecordsetChangeComplete</td>
<td>在 Recordset 更改之后被触发。</td>

<tr>
<td>WillChangeField</td>
<td>在 Field 对象的值更改之前被触发</td>
</tr>

<tr>
<td>WillChangeRecord</td>
<td>在一条记录更改之前被触发。</td>
</tr>

<tr>
<td>WillChangeRecordset</td>
<td>在 Recordset 更改之前被触发。</td>
</tr>

<tr>
<td>WillMove</td>
<td>在 Recordset 中的当前位置更改之前被触发。</td>
</tr>
</table>
</div>

<div>
<h2>集合</h2>

<table class="dataintable">
<tr>
<th>集合</th>
<th>描述</th>
</tr>

<tr>
<td>Fields</td>
<td>指示在此 Recordset 对象中 Field 对象的数目。</td>
</tr>

<tr>
<td>Properties</td>
<td>包含所有 Recordset 对象中的 Property 对象。</td>
</tr>
</table>
</div>

<div>
<h2>Fields 集合的属性</h2>

<table class="dataintable">
<tr>
<th>属性</th>
<th>描述</th>
</tr>

<tr>
<td>Count</td>
<td>
<p>返回 fields 集合中项目的数目。以 0 起始。</p>
<p>例子：</p>
<pre>countfields = rs.Fields.Count</pre>
</td>
</tr>

<tr>
<td>Item(named_item/number)</td>
<td>
<p>返回 fields 集合中的某个指定的项目。</p>
<p>例子：</p>
<pre>itemfields = rs.Fields.Item(1)
或者	
itemfields = rs.Fields.Item(&quot;Name&quot;)
</pre>
</td>
</tr>
</table>
</div>

<div>
<h2>Properties 集合的属性</h2>
<table class="dataintable">
<tr>
<th>属性</th>
<th>描述</th>
</tr>

<tr>
<td>Count</td>
<td>
<p>返回 properties 集合中项目的数目。以 0 起始。</p>
<p>例子：</p>
<pre>countprop = rs.Properties.Count</pre>
</td>
</tr>

<tr>
<td>Item(named_item/number)</td>
<td>
<p>返回 properties 集合中某个指定的项目。</p>
<p>例子：</p>
<pre>
itemprop = rs.Properties.Item(1)
或者
itemprop = rs.Properties.Item(&quot;Name&quot;)
</pre>
</td>
</tr>
</table>
</div>

<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="ado_ref_record.asp">Previous Page</a></li>

<li class="next"><a href="ado_ref_stream.asp">Next Page</a></li>
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