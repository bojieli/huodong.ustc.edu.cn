
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

<title>WSDL �˿�</title>
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
<h2>WSDL �̳�</h2>
<ul>
<li><a href="index.asp" title="WSDL�̳���ҳ">WSDL ��ҳ</a></li>
<li><a href="wsdl_intro.asp" title="WSDL���">WSDL ���</a></li>
<li><a href="wsdl_documents.asp" title="WSDL �ĵ�">WSDL �ĵ�</a></li>
<li><a href="wsdl_ports.asp" title="WSDL �˿�">WSDL �˿�</a></li>
<li><a href="wsdl_binding.asp" title="WSDL ��">WSDL ��</a></li>
<li><a href="wsdl_uddi.asp" title="WSDL �� UDDI">WSDL �� UDDI</a></li>
<li><a href="wsdl_syntax.asp" title="������ WSDL �﷨">WSDL �﷨</a></li>
<li><a href="wsdl_summary.asp" title="���Ѿ�ѧϰ�� WSDL����һ���أ�">WSDL �ܽ�</a></li>
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

<h1>WSDL �˿�</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="wsdl_documents.asp">Previous Page</a></li>

<li class="next"><a href="wsdl_binding.asp">Next Page</a></li>
</ul>

</div>


<div id="intro">
<p><strong>WSDL �˿ڿ�������ĳ�� web service �ṩ�Ľ��棨�Ϸ���������</strong></p>
</div>


<div>
<h2>WSDL �˿�</h2>
<p><em>&lt;portType&gt;</em> Ԫ��������Ҫ�� WSDL Ԫ�ء�</p>
<p>��������һ�� <em>web service</em>���ɱ�ִ�е�<em>����</em>���Լ���ص�<em>��Ϣ</em>��</p>
<p>�˿ڶ�����ָ��ĳ�� web service �����ӵ㡣���԰Ѹ�Ԫ�ر�����ͳ��������е�һ�������⣨��һ��ģ�顢��һ���ࣩ������ÿ������������ͳ��������е�һ��������</p>
</div>


<div>
<h2>��������</h2>
<p>����-��Ӧ������ͨ�Ĳ������ͣ����� WSDL �������������ͣ�</p>
<table class="dataintable">
<tr>
<th>����</th>
<th>����</th>
</tr>

<tr>
<td>One-way</td>
<td>�˲����ɽ�����Ϣ�������᷵����Ӧ��</td>
</tr>

<tr>
<td>Request-response</td>
<td>�˲����ɽ���һ�����󲢻᷵��һ����Ӧ</td>
</tr>

<tr>
<td>Solicit-response</td>
<td>�˲����ɷ���һ�����󣬲���ȴ�һ����Ӧ��</td>
</tr>

<tr>
<td>Notification</td>
<td>�˲����ɷ���һ����Ϣ��������ȴ���Ӧ��</td>
</tr>
</table>
</div>


<div>
<h2>One-Way ����</h2>
<p>һ�� one-way ���������ӣ�</p>

<pre>&lt;message name=&quot;newTermValues&quot;&gt;
   &lt;part name=&quot;term&quot; type=&quot;xs:string&quot;/&gt;
   &lt;part name=&quot;value&quot; type=&quot;xs:string&quot;/&gt;
&lt;/message&gt;

&lt;portType name=&quot;glossaryTerms&quot;&gt;
   &lt;operation name=&quot;setTerm&quot;&gt;
      &lt;input name=&quot;newTerm&quot; message=&quot;newTermValues&quot;/&gt;
   &lt;/operation&gt;
&lt;/portType &gt;</pre>

<p>����������У��˿� &quot;glossaryTerms&quot; ������һ����Ϊ &quot;setTerm&quot; �� one-way ������</p>
<p>��� &quot;setTerm&quot; �����ɽ������������Ŀ��Ϣ�����룬��Щ��Ϣʹ��һ����Ϊ &quot;newTermValues&quot; ����Ϣ������Ϣ����������� &quot;term&quot; �� &quot;value&quot;��������û��Ϊ������������κ������</p>
</div>


<div>
<h2>Request-Response ����</h2>
<p>һ�� request-response ���������ӣ�</p>
<pre>&lt;message name=&quot;getTermRequest&quot;&gt;
   &lt;part name=&quot;term&quot; type=&quot;xs:string&quot;/&gt;
&lt;/message&gt;

&lt;message name=&quot;getTermResponse&quot;&gt;
   &lt;part name=&quot;value&quot; type=&quot;xs:string&quot;/&gt;
&lt;/message&gt;

&lt;portType name=&quot;glossaryTerms&quot;&gt;
  &lt;operation name=&quot;getTerm&quot;&gt;
    &lt;input message=&quot;getTermRequest&quot;/&gt;
    &lt;output message=&quot;getTermResponse&quot;/&gt;
  &lt;/operation&gt;
&lt;/portType&gt;</pre>
<p>����������У��˿� &quot;glossaryTerms&quot; ������һ����Ϊ &quot;getTerm&quot; �� request-response ������</p>
<p>&quot;getTerm&quot; ����������һ����Ϊ &quot;getTermRequest&quot; ��������Ϣ������Ϣ����һ����Ϊ &quot;term&quot; �Ĳ�������������һ����Ϊ &quot;getTermResponse&quot; �������Ϣ������Ϣ����һ����Ϊ &quot;value&quot; �Ĳ�����</p>
</div>


<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="wsdl_documents.asp">Previous Page</a></li>

<li class="next"><a href="wsdl_binding.asp">Next Page</a></li>
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
</div><div id="ad">
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