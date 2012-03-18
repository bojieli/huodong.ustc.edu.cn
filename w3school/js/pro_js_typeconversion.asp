
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

<title>ECMAScript 类型转换</title>
</head>

<body class="browserscripting">
<div id="wrapper" class="as">

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

<div id="afterschool">

<h2>JavaScript 简介</h2>
<ul>
<li><a href="index_pro.asp" title="JavaScript 高级教程">JavaScript 高级教程</a></li>
<li><a href="pro_js_history.asp" title="JavaScript 历史">JavaScript 历史</a></li>
<li><a href="pro_js_implement.asp" title="JavaScript 实现">JavaScript 实现</a></li>
</ul>

<h2>ECMAScript 基础</h2>
<ul>
<li><a href="pro_js_syntax.asp" title="ECMAScript 语法">ECMAScript 语法</a></li>
<li><a href="pro_js_variables.asp" title="ECMAScript 变量">ECMAScript 变量</a></li>
<li><a href="pro_js_keywords.asp" title="ECMAScript 关键字">ECMAScript 关键字</a></li>
<li><a href="pro_js_reservedwords.asp" title="ECMAScript 保留字">ECMAScript 保留字</a></li>
<li><a href="pro_js_value.asp" title="ECMAScript 值">ECMAScript 值</a></li>
<li><a href="pro_js_primitivetypes.asp" title="ECMAScript 原始类型">ECMAScript 原始类型</a></li>
<li><a href="pro_js_typeconversion.asp" title="ECMAScript 类型转换">ECMAScript 类型转换</a></li>
<li><a href="pro_js_referencetypes.asp" title="ECMAScript 引用类型">ECMAScript 引用类型</a></li>
</ul>

<h2>ECMAScript 运算符</h2>
<ul>
<li><a href="pro_js_operators_unary.asp" title="ECMAScript 一元运算符">一元运算符</a></li>
<li><a href="pro_js_operators_bitwise.asp" title="ECMAScript 位运算符">位运算符</a></li>
<li><a href="pro_js_operators_boolean.asp" title="ECMAScript Boolean 运算符">逻辑运算符</a></li>
<li><a href="pro_js_operators_multiplicative.asp" title="ECMAScript 乘性运算符">乘性运算符</a></li>
<li><a href="pro_js_operators_additive.asp" title="ECMAScript 加性运算符">加性运算符</a></li>
<li><a href="pro_js_operators_relational.asp" title="ECMAScript 关系运算符">关系运算符</a></li>
<li><a href="pro_js_operators_equality.asp" title="ECMAScript 等性运算符">等性运算符</a></li>
<li><a href="pro_js_operators_conditional.asp" title="ECMAScript 条件运算符">条件运算符</a></li>
<li><a href="pro_js_operators_assignment.asp" title="ECMAScript 赋值运算符">赋值运算符</a></li>
<li><a href="pro_js_operators_comma.asp" title="ECMAScript 逗号运算符">逗号运算符</a></li>
</ul>

<h2>ECMAScript 语句</h2>
<ul>
<li><a href="pro_js_statements_if.asp" title="ECMAScript if 语句">if 语句</a></li>
<li><a href="pro_js_statements_iterative.asp" title="ECMAScript 迭代语句">迭代语句</a></li>
<li><a href="pro_js_statements_labeled.asp" title="ECMAScript 标签语句">标签语句</a></li>
<li><a href="pro_js_statements_break_continue.asp" title="ECMAScript break 和 continue 语句">break 语句</a></li>
<li><a href="pro_js_statements_break_continue.asp" title="ECMAScript break 和 continue 语句">continue 语句</a></li>
<li><a href="pro_js_statements_with.asp" title="ECMAScript with 语句">with 语句</a></li>
<li><a href="pro_js_statements_switch.asp" title="ECMAScript switch 语句">switch 语句</a></li>
</ul>

<h2>ECMAScript 函数</h2>
<ul>
<li><a href="pro_js_functions.asp" title="ECMAScript 函数概述">函数概述</a></li>
<li><a href="pro_js_functions_arguments_object.asp" title="ECMAScript arguments 对象">arguments 对象</a></li>
<li><a href="pro_js_functions_function_object.asp" title="ECMAScript Function 对象（类）">Function 对象</a></li>
<li><a href="pro_js_functions_closures.asp" title="ECMAScript 闭包（closure）">闭包（closure）</a></li>
</ul>

<h2>ECMAScript 对象</h2>
<ul>
<li><a href="pro_js_object_oriented.asp" title="ECMAScript 面向对象技术">面向对象</a></li>
<li><a href="pro_js_object_working_with.asp" title="ECMAScript 对象应用">对象应用</a></li>
<li><a href="pro_js_object_types.asp" title="ECMAScript 对象类型">对象类型</a></li>
<li><a href="pro_js_object_scope.asp" title="ECMAScript 对象作用域">对象作用域</a></li>
<li><a href="pro_js_object_defining.asp" title="ECMAScript 定义类或对象">定义类或对象</a></li>
<li><a href="pro_js_object_modifying.asp" title="ECMAScript 修改对象">修改对象</a></li>
</ul>

<h2>ECMAScript 继承</h2>
<ul>
<li><a href="pro_js_inheritance_in_action.asp" title="ECMAScript 继承机制实例">继承机制实例</a></li>
<li><a href="pro_js_inheritance_implementing.asp" title="ECMAScript 继承机制实现">继承机制实现</a></li>
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

<h1>ECMAScript 类型转换</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="pro_js_primitivetypes.asp">Previous Page</a></li>

<li class="next"><a href="pro_js_referencetypes.asp">Next Page</a></li>
</ul>

</div>

<div>
<p><strong>所有程序设计语言最重要的特征之一是具有进行类型转换的能力。</strong></p>
<p><strong>ECMAScript 给开发者提供了大量简单的类型转换方法。</strong></p>
<p><strong>大部分类型具有进行简单转换的方法，还有几个全局方法可以用于更复杂的转换。无论哪种情况，在 ECMAScript 中，类型转换都是简短的一步操作。</strong></p>
</div>

<div>
<h2>转换成字符串</h2>

<p>ECMAScript 的 Boolean 值、数字和字符串的原始值的有趣之处在于它们是伪对象，这意味着它们实际上具有属性和方法。</p>

<p>例如，要获得字符串的长度，可以采用下面的代码：</p>

<pre>
var sColor = &quot;red&quot;;
alert(sColor.length);	<span>//输出 &quot;3&quot;</span>
</pre>

<p>尽管 &quot;red&quot; 是原始类型的字符串，它仍然具有属性 length，用于存放字符串的大小。</p>

<p>总而言之，3 种主要的原始类型 Boolean 值、数字和字符串都有 toString() 方法，可以把它们的值转换成字符串。</p>

<p class="tip"><span>提示：</span>您也许会问，“字符串还有 toString() 方法吗，这不是多余吗？”是的，的确如此，不过 ECMAScript 定义所有对象都有 toString() 方法，无论它是伪对象，还是真对象。因为 String 类型属于伪对象，所以它一定有 toString() 方法。</p>

<p>Boolean 类型的 toString() 方法只是输出 &quot;true&quot; 或 &quot;false&quot;，结果由变量的值决定：</p>

<pre>
var bFound = false;
alert(bFound.toString());	<span>//输出 &quot;false&quot;</span>
</pre>

<p>Number 类型的 toString() 方法比较特殊，它有两种模式，即<em>默认模式</em>和<em>基模式</em>。采用默认模式，toString() 方法只是用相应的字符串输出数字值（无论是整数、浮点数还是科学计数法），如下所示：</p>

<pre>
var iNum1 = 10;
var iNum2 = 10.0;
alert(iNum1.toString());	<span>//输出 &quot;10&quot;</span>
alert(iNum2.toString());	<span>//输出 &quot;10&quot;</span>
</pre>

<p class="note"><span>注释：</span>在默认模式中，无论最初采用什么表示法声明数字，Number 类型的 toString() 方法返回的都是数字的十进制表示。因此，以八进制或十六进制字面量形式声明的数字输出的都是十进制形式的。</p>

<p>采用 Number 类型的 toString() 方法的基模式，可以用不同的<em>基</em>输出数字，例如二进制的基是 2，八进制的基是 8，十六进制的基是 16。</p>

<p><em>基</em>只是要转换成的基数的另一种加法而已，它是 toString() 方法的参数：</p>

<pre>
var iNum = 10;
alert(iNum1.toString(2));	<span>//输出 &quot;1010&quot;</span>
alert(iNum1.toString(8));	<span>//输出 &quot;12&quot;</span>
alert(iNum1.toString(16));	<span>//输出 &quot;A&quot;</span>
</pre>

<p>在前面的示例中，以 3 种不同的形式输出了数字 10，即二进制形式、八进制形式和十六进制形式。HTML 采用十六进制表示每种颜色，在 HTML 中处理数字时这种功能非常有用。</p>

<p class="note"><span>注释：</span>对数字调用 toString(10) 与调用 toString() 相同，它们返回的都是该数字的十进制形式。</p>

<h4>参阅：</h4>
<p>请参阅 <a href="js_reference.asp" title="JavaScript 参考手册">JavaScript 参考手册</a>提供的有关 toString() 方法的详细信息：</p>
<ul>
<li><a href="jsref_toString_array.asp" title="JavaScript toString() 方法">arrayObject.toString()</a></li>
<li><a href="jsref_toString_boolean.asp" title="JavaScript toString() 方法">booleanObject.toString()</a></li>
<li><a href="jsref_toString_date.asp" title="JavaScript toString() 方法">dateObject.toString()</a></li>
<li><a href="jsref_tostring_number.asp" title="JavaScript toString() 方法">NumberObject.toString()</a></li>
<li><a href="jsref_toString_string.asp" title="JavaScript toString() 方法">stringObject.toString()</a></li>
</ul>
</div>


<div>
<h2>转换成数字</h2>

<p>ECMAScript 提供了两种把非数字的原始值转换成数字的方法，即 parseInt() 和 parseFloat()。</p>

<p>正如您可能想到的，前者把值转换成整数，后者把值转换成浮点数。只有对 String 类型调用这些方法，它们才能正确运行；对其他类型返回的都是 NaN。</p>

<h3>parseInt()</h3>

<p>在判断字符串是否是数字值前，parseInt() 和 parseFloat() 都会仔细分析该字符串。</p>

<p>parseInt() 方法首先查看位置 0 处的字符，判断它是否是个有效数字；如果不是，该方法将返回 NaN，不再继续执行其他操作。但如果该字符是有效数字，该方法将查看位置 1 处的字符，进行同样的测试。这一过程将持续到发现非有效数字的字符为止，此时 parseInt() 将把该字符之前的字符串转换成数字。</p>

<p>例如，如果要把字符串 &quot;12345red&quot; 转换成整数，那么 parseInt() 将返回 12345，因为当它检查到字符 r 时，就会停止检测过程。</p>

<p>字符串中包含的数字字面量会被正确转换为数字，比如 &quot;0xA&quot; 会被正确转换为数字 10。不过，字符串 &quot;22.5&quot; 将被转换成 22，因为对于整数来说，小数点是无效字符。</p>

<p>一些示例如下：</p>

<pre>
var iNum1 = parseInt(&quot;12345red&quot;);	<span>//返回 12345</span>
var iNum1 = parseInt(&quot;0xA&quot;);	<span>//返回 10</span>
var iNum1 = parseInt(&quot;56.9&quot;);	<span>//返回 56</span>
var iNum1 = parseInt(&quot;red&quot;);	<span>//返回 NaN</span>
</pre>

<p>parseInt() 方法还有基模式，可以把二进制、八进制、十六进制或其他任何进制的字符串转换成整数。基是由 parseInt() 方法的第二个参数指定的，所以要解析十六进制的值，需如下调用 parseInt() 方法：</p>

<pre>var iNum1 = parseInt(&quot;AF&quot;, 16);	<span>//返回 175</span></pre>

<p>当然，对二进制、八进制甚至十进制（默认模式），都可以这样调用 parseInt() 方法：</p>

<pre>
var iNum1 = parseInt(&quot;10&quot;, 2);	<span>//返回 2</span>
var iNum2 = parseInt(&quot;10&quot;, 8);	<span>//返回 8</span>
var iNum3 = parseInt(&quot;10&quot;, 10);	<span>//返回 10</span>
</pre>

<p>如果十进制数包含前导 0，那么最好采用基数 10，这样才不会意外地得到八进制的值。例如：</p>

<pre>
var iNum1 = parseInt(&quot;010&quot;);	<span>//返回 8</span>
var iNum2 = parseInt(&quot;010&quot;, 8);	<span>//返回 8</span>
var iNum3 = parseInt(&quot;010&quot;, 10);	<span>//返回 10</span>
</pre>

<p>在这段代码中，两行代码都把字符 &quot;010&quot; 解析成一个数字。第一行代码把这个字符串看作八进制的值，解析它的方式与第二行代码（声明基数为 8）相同。最后一行代码声明基数为 10，所以 iNum3 最后等于 10。</p>

<h4>参阅</h4>
<p>请参阅 <a href="js_reference.asp" title="JavaScript 参考手册">JavaScript 参考手册</a>提供的有关 parseInt() 方法的详细信息：<a href="jsref_parseInt.asp" title="JavaScript parseInt() 函数">parseInt()</a>。</p>


<h3>parseFloat()</h3>

<p>parseFloat() 方法与 parseInt() 方法的处理方式相似，从位置 0 开始查看每个字符，直到找到第一个非有效的字符为止，然后把该字符之前的字符串转换成整数。</p>

<p>不过，对于这个方法来说，第一个出现的小数点是有效字符。如果有两个小数点，第二个小数点将被看作无效的。parseFloat() 会把这个小数点之前的字符转换成数字。这意味着字符串 &quot;11.22.33&quot; 将被解析成 11.22。</p>

<p>使用 parseFloat() 方法的另一不同之处在于，字符串必须以十进制形式表示浮点数，而不是用八进制或十六进制。该方法会忽略前导 0，所以八进制数 0102 将被解析为 102。对于十六进制数 0xA，该方法将返回 NaN，因为在浮点数中，x 不是有效字符。</p>

<p>此外，parseFloat() 方法也没有基模式。</p>

<p>下面是使用 parseFloat() 方法的一些示例：</p>

<pre>
var fNum1 = parseFloat(&quot;12345red&quot;);	<span>//返回 12345</span>
var fNum2 = parseFloat(&quot;0xA&quot;);	<span>//返回 NaN</span>
var fNum3 = parseFloat(&quot;11.2&quot;);	<span>//返回 11.2</span>
var fNum4 = parseFloat(&quot;11.22.33&quot;);	<span>//返回 11.22</span>
var fNum5 = parseFloat(&quot;0102&quot;);	<span>//返回 102</span>
var fNum1 = parseFloat(&quot;red&quot;);	<span>//返回 NaN</span>
</pre>

<h4>参阅</h4>
<p>请参阅 <a href="js_reference.asp" title="JavaScript 参考手册">JavaScript 参考手册</a>提供的有关 parseFloat() 方法的详细信息：<a href="jsref_parseFloat.asp" title="JavaScript parseFloat() 函数">parseFloat()</a>。</p>
</div>


<div>
<h2>强制类型转换</h2>

<p>您还可以使用<em>强制类型转换（type casting）</em>来处理转换值的类型。使用强制类型转换可以访问特定的值，即使它是另一种类型的。</p>

<p class="note"><span>编者注：</span>cast 有“铸造”之意，很贴合“强制转换”的意思。</p>

<p>ECMAScript 中可用的 3 种强制类型转换如下：</p>

<ul>
<li>Boolean(value) - 把给定的值转换成 Boolean 型；</li>
<li>Number(value) - 把给定的值转换成数字（可以是整数或浮点数）；</li>
<li>String(value) - 把给定的值转换成字符串；</li>
</ul>

<p>用这三个函数之一转换值，将创建一个新值，存放由原始值直接转换成的值。这会造成意想不到的后果。</p>

<h3>Boolean() 函数</h3>

<p>当要转换的值是至少有一个字符的字符串、非 0 数字或对象时，Boolean() 函数将返回 true。如果该值是空字符串、数字 0、undefined 或 null，它将返回 false。</p>

<p>可以用下面的代码测试 Boolean 型的强制类型转换：</p>

<pre>
var b1 = Boolean(&quot;&quot;);		<span>//false - 空字符串</span>
var b2 = Boolean(&quot;hello&quot;);		<span>//true - 非空字符串</span>
var b1 = Boolean(50);		<span>//true - 非零数字</span>
var b1 = Boolean(null);		<span>//false - null</span>
var b1 = Boolean(0);		<span>//false - 零</span>
var b1 = Boolean(new object());	<span>//true - 对象</span>
</pre>

<h3>Number() 函数</h3>

<p>Number() 函数的强制类型转换与 parseInt() 和 parseFloat() 方法的处理方式相似，只是它转换的是整个值，而不是部分值。</p>

<p>还记得吗，parseInt() 和 parseFloat() 方法只转换第一个无效字符之前的字符串，因此 &quot;1.2.3&quot; 将分别被转换为 &quot;1&quot; 和 &quot;1.2&quot;。</p>

<p>用 Number() 进行强制类型转换，&quot;1.2.3&quot; 将返回 NaN，因为整个字符串值不能转换成数字。如果字符串值能被完整地转换，Number() 将判断是调用 parseInt() 方法还是 parseFloat() 方法。</p>

<p>下表说明了对不同的值调用 Number() 方法会发生的情况：</p>

<table class="dataintable">
<tr>
<th style="width:60%;">用法</th>
<th>结果</th>
</tr>

<tr>
<td>Number(false)</td>
<td>0</td>
</tr>

<tr>
<td>Number(true)</td>
<td>1</td>
</tr>

<tr>
<td>Number(undefined)</td>
<td>NaN</td>
</tr>

<tr>
<td>Number(null)</td>
<td>0</td>
</tr>

<tr>
<td>Number(&quot;1.2&quot;)</td>
<td>1.2</td>
</tr>

<tr>
<td>Number(&quot;12&quot;)</td>
<td>12</td>
</tr>

<tr>
<td>Number(&quot;1.2.3&quot;)</td>
<td>NaN</td>
</tr>

<tr>
<td>Number(new object())</td>
<td>NaN</td>
</tr>

<tr>
<td>Number(50)</td>
<td>50</td>
</tr>
</table>

<h3>String() 函数</h3>

<p>最后一种强制类型转换方法 String() 是最简单的，因为它可把任何值转换成字符串。</p>

<p>要执行这种强制类型转换，只需要调用作为参数传递进来的值的 toString() 方法，即把 12 转换成 &quot;12&quot;，把 true 转换成 &quot;true&quot;，把 false 转换成 &quot;false&quot;，以此类推。</p>

<p>强制转换成字符串和调用 toString() 方法的唯一不同之处在于，对 null 和 undefined 值强制类型转换可以生成字符串而不引发错误：</p>

<pre>
var s1 = String(null);	<span>//&quot;null&quot;</span>
var oNull = null;
var s2 = oNull.toString();	<span>//会引发错误</span>
</pre>

<p>在处理 ECMAScript 这样的弱类型语言时，强制类型转换非常有用，不过应该确保使用值的正确。</p>
</div>


<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="pro_js_primitivetypes.asp">Previous Page</a></li>

<li class="next"><a href="pro_js_referencetypes.asp">Next Page</a></li>
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