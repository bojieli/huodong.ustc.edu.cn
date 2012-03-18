
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

<title>XML DOM textContent 属性</title>
</head>

<body class="xml">
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
<h2>XML DOM 教程</h2>
<ul>
<li><a href="index.asp" title="XML DOM 教程">DOM 首页</a></li>
<li><a href="dom_intro.asp" title="XML DOM 简介">DOM 简介</a></li>
<li><a href="dom_nodes.asp" title="XML DOM 节点">DOM 节点</a></li>
<li><a href="dom_nodetree.asp" title="XML DOM 节点树">DOM 节点树</a></li>
<li><a href="dom_parser.asp" title="解析 XML DOM">DOM 解析</a></li>
<li><a href="dom_loadxmldoc.asp" title="XML DOM 加载函数">DOM 加载</a></li>
<li><a href="dom_methods.asp" title="XML DOM - 属性和方法">DOM 属性和方法</a></li>
<li><a href="dom_nodes_access.asp" title="XML DOM 访问节点">DOM 访问节点</a></li>
<li><a href="dom_nodes_info.asp" title="XML DOM 节点信息">DOM 节点信息</a></li>
<li><a href="dom_nodes_nodelist.asp" title="XML DOM Node List">DOM 节点列表</a></li>
<li><a href="dom_nodes_traverse.asp" title="XML DOM 遍历节点树">DOM 遍历节点</a></li>
<li><a href="dom_mozilla_vs_ie.asp" title="XML DOM 浏览器差异">DOM 浏览器</a></li>
<li><a href="dom_nodes_navigate.asp" title="XML DOM 定位节点">DOM 定位节点</a></li>
</ul>

<h2>节点操作</h2>
<ul>
<li><a href="dom_nodes_get.asp" title="XML DOM 获取节点值">DOM 获取节点</a></li>
<li><a href="dom_nodes_set.asp" title="XML DOM 设置节点">DOM 改变节点</a></li>
<li><a href="dom_nodes_remove.asp" title="XML DOM 删除节点">DOM 删除节点</a></li>
<li><a href="dom_nodes_replace.asp" title="XML DOM 替换节点">DOM 替换节点</a></li>
<li><a href="dom_nodes_create.asp" title="XML DOM 创建节点">DOM 创建节点</a></li>
<li><a href="dom_nodes_add.asp" title="XML DOM 添加节点">DOM 添加节点</a></li>
<li><a href="dom_nodes_clone.asp" title="XML DOM 添加节点">DOM 克隆节点</a></li>
<li><a href="dom_httprequest.asp" title="XMLHttpRequest 对象">DOM HttpRequest</a></li>
</ul>

<h2>XML DOM 参考手册</h2>
<ul class="small">
<li><a href="xmldom_reference.asp" title="XML DOM 参考手册">DOM 手册目录</a></li>
<li><a href="dom_nodetype.asp" title="XML DOM 节点类型（Node Types）">DOM 节点类型</a></li>
<li><a href="dom_attribute.asp">DOM Attr</a></li>
<li><a href="dom_cdatasection.asp">DOM CDATASection</a></li>
<li><a href="dom_characterdata.asp">DOM CharacterData</a></li>
<li><a href="dom_css2properties.asp">DOM CSS2Properties</a></li>
<li><a href="dom_cssrule.asp">DOM CSSRule</a></li>
<li><a href="dom_cssstylerule.asp">DOM CSSStyleRule</a></li>
<li><a href="dom_cssstylesheet.asp">DOM CSSStyleSheet</a></li>
<li><a href="dom_comment.asp">DOM Comment</a></li>
<li><a href="dom_document.asp">DOM Document</a></li>
<li><a href="dom_documenttype.asp">DOM DocumentType</a></li>
<li><a href="dom_domexception.asp">DOM DOMException</a></li>
<li><a href="dom_domimplementation.asp">DOM Implementation</a></li>
<li><a href="dom_domparser.asp">DOM DOMParser</a></li>
<li><a href="dom_element.asp">DOM Element</a></li>
<li><a href="dom_event.asp">DOM Event</a></li>
<li><a href="dom_htmlcollection.asp">DOM HTMLCollection</a></li>
<li><a href="dom_htmldocument.asp">DOM HTMLDocument</a></li>
<li><a href="dom_htmlelement.asp">DOM HTMLElement</a></li>
<li><a href="dom_namednodemap.asp">DOM NamedNodeMap</a></li>
<li><a href="dom_node.asp" title="XML DOM - Node 对象">DOM Node</a></li>
<li><a href="dom_nodelist.asp">DOM NodeList</a></li>
<li><a href="dom_errors.asp">DOM ParseError</a></li>
<li><a href="dom_processinginstruction.asp">DOM ProcessingInstr</a></li>
<li><a href="dom_range.asp">DOM Range</a></li>
<li><a href="dom_rangeexception.asp">DOM RangeException</a></li>
<li><a href="dom_text.asp">DOM Text</a></li>
<li><a href="dom_http.asp">DOM XMLHttpRequest</a></li>
<li><a href="dom_xmlserializer.asp">DOM XMLSerializer</a></li>
<li><a href="dom_xpathexpression.asp">DOM XPathExpression</a></li>
<li><a href="dom_xpathresult.asp">DOM XPathResult</a></li>
<li><a href="dom_xsltprocessor.asp">DOM XSLTProcessor</a></li>
<li class="list_apart"><a href="dom_summary.asp" title="你已经学习了XML DOM，下一步呢？">DOM 总结</a></li>
</ul>

<h2>实例</h2>
<ul>
<li><a href="../example/xdom_examples.asp">DOM 实例</a></li>
<li>DOM 验证器</li>
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

<h1>XML DOM textContent 属性</h1>

<div class="backtoreference">
<p><a href="dom_element.asp" title="XML DOM - Element 对象">Element 对象参考手册</a></p>
</div>

<div>
<h2>定义和用法</h2>

<p>textContent 属性返回或设置选定元素的文本。</p>

<p>如果返回文本，则该属性返回元素节点内所有文本节点的值。</p>
<p>如果设置文本，则该属性删除所有子节点，并用单个文本节点来替换它们。</p>

<h3>语法：</h3>
<p>返回文本：</p>

<pre>elementNode.textContent</pre>

<p>设置文本：</p>

<pre>elementNode.textContent=string</pre>
</div>

<div>
<h2>提示和注释：</h2>
<p class="tip"><span>提示：</span>如需针对 IE 浏览器返回文本节点的文本，请使用 text 属性。</p>
</div>

<div>
<h2>实例</h2>

<p>在所有的例子中，我们将使用 XML 文件 <a href="../example/xdom/books.xml">books.xml</a>，以及 JavaScript 函数 <a href="dom_loadxmldoc.asp" title="XML DOM 加载函数">loadXMLDoc()</a>。</p>

<h3>例子 1</h3>
<p>下面的代码片段获取 &quot;books.xml&quot; 中第一个 &lt;title&gt; 元素的文本节点：</p>

<pre>xmlDoc=loadXMLDoc(&quot;books.xml&quot;);
var x=xmlDoc.getElementsByTagName(&quot;title&quot;)[0];

document.write(&quot;Text Nodes: &quot;);
document.write(<code>x.textContent</code>);</pre>

<p>以上代码的输出：</p>

<pre>Text Nodes: Everyday Italian</pre>

<h3>例子 2</h3>
<p>下面的代码片段从 &quot;books.xml&quot; 的第一个 &lt;book&gt; 元素返回文本节点，并用一个新的文本节点替换所有节点：</p>
<pre>xmlDoc=loadXMLDoc(&quot;books.xml&quot;);
var x=xmlDoc.getElementsByTagName(&quot;book&quot;)[0];

document.write(&quot;Before: &quot;);
document.write(<code>x.textContent</code>);

document.write(&quot;&lt;br /&gt;&quot;);
x.textContent=&quot;hello&quot;;

document.write(&quot;After: &quot;);
document.write(<code>x.textContent</code>);</pre>

<p>以上代码的输出：</p>
<pre>Before: Everyday Italian Giada De Laurentiis 2005 30.00 
After: hello</pre>
</div>

<div class="example">
<h2>TIY</h2>
<dl>
<dt><a href="../tiy/t.asp@f=xdom_textcontent">textContent - 获取元素的文本节点</a></dt>

<dt><a href="../tiy/t.asp@f=xdom_textcontent2">textContent - 获取元素的文本节点并替换它们</a></dt>
</dl>
</div>

<div class="backtoreference">
<p><a href="dom_element.asp" title="XML DOM - Element 对象">Element 对象参考手册</a></p>
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
<h5 id="tools_reference"><a href="xmldom_reference.asp">XML DOM 参考手册</a></h5>
<h5 id="tools_example"><a href="../example/xdom_examples.asp">XML DOM 实例</a></h5>
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