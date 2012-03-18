
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

<title>XQuery ����Ԫ�غ�����</title>
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
<h2>XQuery ����</h2>
<ul>
<li><a href="index.asp" title="XQuery �̳�">XQuery ��ҳ</a></li>
<li><a href="xquery_intro.asp" title="XQuery ���">XQuery ���</a></li>
<li><a href="xquery_example.asp" title="XQuery ʵ��">XQuery ʵ��</a></li>
<li><a href="xquery_flwor.asp" title="XQuery FLWOR ����ʽ">XQuery FLWOR</a></li>
<li><a href="xquery_flwor_html.asp" title="XQuery FLWOR + HTML">XQuery HTML</a></li>
<li><a href="xquery_terms.asp" title="XQuery ����">XQuery ����</a></li>
<li><a href="xquery_syntax.asp" title="XQuery �﷨">XQuery �﷨</a></li>
</ul>

<h2>XQuery �߼�</h2>
<ul>
<li><a href="xquery_add.asp" title="XQuery ����Ԫ�غ�����">XQuery ����</a></li>
<li><a href="xquery_select.asp" title="XQuery ѡ��͹���">XQuery ѡȡ</a></li>
<li><a href="xquery_functions.asp" title="XQuery ����">XQuery ����</a></li>
<li><a href="xquery_summary.asp" title="���Ѿ�ѧϰ�� XQuery����һ���أ�">XQuery �ܽ�</a></li>
</ul>

<h2>XQuery �ο��ֲ�</h2>
<ul>
<li><a href="xquery_reference.asp" title="XQuery �ο��ֲ�">XQuery �ο��ֲ�</a></li>
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

<h1>XQuery ����Ԫ�غ�����</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="xquery_syntax.asp">Previous Page</a></li>

<li class="next"><a href="xquery_select.asp">Next Page</a></li>
</ul>

</div>

<div>
<h2>XML ʵ���ĵ�</h2>
<p>���ǽ��������������ʹ����� &quot;books.xml&quot; �ĵ�����������½���ʹ�õ� XML �ļ���ͬ����</p>
<p><a href="books.xml">������������в鿴 &quot;books.xml&quot; �ļ�</a>��</p>
</div>

<div>
<h2>��������Ԫ�غ�����</h2>
<p>������ǰ��һ�ڿ����ģ����ǿ����ڽ�������������ļ��е�Ԫ�غ����ԣ�</p>
<pre>for $x in doc(&quot;books.xml&quot;)/bookstore/book/title
order by $x
return $x</pre>

<p>����� XQuery ����ʽ���ڽ�������� title Ԫ�غ� lang ���ԣ�����������</p>
<pre>&lt;title lang=&quot;en&quot;&gt;Everyday Italian&lt;/title&gt;
&lt;title lang=&quot;en&quot;&gt;Harry Potter&lt;/title&gt;
&lt;title lang=&quot;en&quot;&gt;Learning XML&lt;/title&gt;
&lt;title lang=&quot;en&quot;&gt;XQuery Kick Start&lt;/title&gt;</pre>

<p>���� XQuery ����ʽ���� title Ԫ�صķ�ʽ�������������ĵ��б������ķ�ʽ����ͬ�ġ�</p>
<p>��������Ҫ�������������Լ���Ԫ�غ����ԣ�</p>

<h3>���� HTML Ԫ�غ��ı�</h3>
<p>���ڣ�����Ҫ�������� HTML Ԫ�ء����ǻ�ѽ������һ�� HTML �б��У�</p>
<pre>&lt;html&gt;
&lt;body&gt;

&lt;h1&gt;Bookstore&lt;/h1&gt;

<code>&lt;ul&gt;</code>
{
for $x in doc(&quot;books.xml&quot;)/bookstore/book
order by $x/title
return <code>&lt;li&gt;{data($x/title)}. Category: {data($x/@category)}&lt;/li&gt;</code>
}
<code>&lt;/ul&gt;</code>

&lt;/body&gt;
&lt;/html&gt;</pre>

<p>���� XQuery ����ʽ����������Ľ����</p>
<pre>&lt;html&gt;
&lt;body&gt;

&lt;h1&gt;Bookstore&lt;/h1&gt;

&lt;ul&gt;
&lt;li&gt;Everyday Italian. Category: COOKING&lt;/li&gt;
&lt;li&gt;Harry Potter. Category: CHILDREN&lt;/li&gt;
&lt;li&gt;Learning XML. Category: WEB&lt;/li&gt;
&lt;li&gt;XQuery Kick Start. Category: WEB&lt;/li&gt;
&lt;/ul&gt;

&lt;/body&gt;
&lt;/html&gt;</pre>

<h3>�� HTML Ԫ����������</h3>
<p>������������Ҫ�� category ������Ϊ HTML �б��е� class ������ʹ�ã�</p>
<pre>&lt;html&gt;
&lt;body&gt;

&lt;h1&gt;Bookstore&lt;/h1&gt;

<code>&lt;ul&gt;</code>
{
for $x in doc(&quot;books.xml&quot;)/bookstore/book
order by $x/title
<code>return &lt;li class=&quot;{data($x/@category)}&quot;&gt;{data($x/title)}&lt;/li&gt;</code>
}
<code>&lt;/ul&gt;</code>

&lt;/body&gt;
&lt;/html&gt;</pre>

<p>����� XQuery ����ʽ���������½����</p>
<pre>&lt;html&gt;
&lt;body&gt;

&lt;h1&gt;Bookstore&lt;/h1&gt;

&lt;ul&gt;
&lt;li class=&quot;COOKING&quot;&gt;Everyday Italian&lt;/li&gt;
&lt;li class=&quot;CHILDREN&quot;&gt;Harry Potter&lt;/li&gt;
&lt;li class=&quot;WEB&quot;&gt;Learning XML&lt;/li&gt;
&lt;li class=&quot;WEB&quot;&gt;XQuery Kick Start&lt;/li&gt;
&lt;/ul&gt;

&lt;/body&gt;
&lt;/html&gt;</pre>
</div>

<div  id="bpn">
<ul class="prenext">

<li class="pre"><a href="xquery_syntax.asp">Previous Page</a></li>

<li class="next"><a href="xquery_select.asp">Next Page</a></li>
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
<h5 id="tools_reference"><a href="xquery_reference.asp">XQuery �ο��ֲ�</a></h5>
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