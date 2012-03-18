
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

<title>jQuery 遍历 - is() 方法</title>
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

<h1>jQuery 遍历 - is() 方法</h1>

<div class="backtoreference">
<p><a href="jquery_ref_traversing.asp" title="jQuery 参考手册 - 遍历">jQuery 遍历参考手册</a></p>
</div>


<div>
<h2>实例</h2>

<p>返回 false，因为 input 元素的父元素是 p 元素：</p>

<pre>
  var isFormParent = $(&quot;input[type='checkbox']&quot;).parent()<code>.is(&quot;form&quot;)</code>;
  $(&quot;div&quot;).text(&quot;isFormParent = &quot; + isFormParent);
</pre>

<p><a href="../tiy/t.asp@f=jquery_traversing_is">亲自试一试</a></p>
</div>


<div>
<h2>定义和用法</h2>

<p>is() 根据选择器、元素或 jQuery 对象来检测匹配元素集合，如果这些元素中至少有一个元素匹配给定的参数，则返回 true。</p>

<h3>语法</h3>

<pre>.is(<i>selector</i>)</pre>

<table class="dataintable">
<tr>
<th style="width:30%;">参数</th>

<th>描述</th>
</tr>

<tr>
<td><i>selector</i></td>
<td>字符串值，包含匹配元素的选择器表达式。</td>
</tr>
</table>

<h3>详细说明</h3>

<p>与其他筛选方法不同，.is() 不创建新的 jQuery 对象。相反，它允许我们在不修改 jQuery 对象内容的情况下对其进行检测。这在 callback 内部通常比较拥有，比如事件处理程序。</p>

<p>假设我们有一个列表，其中两个项目包含子元素：</p>

<pre>
&lt;ul&gt;
  &lt;li&gt;list &lt;strong&gt;item 1&lt;/strong&gt;&lt;/li&gt;
  &lt;li&gt;&lt;span&gt;list item 2&lt;/span&gt;&lt;/li&gt;
  &lt;li&gt;list item 3&lt;/li&gt;
&lt;/ul&gt;
</pre>

<p>您可以向 &lt;ul&gt; 元素添加 click 处理程序，然后把代码限制为只有当列表项本身，而非子元素，被点击时才进行触发：</p>

<pre>
$(&quot;ul&quot;).click(function(event) {
  var $target = $(event.target);
  if ( <code>$target.is(&quot;li&quot;)</code> ) {
    $target.css(&quot;background-color&quot;, &quot;red&quot;);
  }
});
</pre>

<p><a href="../tiy/t.asp@f=jquery_traversing_is_2">亲自试一试</a></p>

<p>现在，当用户点击的是第一个列表项中的单词 &quot;list&quot; 或第三个列表项中的任何单词时，被点击的列表项会被设置为红色背景。不过，当用户点击第一个列表项中的 item 1 或第二个列表项中的任何单词时，都不会有任何变化，这是因为这上面的情况中，事件的目标分别是 &lt;strong&gt; 是 &lt;span&gt;。</p>

<p>请您注意，对于带有位置性选择器的选择器表达式字符串，比如 :first, :gt(), or :even，位置性筛选是针对传递到 .is() 的 jQuery 对象进行的，而非针对包含文档。所以对于上面的 HTML 来说，诸如 $(&quot;li:first&quot;).is(&quot;li:last&quot;) 的表达式返回 true，但是 $(&quot;li:first-child&quot;).is(&quot;li:last-child&quot;) 返回 false。</p>
</div>


<div>
<h2>使用函数</h2>

<p>该方法的第二种用法是，对基于函数而非选择器的相关元素的表达式进行求值。对于每个元素来说，如果该函数返回 true，则 .is() 也返回 true。例如，下面是稍微复杂的 HTML 片段：</p>

<pre>
&lt;ul&gt;
  &lt;li&gt;&lt;strong&gt;list&lt;/strong&gt; item 1 - one strong tag&lt;/li&gt;
  &lt;li&gt;&lt;strong&gt;list&lt;/strong&gt; item &lt;strong&gt;2&lt;/strong&gt; -
    two &lt;span&gt;strong tags&lt;/span&gt;&lt;/li&gt;
  &lt;li&gt;list item 3&lt;/li&gt;
  &lt;li&gt;list item 4&lt;/li&gt;
  &lt;li&gt;list item 5&lt;/li&gt;
&lt;/ul&gt;
</pre>

<p>您可以向每个 &lt;li&gt; 添加 click 处理程序，以计算在被点击的 &lt;li&gt; 内部 &lt;strong&gt; 元素的数目：</p>

<pre>
$(&quot;li&quot;).click(function() {
  var $li = $(this),
    isWithTwo = <code>$li.is(function() {
      return $('strong', this).length === 2;
    })</code>;
  if ( isWithTwo ) {
    $li.css(&quot;background-color&quot;, &quot;green&quot;);
  } else {
    $li.css(&quot;background-color&quot;, &quot;red&quot;);
  }
});
</pre>

<p><a href="../tiy/t.asp@f=jquery_traversing_is_3">亲自试一试</a></p>
</div>


<div class="backtoreference">
<p><a href="jquery_ref_traversing.asp" title="jQuery 参考手册 - 遍历">jQuery 遍历参考手册</a></p>
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