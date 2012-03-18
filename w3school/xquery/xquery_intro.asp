
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

<title>XQuery 简介</title>
</head>

<body class="xml">
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
<h2>XQuery 基础</h2>
<ul>
<li><a href="index.asp" title="XQuery 教程">XQuery 首页</a></li>
<li><a href="xquery_intro.asp" title="XQuery 简介">XQuery 简介</a></li>
<li><a href="xquery_example.asp" title="XQuery 实例">XQuery 实例</a></li>
<li><a href="xquery_flwor.asp" title="XQuery FLWOR 表达式">XQuery FLWOR</a></li>
<li><a href="xquery_flwor_html.asp" title="XQuery FLWOR + HTML">XQuery HTML</a></li>
<li><a href="xquery_terms.asp" title="XQuery 术语">XQuery 术语</a></li>
<li><a href="xquery_syntax.asp" title="XQuery 语法">XQuery 语法</a></li>
</ul>

<h2>XQuery 高级</h2>
<ul>
<li><a href="xquery_add.asp" title="XQuery 添加元素和属性">XQuery 添加</a></li>
<li><a href="xquery_select.asp" title="XQuery 选择和过滤">XQuery 选取</a></li>
<li><a href="xquery_functions.asp" title="XQuery 函数">XQuery 函数</a></li>
<li><a href="xquery_summary.asp" title="您已经学习了 XQuery，下一步呢？">XQuery 总结</a></li>
</ul>

<h2>XQuery 参考手册</h2>
<ul>
<li><a href="xquery_reference.asp" title="XQuery 参考手册">XQuery 参考手册</a></li>
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

<h1>XQuery 简介</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="index.asp">Previous Page</a></li>

<li class="next"><a href="xquery_example.asp">Next Page</a></li>
</ul>

</div>

<div id="intro">
<p><strong>解释XQuery最佳方式是这样讲：XQuery 相对于 XML 的关系，等同于 SQL 相对于数据库表的关系。</strong></p>
<p><strong>XQuery 被设计用来查询 XML 数据 - 不仅仅限于 XML 文件，还包括任何可以 XML 形态呈现的数据，包括数据库。</strong></p>
</div>

<div>
<h2>您应该具备的基础知识：</h2>
<p>在您继续学习之前，需要对下面的知识有基本的了解：</p>
<ul>
<li>HTML / XHTML</li>
<li>XML / XML 命名空间</li>
<li>XPath</li>
</ul>
<p>如果您希望首先学习这些项目，请在我们的 <a href="../index.html" title="W3School在线教程">首页</a> 访问这些教程。</p>
</div>

<div id="definition">
<h2>什么是 XQuery?</h2>
<ul>
<li>XQuery 是用于 XML 数据查询的语言</li>
<li>XQuery 对 XML 的作用类似 SQL 对数据库的作用</li>
<li>XQuery 被构建在 XPath 表达式之上</li>
<li>XQuery 被所有主要的数据库引擎支持（IBM、Oracle、Microsoft等等）</li>
<li>XQuery 是 W3C 标准。
</ul>
</div>

<div>
<h2>XQuery 和 XML 查询有关</h2>
<p>XQuery 是用来从 XML 文档查找和提取元素及属性的语言。</p>
<p>这是一个 XQuery 解决实际问题的例子：</p>
<p>“从存储在名为 cd_catalog.xml 的 XML 文档中的 CD 集那里选取所有价格低于 10 美元的 CD 纪录。”</p>
</div>

<div>
<h2>XQuery 与 XPath</h2>
<p>XQuery 1.0 和 XPath 2.0 共享相同的数据模型，并支持相同的函数和运算符。假如您已经学习了 XPath，那么学习 XQuery 也不会有问题。</p>
<p>您可以在我们的《<a href="../xpath/index.asp" title="XPath 教程">XPath 教程</a>》中阅读更多有关 XPath 的知识。</p>
</div>

<div>
<h2>XQuery - 应用举例</h2>
<p>XQuery 可被用来：</p>
<ul>
<li>提取信息以便在网络服务中使用</li>
<li>生成摘要报告</li>
<li>把 XML 数据转换为 XHTML</li>
<li>为获得相关信息而搜索网络文档</li>
</ul>
</div>

<div>
<h2>XQuery 是一个 W3C 推荐标准</h2>
<p>XQuery 与多种 W3C 标准相兼容，比如 XML、Namespaces、XSLT、XPath 以及 XML Schema。</p>
<p>XQuery 1.0 在 2007年1月23日 被确立为 W3C 推荐标准。</p>
<p>如需获得更多有关 W3C 的 XQuery 活动的信息，请阅读我们的《<a href="../w3c/w3c_xquery.asp" title="W3C XQuery 活动">W3C 教程</a>》。</p>
</div>

<div  id="bpn">
<ul class="prenext">

<li class="pre"><a href="index.asp">Previous Page</a></li>

<li class="next"><a href="xquery_example.asp">Next Page</a></li>
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
<h5 id="tools_reference"><a href="xquery_reference.asp">XQuery 参考手册</a></h5>
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