
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

<title>ECMAScript 引用类型</title>
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

<h1>ECMAScript 引用类型</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="pro_js_typeconversion.asp">Previous Page</a></li>

<li class="next"><a href="pro_js_operators_unary.asp">Next Page</a></li>
</ul>

</div>


<div>
<p><strong>引用类型通常叫做类（class）。</strong></p>
<p><strong>本教程会讨论大量的 ECMAScript 预定义引用类型。</strong></p>
</div>


<div>
<h2>引用类型</h2>

<p>引用类型通常叫做类（class），也就是说，遇到引用值，所处理的就是对象。</p>

<p>本教程会讨论大量的 ECMAScript 预定义引用类型。</p>

<p>从现在起，将重点讨论与已经讨论过的原始类型紧密相关的引用类型。</p>

<p class="important"><span>注意：</span>从传统意义上来说，ECMAScript 并不真正具有类。事实上，除了说明不存在类，在 ECMA-262  中根本没有出现“类”这个词。ECMAScript 定义了“对象定义”，逻辑上等价于其他程序设计语言中的类。</p>

<p class="tip"><span>提示：</span>本教程将使用术语“对象”。</p>

<p>对象是由 new 运算符加上要实例化的对象的名字创建的。例如，下面的代码创建 Object 对象的实例：</p>

<pre>var o = new Object();</pre>

<p>这种语法与 Java 语言的相似，不过当有不止一个参数时，ECMAScript 要求使用括号。如果没有参数，如以下代码所示，括号可以省略：</p>

<pre>var o = new Object;</pre>

<p class="important"><span>注意：</span>尽管括号不是必需的，但是为了避免混乱，最好使用括号。</p>

<p class="tip"><span>提示：</span>我们会在对象基础这一章中更深入地探讨对象及其行为。</p>

<p>这一节的重点是具有等价的原始类型的引用类型。</p>

</div>


<div>
<h2>Object 对象</h2>

<p>Object 对象自身用处不大，不过在了解其他类之前，还是应该了解它。因为 ECMAScript 中的 Object 对象与 Java 中的 java.lang.Object 相似，ECMAScript 中的所有对象都由这个对象继承而来，Object 对象中的所有属性和方法都会出现在其他对象中，所以理解了 Object 对象，就可以更好地理解其他对象。</p>

<h3>Object 对象具有下列属性：</h3>

<dl class="define">
<dt>constructor</dt>
<dd>对创建对象的函数的引用（指针）。对于 Object 对象，该指针指向原始的 Object() 函数。</dd>

<dt>Prototype</dt>
<dd>对该对象的对象原型的引用。对于所有的对象，它默认返回 Object 对象的一个实例。</dd>
</dl>


<h3>Object 对象还具有几个方法：</h3>

<dl class="define">
<dt>hasOwnProperty(property)</dt>
<dd>判断对象是否有某个特定的属性。必须用字符串指定该属性。（例如，o.hasOwnProperty(&quot;name&quot;)）</dd>

<dt>IsPrototypeOf(object)</dt>
<dd>判断该对象是否为另一个对象的原型。</dd>

<dt>PropertyIsEnumerable</dt>
<dd>判断给定的属性是否可以用 for...in 语句进行枚举。</dd>

<dt>ToString()</dt>
<dd>返回对象的原始字符串表示。对于 Object 对象，ECMA-262 没有定义这个值，所以不同的 ECMAScript 实现具有不同的值。</dd>

<dt>ValueOf()</dt>
<dd>返回最适合该对象的原始值。对于许多对象，该方法返回的值都与 ToString() 的返回值相同。</dd>
</dl>

<p class="note"><span>注释：</span>上面列出的每种属性和方法都会被其他对象覆盖。</p>
</div>


<div>
<h2>Boolean 对象</h2>

<p>Boolean 对象是 Boolean 原始类型的引用类型。</p>

<p>要创建 Boolean 对象，只需要传递 Boolean 值作为参数：</p>

<pre>var oBooleanObject = new Boolean(true);</pre>

<p>Boolean 对象将覆盖 Object 对象的 ValueOf() 方法，返回原始值，即 true 和 false。ToString() 方法也会被覆盖，返回字符串 &quot;true&quot; 或 &quot;false&quot;。</p>

<p>遗憾的是，在 ECMAScript 中很少使用 Boolean 对象，即使使用，也不易理解。</p>

<p>问题通常出现在 Boolean 表达式中使用 Boolean 对象时。例如：</p>

<pre>
var oFalseObject = new Boolean(false);
var bResult = oFalseObject &amp;&amp; true;	<span>//输出 true</span>
</pre>

<p>在这段代码中，用 false 值创建 Boolean 对象。然后用这个值与原始值 true 进行 AND 操作。在 Boolean 运算中，false 和 true 进行 AND 操作的结果是 false。不过，在这行代码中，计算的是 oFalseObject，而不是它的值 false。</p>

<p>正如前面讨论过的，在 Boolean 表达式中，所有对象都会被自动转换为 true，所以 oFalseObject 的值是 true。然后 true 再与 true 进行 AND 操作，结果为 true。</p>

<p class="important"><span>注意：</span>虽然你应该了解 Boolean 对象的可用性，不过最好还是使用 Boolean 原始值，避免发生这一节提到的问题。</p>


<h3>参阅</h3>

<p>如需更多有关 Boolean 对象的信息，请访问 <a href="jsref_obj_boolean.asp" title="JavaScript Boolean 对象参考手册">JavaScript Boolean 对象参考手册</a>。</p>
</div>


<div>
<h2>Number 对象</h2>

<p>正如你可能想到的，Number 对象是 Number 原始类型的引用类型。要创建 Number 对象，采用下列代码：</p>

<pre>var oNumberObject = new Number(68);</pre>

<p>您应该已认出本章前面小节中讨论特殊值（如 Number.MAX_VALUE）时提到的 Number 对象。所有特殊值都是 Number 对象的静态属性。</p>

<p>要得到数字对象的 Number 原始值，只需要使用 valueOf() 方法：</p>

<pre>var iNumber = oNumberObject.valueOf();</pre>

<p>当然，Number 类也有 toString() 方法，在讨论类型转换的小节中已经详细讨论过该方法。</p>

<p>除了从 Object 对象继承的标准方法外，Number 对象还有几个处理数值的专用方法。</p>

<h3>toFixed() 方法</h3>

<p>toFixed() 方法返回的是具有指定位数小数的数字的字符串表示。例如：</p>

<pre>
var oNumberObject = new Number(68);
alert(oNumberObject.toFixed(2));  <span>//输出 &quot;68.00&quot;</span>
</pre>

<p>在这里，toFixed() 方法的参数是 2，说明应该显示两位小数。该方法返回 &quot;68.00&quot;，空的字符串位由 0 来补充。对于处理货币的应用程序，该方法非常有用。toFixed() 方法能表示具有 0 到 20 位小数的数字，超过这个范围的值会引发错误。</p>

<h3>toExponential() 方法</h3>

<p>与格式化数字相关的另一个方法是 toExponential()，它返回的是用科学计数法表示的数字的字符串形式。</p>

<p>与 toFixed() 方法相似，toExponential() 方法也有一个参数，指定要输出的小数的位数。例如：</p>

<pre>
var oNumberObject = new Number(68);
alert(oNumberObject.toExponential(1));  <span>//输出 &quot;6.8e+1&quot;
</pre>

<p>这段代码的结果是 &quot;6.8e+1&quot;，前面解释过，它表示 6.8x10<sup>1</sup>。问题是，如果不知道要用哪种形式（预定形式或指数形式）表示数字怎么办？可以用 toPrecision() 方法。</p>

<h3>toPrecision() 方法</h3>

<p>toPrecision() 方法根据最有意义的形式来返回数字的预定形式或指数形式。它有一个参数，即用于表示数的数字总数（不包括指数）。例如，</p>

<pre>
var oNumberObject = new Number(68);
alert(oNumberObject.toPrecision(1));  <span>//输出 &quot;7e+1&quot;
</pre>

<p>这段代码的任务是用一位数字表示数字 68，结果为 &quot;7e+1&quot;，以另外的形式表示即 70。的确，toPrecision() 方法会对数进行舍入。不过，如果用 2 位数字表示 68，就容易多了：</p>

<pre>
var oNumberObject = new Number(68);
alert(oNumberObject.toPrecision(2));  <span>//输出 &quot;68&quot;
</pre>

<p>当然，输出的是 &quot;68&quot;，因为这正是该数的准确表示。不过，如果指定的位数多于需要的位数又如何呢？</p>

<pre>
var oNumberObject = new Number(68);
alert(oNumberObject.toPrecision(3));  <span>//输出 &quot;68.0&quot;
</pre>

<p>在这种情况下，toPrecision(3) 等价于 toFixed(1)，输出的是 &quot;68.0&quot;。

<p>toFixed()、toExponential() 和 toPrecision() 方法都会进行舍入操作，以便用正确的小数位数正确地表示一个数。

<p class="tip"><span>提示：</span>与 Boolean 对象相似，Number 对象也很重要，不过应该少用这种对象，以避免潜在的问题。只要可能，都使用数字的原始表示法。</p>


<h3>参阅</h3>

<p>如需更多有关 Number 对象的信息，请访问 <a href="jsref_obj_number.asp" title="JavaScript Number 对象参考手册">JavaScript Number 对象参考手册</a>。</p>
</div>


<div>
<h2>String 对象</h2>

<p>String 对象是 String 原始类型的对象表示法，它是以下方式创建的：</p>

<pre>var oStringObject = new String(&quot;hello world&quot;);</pre>

<p>String 对象的 valueOf() 方法和 toString() 方法都会返回 String 类型的原始值：</p>

<pre>alert(oStringObject.valueOf() == oStringObject.toString());	<span>//输出 &quot;true&quot;</span></pre>

<p>如果运行这段代码，输出是 &quot;true&quot;，说明这些值真的相等。</p>

<p class="note"><span>注释：</span>String 对象是 ECMAScript 中比较复杂的引用类型之一。同样，本节的重点只是 String 类的基本功能。更多的高级功能请阅读本教程相关的章节，或参阅 <a href="jsref_obj_string.asp" title="JavaScript String 对象参考手册">JavaScript String 对象参考手册</a>。</p>


<h3>length 属性</h3>

<p>String 对象具有属性 length，它是字符串中的字符个数：</p>

<pre>
var oStringObject = new String(&quot;hello world&quot;);
alert(oStringObject.length);	<span>//输出 &quot;11&quot;</span>
</pre>

<p>这个例子输出的是 &quot;11&quot;，即 &quot;hello world&quot; 中的字符个数。注意，即使字符串包含双字节的字符（与 ASCII 字符相对，ASCII 字符只占用一个字节），每个字符也只算一个字符。</p>


<h3>charAt() 和 charCodeAt() 方法</h3>

<p>String 对象还拥有大量的方法。</p>

<p>首先，两个方法 charAt() 和 charCodeAt() 访问的是字符串中的单个字符。这两个方法都有一个参数，即要操作的字符的位置。</p>

<p>charAt() 方法返回的是包含指定位置处的字符的字符串：</p>

<pre>
var oStringObject = new String(&quot;hello world&quot;);
alert(oStringObject.charAt(1));	<span>//输出 &quot;e&quot;</span>
</pre>

<p>在字符串 &quot;hello world&quot; 中，位置 1 处的字符是 &quot;e&quot;。在“ECMAScript 原始类型”这一节中我们讲过，第一个字符的位置是 0，第二个字符的位置是 1，依此类推。因此，调用 charAt(1) 返回的是 &quot;e&quot;。</p>

<p>如果想得到的不是字符，而是字符代码，那么可以调用 charCodeAt() 方法：</p>

<pre>
var oStringObject = new String(&quot;hello world&quot;);
alert(oStringObject.charCodeAt(1));	<span>//输出 &quot;101&quot;</span>
</pre>

<p>这个例子输出 &quot;101&quot;，即小写字母 &quot;e&quot; 的字符代码。</p>


<h3>concat() 方法</h3>

<p>接下来是 concat() 方法，用于把一个或多个字符串连接到 String 对象的原始值上。该方法返回的是 String 原始值，保持原始的 String 对象不变：</p>

<pre>
var oStringObject = new String(&quot;hello &quot;);
var sResult = oStringObject.concat(&quot;world&quot;);
alert(sResult);		<span>//输出 &quot;hello world&quot;</span>
alert(oStringObject);	<span>//输出 &quot;hello &quot;</span>
</pre>

<p>在上面这段代码中，调用 concat() 方法返回的是 &quot;hello world&quot;，而 String 对象存放的仍然是 &quot;hello &quot;。出于这种原因，较常见的是用加号（+）连接字符串，因为这种形式从逻辑上表明了真正的行为：</p>

<pre>
var oStringObject = new String(&quot;hello &quot;);
var sResult = oStringObject + &quot;world&quot;;
alert(sResult);		<span>//输出 &quot;hello world&quot;</span>
alert(oStringObject);	<span>//输出 &quot;hello &quot;</span>
</pre>


<h3>indexOf() 和 lastIndexOf() 方法</h3>

<p>迄今为止，已讨论过连接字符串的方法，访问字符串中的单个字符的方法。不过如果无法确定在某个字符串中是否确实存在一个字符，应该调用什么方法呢？这时，可调用 indexOf() 和 lastIndexOf() 方法。</p>

<p>indexOf() 和 lastIndexOf() 方法返回的都是指定的子串在另一个字符串中的位置，如果没有找不到子串，则返回 -1。</p>

<p>这两个方法的不同之处在于，indexOf() 方法是从字符串的开头（位置 0）开始检索字符串，而 lastIndexOf() 方法则是从字符串的结尾开始检索子串。例如：</p>

<pre>
var oStringObject = new String(&quot;hello world!&quot;);
alert(oStringObject.indexOf(&quot;o&quot;));		<span>输出 &quot;4&quot;</span>
alert(oStringObject.lastIndexOf(&quot;o&quot;));	<span>输出 &quot;7&quot;</span>
</pre>

<p>在这里，第一个 &quot;o&quot; 字符串出现在位置 4，即 &quot;hello&quot; 中的 &quot;o&quot;；最后一个 &quot;o&quot; 出现在位置 7，即 &quot;world&quot; 中的 &quot;o&quot;。如果该字符串中只有一个 &quot;o&quot; 字符串，那么 indexOf() 和 lastIndexOf() 方法返回的位置相同。</p>


<h3>localeCompare() 方法</h3>

<p>下一个方法是 localeCompare()，对字符串进行排序。该方法有一个参数 - 要进行比较的字符串，返回的是下列三个值之一：</p>

<ul>
<li>如果 String 对象按照字母顺序排在参数中的字符串之前，返回负数。</li>
<li>如果 String 对象等于参数中的字符串，返回 0</li>
<li>如果 String 对象按照字母顺序排在参数中的字符串之后，返回正数。</li>
</ul>

<p class="note"><span>注释：</span>如果返回负数，那么最常见的是 -1，不过真正返回的是由实现决定的。如果返回正数，那么同样的，最常见的是 1，不过真正返回的是由实现决定的。</p>

<p>示例如下：</p>

<pre>
var oStringObject = new String(&quot;yellow&quot;);
alert(oStringObject.localeCompare(&quot;brick&quot;));		<span>//输出 &quot;1&quot;</span>
alert(oStringObject.localeCompare(&quot;yellow&quot;));		<span>//输出 &quot;0&quot;</span>
alert(oStringObject.localeCompare(&quot;zoo&quot;));		<span>//输出 &quot;-1&quot;</span>
</pre>

<p>在这段代码中，字符串 &quot;yellow&quot; 与 3 个值进行了对比，即 &quot;brick&quot;、&quot;yellow&quot; 和 &quot;zoo&quot;。由于按照字母顺序排列，&quot;yellow&quot; 位于 &quot;brick&quot; 之后，所以 localeCompare() 返回 1；&quot;yellow&quot; 等于 &quot;yellow&quot;，所以 localeCompare() 返回 0；&quot;zoo&quot; 位于 &quot;yellow&quot; 之后，localeCompare() 返回 -1。再强调一次，由于返回的值是由实现决定的，所以最好以下面的方式调用 localeCompare() 方法：</p>

<pre>
var oStringObject1 = new String(&quot;yellow&quot;);
var oStringObject2 = new String(&quot;brick&quot;);

var iResult = sTestString.localeCompare(&quot;brick&quot;);

if(iResult &lt; 0) {
  alert(oStringObject1 + &quot; comes before &quot; + oStringObject2);
} else if (iResult &gt; 0) {
  alert(oStringObject1 + &quot; comes after &quot; + oStringObject2);
} else {
  alert(&quot;The two strings are equal&quot;);
}
</pre>

<p>采用这种结构，可以确保这段代码在所有实现中都能正确运行。</p>

<p>localeCompare() 方法的独特之处在于，实现所处的区域（locale，兼指国家/地区和语言）确切说明了这种方法运行的方式。在美国，英语是 ECMAScript 实现的标准语言，localeCompare() 是区分大小写的，大写字母在字母顺序上排在小写字母之后。不过，在其他区域，情况可能并非如此。</p>


<h3>slice() 和 substring()</h3>

<p>ECMAScript 提供了两种方法从子串创建字符串值，即 slice() 和 substring()。这两种方法返回的都是要处理的字符串的子串，都接受一个或两个参数。第一个参数是要获取的子串的起始位置，第二个参数（如果使用的话）是要获取子串终止前的位置（也就是说，获取终止位置处的字符不包括在返回的值内）。如果省略第二个参数，终止位就默认为字符串的长度。</p>

<p>与 concat() 方法一样，slice() 和 substring() 方法都不改变 String 对象自身的值。它们只返回原始的 String 值，保持 String 对象不变。</p>

<pre>
var oStringObject = new String(&quot;hello world&quot;);
alert(oStringObject.slice(&quot;3&quot;));		<span>//输出 &quot;lo world&quot;</span>
alert(oStringObject.substring(&quot;3&quot;));		<span>//输出 &quot;lo world&quot;</span>
alert(oStringObject.slice(&quot;3, 7&quot;));		<span>//输出 &quot;lo w&quot;</span>
alert(oStringObject.substring(&quot;3, 7&quot;));	<span>//输出 &quot;lo w&quot;</span>
</pre>

<p>在这个例子中，slice() 和 substring() 的用法相同，返回值也一样。当只有参数 3 时，两个方法返回的都是 &quot;lo world&quot;，因为 &quot;hello&quot; 中的第二个 &quot;l&quot; 位于位置 3 上。当有两个参数 &quot;3&quot; 和 &quot;7&quot; 时，两个方法返回的值都是 &quot;lo w&quot;（&quot;world&quot; 中的字母 &quot;o&quot; 位于位置 7 上，所以它不包括在结果中）。</p>

<p>为什么有两个功能完全相同的方法呢？事实上，这两个方法并不完全相同，不过只在参数为负数时，它们处理参数的方式才稍有不同。</p>

<p>对于负数参数，slice() 方法会用字符串的长度加上参数，substring() 方法则将其作为 0 处理（也就是说将忽略它）。例如：</p>

<pre>
var oStringObject = new String(&quot;hello world&quot;);
alert(oStringObject.slice(&quot;-3&quot;));		<span>//输出 &quot;rld&quot;</span>
alert(oStringObject.substring(&quot;-3&quot;));	<span>//输出 &quot;hello world&quot;</span>
alert(oStringObject.slice(&quot;3, -4&quot;));		<span>//输出 &quot;lo w&quot;</span>
alert(oStringObject.substring(&quot;3, -4&quot;));	<span>//输出 &quot;hel&quot;</span>
</pre>

<p>这样即可看出 slice() 和 substring() 方法的主要不同。</p>

<p>当只有参数 -3 时，slice() 返回 &quot;rld&quot;，substring() 则返回 &quot;hello world&quot;。这是因为对于字符串 &quot;hello world&quot;，slice(&quot;-3&quot;) 将被转换成 slice(&quot;8&quot;)，而 substring(&quot;-3&quot;) 将被转换成 substring(&quot;0&quot;)。</p>

<p>同样，使用参数 3 和 -4 时，差别也很明显。slice() 将被转换成 slice(3, 7)，与前面的例子相同，返回 &quot;lo w&quot;。而 substring() 方法则将两个参数解释为 substring(3, 0)，实际上即 substring(0, 3)，因为 substring() 总把较小的数字作为起始位，较大的数字作为终止位。因此，substring(&quot;3, -4&quot;) 返回的是 &quot;hel&quot;。这里的最后一行代码用来说明如何使用这些方法。</p>


<h3>toLowerCase()、toLocaleLowerCase()、toUpperCase() 和 toLocaleUpperCase()</h3>

<p>最后一套要讨论的方法涉及大小写转换。有 4 种方法用于执行大小写转换，即 </p>

<ul>
<li>toLowerCase()</li>
<li>toLocaleLowerCase()</li>
<li>toUpperCase()</li>
<li>toLocaleUpperCase()</li>
</ul>

<p>从名字上可以看出它们的用途，前两种方法用于把字符串转换成全小写的，后两种方法用于把字符串转换成全大写的。</p>

<p>toLowerCase() 和 toUpperCase() 方法是原始的，是以 java.lang.String 中相同方法为原型实现的。</p>

<p>toLocaleLowerCase() 和 toLocaleUpperCase() 方法是基于特定的区域实现的（与 localeCompare() 方法相同）。在许多区域中，区域特定的方法都与通用的方法完全相同。不过，有几种语言对 Unicode 大小写转换应用了特定的规则（例如土耳其语），因此必须使用区域特定的方法才能进行正确的转换。</p>

<pre>
var oStringObject = new String(&quot;Hello World&quot;);
alert(oStringObject.toLocaleUpperCase());	<span>//输出 &quot;HELLO WORLD&quot;</span>
alert(oStringObject.toUpperCase());		<span>//输出 &quot;HELLO WORLD&quot;</span>
alert(oStringObject.toLocaleLowerCase());	<span>//输出 &quot;hello world&quot;</span>
alert(oStringObject.toLowerCase());		<span>//输出 &quot;hello world&quot;</span>
</pre>

<p>这段代码中，toUpperCase() 和 toLocaleUpperCase() 输出的都是 &quot;HELLO WORLD&quot;，toLowerCase() 和 toLocaleLowerCase() 输出的都是 &quot;hello world&quot;。一般来说，如果不知道在以哪种编码运行一种语言，则使用区域特定的方法比较安全。</p>

<p class="tip"><span>提示：</span>记住，String 对象的所有属性和方法都可应用于 String 原始值上，因为它们是伪对象。</p>
</div>


<div>
<h2>instanceof 运算符</h2>

<p>在使用 typeof 运算符时采用引用类型存储值会出现一个问题，无论引用的是什么类型的对象，它都返回 &quot;object&quot;。ECMAScript 引入了另一个 Java 运算符 instanceof 来解决这个问题。</p>

<p>instanceof 运算符与  typeof 运算符相似，用于识别正在处理的对象的类型。与 typeof 方法不同的是，instanceof 方法要求开发者明确地确认对象为某特定类型。例如：</p>

<pre>
var oStringObject = new String(&quot;hello world&quot;);
alert(oStringObject instanceof String);	<span>//输出 &quot;true&quot;</span>
</pre>

<p>这段代码问的是“变量 oStringObject 是否为 String 对象的实例？”oStringObject 的确是 String 对象的实例，因此结果是 &quot;true&quot;。尽管不像 typeof 方法那样灵活，但是在 typeof 方法返回 &quot;object&quot; 的情况下，instanceof 方法还是很有用的。</p>
</div>


<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="pro_js_typeconversion.asp">Previous Page</a></li>

<li class="next"><a href="pro_js_operators_unary.asp">Next Page</a></li>
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