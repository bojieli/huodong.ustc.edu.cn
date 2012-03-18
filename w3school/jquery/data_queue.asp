
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

<title>jQuery 遍历 - queue() 方法</title>
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
<h2>jQuery 教程</h2>
<ul>
<li><a href="index.asp" title="jQuery 教程">jQuery 教程</a></li>
<li><a href="jquery_intro.asp" title="jQuery 简介">jQuery 简介</a></li>
<li><a href="jquery_syntax.asp" title="jQuery 语法">jQuery 语法</a></li>
<li><a href="jquery_selectors.asp" title="jQuery 选择器">jQuery 选择器</a></li>
<li><a href="jquery_events.asp" title="jQuery 事件">jQuery 事件</a></li>
<li><a href="jquery_effects.asp" title="jQuery 效果">jQuery 效果</a></li>
<li><a href="jquery_callback.asp" title="jQuery Callback">jQuery Callback</a></li>
<li><a href="jquery_html.asp" title="jQuery HTML">jQuery HTML</a></li>
<li><a href="jquery_css.asp" title="jQuery CSS">jQuery CSS</a></li>
<li><a href="jquery_ajax.asp" title="jQuery AJAX 函数">jQuery AJAX</a></li>
<li><a href="jquery_examples.asp" title="jQuery 实例">jQuery 实例</a></li>
</ul>

<h2>jQuery 参考手册</h2>
<ul>
<li><a href="jquery_reference.asp" title="jQuery 参考手册">jQuery 参考手册</a></li>
<li><a href="jquery_ref_selectors.asp" title="jQuery 参考手册 - 选择器">jQuery 选择器</a></li>
<li><a href="jquery_ref_events.asp" title="jQuery 参考手册 - 事件">jQuery 事件</a></li>
<li><a href="jquery_ref_effects.asp" title="jQuery 参考手册 - 效果">jQuery 效果</a></li>
<li><a href="jquery_ref_manipulation.asp" title="jQuery 参考手册 - 文档操作">jQuery 文档操作</a></li>
<li><a href="jquery_ref_attributes.asp" title="jQuery 参考手册 - 属性">jQuery 属性</a></li>
<li><a href="jquery_ref_css.asp" title="jQuery 参考手册 - CSS">jQuery CSS</a></li>
<li><a href="jquery_ref_ajax.asp" title="jQuery Ajax 参考手册">jQuery Ajax</a></li>
<li><a href="jquery_ref_traversing.asp" title="jQuery 遍历 参考手册">jQuery 遍历</a></li>
<li><a href="jquery_ref_data.asp" title="jQuery 参考手册 - 数据">jQuery 数据</a></li>
<li><a href="jquery_ref_dom_element_methods.asp" title="jQuery 参考手册 - DOM 元素方法">jQuery DOM 元素</a></li>
<li><a href="jquery_ref_core.asp" title="jQuery 参考手册 - 核心">jQuery 核心</a></li>
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

<h1>jQuery 遍历 - queue() 方法</h1>

<div class="backtoreference">
<p><a href="jquery_ref_data.asp" title="jQuery 参考手册 - 数据">jQuery 数据参考手册</a></p>
</div>


<div>
<h2>实例</h2>

<p>显示队列的长度：</p>

<pre>
function showIt() {
  var n = <code>div.queue(&quot;fx&quot;)</code>;
  $(&quot;span&quot;).text( n.length );      
  setTimeout(showIt, 100);
}
</pre>

<p><a href="../tiy/t.asp@f=jquery_data_queue">亲自试一试</a></p>
</div>


<div>
<h2>定义和用法</h2>

<p>queue() 方法显示或操作在匹配元素上执行的函数队列。</p>

<h3>语法</h3>

<pre>.queue(<i>queueName</i>)</pre>

<table class="dataintable">
<tr>
<th style="width:25%;">参数</th>
<th>描述</th>
</tr>

<tr>
<td><i>queueName</i></td>
<td>可选。字符串值，包含序列的名称。默认是 fx, 标准的效果序列。</td>
</tr>
</table>

</div>


<div>
<h2>操作队列</h2>

<p>queue() 方法操作在匹配元素上执行的函数队列。</p>

<h3>语法</h3>

<pre>.queue(<i>queueName</i>,<i>newQueue</i>)</pre>

<table class="dataintable">
<tr>
<th style="width:25%;">参数</th>
<th>描述</th>
</tr>

<tr>
<td><i>queueName</i></td>
<td>可选。字符串值，包含序列的名称。默认是 fx, 标准的效果序列。</td>
</tr>
</table>

<h3>详细说明</h3>

<p>每个元素均可拥有一到多个由 jQuery 添加的函数队列。在大多数应用程序中，只使用一个队列（名为 fx）。队列运行在元素上异步地调用动作序列，而不会终止程序执行。典型例子时调用元素上的多个动画方法。例如：</p>

<pre>$('#foo').slideUp().fadeIn();</pre>

<p>当这条语句执行时，元素会立即开始其滑动动画，但是淡入过渡被置于 fx 队列，只有当滑动过渡完成后才会被调用。</p>

<p>.queue() 方法允许我们直接对这个函数队列进行操作。调用带有回调函数的 .queue() 方法特别有用；它允许我们在队列末端放置一个新函数。</p>

<p>这个特性与动画方法提供回调函数类似，但是无需在动画执行时设置回调函数。</p>

<pre>
$('#foo').slideUp();
$('#foo')<code>.queue(function() {
  alert('Animation complete.');
  <span class="marked">$(this).dequeue();</span>
})</code>;
</pre>

<p>等价于：</p>

<pre>
$('#foo').slideUp(function() {
  alert('Animation complete.');
});
</pre>

<p>请注意，当通过 .queue() 添加函数时，我们应当确保最终调用了 .dequeue()，这样下一个排队的函数才能执行。</p>

<h3>例子 1</h3>

<p>对自定义函数进行队列操作：</p>

<pre>
$(document.body).click(function () {
  $(&quot;div&quot;).show(&quot;slow&quot;);
  $(&quot;div&quot;).animate({left:'+=200'},2000);
  $(&quot;div&quot;)<code>.queue(function () {
    $(this).addClass(&quot;newcolor&quot;);
    $(this).dequeue();
  })</code>;
  $(&quot;div&quot;).animate({left:'-=200'},500);
  $(&quot;div&quot;)<code>.queue(function () {
    $(this).removeClass(&quot;newcolor&quot;);
    $(this).dequeue();
  })</code>;
  $(&quot;div&quot;).slideUp();
});
</pre>

<p><a href="../tiy/t.asp@f=jquery_data_queue_2">亲自试一试</a></p>

<h3>例子 2</h3>

<p>设置队列数组来删除队列：</p>

<pre>
$(&quot;#start&quot;).click(function () {
  $(&quot;div&quot;).show(&quot;slow&quot;);
  $(&quot;div&quot;).animate({left:'+=200'},5000);
  $(&quot;div&quot;).queue(function () {
    $(this).addClass(&quot;newcolor&quot;);
    $(this).dequeue();
  });
  $(&quot;div&quot;).animate({left:'-=200'},1500);
  $(&quot;div&quot;).queue(function () {
    $(this).removeClass(&quot;newcolor&quot;);
    $(this).dequeue();
  });
  $(&quot;div&quot;).slideUp();
});

$(&quot;#stop&quot;).click(function () {
  <code>$(&quot;div&quot;).queue(&quot;fx&quot;, []);</code>
  $(&quot;div&quot;).stop();
});
</pre>

<p><a href="../tiy/t.asp@f=jquery_data_queue_3">亲自试一试</a></p>

</div>


<div class="backtoreference">
<p><a href="jquery_ref_data.asp" title="jQuery 参考手册 - 数据">jQuery 数据参考手册</a></p>
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
<h5 id="tools_reference"><a href="jquery_reference.asp" title="jQuery 参考手册">jQuery 参考手册</a></h5>
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