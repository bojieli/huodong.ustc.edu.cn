
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

<title>VBScript Rnd 函数</title>
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
</div><div id="navsecond">

<div id="course">
<h2>VBScript 教程</h2>
<ul>
<li><a href="index.asp" title="VBScript 教程">VB 教程</a></li>
<li><a href="vbscript_intro.asp" title="VBScript简介">VB 简介</a></li>
<li><a href="vbscript_howto.asp" title="VBScript How to">VB How to</a></li>
<li><a href="vbscript_whereto.asp" title="VBScript Where to">VB Where to</a></li>
<li><a href="vbscript_variables.asp" title="VBScript变量">VB 变量</a></li>
<li><a href="vbscript_procedures.asp" title="VBScript程序">VB 程序</a></li>
<li><a href="vbscript_conditionals.asp" title="VBScript条件语句">VB 条件语句</a></li>
<li><a href="vbscript_looping.asp" title="VBScript循环语句">VB 循环语句</a></li>
<li><a href="vbscript_summary.asp" title="您已经学习了VBScript，下一步呢？">VB 总结</a></li>
</ul>

<h2>实例</h2>
<ul>
<li><a href="../example/vbst_examples.asp" title="VBScript实例">VB 实例</a></li>
</ul>

<h2>参考手册</h2>
<ul>
<li><a href="vbscript_ref_functions.asp" title="VBScript函数">VB 函数</a></li>
<li><a href="vbscript_ref_keywords.asp" title="VBScript关键字">VB 关键字</a></li>
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
<h1>VBScript Rnd 函数</h1>

<div class="backtoreference">
<p><a href="vbscript_ref_functions.asp" title="VBScript 函数">VBScript 函数参考手册</a></p>
</div>

<div>
<h2>定义和用法</h2>
<p><strong>Rnd 函数可返回一个随机数。数字总是小于 1 但大于或等于 0 。</strong></p>
<p>因每一次连续调用 Rnd 函数时都用序列中的前一个数作为下一个数的种子，所以对于任何最初给定的种子都会生成相同的数列。</p>
<p>在调用 Rnd 之前，先使用无参数的 Randomize 语句初始化随机数生成器，该生成器具有基于系统计时器的种子。</p>
<p>要产生指定范围的随机整数，请使用以下公式： </p>
<pre>Int((upperbound - lowerbound + 1) * Rnd + lowerbound)</pre>
<p>这里， upperbound 是此范围的上界，而 lowerbound 是此范围内的下界。</p>
<p class="note"><span>注释：</span>要重复随机数的序列，请在使用数值参数调用 Randomize 之前，立即用负值参数调用 Rnd。使用同样 number 值的 Randomize 不能重复先前的随机数序列。</p>


<h3>语法</h3>
<pre>Rnd[(number)]</pre>

<table class="dataintable"> 
  <tr>
    <th>参数</th>
    <th>描述</th>
  </tr>  
  <tr>
    <td>number</td>
    <td>
	<p>可选的。合法的数值表达式。</p>
	<p>如果数字是：</p>
    <ul>
      <li>&lt;0 - Rnd 会每次都返回相同的值。</li>
      <li>&gt;0 - Rnd 会返回序列中的下一个随机数。</li>
      <li>=0 - Rnd 返回最近生成的数。</li>
      <li>省略 - Rnd 会返回序列中的下一个随机数。</li>
    </ul>
	</td>
  </tr>
</table>
</div>

<div>
<h2>实例</h2>
<h3>例子 1</h3>
<pre>document.write(Rnd)</pre>
<p>输出：</p>
<pre>0.7055475</pre>

<h3>例子 2</h3>
<p>如果您使用例子 1 中的代码，相同的随机数会重复出现。</p>
<p>可以使用 Randomize 语句在页面每次重新载入的时候生成一个新的随机数：</p>

<pre>Randomize
document.write(Rnd)</pre>
<p>输出：</p>
<pre>0.4758112</pre>

<h3>例子 3</h3>
<pre>dim max,min
max=100
min=1
document.write(Int((max-min+1)*Rnd+min))</pre>
<p>输出：</p>
<pre>71</pre>
</div>

<div class="backtoreference">
<p><a href="vbscript_ref_functions.asp" title="VBScript 函数">VBScript 函数参考手册</a></p>
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
<h5 id="tools_reference"><a href="vbscript_ref_functions.asp">VBScript 参考手册</a></h5>
<h5 id="tools_example"><a href="../example/vbst_examples.asp">VBScript 实例</a></h5>
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