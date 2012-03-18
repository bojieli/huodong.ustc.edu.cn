
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

<title>ASP NET - ArrayList 对象</title>
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

<h1>ASP NET - ArrayList 对象</h1>


<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="aspnet_databinding.asp">Previous Page</a></li>

<li class="next"><a href="aspnet_hashtable.asp">Next Page</a></li>
</ul>

</div>


<div id="intro">
<p><strong>ArrayList 对象是包含单一数据值的项目的集合。</strong></p>
</div>


<div>
<h2>实例</h2>

<p><a href="../tiy/s.asp@f=demo_aspnet_arraylist_drop_1">ArrayList DropDownList</a></p>

<p><a href="../tiy/s.asp@f=demo_aspnet_arraylist_radio_1">ArrayList RadioButtonList</a></p>

</div>


<div>
<h2>创建 ArrayList</h2>

<p>ArrayList 对象是包含单一数据值的项目的集合。</p>

<p>通过 Add() 方法向 ArrayList 添加项目。</p>

<p>下面的代码创建了一个新的 ArrayList 对象，名为 mycountries，并添加了四个项目：</p>

<pre>&lt;script runat=&quot;server&quot;&gt;
Sub Page_Load
if Not Page.IsPostBack then
  <span class="marked">dim mycountries=New ArrayList</span>
  mycountries.Add(&quot;China&quot;)
  mycountries.Add(&quot;Sweden&quot;)
  mycountries.Add(&quot;France&quot;)
  mycountries.Add(&quot;Italy&quot;)
end if
end sub
&lt;/script&gt;</pre>

<p>默认地，一个 ArrayList 对象包含 16 个条目。可通过 TrimToSize() 方法把 ArrayList 调整为最终大小：</p>

<pre>&lt;script runat=&quot;server&quot;&gt;
Sub Page_Load
if Not Page.IsPostBack then
  dim mycountries=New ArrayList
  mycountries.Add(&quot;China&quot;)
  mycountries.Add(&quot;Sweden&quot;)
  mycountries.Add(&quot;France&quot;)
  mycountries.Add(&quot;Italy&quot;)
  <code>mycountries.TrimToSize()</code>
end if
end sub
&lt;/script&gt;</pre>

<p>通过 Sort() 方法，ArrayList 也能够按照字母顺序或者数字顺序进行排序：</p>

<pre>&lt;script runat=&quot;server&quot;&gt;
Sub Page_Load
if Not Page.IsPostBack then
  dim mycountries=New ArrayList
  mycountries.Add(&quot;China&quot;)
  mycountries.Add(&quot;Sweden&quot;)
  mycountries.Add(&quot;France&quot;)
  mycountries.Add(&quot;Italy&quot;)
  mycountries.TrimToSize()
  <code>mycountries.Sort()</code>
end if
end sub
&lt;/script&gt;</pre>

<p>要实现颠倒的排序，请在 Sort() 方法后应用 Reverse() 方法：</p>

<pre>&lt;script runat=&quot;server&quot;&gt;
Sub Page_Load
if Not Page.IsPostBack then
  dim mycountries=New ArrayList
  mycountries.Add(&quot;China&quot;)
  mycountries.Add(&quot;Sweden&quot;)
  mycountries.Add(&quot;France&quot;)
  mycountries.Add(&quot;Italy&quot;)
  mycountries.TrimToSize()
  mycountries.Sort()
  <code>mycountries.Reverse()</code>
end if
end sub
&lt;/script&gt;</pre>
</div>


<div>
<h2>把数据绑定到 ArrayList</h2>

<p>ArrayList 对象可向下面这些控件自动地生成文本和值：</p>

<ul>
  <li>asp:RadioButtonList</li>
  <li>asp:CheckBoxList</li>
  <li>asp:DropDownList</li>
  <li>asp:Listbox</li>
</ul>

<p>如需把数据绑定到一个 RadioButtonList 控件，首先请在一个 .aspx 页面中创建 RadioButtonList 控件（请注意，没有任何 asp:ListItem 元素）：</p>

<pre>&lt;html&gt;
&lt;body&gt;

&lt;form runat=&quot;server&quot;&gt;
&lt;asp:RadioButtonList id=&quot;rb&quot; runat=&quot;server&quot; /&gt;
&lt;/form&gt;

&lt;/body&gt;
&lt;/html&gt;</pre>

<p>然后添加构建列表的脚本，并把列表中的值绑定到该 RadioButtonList 控件：</p>

<pre>&lt;script runat=&quot;server&quot;&gt;
Sub Page_Load
if Not Page.IsPostBack then
  dim mycountries=New ArrayList
  mycountries.Add(&quot;China&quot;)
  mycountries.Add(&quot;Sweden&quot;)
  mycountries.Add(&quot;France&quot;)
  mycountries.Add(&quot;Italy&quot;)
  mycountries.TrimToSize()
  mycountries.Sort()
  <code>rb.DataSource=mycountries
  rb.DataBind()</code>
end if
end sub
&lt;/script&gt;

&lt;html&gt;
&lt;body&gt;

&lt;form runat=&quot;server&quot;&gt;
&lt;asp:RadioButtonList id=&quot;rb&quot; runat=&quot;server&quot; /&gt;
&lt;/form&gt;

&lt;/body&gt;
&lt;/html&gt;</pre>

<p><a href="../tiy/s.asp@f=demo_aspnet_arraylist_radio_1">显示这个例子</a></p>

<p>RadioButtonList 控件的 DataSource 属性被设置为该 ArrayList，它定义了这个 RadioButtonList 控件的数据源。RadioButtonList 控件的 DataBind() 方法把 RadioButtonList 控件与数据源绑定在一起。</p>

<p class="note"><span>注释：</span>数据值作为控件的 Text 和 Value 属性来使用。如需添加不同于 Text 的 Value，既可以使用 Hashtable 对象，也可以使用 SortedList 对象。</p>
</div>


<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="aspnet_databinding.asp">Previous Page</a></li>

<li class="next"><a href="aspnet_hashtable.asp">Next Page</a></li>
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