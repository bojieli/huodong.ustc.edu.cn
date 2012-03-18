
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

<title>WMLScript Lang 库</title>
</head>

<body class="browserscripting">
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
</div>
<div id="navsecond">

<div id="course">
<h2>WMLScript 教程</h2>
<ul>
<li><a href="index.asp" title="WMLScript教程首页">WMLScript 首页</a></li>
<li><a href="wmlscript_intro.asp" title="WMLScript简介">WMLScript 简介</a></li>
<li><a href="wmlscript_howto.asp" title="如何调用 WMLScript">WMLScript 调用</a></li>
</ul>

<h2>WML 库</h2>
<ul>
<li><a href="wmlscript_lib_dialogs.asp" title="WMLScript Dialogs 库">WML Dialogs</a></li>
<li><a href="wmlscript_lib_float.asp" title="WMLScript Float 库">WML Float</a></li>
<li><a href="wmlscript_lib_lang.asp" title="WMLScript Lang 库">WML Lang</a></li>
<li><a href="wmlscript_lib_string.asp" title="WMLScript String 库">WML String</a></li>
<li><a href="wmlscript_lib_url.asp" title="WMLScript URL 库">WML URL</a></li>
<li><a href="wmlscript_lib_wmlbrowser.asp" title="WMLScript WMLBrowser 库">WML Browser</a></li>
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

<h1>WMLScript Lang 库</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="wmlscript_lib_float.asp">Previous Page</a></li>

<li class="next"><a href="wmlscript_lib_string.asp">Next Page</a></li>
</ul>

</div>


<div id="intro">
<p><strong>Lang 函数库包含用于绝对值计算、数据类型操作以及随机数生成的函数。</strong></p>
</div>

<div>
<h2>WMLScript Lang 库的函数</h2>

<table class="dataintable">
  <tr>
    <th>函数</th>
    <th>描述</th>
  </tr>
  <tr>
    <td><a href="lang_abort.asp">abort()</a></td>
    <td>中止 WMLScript，并向该脚本的调用者返回一条消息。</td>
  </tr>
  <tr>
    <td><a href="lang_abs.asp">abs(x)</a></td>
    <td>返回一个数的绝对值。</td>
  </tr>
  <tr>
    <td><a href="lang_characterset.asp">characterSet()</a></td>
    <td>返回 WMLScript 解释器所支持的字符集。</td>
  </tr>
  <tr>
    <td><a href="lang_exit.asp">exit()</a></td>
    <td>退出 WMLScript，并向该脚本的调用者返回一条消息。</td>
  </tr>
  <tr>
    <td><a href="lang_float.asp">float()</a></td>
    <td>返回一个布尔值，该值指示是否支持浮点数。</td>
  </tr>
  <tr>
    <td><a href="lang_isfloat.asp">isFloat()</a></td>
    <td>返回一个布尔值，指示是否能够通过 parseFloat() 函数把一个值转换为浮点数。</td>
  </tr>
  <tr>
    <td><a href="lang_isint.asp">isInt()</a></td>
    <td>返回一个布尔值，指示是否能够通过 parseInt() 函数把一个值转换为整数。</td>
  </tr>
  <tr>
    <td><a href="lang_max.asp">max(x,y)</a></td>
    <td>返回 x 和 y 中的最高值。</td>
  </tr>
  <tr>
    <td><a href="lang_maxint.asp">maxInt()</a></td>
    <td>返回可能的最大整数值。</td>
  </tr>
  <tr>
    <td><a href="lang_min.asp">min(x,y)</a></td>
    <td>返回 x 和 y 中的最小值。</td>
  </tr>
  <tr>
    <td><a href="lang_minint.asp">minInt()</a></td>
    <td>返回可能的最小整数值。</td>
  </tr>
  <tr>
    <td><a href="lang_parsefloat.asp">parseFloat()</a></td>
    <td>返回由一个字符串定义的浮点数。</td>
  </tr>
  <tr>
    <td><a href="lang_parseint.asp">parseInt()</a></td>
    <td>返回由一个字符串定义的整数。</td>
  </tr>
  <tr>
    <td><a href="lang_random.asp">random(x)</a></td>
    <td>返回介于 0 与 x 之间的随机整数。</td>
  </tr>
  <tr>
    <td><a href="lang_seed.asp">seed()</a></td>
    <td>初始化带有一个数字的随机数生成器，并返回一个空字符串。</td>
  </tr>
</table>

<p class="note"><span>注释：</span>Lang 函数库的名称容易使人误解，应该命名为 Math 函数库之类的名称。不过之所以它称为 Lang 函数库，是因为这个函数库所含的函数同 WMLScript 语言的核心有很密切的关系。</p>
</div>

<div  id="bpn">
<ul class="prenext">

<li class="pre"><a href="wmlscript_lib_float.asp">Previous Page</a></li>

<li class="next"><a href="wmlscript_lib_string.asp">Next Page</a></li>
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
<h5 id="tools_reference"><a href="index.asp#WMLScript_Libraries">WMLScript 库 参考手册</a></h5>
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