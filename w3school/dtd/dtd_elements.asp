
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

<title>DTD - Ԫ��</title>
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
<h2>DTD �̳�</h2>
<ul>
<li><a href="index.asp" title="DTD �̳�">DTD ��ҳ</a></li>
<li><a href="dtd_intro.asp" title="DTD ���">DTD ���</a></li>
<li><a href="dtd_building.asp" title="DTD - XML ����ģ��">DTD ����ģ��</a></li>
<li><a href="dtd_elements.asp" title="DTD - Ԫ��">DTD Ԫ��</a></li>
<li><a href="dtd_attributes.asp" title="DTD - ����">DTD ����</a></li>
<li><a href="dtd_entities.asp" title="DTD - ʵ��">DTD ʵ��</a></li>
<li><a href="dtd_validation.asp" title="DTD ��֤">DTD ��֤</a></li>
<li><a href="dtd_examples.asp" title="DTD - ���������ʵ��">DTD ʵ��</a></li>
<li><a href="dtd_summary.asp" title="���Ѿ�ѧϰ��DTD����һ���أ�">DTD �ܽ�</a></li>
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

<h1>DTD - Ԫ��</h1>

<div  id="tpn">
<ul class="prenext">

<li class="pre"><a href="dtd_building.asp">Previous Page</a></li>

<li class="next"><a href="dtd_attributes.asp">Next Page</a></li>
</ul>

</div>

<div id="intro">
<p><strong>��һ�� DTD �У�Ԫ��ͨ��Ԫ������������������</strong></p>
</div>

<div>
<h2>����һ��Ԫ��</h2>

<p>�� DTD �У�XML Ԫ��ͨ��Ԫ������������������Ԫ������ʹ��������﷨��</p>
<pre>&lt;!ELEMENT Ԫ������ ���&gt;</pre>

<p>����</p>
<pre>&lt;!ELEMENT Ԫ������ (Ԫ������)&gt;</pre>
</div>

<div>
<h2>��Ԫ��</h2>
<p>��Ԫ��ͨ�����ؼ���EMPTY����������</p>

<pre>&lt;!ELEMENT Ԫ������ EMPTY&gt;</pre>

<h3>���ӣ�</h3>
<pre>&lt;!ELEMENT br EMPTY&gt;</pre>

<h3>XML���ӣ�</h3>
<pre>&lt;br /&gt;</pre>
</div>

<div>
<h2>ֻ�� PCDATA ��Ԫ��</h2>
<p>ֻ�� PCDATA ��Ԫ��ͨ��Բ�����е� #PCDATA ����������</p>
<pre>&lt;!ELEMENT Ԫ������ (#PCDATA)&gt;</pre>

<h3>���ӣ�</h3>
<pre>&lt;!ELEMENT from (#PCDATA)&gt;</pre>
</div>

<div>
<h2>�����κ����ݵ�Ԫ��</h2>
<p>ͨ�����ؼ��� ANY ������Ԫ�أ��ɰ����κοɽ������ݵ���ϣ�</p>
<pre>&lt;!ELEMENT Ԫ������ ANY&gt;</pre>

<h3>���ӣ�</h3>
<pre>&lt;!ELEMENT note ANY&gt;</pre>
</div>

<div>
<h2>������Ԫ�أ����У���Ԫ��</h2>
<p>����һ��������Ԫ�ص�Ԫ��ͨ��Բ�����е���Ԫ��������������</p>
<pre>&lt;!ELEMENT Ԫ������ (��Ԫ������ 1)&gt;</pre>
<p>����</p>
<pre>&lt;!ELEMENT Ԫ������ (��Ԫ������ 1,��Ԫ������ 2,.....)&gt;</pre>

<h3>���ӣ�</h3>
<pre>&lt;!ELEMENT note (to,from,heading,body)&gt;</pre>
<p>����Ԫ�ذ����ɶ��ŷָ��������н�������ʱ����Щ��Ԫ�ر��밴����ͬ��˳��������ĵ��С���һ�������������У���Ԫ��Ҳ���뱻������ͬʱ��Ԫ��Ҳ��ӵ����Ԫ�ء�&quot;note&quot; Ԫ�ص����������ǣ�</p>
<pre>&lt;!ELEMENT note (to,from,heading,body)&gt;
&lt;!ELEMENT to      (#PCDATA)&gt;
&lt;!ELEMENT from    (#PCDATA)&gt;
&lt;!ELEMENT heading (#PCDATA)&gt;
&lt;!ELEMENT body    (#PCDATA)&gt;</pre>
</div>

<div>
<h2>����ֻ����һ�ε�Ԫ��</h2>
<pre>&lt;!ELEMENT Ԫ������ (��Ԫ������)&gt;</pre>
<h3>���ӣ�</h3>
<pre>&lt;!ELEMENT note (message)&gt;</pre>
<p>��������������ˣ�message ��Ԫ�ر������һ�Σ����ұ���ֻ�� &quot;note&quot; Ԫ���г���һ�Ρ�</p>
</div>

<div>
<h2>�������ٳ���һ�ε�Ԫ��</h2>
<pre>&lt;!ELEMENT Ԫ������ (��Ԫ������+)&gt;</pre>
<h3>���ӣ�</h3>
<pre>&lt;!ELEMENT note (message+)&gt;</pre>
<p>����������еļӺ������ˣ�message ��Ԫ�ر����� &quot;note&quot; Ԫ���ڳ�������һ�Ρ�</p>
</div>

<div>
<h2>����������λ��ε�Ԫ��</h2>
<pre>&lt;!ELEMENT Ԫ������ (��Ԫ������*)&gt;</pre>
<h3>���ӣ�</h3>
<pre>&lt;!ELEMENT note (message*)&gt;</pre>
<p>����������е��Ǻ������ˣ���Ԫ�� message ���� &quot;note&quot; Ԫ���ڳ�����λ��Ρ�</p>
</div>

<div>
<h2>����������λ�һ�ε�Ԫ��</h2>
<pre>&lt;!ELEMENT Ԫ������ (��Ԫ������?)&gt;</pre>
<h3>���ӣ�</h3>
<pre>&lt;!ELEMENT note (message?)&gt;</pre>
<p>����������е��ʺ������ˣ���Ԫ�� message ���� &quot;note&quot; Ԫ���ڳ�����λ�һ�Ρ�</p>
</div>

<div>
<h2>��������.../��...�����͵�����</h2>
<h3>���ӣ�</h3>
<pre>&lt;!ELEMENT note (to,from,header,(message|body))&gt;</pre>
<p>��������������ˣ�&quot;note&quot; Ԫ�ر������ &quot;to&quot; Ԫ�ء�&quot;from&quot; Ԫ�ء�&quot;header&quot; Ԫ�أ��Լ��� &quot;message&quot; Ԫ�ؼ� &quot;body&quot; Ԫ�ء�</p>
</div>

<div>
<h2>��������͵�����</h2>
<h3>���ӣ�</h3>
<pre>&lt;!ELEMENT note (#PCDATA|to|from|header|message)*&gt;</pre>
<p>��������������ˣ�&quot;note&quot; Ԫ�ؿɰ���������λ��ε� PCDATA��&quot;to&quot;��&quot;from&quot;��&quot;header&quot; ���� &quot;message&quot;��</p>
</div>

<div  id="bpn">
<ul class="prenext">

<li class="pre"><a href="dtd_building.asp">Previous Page</a></li>

<li class="next"><a href="dtd_attributes.asp">Next Page</a></li>
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