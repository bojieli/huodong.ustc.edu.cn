
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

<title>RDF 实例</title>
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
<h2>RDF 教程</h2>
<ul>
<li><a href="index.asp" title="RDF教程首页">RDF 首页</a></li>
<li><a href="rdf_intro.asp" title="RDF简介">RDF 简介</a></li>
<li><a href="rdf_rules.asp" title="">RDF 规则</a></li>
<li><a href="rdf_example.asp" title="">RDF 实例</a></li>
<li><a href="rdf_main.asp" title="">RDF 元素</a></li>
<li><a href="rdf_containers.asp" title="">RDF 容器</a></li>
<li><a href="rdf_collections.asp" title="">RDF 集合</a></li>
<li><a href="rdf_schema.asp" title="">RDF Schema</a></li>
<li><a href="rdf_dublin.asp" title="">RDF 都柏林核心</a></li>
<li><a href="rdf_owl.asp" title="">RDF OWL</a></li>
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

<h1>RDF 实例</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="rdf_rules.asp">Previous Page</a></li>

<li class="next"><a href="rdf_main.asp">Next Page</a></li>
</ul>

</div>

<div>
<h2>RDF 实例</h2>
<p>这是一个 CD 列表的其中几行:</p>

<table class="dataintable">
  <tr>
    <th>Title</th>
    <th>Artist</th>
    <th>Country</th>
    <th>Company</th>
    <th>Price</th>
    <th>Year</th>
  </tr>
  <tr>
    <td>Empire Burlesque</td>
    <td>Bob Dylan</td>
    <td>USA</td>
    <td>Columbia</td>
    <td>10.90</td>
    <td>1985</td>
  </tr>
  <tr>
    <td>Hide your heart</td>
    <td>Bonnie Tyler</td>
    <td>UK</td>
    <td>CBS Records</td>
    <td>9.90</td>
    <td>1988</td>
  </tr>
  <tr>
    <td>...</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

<p>这是一个 RDF 文档的其中几行：</p>
<pre>&lt;?xml version=&quot;1.0&quot;?&gt;

&lt;rdf:RDF
xmlns:rdf=&quot;http://www.w3.org/1999/02/22-rdf-syntax-ns#&quot; 
xmlns:cd=&quot;http://www.recshop.fake/cd#&quot;&gt;

&lt;rdf:Description
 rdf:about=&quot;http://www.recshop.fake/cd/Empire Burlesque&quot;&gt;
  &lt;cd:artist&gt;Bob Dylan&lt;/cd:artist&gt;
  &lt;cd:country&gt;USA&lt;/cd:country&gt;
  &lt;cd:company&gt;Columbia&lt;/cd:company&gt;
  &lt;cd:price&gt;10.90&lt;/cd:price&gt;
  &lt;cd:year&gt;1985&lt;/cd:year&gt;
&lt;/rdf:Description&gt;

&lt;rdf:Description
 rdf:about=&quot;http://www.recshop.fake/cd/Hide your heart&quot;&gt;
  &lt;cd:artist&gt;Bonnie Tyler&lt;/cd:artist&gt;
  &lt;cd:country&gt;UK&lt;/cd:country&gt;
  &lt;cd:company&gt;CBS Records&lt;/cd:company&gt;
  &lt;cd:price&gt;9.90&lt;/cd:price&gt;
  &lt;cd:year&gt;1988&lt;/cd:year&gt;
&lt;/rdf:Description&gt;
.
.
.
&lt;/rdf:RDF&gt;</pre>

<p>此 RDF 文档的第一行是 XML 声明。这个 XML 声明之后是 RDF 文档的根元素：<em>&lt;rdf:RDF&gt;</em>。</p>
<p><em>xmlns:rdf</em> 命名空间，规定了带有前缀 rdf 的元素来自命名空间 &quot;http://www.w3.org/1999/02/22-rdf-syntax-ns#&quot;。</p>
<p><em>xmlns:cd</em> 命名空间，规定了带有前缀 cd 的元素来自命名空间 &quot;http://www.recshop.fake/cd#&quot;。</p>
<p><em>&lt;rdf:Description&gt;</em> 元素包含了对被 <em>rdf:about</em> 属性标识的资源的描述。</p>
<p>元素：<em>&lt;cd:artist&gt;</em>、<em>&lt;cd:country&gt;</em>、<em>&lt;cd:company&gt;</em> 等是此资源的属性。</p>
</div>

<div>
<h2>RDF 在线验证器</h2>
<p><a href="http://www.w3.org/RDF/Validator/" title="W3C RDF Validation Service">W3C 的 RDF 验证服务</a>在您学习 RDF 时是很有帮助的。在此您可对 RDF 文件进行试验。</p>
<p>RDF 在线验证器可解析您的 RDF 文档，检查其中的语法，并为您的 RDF 文档生成表格和图形视图。</p>
<p>把下面这个例子拷贝粘贴到 W3C 的 RDF 验证器：</p>

<pre>&lt;?xml version=&quot;1.0&quot;?&gt;

&lt;rdf:RDF
xmlns:rdf=&quot;http://www.w3.org/1999/02/22-rdf-syntax-ns#&quot; 
xmlns:si=&quot;http://www.recshop.fake/siteinfo#&quot;&gt;
  &lt;rdf:Description rdf:about=&quot;http://www.w3school.com.cn/RDF&quot;&gt;
    &lt;si:author&gt;David&lt;/si:author&gt;
    &lt;si:homepage&gt;http://www.w3school.com.cn&lt;/si:homepage&gt;
  &lt;/rdf:Description&gt;
&lt;/rdf:RDF&gt;</pre>

<p>在您对上面的例子进行解析后，结果将是类似这样的。</p>
</div>

<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="rdf_rules.asp">Previous Page</a></li>

<li class="next"><a href="rdf_main.asp">Next Page</a></li>
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
<h5 id="tools_reference"><a href="rdf_reference.asp">RDF 参考手册</a></h5>
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