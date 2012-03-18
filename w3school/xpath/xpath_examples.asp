
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

<title>XPath ʵ��</title>
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

<h1>XPath ʵ��</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="xpath_operators.asp">Previous Page</a></li>

<li class="next"><a href="xpath_summary.asp">Next Page</a></li>
</ul>

</div>


<div id="intro">
<p><strong>�ڱ��ڣ�������ͨ��ʵ����ѧϰһЩ������ XPath �﷨��</strong></p>
</div>


<div>
<h2>XMLʵ���ĵ�</h2>

<p>���ǽ��������������ʹ����� XML �ĵ���</p>

<h3>&quot;books.xml&quot; :</h3>

<pre>&lt;?xml version=&quot;1.0&quot; encoding=&quot;ISO-8859-1&quot;?&gt;

&lt;bookstore&gt;

&lt;book category=&quot;COOKING&quot;&gt;
  &lt;title lang=&quot;en&quot;&gt;Everyday Italian&lt;/title&gt;
  &lt;author&gt;Giada De Laurentiis&lt;/author&gt;
  &lt;year&gt;2005&lt;/year&gt;
  &lt;price&gt;30.00&lt;/price&gt;
&lt;/book&gt;

&lt;book category=&quot;CHILDREN&quot;&gt;
  &lt;title lang=&quot;en&quot;&gt;Harry Potter&lt;/title&gt;
  &lt;author&gt;J K. Rowling&lt;/author&gt;
  &lt;year&gt;2005&lt;/year&gt;
  &lt;price&gt;29.99&lt;/price&gt;
&lt;/book&gt;

&lt;book category=&quot;WEB&quot;&gt;
  &lt;title lang=&quot;en&quot;&gt;XQuery Kick Start&lt;/title&gt;
  &lt;author&gt;James McGovern&lt;/author&gt;
  &lt;author&gt;Per Bothner&lt;/author&gt;
  &lt;author&gt;Kurt Cagle&lt;/author&gt;
  &lt;author&gt;James Linn&lt;/author&gt;
  &lt;author&gt;Vaidyanathan Nagarajan&lt;/author&gt;
  &lt;year&gt;2003&lt;/year&gt;
  &lt;price&gt;49.99&lt;/price&gt;
&lt;/book&gt;

&lt;book category=&quot;WEB&quot;&gt;
  &lt;title lang=&quot;en&quot;&gt;Learning XML&lt;/title&gt;
  &lt;author&gt;Erik T. Ray&lt;/author&gt;
  &lt;year&gt;2003&lt;/year&gt;
  &lt;price&gt;39.95&lt;/price&gt;
&lt;/book&gt;

&lt;/bookstore&gt;</pre>

<p><a href="../example/xmle/books.xml">������������в鿴�� &quot;books.xml&quot; �ļ�</a>��</p>
</div>


<div>
<h2>���� XML �ĵ�</h2>

<p>�����ִ��������֧��ʹ�� XMLHttpRequest ������ XML �ĵ��ķ�����</p>

<p>��Դ�����ִ�������Ĵ��룺</p>

<pre>var xmlhttp=new XMLHttpRequest()</pre>

<p>��Թ��ϵ�΢���������IE 5 �� 6���Ĵ��룺</p>

<pre>var xmlhttp=new ActiveXObject(&quot;Microsoft.XMLHTTP&quot;)</pre>
</div>


<div>
<h2>ѡȡ�ڵ�</h2>

<p>���ҵ��ǣ�Internet Explorer ���������� XPath �ķ�ʽ��ͬ��</p>

<p>�����ǵ������У����������ڴ��������������Ĵ��롣</p>

<p>Internet Explorer ʹ�� selectNodes() ������ XML �ĵ��е�ѡȡ�ڵ㣺</p>

<pre>xmlDoc.selectNodes(<i>xpath</i>);</pre>

<p>Firefox��Chrome��Opera �Լ� Safari ʹ�� evaluate() ������ XML �ĵ���ѡȡ�ڵ㣺</p>

<pre>xmlDoc.evaluate(<i>xpath</i>, xmlDoc, null, XPathResult.ANY_TYPE,null);</pre>
</div>


<div>
<h2>ѡȡ���� title</h2>

<p>���������ѡȡ���� title �ڵ㣺</p>

<pre>/bookstore/book/title</pre>

<p><a href="../tiy/t.asp@f=xpath_select_titlenodes">������һ��</a></p>
</div>


<div>
<h2>ѡȡ��һ�� book �� title</h2>

<p>���������ѡȡ bookstore Ԫ������ĵ�һ�� book �ڵ�� title��</p>

<pre>/bookstore/book[1]/title</pre>

<p><a href="../tiy/t.asp@f=xpath_select_titlenodes_first">������һ��</a></p>

<p>������һ�����⡣����������� IE ������������������ͬ�Ľ����</p>

<p>IE5 �Լ����߰汾�� [0] ��Ϊ��һ���ڵ㣬������ W3C �ı�׼��Ӧ���� [1]��</p>

<p>Ϊ�˽�� IE5+ �� [0] �� [1] �����⣬����Ϊ XPath ��������ѡ��SelectionLanguage����</p>

<p>���������ѡȡ bookstore Ԫ������ĵ�һ�� book �ڵ�� title��</p>

<pre>
xml.setProperty(&quot;SelectionLanguage&quot;,&quot;XPath&quot;);
xml.selectNodes(&quot;/bookstore/book[1]/title&quot;);
</pre>

<p><a href="../tiy/t.asp@f=xpath_select_titlenodes_first_iesp1">������һ��</a></p>
</div>


<div>
<h2>ѡȡ���м۸�</h2>

<p>���������ѡȡ price �ڵ��е������ı���</p>

<pre>/bookstore/book/price/text()</pre>

<p><a href="../tiy/t.asp@f=xpath_select_pricenodes_text">������һ��</a></p>
</div>


<div>
<h2>ѡȡ�۸���� 35 �� price �ڵ�</h2>

<p>���������ѡȡ�۸���� 35 ������ price �ڵ㣺</p>

<pre>/bookstore/book[price&gt;35]/price</pre>

<p><a href="../tiy/t.asp@f=xpath_select_pricenodes_35">������һ��</a></p>
</div>


<div>
<h2>ѡȡ�۸���� 35 �� title �ڵ�</h2>

<p>���������ѡȡ�۸���� 35 ������ title �ڵ㣺</p>

<pre>/bookstore/book[price&gt;35]/title</pre>

<p><a href="../tiy/t.asp@f=xpath_select_pricenodes_35_title">������һ��</a></p>
</div>





<div>
<h2>ѡȡ���е� book �ڵ�</h2>

<p>������������ѡȡ�� bookstore Ԫ�������е� book �ڵ㣺</p>

<pre>xmlDoc.selectNodes(&quot;/bookstore/book&quot;)</pre>
<p>����������ʹ�� IE 5 ����ߵİ汾������<a href="http://www.w3school.com.cn/tiy/t.asp?f=xpth_select_cdnodes">������һ��</a>��</p>
</div>


<div>
<h2>ѡȡ��һ�� book �ڵ�</h2>

<p>��������ӽ�ѡȡ bookstore Ԫ���µ�һ�� book �ڵ㣺</p>

<pre>xmlDoc.selectNodes(&quot;/bookstore/book[0]&quot;)</pre>

<p>����������ʹ�� IE 5����ߵİ汾������<a href="http://www.w3school.com.cn/tiy/t.asp?f=xpth_select_cdnodes_first">������һ��</a>��</p>
<p class="note"><span>ע�ͣ�</span>IE 5 �� 6 ��� [0] ��Ϊ��һ���ڵ���ִ�У����Ǹ��� W3C �ı�׼��Ӧ��ʹ�� [1] ����</p>
<p class="note"><span>ע�ͣ�</span>��������� IE 6 SP2 �б������ˣ�</p>
</div>


<div>
<h2>ѡȡ price</h2>
<p>��������Ӵ����е� price �ڵ�ѡȡ�ı���</p>
<pre>xmlDoc.selectNodes(&quot;/bookstore/book/price/text()&quot;)</pre>
<p>����������ʹ�� IE 5 ����ߵİ汾������<a href="http://www.w3school.com.cn/tiy/t.asp?f=xpth_select_pricenodes_text">������һ��</a>��</p>
</div>


<div>
<h2>ѡȡ�۸���� 35 �� price �۸�</h2>
<p>��������ӻ�ѡȡ���м۸���� 35 �� price �ڵ㣺</p>
<pre>xmlDoc.selectNodes(&quot;/bookstore/book[price&gt;35]/price&quot;)</pre>
<p>����������ʹ�� IE 5 ����ߵİ汾������<a href="http://www.w3school.com.cn/tiy/t.asp?f=xpth_select_pricenodes_35">������һ��</a>��</p>
</div>


<div>
<h2>ѡȡ�۸���� 35 �� title �ڵ�</h2>
<p>��������ӻ�ѡȡ���м۸���� 35 �� title �ڵ㣺</p>
<pre>xmlDoc.selectNodes(&quot;/bookstore/book[price&gt;35]/title&quot;)</pre>
<p>����������ʹ�� IE 5 ����ߵİ汾������<a href="http://www.w3school.com.cn/tiy/t.asp?f=xpth_select_pricenodes_high">������һ��</a>��</p>
</div>


<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="xpath_operators.asp">Previous Page</a></li>

<li class="next"><a href="xpath_summary.asp">Next Page</a></li>
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
<p>��Ȩ���У�����һ��Ȩ����δ��������ɣ�����ת�ء�W3School �������İ���������ݽ������ԣ����κη������⼰���ղ��е��κ����Ρ�<a href="http://www.yktz.net/" title="�Ϻ�Ӯ��Ͷ�����޹�˾">�Ϻ�Ӯ��Ͷ�ʹ�˾</a>��</p>
</div>

</div>
</body>
</html>