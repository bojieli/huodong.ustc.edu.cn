
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

<title>ECMAScript 闭包</title>
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

<h1>ECMAScript 闭包（closure）</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="pro_js_functions_function_object.asp">Previous Page</a></li>

<li class="next"><a href="pro_js_object_oriented.asp">Next Page</a></li>
</ul>

</div>


<div>
<p><strong>ECMAScript 最易让人误解的一点是，它支持闭包（closure）。</strong></p>
<p><strong>闭包，指的是词法表示包括不被计算的变量的函数，也就是说，函数可以使用函数之外定义的变量。</strong></p>
</div>


<div>
<h2>简单的闭包实例</h2>

<p>在 ECMAScript 中使用全局变量是一个简单的闭包实例。请思考下面这段代码：</p>

<pre>
var sMessage = &quot;hello world&quot;;

function sayHelloWorld() {
  alert(sMessage);
}

sayHelloWorld();
</pre>

<p>在上面这段代码中，脚本被载入内存后，并没有为函数 sayHelloWorld() 计算变量 sMessage 的值。该函数捕获 sMessage 的值只是为了以后的使用，也就是说，解释程序知道在调用该函数时要检查 sMessage 的值。sMessage 将在函数调用 sayHelloWorld() 时（最后一行）被赋值，显示消息 &quot;hello world&quot;。</p>
</div>


<div>
<h2>复杂的闭包实例</h2>

<p>在一个函数中定义另一个会使闭包变得更加复杂。例如：</p>

<pre>
var iBaseNum = 10;

function addNum(iNum1, iNum2) {
  function doAdd() {
    return iNum1 + iNum2 + iBaseNum;
  }
  return doAdd();
}
</pre>

<p>这里，函数 addNum() 包括函数 doAdd() （闭包）。内部函数是一个闭包，因为它将获取外部函数的参数 iNum1 和 iNum2 以及全局变量 iBaseNum 的值。 addNum() 的最后一步调用了 doAdd()，把两个参数和全局变量相加，并返回它们的和。</p>

<p>这里要掌握的重要概念是，doAdd() 函数根本不接受参数，它使用的值是从执行环境中获取的。</p>

<p>可以看到，闭包是 ECMAScript 中非常强大多用的一部分，可用于执行复杂的计算。</p>

<p class="tip"><span>提示：</span>就像使用任何高级函数一样，使用闭包要小心，因为它们可能会变得非常复杂。</p>
</div>


<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="pro_js_functions_function_object.asp">Previous Page</a></li>

<li class="next"><a href="pro_js_object_oriented.asp">Next Page</a></li>
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