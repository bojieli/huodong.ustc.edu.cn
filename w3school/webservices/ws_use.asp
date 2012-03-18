
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

<title>Web Service 使用</title>
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
<h2>Web Services 基础</h2>
<ul>
<li><a href="index.asp" title="Web Services 教程">WS 首页</a></li>
<li><a href="ws_intro.asp" title="Web Services 简介">WS 简介</a></li>
<li><a href="ws_why.asp" title="Why Web Services?">Why WS?</a></li>
<li><a href="ws_platform.asp" title="Web Services 平台元素">WS 平台</a></li>
<li><a href="ws_example.asp" title="Web Services 实例">WS 实例</a></li>
<li><a href="ws_use.asp" title="Web Services 使用">WS 使用</a></li>
<li><a href="ws_summary.asp" title="您已经学习了 Web Services,下一步学习什么内容呢？">WS 总结</a></li>
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

<h1>Web Service 使用</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="ws_example.asp">Previous Page</a></li>

<li class="next"><a href="ws_summary.asp">Next Page</a></li>
</ul>

</div>


<div>
<h2>使用我们的 ASP.NET Web Service 例子</h2>
<p>在上一节，我们创建了一个 <a href="http://www.w3schools.com/webservices/tempconvert.asmx" title="TempConvert Web Service">Web Service 的例子</a>。</p>
<p>请在此测试华氏度转换摄氏度函数：<a href="http://www.w3schools.com/webservices/tempconvert.asmx?op=FahrenheitToCelsius" title="TempConvert Web Service">华氏度转换为摄氏度</a></p>
<p>请在此测试摄氏度转换华氏度函数：<a href="http://www.w3schools.com/webservices/tempconvert.asmx?op=CelsiusToFahrenheit" title="TempConvert Web Service">摄氏度转换为华氏度</a></p>
</div>

<div>
<h2>这些函数会向您发送一个 XML 回答</h2>
<p>本测试使用 HTTP POST，会发送类似这样的 XML 响应：</p>
<pre>&lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot; ?&gt; 
&lt;short xmlns=&quot;http://tempuri.org/&quot;&gt;38&lt;/short&gt;</pre>
</div>

<div>
<h2>使用表单来访问 Web Service</h2>
<p>通过使用表单和 HTTP POST，您可以把 web service 置于您的站点上，比如这样：</p>
<form target="_blank" action='http://www.w3schools.com/webservices/tempconvert.asmx/FahrenheitToCelsius' method="POST">
		<label>华氏度转换为摄氏度：</label>
		<p>
		<span><input class="frmInput" type="text" size="30" name="Fahrenheit"></span>
		<span><input type="submit" value="提交" class="button"></span>
		</p>
</form>

<form target="_blank" action='http://www.w3schools.com/webservices/tempconvert.asmx/CelsiusToFahrenheit' method="POST">
		<label>摄氏度转换为华氏度：</label>
		<p>
		<span><input class="frmInput" type="text" size="30" name="Celsius"></span>
		<span><input type="submit" value="提交" class="button"></span>
		</p>
</form>

</div>

<div>
<h2>您可以把 web service 置于您的站点上</h2>
<p>您可以使用这些代码把 web service 放置在您的站点上：</p>
<pre>
&lt;form target=&quot;_blank&quot; 
action='http://w3school.com.cn/webservices/tempconvert.asmx/FahrenheitToCelsius' 
method=&quot;POST&quot;&gt;

  &lt;label&gt;华氏度转换为摄氏度：&lt;/label&gt;
  &lt;p&gt;
  
    &lt;span&gt;
      &lt;input class=&quot;frmInput&quot; type=&quot;text&quot; size=&quot;30&quot; name=&quot;Fahrenheit&quot;&gt;
    &lt;/span&gt;
  
    &lt;span&gt;
      &lt;input type=&quot;submit&quot; value=&quot;提交&quot; class=&quot;button&quot;&gt;
    &lt;/span&gt;
  
  &lt;/p&gt;

&lt;/form&gt;


&lt;form target=&quot;_blank&quot; 
action='http://w3school.com.cn/webservices/tempconvert.asmx/CelsiusToFahrenheit' 
method=&quot;POST&quot;&gt;

  &lt;label&gt;摄氏度转换为华氏度：&lt;/label&gt;
  &lt;p&gt;
  
    &lt;span&gt;
     &lt;input class=&quot;frmInput&quot; type=&quot;text&quot; size=&quot;30&quot; name=&quot;Celsius&quot;&gt;
    &lt;/span&gt;
  
    &lt;span&gt;
     &lt;input type=&quot;submit&quot; value=&quot;提交&quot; class=&quot;button&quot;&gt;
    &lt;/span&gt;
  
  &lt;/p&gt;

&lt;/form&gt;</pre>
</div>

<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="ws_example.asp">Previous Page</a></li>

<li class="next"><a href="ws_summary.asp">Next Page</a></li>
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
</div><div id="ad">
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