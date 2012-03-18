
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

<title>JavaScript Math 对象的参考手册</title>
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
<h2>JS &amp; DOM 参考手册</h2>
<ul>
<li><a href="js_reference.asp">参考手册概述</a></li>
</ul>

<h2>JavaScript 对象</h2>
<ul class="small">
<li><a href="jsref_obj_array.asp">JS Array</a></li>
<li><a href="jsref_obj_boolean.asp">JS Boolean</a></li>
<li><a href="jsref_obj_date.asp">JS Date</a></li>
<li><a href="jsref_obj_math.asp">JS Math</a></li>
<li><a href="jsref_obj_number.asp">JS Number</a></li>
<li><a href="jsref_obj_string.asp">JS String</a></li>
<li><a href="jsref_obj_regexp.asp">JS RegExp</a></li>
<li><a href="jsref_obj_global.asp">JS Functions</a></li>
<li><a href="jsref_events.asp">JS Events</a></li>
</ul>

<h2>Browser 对象</h2>
<ul class="small">
<li><a href="../htmldom/dom_obj_window.asp" title="HTML DOM Window 对象">DOM Window</a></li>
<li><a href="../htmldom/dom_obj_navigator.asp" title="HTML DOM Navigator 对象">DOM Navigator</a></li>
<li><a href="../htmldom/dom_obj_screen.asp" title="HTML DOM Screen 对象">DOM Screen</a></li>
<li><a href="../htmldom/dom_obj_history.asp" title="HTML DOM History 对象">DOM History</a></li>
<li><a href="../htmldom/dom_obj_location.asp" title="HTML DOM Location 对象">DOM Location</a></li>
</ul>

<h2>HTML DOM 对象</h2>
<ul class="small">
<li><a href="../htmldom/dom_obj_document.asp" title="HTML DOM Document 对象">DOM Document</a></li>
<li><a href="../htmldom/dom_obj_anchor.asp" title="HTML DOM Anchor 对象">DOM Anchor</a></li>
<li><a href="../htmldom/dom_obj_area.asp" title="HTML DOM Area 对象">DOM Area</a></li>
<li><a href="../htmldom/dom_obj_base.asp" title="HTML DOM Base 对象">DOM Base</a></li>
<li><a href="../htmldom/dom_obj_body.asp" title="HTML DOM Body 对象">DOM Body</a></li>
<li><a href="../htmldom/dom_obj_pushbutton.asp" title="HTML DOM Button 对象">DOM Button</a></li>
<li><a href="../htmldom/dom_obj_canvas.asp" title="HTML DOM Canvas 对象">DOM Canvas</a></li>
<li><a href="../htmldom/dom_obj_event.asp" title="HTML DOM Event 对象">DOM Event</a></li>
<li><a href="../htmldom/dom_obj_form.asp" title="HTML DOM Form 对象">DOM Form</a></li>
<li><a href="../htmldom/dom_obj_frame.asp" title="HTML DOM Frame 对象">DOM Frame</a></li>
<li><a href="../htmldom/dom_obj_frameset.asp" title="HTML DOM Frameset 对象">DOM Frameset</a></li>
<li><a href="../htmldom/dom_obj_iframe.asp" title="HTML DOM IFrame 对象">DOM IFrame</a></li>
<li><a href="../htmldom/dom_obj_image.asp" title="HTML DOM Image 对象">DOM Image</a></li>
<li><a href="../htmldom/dom_obj_button.asp" title="HTML DOM Button 对象">DOM Input Button</a></li>
<li><a href="../htmldom/dom_obj_checkbox.asp" title="HTML DOM Checkbox 对象">DOM Input Checkbox</a></li>
<li><a href="../htmldom/dom_obj_fileupload.asp" title="HTML DOM FileUpload 对象">DOM Input File</a></li>
<li><a href="../htmldom/dom_obj_hidden.asp" title="HTML DOM Hidden 对象">DOM Input Hidden</a></li>
<li><a href="../htmldom/dom_obj_password.asp" title="HTML DOM Password 对象">DOM Input Password</a></li>
<li><a href="../htmldom/dom_obj_radio.asp" title="HTML DOM Radio 对象">DOM Input Radio</a></li>
<li><a href="../htmldom/dom_obj_reset.asp" title="HTML DOM Reset 对象">DOM Input Reset</a></li>
<li><a href="../htmldom/dom_obj_submit.asp" title="HTML DOM Submit 对象">DOM Input Submit</a></li>
<li><a href="../htmldom/dom_obj_text.asp" title="HTML DOM Text 对象">DOM Input Text</a></li>
<li><a href="../htmldom/dom_obj_link.asp" title="HTML DOM Link 对象">DOM Link</a></li>
<li><a href="../htmldom/dom_obj_meta.asp" title="HTML DOM Meta 对象">DOM Meta</a></li>
<li><a href="../htmldom/dom_obj_object.asp" title="HTML DOM Object 对象">DOM Object</a></li>
<li><a href="../htmldom/dom_obj_option.asp" title="HTML DOM Option 对象">DOM Option</a></li>
<li><a href="../htmldom/dom_obj_select.asp" title="HTML DOM Select 对象">DOM Select</a></li>
<li><a href="../htmldom/dom_obj_style.asp" title="HTML DOM Style 对象">DOM Style</a></li>
<li><a href="../htmldom/dom_obj_table.asp" title="HTML DOM Table 对象">DOM Table</a></li>
<li><a href="../htmldom/dom_obj_tabledata.asp" title="HTML DOM TableCell 对象">DOM TableCell</a></li>
<li><a href="../htmldom/dom_obj_tablerow.asp" title="HTML DOM TableRow 对象">DOM TableRow</a></li>
<li><a href="../htmldom/dom_obj_textarea.asp" title="HTML DOM Textarea 对象">DOM Textarea</a></li>
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

<h1>JavaScript Math 对象的参考手册</h1>


<div id="intro">
<h2>Math 对象</h2>

<p>Math 对象用于执行数学任务。</p>

<h3>使用 Math 的属性和方法的语法：</h3>
<pre>var pi_value=Math.PI;
var sqrt_value=Math.sqrt(15);</pre>

<p class="note"><span>注释：</span>Math 对象并不像 Date 和 String 那样是对象的类，因此没有构造函数 Math()，像 Math.sin() 这样的函数只是函数，不是某个对象的方法。您无需创建它，通过把 Math 作为对象使用就可以调用其所有属性和方法。</p>
</div>


<div>
<h2>Math 对象属性</h2>

<p>FF: Firefox, IE: Internet Explorer</p>

<table class="dataintable">
  <tr>
    <th style="width:20%">属性</th>
    <th style="width:66%">描述</th>
    <th style="width:7%">FF</th>
    <th style="width:7%">IE</th>
  </tr>

  <tr>
    <td><a href="jsref_e.asp">E</a></td>
    <td>返回算术常量 e，即自然对数的底数（约等于2.718）。</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_ln2.asp">LN2</a></td>
    <td>返回 2 的自然对数（约等于0.693）。</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_ln10.asp">LN10</a></td>
    <td>返回 10 的自然对数（约等于2.302）。</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_log2e.asp">LOG2E</a></td>
    <td>返回以 2 为底的 e 的对数（约等于 1.414）。</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_log10e.asp">LOG10E</a></td>
    <td>返回以 10 为底的 e 的对数（约等于0.434）。</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_pi.asp">PI</a></td>
    <td>返回圆周率（约等于3.14159）。</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_sqrt1_2.asp">SQRT1_2</a></td>
    <td>返回返回 2 的平方根的倒数（约等于 0.707）。</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_sqrt2.asp">SQRT2</a></td>
    <td>返回 2 的平方根（约等于 1.414）。</td>
    <td>1</td>
    <td>3</td>
  </tr>
</table>
</div>


<div>
<h2>Math 对象方法</h2>

<p>FF: Firefox, IE: Internet Explorer</p>

<table class="dataintable">
  <tr>
    <th style="width:20%">方法</th>
    <th style="width:66%">描述</th>
    <th style="width:7%">FF</th>
    <th style="width:7%">IE</th>
  </tr>

  <tr>
    <td><a href="jsref_abs.asp">abs(x)</a></td>
    <td>返回数的绝对值。</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_acos.asp">acos(x)</a></td>
    <td>返回数的反余弦值。</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_asin.asp">asin(x)</a></td>
    <td>返回数的反正弦值。</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_atan.asp">atan(x)</a></td>
    <td>以介于 -PI/2 与 PI/2 弧度之间的数值来返回 x 的反正切值。</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_atan2.asp">atan2(y,x)</a></td>
    <td>返回从 x 轴到点 (x,y) 的角度（介于 -PI/2 与 PI/2 弧度之间）。</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_ceil.asp">ceil(x)</a></td>
    <td>对数进行上舍入。</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_cos.asp">cos(x)</a></td>
    <td>返回数的余弦。</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_exp.asp">exp(x)</a></td>
    <td>返回 e 的指数。</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_floor.asp">floor(x)</a></td>
    <td>对数进行下舍入。</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_log.asp">log(x)</a></td>
    <td>返回数的自然对数（底为e）。</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_max.asp">max(x,y)</a></td>
    <td>返回 x 和 y 中的最高值。</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_min.asp">min(x,y)</a></td>
    <td>返回 x 和 y 中的最低值。</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_pow.asp">pow(x,y)</a></td>
    <td>返回 x 的 y 次幂。</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_random.asp">random()</a></td>
    <td>返回 0 ~ 1 之间的随机数。</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_round.asp">round(x)</a></td>
    <td>把数四舍五入为最接近的整数。</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_sin.asp">sin(x)</a></td>
    <td>返回数的正弦。</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_sqrt.asp">sqrt(x)</a></td>
    <td>返回数的平方根。</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_tan.asp">tan(x)</a></td>
    <td>返回角的正切。</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_tosource_math.asp">toSource()</a></td>
    <td>返回该对象的源代码。</td>
    <td>1</td>
    <td>-</td>
  </tr>

  <tr>
    <td><a href="jsref_valueof_math.asp">valueOf()</a></td>
    <td>返回 Math 对象的原始值。</td>
    <td>1</td>
    <td>4</td>
  </tr>
</table>
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