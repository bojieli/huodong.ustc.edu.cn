
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

<title>XML DOM hasChildNodes() ����</title>
</head>

<body class="xml">
<div id="wrapper">

<div id="header">
<a href="../index.html" title="w3school ���߽̳�" style="float:left;">w3school ���߽̳�</a>
<div id="ad_head">
<script type="text/javascript"><!--
google_ad_client = "pub-3381531532877742";
/* 728x90, ������ 08-12-1 */
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
<li id="h"><a href="../h.asp" title="HTML ϵ�н̳�">HTML�̳�</a></li>
<li id="x"><a href="../x.asp" title="XML ϵ�н̳�">XML�̳�</a></li>
<li id="b"><a href="../b.asp" title="������ű�ϵ�н̳�">������ű�</a></li>
<li id="s"><a href="../s.asp" title="�������ű�ϵ�н̳�">�������ű�</a></li>
<li id="d"><a href="../d.asp" title=".NET (dotnet) �̳�">dot net�̳�</a></li>
<li id="m"><a href="../m.asp" title="��ý��ϵ�н̳�">��ý��̳�</a></li>
<li id="w"><a href="../w.asp" title="��վ�����ֲ�">��վ�ֲ�</a></li>
</ul>
</div><div id="navsecond">

<div id="course">
<h2>XML DOM �̳�</h2>
<ul>
<li><a href="index.asp" title="XML DOM �̳�">DOM ��ҳ</a></li>
<li><a href="dom_intro.asp" title="XML DOM ���">DOM ���</a></li>
<li><a href="dom_nodes.asp" title="XML DOM �ڵ�">DOM �ڵ�</a></li>
<li><a href="dom_nodetree.asp" title="XML DOM �ڵ���">DOM �ڵ���</a></li>
<li><a href="dom_parser.asp" title="���� XML DOM">DOM ����</a></li>
<li><a href="dom_loadxmldoc.asp" title="XML DOM ���غ���">DOM ����</a></li>
<li><a href="dom_methods.asp" title="XML DOM - ���Ժͷ���">DOM ���Ժͷ���</a></li>
<li><a href="dom_nodes_access.asp" title="XML DOM ���ʽڵ�">DOM ���ʽڵ�</a></li>
<li><a href="dom_nodes_info.asp" title="XML DOM �ڵ���Ϣ">DOM �ڵ���Ϣ</a></li>
<li><a href="dom_nodes_nodelist.asp" title="XML DOM Node List">DOM �ڵ��б�</a></li>
<li><a href="dom_nodes_traverse.asp" title="XML DOM �����ڵ���">DOM �����ڵ�</a></li>
<li><a href="dom_mozilla_vs_ie.asp" title="XML DOM ���������">DOM �����</a></li>
<li><a href="dom_nodes_navigate.asp" title="XML DOM ��λ�ڵ�">DOM ��λ�ڵ�</a></li>
</ul>

<h2>�ڵ����</h2>
<ul>
<li><a href="dom_nodes_get.asp" title="XML DOM ��ȡ�ڵ�ֵ">DOM ��ȡ�ڵ�</a></li>
<li><a href="dom_nodes_set.asp" title="XML DOM ���ýڵ�">DOM �ı�ڵ�</a></li>
<li><a href="dom_nodes_remove.asp" title="XML DOM ɾ���ڵ�">DOM ɾ���ڵ�</a></li>
<li><a href="dom_nodes_replace.asp" title="XML DOM �滻�ڵ�">DOM �滻�ڵ�</a></li>
<li><a href="dom_nodes_create.asp" title="XML DOM �����ڵ�">DOM �����ڵ�</a></li>
<li><a href="dom_nodes_add.asp" title="XML DOM ���ӽڵ�">DOM ���ӽڵ�</a></li>
<li><a href="dom_nodes_clone.asp" title="XML DOM ���ӽڵ�">DOM ��¡�ڵ�</a></li>
<li><a href="dom_httprequest.asp" title="XMLHttpRequest ����">DOM HttpRequest</a></li>
</ul>

<h2>XML DOM �ο��ֲ�</h2>
<ul class="small">
<li><a href="xmldom_reference.asp" title="XML DOM �ο��ֲ�">DOM �ֲ�Ŀ¼</a></li>
<li><a href="dom_nodetype.asp" title="XML DOM �ڵ����ͣ�Node Types��">DOM �ڵ�����</a></li>
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
<li><a href="dom_node.asp" title="XML DOM - Node ����">DOM Node</a></li>
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
<li class="list_apart"><a href="dom_summary.asp" title="���Ѿ�ѧϰ��XML DOM����һ���أ�">DOM �ܽ�</a></li>
</ul>

<h2>ʵ��</h2>
<ul>
<li><a href="../example/xdom_examples.asp">DOM ʵ��</a></li>
<li>DOM ��֤��</li>
</ul>
</div>

<div id="selected">
<h2>��վ�ֲ�</h2>
<ul>
<li><a href="../site/index.asp" title="��վ����">��վ����</a></li>
<li><a href="../w3c/index.asp" title="��ά������ (W3C)">��ά������ (W3C)</a></li>
<li><a href="../browsers/index.asp" title="�������Ϣ">�������Ϣ</a></li>
<li><a href="../quality/index.asp" title="��վƷ��">��վƷ��</a></li>
<li><a href="../semweb/index.asp" title="������">������</a></li>
<li><a href="../careers/index.asp" title="ְҵ�滮">ְҵ�滮</a></li>
<li><a href="../hosting/index.asp" title="��վ����">��վ����</a></li>
</ul>

<h2><a href="../about/index.asp" title="���� W3School" id="link_about">���� W3School</a></h2>
<h2><a href="../about/about_helping.asp" title="���� W3School" id="link_help">���� W3School</a></h2>

</div>

</div>

<div id="maincontent">

<h1>XML DOM hasChildNodes() ����</h1>

<div class="backtoreference">
<p><a href="dom_element.asp" title="XML DOM - Element ����">Element ����ο��ֲ�</a></p>
</div>

<div>
<h2>������÷�</h2>

<p>�����ǰԪ�ؽڵ�ӵ���ӽڵ㣬�� hasChildNodes() ���� true�����ط��� false��</p>

<h3>�﷨��</h3>
<pre>elementNode.hasChildNodes()</pre>
</div>

<div>
<h2>ʵ��</h2>

<p>�����е������У����ǽ�ʹ�� XML �ļ� <a href="../example/xdom/books.xml">books.xml</a>���Լ� JavaScript ���� <a href="dom_loadxmldoc.asp" title="XML DOM ���غ���">loadXMLDoc()</a>��</p>

<p>����Ĵ���Ƭ�μ�� &quot;books.xml&quot; �еĵ�һ�� &lt;book&gt; Ԫ���Ƿ�ӵ���ӽڵ㣺</p>

<pre>xxmlDoc=loadXMLDoc(&quot;books.xml&quot;);
x=xmlDoc.getElementsByTagName(&quot;book&quot;)[0];

document.write(<code>x.hasChildNodes()</code>);</pre>

<p>���ϴ���������</p>

<pre>true</pre>
</div>

<div class="example">
<h2>TIY</h2>
<dl>
<dt><a href="../tiy/t.asp@f=xdom_element_haschildnodes">hasChildNodes() - ���Ԫ���Ƿ�ӵ���ӽڵ�</a></dt>
</dl>
</div>

<div class="backtoreference">
<p><a href="dom_element.asp" title="XML DOM - Element ����">Element ����ο��ֲ�</a></p>
</div>

</div>

<div id="sidebar">

<div id="searchui">
<form method="get" id="searchform" action="http://www.google.com.hk/search">
<p><label for="searched_content">Search:</label></p>
<p><input type="hidden" name="sitesearch" value="w3school.com.cn" /></p>
<p>
<input type="text" name="as_q" class="box"  id="searched_content" title="�ڴ������������ݡ�" />
<input type="submit" value="Go" class="button" title="������" />
</p>
</form>
</div>

<div id="tools">
<h5 id="tools_reference"><a href="xmldom_reference.asp">XML DOM �ο��ֲ�</a></h5>
<h5 id="tools_example"><a href="../example/xdom_examples.asp">XML DOM ʵ��</a></h5>
</div>

<div id="ad">
<h2>����������</h2>
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
<p>W3School�ṩ�����ݽ�������ѵ�����ǲ���֤���ݵ���ȷ�ԡ�ͨ��ʹ�ñ�վ������֮�����ķ����뱾վ�޹ء���ʹ�ñ�վʱ���������ѽ����˱�վ��<a href="../about/about_use.asp" title="����ʹ��">ʹ������</a>��<a href="../about/about_privacy.asp" title="������˽">��˽����</a>��</p>
<p>��Ȩ���У�����һ��Ȩ����δ���������ɣ�����ת�ء�W3School �������İ���������ݽ������ԣ����κη������⼰���ղ��е��κ����Ρ�<a href="http://www.yktz.net/" title="�Ϻ�Ӯ��Ͷ�����޹�˾">�Ϻ�Ӯ��Ͷ�ʹ�˾</a>��</p>
</div>

</div>
</body>
</html>