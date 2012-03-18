
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

<title>JavaScript If...Else 语句</title>
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

<h2>JavaScript 基础</h2>
<ul>
<li><a href="index.asp" title="JavaScript 教程">JS 教程</a></li>
<li><a href="js_intro.asp" title="JavaScript 简介">JS 简介</a></li>
<li><a href="js_howto.asp" title="JavaScript 实现">JS 实现</a></li>
<li><a href="js_whereto.asp" title="JavaScript 放置">JS 放置</a></li>
<li><a href="js_statements.asp" title="JavaScript 语句">JS 语句</a></li>
<li><a href="js_comments.asp" title="JavaScript 注释">JS 注释</a></li>
<li><a href="js_variables.asp" title="JavaScript 变量">JS 变量</a></li>
<li><a href="js_operators.asp" title="JavaScript 运算符">JS 运算符</a></li>
<li><a href="js_comparisons.asp" title="JavaScript 比较">JS 比较</a></li>
<li><a href="js_if_else.asp" title="JavaScript If...Else">JS If...Else</a></li>
<li><a href="js_switch.asp" title="JavaScript Switch">JS Switch</a></li>
<li><a href="js_popup.asp" title="JavaScript 消息框">JS 消息框</a></li>
<li><a href="js_functions.asp" title="JavaScript 函数">JS 函数</a></li>
<li><a href="js_loop_for.asp" title="JavaScript For Loop">JS For Loop</a></li>
<li><a href="js_loop_while.asp" title="JavaScript While Loop">JS While Loop</a></li>
<li><a href="js_break.asp" title="JavaScript Break Loops">JS Break Loops</a></li>
<li><a href="js_loop_for_in.asp" title="JavaScript For...In">JS For...In</a></li>
<li><a href="js_events.asp" title="JavaScript 事件">JS 事件</a></li>
<li><a href="js_try_catch.asp" title="JavaScript Try...Catch">JS Try...Catch</a></li>
<li><a href="js_throw.asp" title="JavaScript Throw">JS Throw</a></li>
<li><a href="js_onerror.asp" title="JavaScript onerror">JS onerror</a></li>
<li><a href="js_special_characters.asp" title="JavaScript 特殊字符">JS 特殊字符</a></li>
<li><a href="js_guidelines.asp" title="JavaScript 指导方针">JS 指导方针</a></li>
</ul>

<h2>JavaScript 对象</h2>
<ul>
<li><a href="js_obj_intro.asp" title="JavaScript 对象简介">JS 对象简介</a></li>
<li><a href="js_obj_string.asp" title="JavaScript 字符串对象">JS 字符串</a></li>
<li><a href="js_obj_date.asp" title="JavaScript 日期对象">JS 日期</a></li>
<li><a href="js_obj_array.asp" title="JavaScript 数组对象">JS 数组</a></li>
<li><a href="js_obj_boolean.asp" title="JavaScript 逻辑对象">JS 逻辑</a></li>
<li><a href="js_obj_math.asp" title="JavaScript 算数对象">JS 算数</a></li>
<li><a href="js_obj_regexp.asp" title="JavaScript RegExp 对象">JS RegExp</a></li>
<li><a href="js_obj_htmldom.asp" title="JavaScript HTML DOM">JS HTML DOM</a></li>
</ul>

<h2>JavaScript 高级</h2>
<ul>
<li><a href="js_browser.asp" title="JavaScript 浏览器">JS 浏览器</a></li>
<li><a href="js_cookies.asp" title="JavaScript Cookies">JS Cookies</a></li>
<li><a href="js_form_validation.asp" title="JavaScript 验证">JS 验证</a></li>
<li><a href="js_animation.asp" title="JavaScript 动画">JS 动画</a></li>
<li><a href="js_image_maps.asp" title="JavaScript 图像地图">JS 图像地图</a></li>
<li><a href="js_timing.asp" title="JavaScript 计时">JS 计时</a></li>
<li><a href="js_objects.asp" title="JavaScript 创建对象">JS 创建对象</a></li>
<li><a href="js_summary.asp" title="JavaScript 教程总结">JS 总结</a></li>
</ul>

<h2>实例/测验</h2>
<ul>
<li><a href="../example/jseg_examples.asp" title="JS 实例">JS 实例</a></li>
<li><a href="../example/jsrf_examples.asp" title="JS 对象实例">JS 对象实例</a></li>
<li><a href="js_quiz.asp" title="JS 测验">JS 测验</a></li>
</ul>

<h2>JS 参考手册</h2>
<ul>
<li><a href="js_reference.asp" title="JavaScript 对象">JS 对象</a></li>
<li><a href="../htmldom/htmldom_reference.asp" title="JavaScript HTML DOM">JS HTML DOM</a></li>
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
<h1>JavaScript If...Else 语句</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="js_comparisons.asp">Previous Page</a></li>

<li class="next"><a href="js_switch.asp">Next Page</a></li>
</ul>

</div>

<div id="intro">
<p><strong>JavaScript 中的条件语句用于完成不同条件下的行为。</strong></p>
</div>


<div class="example">
<h2>实例</h2>

<dl>
<dt><a href="../tiy/t.asp@f=jseg_ifthen">If 语句</a></dt>
<dd>如何编写一个 If 语句。</dd>

<dt><a href="../tiy/t.asp@f=jseg_ifthenelse">If...else 语句</a></dt>
<dd>如何编写 if...else 语句。</dd>

<dt><a href="../tiy/t.asp@f=jseg_elseif">If..else if...else 语句</a></dt>
<dd>如何编写 if..else if...else 语句</dd>

<dt><a href="../tiy/t.asp@f=jseg_randomlink">随机链接</a></dt>
<dd>本例演示一个随机的链接，当您单击这个链接时，会打开某个随机的网站。</dd>
</dl>
</div>

<div id="definitionlist">
<h2>条件语句</h2>

<p>在您编写代码时，经常需要根据不同的条件完成不同的行为。可以在代码中使用条件语句来完成这个任务。</p>

<p>在 JavaScript 中，我们可以使用下面几种条件语句：</p>
<dl>
<dt>if 语句</dt>
<dd>在一个指定的条件成立时执行代码。</dd>
<dt>if...else 语句</dt>
<dd>在指定的条件成立时执行代码，当条件不成立时执行另外的代码。</dd>
<dt>if...else if....else 语句</dt>
<dd>使用这个语句可以选择执行若干块代码中的一个。</dd>
<dt>switch 语句</dt>
<dd>使用这个语句可以选择执行若干块代码中的一个。</dd>
</dl>
</div>

<div>
<h2>If 语句</h2>

<p>如果希望指定的条件成立时执行代码，就可以使用这个语句。</p>

<p>语法：</p>
<pre>
<code>if</code> (条件)
{
条件成立时执行代码
} 
</pre>

<p class="important"><span>注意：</span>请使用小写字母。使用大写的 IF 会出错！</p>


<h3>实例 1</h3>

<pre>&lt;script type=&quot;text/javascript&quot;&gt;
//Write a &quot;Good morning&quot; greeting if
//the time is less than 10

var d=new Date()
var time=d.getHours()

<code>if</code> (time&lt;10) 
{
document.write(&quot;&lt;b&gt;Good morning&lt;/b&gt;&quot;)
}
&lt;/script&gt;</pre>

<h3>实例 2</h3>

<pre>&lt;script type=&quot;text/javascript&quot;&gt;
//Write &quot;Lunch-time!&quot; if the time is 11

var d=new Date()
var time=d.getHours()

<code>if</code> (time==11) 
{
document.write(&quot;&lt;b&gt;Lunch-time!&lt;/b&gt;&quot;)
}
&lt;/script&gt;</pre>

<p class="important"><span>注意：</span>请使用双等号 (==) 来<em>比较</em>变量！</p>
<p class="important"><span>注意：</span>在语法中没有 else。<em>仅仅当条件为 true 时</em>，代码才会执行。</p>
</div>

<div>
<h2>If...else 语句</h2>

<p>如果希望条件成立时执行一段代码，而条件不成立时执行另一段代码，那么可以使用 if....else 语句。</p>


<h3>语法：</h3>

<pre>
<code>if</code> (条件)
{
条件成立时执行此代码
}
<code>else</code>
{
条件不成立时执行此代码
}
</pre>
<h3>实例</h3>
<pre>&lt;script type=&quot;text/javascript&quot;&gt;
//If the time is less than 10,
//you will get a &quot;Good morning&quot; greeting.
//Otherwise you will get a &quot;Good day&quot; greeting.

var d = new Date()
var time = d.getHours()

<code>if</code> (time &lt; 10) 
{
document.write(&quot;Good morning!&quot;)
}
<code>else</code>
{
document.write(&quot;Good day!&quot;)
}
&lt;/script&gt;</pre>
</div>

<div>
<h2>If...else if...else 语句</h2>

<p>当需要选择多套代码中的一套来运行时，请使用 if....else if...else 语句。</p>


<h3>语法：</h3>

<pre>
<code>if</code> (条件1)
{
条件1成立时执行代码
}
<code>else if</code> (条件2)
{
条件2成立时执行代码
}
<code>else</code>
{
条件1和条件2均不成立时执行代码
}
</pre>


<h3>实例：</h3>

<pre>&lt;script type=&quot;text/javascript&quot;&gt;

var d = new Date()
var time = d.getHours()

<code>if</code> (time&lt;10)
{
document.write(&quot;&lt;b&gt;Good morning&lt;/b&gt;&quot;)
}
<code>else if</code> (time&gt;10 &amp;&amp; time&lt;16)
{
document.write(&quot;&lt;b&gt;Good day&lt;/b&gt;&quot;)
}
<code>else</code>
{
document.write(&quot;&lt;b&gt;Hello World!&lt;/b&gt;&quot;)
}
&lt;/script&gt;</pre>
</div>

<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="js_comparisons.asp">Previous Page</a></li>

<li class="next"><a href="js_switch.asp">Next Page</a></li>
</ul>

</div>

<div id="toc">
<h2>课外书</h2>

<p>如需更多有关 <em>JavaScript if 语句</em>的知识，请阅读 JavaScript 高级教程中的相关内容：</p>

<dl>
<dt><a href="pro_js_statements_if.asp" title="ECMAScript if 语句">ECMAScript if 语句</a></dt>
<dd>if 语句是 ECMAScript 中最常用的语句之一。本节为您详细讲解了如何使用 if 语句。</dd>
</dl>
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
<h5 id="tools_reference"><a href="js_reference.asp">JavaScript 参考手册</a></h5>
<h5 id="tools_example"><a href="../example/jseg_examples.asp">JavaScript 实例</a></h5>
<h5 id="tools_quiz"><a href="js_quiz.asp">JavaScript 测验</a></h5>
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