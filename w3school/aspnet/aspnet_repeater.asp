
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

<title>ASP.NET - Repeater 控件</title>
</head>

<body class="dotnet">
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
<h2>ASP.NET 教程</h2>
<ul>
<li><a href="index.asp" title="ASP.NET教程">ASP.NET 首页</a></li>
<li><a href="aspnet_intro.asp" title="ASP.NET 简介">ASP.NET 简介</a></li>
<li><a href="aspnet_vsasp.asp" title="ASP 与 ASP.NET 之间的差异">ASP.NET vs ASP</a></li>
<li><a href="aspnet_install.asp" title="ASP.NET 安装">ASP.NET 安装</a></li>
<li><a href="aspnet_pages.asp" title="ASP.NET - Web 页面">ASP.NET 页面</a></li>
<li><a href="aspnet_controls.asp" title="ASP.NET - 服务器控件">ASP.NET 控件</a></li>
<li><a href="aspnet_events.asp" title="ASP.NET - 事件">ASP.NET 事件</a></li>
</ul>

<h2>ASP.NET 窗体</h2>
<ul>
<li><a href="aspnet_forms.asp" title="ASP.NET Web 窗体">ASP.NET 窗体</a></li>
<li><a href="aspnet_viewstate.asp" title="ASP.NET - 维持 ViewState">ASP.NET ViewState</a></li>
<li><a href="aspnet_textbox.asp" title="ASP .NET - TextBox 控件">asp:TextBox</a></li>
<li><a href="aspnet_button.asp" title="ASP.NET - Button 控件">asp:Button</a></li>
</ul>

<h2>ASP.NET 绑定</h2>
<ul>
<li><a href="aspnet_databinding.asp" title="ASP.NET - 数据绑定">数据绑定</a></li>
<li><a href="aspnet_arraylist.asp" title="ASP NET - ArrayList 对象">ArrayList</a></li>
<li><a href="aspnet_hashtable.asp" title="ASP.NET - Hashtable 对象">Hashtable</a></li>
<li><a href="aspnet_sortedlist.asp" title="ASP.NET - SortedList 对象">SortedList</a></li>
<li><a href="aspnet_xml.asp" title="ASP .NET - XML 文件">XML 文件</a></li>
<li><a href="aspnet_repeater.asp" title="ASP.NET - Repeater 控件">asp:Repeater</a></li>
<li><a href="aspnet_datalist.asp" title="ASP.NET - DataList 控件">asp:DataList</a></li>
</ul>

<h2>ASP.NET 数据库</h2>
<ul>
<li><a href="aspnet_dbconnection.asp" title="ASP.NET - 数据库连接">数据库连接</a></li>
</ul>

<h2>ASP.NET 2.0</h2>
<ul>
<li><a href="aspnet_newfeatures.asp" title="ASP.NET 2.0 - 新特性">2.0 新特性</a></li>
<li><a href="aspnet_masterpages.asp" title="ASP.NET 2.0 - 母版页（Master Pages）">2.0 母版页</a></li>
<li><a href="aspnet_navigation.asp" title="ASP.NET 2.0 - 导航（Navigation）">2.0 导航</a></li>
</ul>

<h2>参考手册</h2>
<ul>
<li><a href="aspnet_refhtmlcontrols.asp" title="HTML 服务器控件">HTML 控件</a></li>
<li><a href="aspnet_refwebcontrols.asp" title="Web 服务器控件">Web 控件</a></li>
<li><a href="aspnet_refvalidationcontrols.asp" title="Validation 服务器控件">Validation 控件</a></li>
</ul>

<h2>实例</h2>
<ul>
<li>ASP.NET 实例</li>
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

<h1>ASP.NET - Repeater 控件</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="aspnet_xml.asp">Previous Page</a></li>

<li class="next"><a href="aspnet_datalist.asp">Next Page</a></li>
</ul>

</div>


<div id="intro">
<p><strong>Repeater 控件用于显示重复的项目列表，这些项目被限制在该控件。</strong></p>
</div>


<div class="example">
<h2>实例</h2>
<dl>
<dt><a href="../tiy/s.asp@f=demo_aspnet_repeater_1">Repeater 控件</a></dt>
<dt><a href="../tiy/s.asp@f=demo_aspnet_repeater_2">带有 &lt;AlternatingItemTemplate&gt; 的 Repeater 控件</a></dt>
<dt><a href="../tiy/s.asp@f=demo_aspnet_repeater_3">带有 &lt;SeparatorTemplate&gt; 的 Repeater 控件</a></dt>
</dl>
</div>


<div>
<h2>把 DataSet 绑定到 Repeater 控件</h2>

<p>Repeater 控件用于显示重复的项目列表，这些项目被限制在该控件。Repeater 控件可被绑定到数据库表、XML 文件或者其他项目列表。这里，我们将展示如何把 XML 文件绑定到一个 Repeater 控件。</p>

<p>我们将在例子中使用下面的 XML 文件(&quot;cdcatalog.xml&quot;)：</p>

<pre>&lt;?xml version=&quot;1.0&quot; encoding=&quot;ISO-8859-1&quot;?&gt;

&lt;catalog&gt;
&lt;cd&gt;
  &lt;title&gt;Empire Burlesque&lt;/title&gt;
  &lt;artist&gt;Bob Dylan&lt;/artist&gt;
  &lt;country&gt;USA&lt;/country&gt;
  &lt;company&gt;Columbia&lt;/company&gt;
  &lt;price&gt;10.90&lt;/price&gt;
  &lt;year&gt;1985&lt;/year&gt;
&lt;/cd&gt;
&lt;cd&gt;
  &lt;title&gt;Hide your heart&lt;/title&gt;
  &lt;artist&gt;Bonnie Tyler&lt;/artist&gt;
  &lt;country&gt;UK&lt;/country&gt;
  &lt;company&gt;CBS Records&lt;/company&gt;
  &lt;price&gt;9.90&lt;/price&gt;
  &lt;year&gt;1988&lt;/year&gt;
&lt;/cd&gt;
&lt;cd&gt;
  &lt;title&gt;Greatest Hits&lt;/title&gt;
  &lt;artist&gt;Dolly Parton&lt;/artist&gt;
  &lt;country&gt;USA&lt;/country&gt;
  &lt;company&gt;RCA&lt;/company&gt;
  &lt;price&gt;9.90&lt;/price&gt;
  &lt;year&gt;1982&lt;/year&gt;
&lt;/cd&gt;
&lt;cd&gt;
  &lt;title&gt;Still got the blues&lt;/title&gt;
  &lt;artist&gt;Gary Moore&lt;/artist&gt;
  &lt;country&gt;UK&lt;/country&gt;
  &lt;company&gt;Virgin records&lt;/company&gt;
  &lt;price&gt;10.20&lt;/price&gt;
  &lt;year&gt;1990&lt;/year&gt;
&lt;/cd&gt;
&lt;cd&gt;
  &lt;title&gt;Eros&lt;/title&gt;
  &lt;artist&gt;Eros Ramazzotti&lt;/artist&gt;
  &lt;country&gt;EU&lt;/country&gt;
  &lt;company&gt;BMG&lt;/company&gt;
  &lt;price&gt;9.90&lt;/price&gt;
  &lt;year&gt;1997&lt;/year&gt;
&lt;/cd&gt;
&lt;/catalog&gt;</pre>

<p>请查看该 XML 文件：<a href="../example/aspnet/cdcatalog.xml">cdcatalog.xml</a></p>

<p>首先，导入 &quot;System.Data&quot; 命名空间。我们需要此命名空间与 DataSet 对象一同工作。在 .aspx 页面的顶部包含下面这条指令：</p>

<pre>&lt;%@ Import Namespace=&quot;System.Data&quot; %&gt;</pre>

<p>接下来，为这个 XML 文件创建一个 DataSet，并把此 XML 文件在页面首次加载时载入 DataSet：</p>

<pre>&lt;script runat=&quot;server&quot;&gt;
sub Page_Load
if Not Page.IsPostBack then
  <code>dim mycdcatalog=New DataSet
  mycdcatalog.ReadXml(MapPath(&quot;cdcatalog.xml&quot;))</code>
end if
end sub</pre>

<p>然后我们在 .aspx 页面中创建一个 Repeater 控件。&lt;HeaderTemplate&gt; 元素中的内容在输出中仅出现一次，而 &lt;ItemTemplate&gt; 元素的内容会对应 DataSet 中的 &quot;record&quot; 重复出现，最后，&lt;FooterTemplate&gt; 的内容在输出中仅出现一次：</p>

<pre>&lt;html&gt;
&lt;body&gt;

&lt;form runat=&quot;server&quot;&gt;
<code>&lt;asp:Repeater id=&quot;cdcatalog&quot; runat=&quot;server&quot;&gt;

&lt;HeaderTemplate&gt;
<span>...</span>
&lt;/HeaderTemplate&gt;

&lt;ItemTemplate&gt;
<span>...</span>
&lt;/ItemTemplate&gt;

&lt;FooterTemplate&gt;
<span>...</span>
&lt;/FooterTemplate&gt;

&lt;/asp:Repeater&gt;</code>
&lt;/form&gt;

&lt;/body&gt;
&lt;/html&gt;</pre>

<p>然后我们添加可创建 DataSet 的脚本，并把这个 mycdcatalog DataSet 绑定到 Repeater 控件。我们同样用 HTML 标签来填充这个 Repeater 控件，并通过 &lt;%#Container.DataItem(&quot;fieldname&quot;)%&gt; 方法把数据项目绑定到 &lt;ItemTemplate&gt; 部分内的单元格：</p>

<pre>&lt;%@ Import Namespace=&quot;System.Data&quot; %&gt;

&lt;script runat=&quot;server&quot;&gt;
sub Page_Load
if Not Page.IsPostBack then
  dim mycdcatalog=New DataSet
  mycdcatalog.ReadXml(MapPath(&quot;cdcatalog.xml&quot;))
  cdcatalog.DataSource=mycdcatalog
  cdcatalog.DataBind()
end if
end sub
&lt;/script&gt;

&lt;html&gt;
&lt;body&gt;

&lt;form runat=&quot;server&quot;&gt;
&lt;asp:Repeater id=&quot;cdcatalog&quot; runat=&quot;server&quot;&gt;

&lt;HeaderTemplate&gt;
&lt;table border=&quot;1&quot; width=&quot;100%&quot;&gt;
&lt;tr&gt;
&lt;th&gt;Title&lt;/th&gt;
&lt;th&gt;Artist&lt;/th&gt;
&lt;th&gt;Country&lt;/th&gt;
&lt;th&gt;Company&lt;/th&gt;
&lt;th&gt;Price&lt;/th&gt;
&lt;th&gt;Year&lt;/th&gt;
&lt;/tr&gt;
&lt;/HeaderTemplate&gt;

&lt;ItemTemplate&gt;
&lt;tr&gt;
&lt;td&gt;&lt;%#Container.DataItem(&quot;title&quot;)%&gt;&lt;/td&gt;
&lt;td&gt;&lt;%#Container.DataItem(&quot;artist&quot;)%&gt;&lt;/td&gt;
&lt;td&gt;&lt;%#Container.DataItem(&quot;country&quot;)%&gt;&lt;/td&gt;
&lt;td&gt;&lt;%#Container.DataItem(&quot;company&quot;)%&gt;&lt;/td&gt;
&lt;td&gt;&lt;%#Container.DataItem(&quot;price&quot;)%&gt;&lt;/td&gt;
&lt;td&gt;&lt;%#Container.DataItem(&quot;year&quot;)%&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;/ItemTemplate&gt;

&lt;FooterTemplate&gt;
&lt;/table&gt;
&lt;/FooterTemplate&gt;

&lt;/asp:Repeater&gt;
&lt;/form&gt;

&lt;/body&gt;
&lt;/html&gt;</pre>

<p><a href="../tiy/s.asp@f=demo_aspnet_repeater_1">显示这个例子</a></p>
</div>


<div>
<h2>使用 &lt;AlternatingItemTemplate&gt;</h2>

<p>您可以在 &lt;ItemTemplate&gt; 元素后添加 &lt;AlternatingItemTemplate&gt; 元素，这样就可以描述交替行的外观了。在下面的例子中，该表格中每隔一行就会显示为浅灰色的背景：</p>

<pre>&lt;%@ Import Namespace=&quot;System.Data&quot; %&gt;

&lt;script runat=&quot;server&quot;&gt;
sub Page_Load
if Not Page.IsPostBack then
  dim mycdcatalog=New DataSet
  mycdcatalog.ReadXml(MapPath(&quot;cdcatalog.xml&quot;))
  cdcatalog.DataSource=mycdcatalog
  cdcatalog.DataBind()
end if
end sub
&lt;/script&gt;

&lt;html&gt;
&lt;body&gt;

&lt;form runat=&quot;server&quot;&gt;
&lt;asp:Repeater id=&quot;cdcatalog&quot; runat=&quot;server&quot;&gt;

&lt;HeaderTemplate&gt;
&lt;table border=&quot;1&quot; width=&quot;100%&quot;&gt;
&lt;tr&gt;
&lt;th&gt;Title&lt;/th&gt;
&lt;th&gt;Artist&lt;/th&gt;
&lt;th&gt;Country&lt;/th&gt;
&lt;th&gt;Company&lt;/th&gt;
&lt;th&gt;Price&lt;/th&gt;
&lt;th&gt;Year&lt;/th&gt;
&lt;/tr&gt;
&lt;/HeaderTemplate&gt;

&lt;ItemTemplate&gt;
&lt;tr&gt;
&lt;td&gt;&lt;%#Container.DataItem(&quot;title&quot;)%&gt;&lt;/td&gt;
&lt;td&gt;&lt;%#Container.DataItem(&quot;artist&quot;)%&gt;&lt;/td&gt;
&lt;td&gt;&lt;%#Container.DataItem(&quot;country&quot;)%&gt;&lt;/td&gt;
&lt;td&gt;&lt;%#Container.DataItem(&quot;company&quot;)%&gt;&lt;/td&gt;
&lt;td&gt;&lt;%#Container.DataItem(&quot;price&quot;)%&gt;&lt;/td&gt;
&lt;td&gt;&lt;%#Container.DataItem(&quot;year&quot;)%&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;/ItemTemplate&gt;

<code>&lt;AlternatingItemTemplate&gt;</code>
&lt;tr bgcolor=&quot;#e8e8e8&quot;&gt;

&lt;td&gt;&lt;%#Container.DataItem(&quot;title&quot;)%&gt;&lt;/td&gt;
&lt;td&gt;&lt;%#Container.DataItem(&quot;artist&quot;)%&gt;&lt;/td&gt;
&lt;td&gt;&lt;%#Container.DataItem(&quot;country&quot;)%&gt;&lt;/td&gt;
&lt;td&gt;&lt;%#Container.DataItem(&quot;company&quot;)%&gt;&lt;/td&gt;
&lt;td&gt;&lt;%#Container.DataItem(&quot;price&quot;)%&gt;&lt;/td&gt;
&lt;td&gt;&lt;%#Container.DataItem(&quot;year&quot;)%&gt;&lt;/td&gt;
&lt;/tr&gt;
<code>&lt;/AlternatingItemTemplate&gt;</code>

&lt;FooterTemplate&gt;
&lt;/table&gt;
&lt;/FooterTemplate&gt;

&lt;/asp:Repeater&gt;
&lt;/form&gt;

&lt;/body&gt;
&lt;/html&gt;</pre>

<p><a href="../tiy/s.asp@f=demo_aspnet_repeater_2">显示这个例子</a></p>
</div>


<div>
<h2>使用 &lt;SeparatorTemplate&gt;</h2>

<p>&lt;SeparatorTemplate&gt; 元素能够用于描述每个记录之间的分隔符。下面的例子在每个表格行之间插入了一条水平线：</p>

<pre>&lt;%@ Import Namespace=&quot;System.Data&quot; %&gt;

&lt;script runat=&quot;server&quot;&gt;
sub Page_Load
if Not Page.IsPostBack then
  dim mycdcatalog=New DataSet
  mycdcatalog.ReadXml(MapPath(&quot;cdcatalog.xml&quot;))
  cdcatalog.DataSource=mycdcatalog
  cdcatalog.DataBind()
end if
end sub
&lt;/script&gt;

&lt;html&gt;
&lt;body&gt;

&lt;form runat=&quot;server&quot;&gt;
&lt;asp:Repeater id=&quot;cdcatalog&quot; runat=&quot;server&quot;&gt;

&lt;HeaderTemplate&gt;
&lt;table border=&quot;0&quot; width=&quot;100%&quot;&gt;
&lt;tr&gt;
&lt;th&gt;Title&lt;/th&gt;
&lt;th&gt;Artist&lt;/th&gt;
&lt;th&gt;Country&lt;/th&gt;
&lt;th&gt;Company&lt;/th&gt;
&lt;th&gt;Price&lt;/th&gt;
&lt;th&gt;Year&lt;/th&gt;
&lt;/tr&gt;
&lt;/HeaderTemplate&gt;

&lt;ItemTemplate&gt;
&lt;tr&gt;
&lt;td&gt;&lt;%#Container.DataItem(&quot;title&quot;)%&gt;&lt;/td&gt;
&lt;td&gt;&lt;%#Container.DataItem(&quot;artist&quot;)%&gt;&lt;/td&gt;
&lt;td&gt;&lt;%#Container.DataItem(&quot;country&quot;)%&gt;&lt;/td&gt;
&lt;td&gt;&lt;%#Container.DataItem(&quot;company&quot;)%&gt;&lt;/td&gt;
&lt;td&gt;&lt;%#Container.DataItem(&quot;price&quot;)%&gt;&lt;/td&gt;
&lt;td&gt;&lt;%#Container.DataItem(&quot;year&quot;)%&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;/ItemTemplate&gt;

<code>&lt;SeparatorTemplate&gt;</code>
&lt;tr&gt;
&lt;td colspan=&quot;6&quot;&gt;&lt;hr /&gt;&lt;/td&gt;
&lt;/tr&gt;
<code>&lt;/SeparatorTemplate&gt;</code>

&lt;FooterTemplate&gt;
&lt;/table&gt;
&lt;/FooterTemplate&gt;

&lt;/asp:Repeater&gt;
&lt;/form&gt;

&lt;/body&gt;
&lt;/html&gt;</pre>

<p><a href="../tiy/s.asp@f=demo_aspnet_repeater_3">显示这个例子</a></p>
</div>


<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="aspnet_xml.asp">Previous Page</a></li>

<li class="next"><a href="aspnet_datalist.asp">Next Page</a></li>
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
<h5 id="tools_reference"><a href="aspnet_reference.asp">ASP.NET 参考手册</a></h5>
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