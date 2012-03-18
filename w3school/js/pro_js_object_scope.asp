
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

<title>ECMAScript 对象作用域</title>
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

<h1>ECMAScript 对象作用域</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="pro_js_object_types.asp">Previous Page</a></li>

<li class="next"><a href="pro_js_object_defining.asp">Next Page</a></li>
</ul>

</div>


<div>
<p><strong>作用域指的是变量的适用范围。</strong></p>
</div>


<div>
<h2>公用、私有和受保护作用域</h2>

<h3>概念</h3>

<p>在传统的面向对象程序设计中，主要关注于公用和私有作用域。公用作用域中的对象属性可以从对象外部访问，即开发者创建对象的实例后，就可使用它的公用属性。而私有作用域中的属性只能在对象内部访问，即对于外部世界来说，这些属性并不存在。这意味着如果类定义了私有属性和方法，则它的子类也不能访问这些属性和方法。</p>

<p>受保护作用域也是用于定义私有的属性和方法，只是这些属性和方法还能被其子类访问。</p>

<h3>ECMAScript 只有公用作用域</h3>

<p>对 ECMAScript 讨论上面这些作用域几乎毫无意义，因为 ECMAScript 中只存在一种作用域 - 公用作用域。ECMAScript 中的所有对象的所有属性和方法都是公用的。因此，定义自己的类和对象时，必须格外小心。记住，所有属性和方法默认都是公用的！</p>

<h3>建议性的解决方法</h3>

<p>许多开发者都在网上提出了有效的属性作用域模式，解决了 ECMAScript 的这种问题。</p>

<p>由于缺少私有作用域，开发者确定了一个规约，说明哪些属性和方法应该被看做私有的。这种规约规定在属性前后加下划线：</p>

<pre>obj._color_ = &quot;blue&quot;;</pre>

<p>这段代码中，属性 color 是私有的。注意，下划线并不改变属性是公用属性的事实，它只是告诉其他开发者，应该把该属性看作私有的。</p>

<p>有些开发者还喜欢用单下划线说明私有成员，例如：obj._color。</p>
</div>


<div>
<h2>静态作用域</h2>

<p>静态作用域定义的属性和方法任何时候都能从同一位置访问。在 Java 中，类可具有属性和方法，无需实例化该类的对象，即可访问这些属性和方法，例如 java.net.URLEncoder 类，它的函数 encode() 就是静态方法。</p>

<h3>ECMAScript 没有静态作用域</h3>

<p>严格来说，ECMAScript 并没有静态作用域。不过，它可以给构造函数提供属性和方法。还记得吗，构造函数只是函数。函数是对象，对象可以有属性和方法。例如：</p>

<pre>
function sayHello() {
  alert(&quot;hello&quot;);
}

sayHello.alternate = function() {
  alert(&quot;hi&quot;);
}

sayHello();		<span>//输出 &quot;hello&quot;</span>
sayHello.alternate();	<span>//输出 &quot;hi&quot;</span>
</pre>

<p><a href="../tiy/t.asp@f=jseg_pro_object_scope_static">TIY</a></p>

<p>这里，方法 alternate() 实际上是函数 sayHello 的方法。可以像调用常规函数一样调用 sayHello() 输出 &quot;hello&quot;，也可以调用 sayHello.alternate() 输出 &quot;hi&quot;。即使如此，alternate() 也是 sayHello() 公用作用域中的方法，而不是静态方法。</p>
</div>


<div>
<h2>关键字 this</h2>

<h3>this 的功能</h3>

<p>在 ECMAScript 中，要掌握的最重要的概念之一是关键字 this 的用法，它用在对象的方法中。关键字 this 总是指向调用该方法的对象，例如：</p>

<pre>
var oCar = new Object;
oCar.color = &quot;red&quot;;
oCar.showColor = function() {
  alert(<code>this.color</code>);
};

oCar.showColor();		<span>//输出 &quot;red&quot;</span>
</pre>

<p><a href="../tiy/t.asp@f=jseg_pro_object_scope_this_1">TIY</a></p>

<p>在上面的代码中，关键字 this 用在对象的 showColor() 方法中。在此环境中，this 等于 oCar。下面的代码与上面的代码的功能相同：</p>

<pre>
var oCar = new Object;
oCar.color = &quot;red&quot;;
oCar.showColor = function() {
  alert(<code>oCar.color</code>);
};

oCar.showColor();		<span>//输出 &quot;red&quot;</span>
</pre>

<p><a href="../tiy/t.asp@f=jseg_pro_object_scope_this_2">TIY</a></p>


<h3>使用 this 的原因</h3>

<p>为什么使用 this 呢？因为在实例化对象时，总是不能确定开发者会使用什么样的变量名。使用 this，即可在任何多个地方重用同一个函数。请思考下面的例子：</p>

<pre>
function showColor() {
  alert(<code>this.color</code>);
};

var oCar1 = new Object;
oCar1.color = &quot;red&quot;;
oCar1.showColor = showColor;

var oCar2 = new Object;
oCar2.color = &quot;blue&quot;;
oCar2.showColor = showColor;

oCar1.showColor();		<span>//输出 &quot;red&quot;</span>
oCar2.showColor();		<span>//输出 &quot;blue&quot;</span>
</pre>

<p><a href="../tiy/t.asp@f=jseg_pro_object_scope_this_3">TIY</a></p>

<p>在上面的代码中，首先用 this 定义函数 showColor()，然后创建两个对象（oCar1 和 oCar2），一个对象的 color 属性被设置为 &quot;red&quot;，另一个对象的 color 属性被设置为 &quot;blue&quot;。两个对象都被赋予了属性 showColor，指向原始的 showColor () 函数（注意这里不存在命名问题，因为一个是全局函数，而另一个是对象的属性）。调用每个对象的 showColor()，oCar1 输出是 &quot;red&quot;，而 oCar2 的输出是 &quot;blue&quot;。这是因为调用 oCar1.showColor() 时，函数中的 this 关键字等于 oCar1。调用 oCar2.showColor() 时，函数中的 this 关键字等于 oCar2。</p>

<p>注意，引用对象的属性时，必须使用 this 关键字。例如，如果采用下面的代码，showColor() 方法不能运行：</p>

<pre>
function showColor() {
  alert(<code>color</code>);
};
</pre>

<p>如果不用对象或 this 关键字引用变量，ECMAScript 就会把它看作局部变量或全局变量。然后该函数将查找名为 color 的局部或全局变量，但是不会找到。结果如何呢？该函数将在警告中显示 &quot;null&quot;。</p>
</div>


<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="pro_js_object_types.asp">Previous Page</a></li>

<li class="next"><a href="pro_js_object_defining.asp">Next Page</a></li>
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