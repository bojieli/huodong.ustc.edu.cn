
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

<title>XPath Axes�������ᣩ</title>
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
<h2>XPath �̳�</h2>
<ul>
<li><a href="index.asp" title="XPath �̳�">XPath ��ҳ</a></li>
<li><a href="xpath_intro.asp" title="XPath ���">XPath ���</a></li>
<li><a href="xpath_nodes.asp" title="XPath �ڵ�">XPath �ڵ�</a></li>
<li><a href="xpath_syntax.asp" title="XPath �﷨">XPath �﷨</a></li>
<li><a href="xpath_axes.asp" title="XPath Axes���ᣩ">XPath ��</a></li>
<li><a href="xpath_operators.asp" title="XPath �����">XPath �����</a></li>
<li><a href="xpath_examples.asp" title="XPath ʵ��">XPath ʵ��</a></li>
<li><a href="xpath_summary.asp" title="���Ѿ�ѧϰ�� XPath����һ���أ�">XPath �ܽ�</a></li>
</ul>

<h2>�ο��ֲ�</h2>
<ul>
<li><a href="xpath_functions.asp" title="XPath��XQuery �Լ� XSLT ����">XPath ����</a></li>
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

<h1>XPath Axes�������ᣩ</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="xpath_syntax.asp">Previous Page</a></li>

<li class="next"><a href="xpath_operators.asp">Next Page</a></li>
</ul>

</div>


<div>
<h2>XML ʵ���ĵ�</h2>
<p>���ǽ��������������ʹ�ô� XML �ĵ���</p>
<pre>&lt;?xml version=&quot;1.0&quot; encoding=&quot;ISO-8859-1&quot;?&gt;

&lt;bookstore&gt;

&lt;book&gt;
  &lt;title lang=&quot;eng&quot;&gt;Harry Potter&lt;/title&gt;
  &lt;price&gt;29.99&lt;/price&gt;
&lt;/book&gt;

&lt;book&gt;
  &lt;title lang=&quot;eng&quot;&gt;Learning XML&lt;/title&gt;
  &lt;price&gt;39.95&lt;/price&gt;
&lt;/book&gt;

&lt;/bookstore&gt;</pre>
</div>


<div>
<h2>XPath ��</h2>

<p>��ɶ�������ڵ�ǰ�ڵ�Ľڵ㼯��</p>

<table class="dataintable">
<tr>
<th style="width:30%;">������</th>
<th>���</th>
</tr>

<tr>
<td>ancestor</td>
<td>ѡȡ��ǰ�ڵ�������ȱ��������游�ȣ���</td>
</tr>

<tr>
<td>ancestor-or-self</td>
<td>ѡȡ��ǰ�ڵ�������ȱ��������游�ȣ��Լ���ǰ�ڵ㱾����</td>
</tr>

<tr>
<td>attribute</td>
<td>ѡȡ��ǰ�ڵ���������ԡ�</td>
</tr>

<tr>
<td>child</td>
<td>ѡȡ��ǰ�ڵ��������Ԫ�ء�</td>
</tr>

<tr>
<td>descendant</td>
<td>ѡȡ��ǰ�ڵ�����к��Ԫ�أ��ӡ���ȣ���</td>
</tr>

<tr>
<td>descendant-or-self</td>
<td>ѡȡ��ǰ�ڵ�����к��Ԫ�أ��ӡ���ȣ��Լ���ǰ�ڵ㱾����</td>
</tr>

<tr>
<td>following</td>
<td>ѡȡ�ĵ��е�ǰ�ڵ�Ľ�����ǩ֮������нڵ㡣</td>
</tr>

<tr>
<td>namespace</td>
<td>ѡȡ��ǰ�ڵ�����������ռ�ڵ㡣</td>
</tr>

<tr>
<td>parent</td>
<td>ѡȡ��ǰ�ڵ�ĸ��ڵ㡣</td>
</tr>

<tr>
<td>preceding</td>
<td>ѡȡ�ĵ��е�ǰ�ڵ�Ŀ�ʼ��ǩ֮ǰ�����нڵ㡣</td>
</tr>

<tr>
<td>preceding-sibling</td>
<td>ѡȡ��ǰ�ڵ�֮ǰ������ͬ���ڵ㡣</td>
</tr>

<tr>
<td>self</td>
<td>ѡȡ��ǰ�ڵ㡣</td>
</tr>
</table>
</div>


<div>
<h2>λ��·������ʽ</h2>
<p>λ��·�������Ǿ��Եģ�Ҳ��������Եġ�</p>
<p>����·����ʼ����б��( / )�������·����������������������У�λ��·��������һ����������ÿ��������б�ָܷ</p>

<h3>����λ��·����</h3>
<pre>/step/step/...</pre>
<h3>���λ��·����</h3>
<pre>step/step/...</pre>

<p>ÿ���������ݵ�ǰ�ڵ㼯֮�еĽڵ������м��㡣</p>

<h3>����step��������</h3>
<dl class="define">
<dt>�ᣨaxis��</dt>
<dd>������ѡ�ڵ��뵱ǰ�ڵ�֮�������ϵ</dd>
<dt>�ڵ���ԣ�node-test��</dt>
<dd>ʶ��ĳ�����ڲ��Ľڵ�</dd>
<dt>������߸���ν�predicate��</dt>
<dd>�������������ѡ�Ľڵ㼯</dd>
</dl>

<h3>�����﷨��</h3>
<pre>������::�ڵ����[ν��]</pre>

<h3>ʵ��</h3>

<table class="dataintable">
<tr>
<th style="width:30%;">����</th>
<th>���</th>
</tr>

<tr>
<td>child::book</td>
<td>ѡȡ�������ڵ�ǰ�ڵ����Ԫ�ص� book �ڵ㡣</td>
</tr>

<tr>
<td>attribute::lang</td>
<td>ѡȡ��ǰ�ڵ�� lang ���ԡ�</td>
</tr>

<tr>
<td>child::*</td>
<td>ѡȡ��ǰ�ڵ��������Ԫ�ء�</td>
</tr>

<tr>
<td>attribute::*</td>
<td>ѡȡ��ǰ�ڵ���������ԡ�</td>
</tr>

<tr>
<td>child::text()</td>
<td>ѡȡ��ǰ�ڵ�������ı��ӽڵ㡣</td>
</tr>

<tr>
<td>child::node()</td>
<td>ѡȡ��ǰ�ڵ�������ӽڵ㡣</td>
</tr>

<tr>
<td>descendant::book</td>
<td>ѡȡ��ǰ�ڵ������ book �����</td>
</tr>

<tr>
<td>ancestor::book</td>
<td>ѡ��ǰ�ڵ������ book �ȱ���</td>
</tr>

<tr>
<td>ancestor-or-self::book</td>
<td>ѡȡ��ǰ�ڵ������ book �ȱ��Լ���ǰ�ڵ㣨����˽ڵ��� book �ڵ㣩</td>
</tr>

<tr>
<td>child::*/child::price</td>
<td>ѡȡ��ǰ�ڵ������ price ��ڵ㡣</td>
</tr>
</table>
</div>


<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="xpath_syntax.asp">Previous Page</a></li>

<li class="next"><a href="xpath_operators.asp">Next Page</a></li>
</ul>

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
<h5 id="tools_reference"><a href="xpath_functions.asp">XPath, XQuery, �Լ�XSLT����</a></h5>
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