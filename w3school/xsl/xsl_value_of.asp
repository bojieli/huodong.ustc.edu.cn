
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

<title>XSLT &lt;xsl:value-of&gt; Ԫ��</title>
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
<h2>XSLT ����</h2>
<ul>
<li><a href="index.asp" title="XSLT�̳���ҳ">XSLT ��ҳ</a></li>
<li><a href="xsl_languages.asp" title="XSL����">XSL  ����</a></li>
<li><a href="xsl_intro.asp" title="XSLT���">XSLT ���</a></li>
<li><a href="xsl_browsers.asp" title="��XSLT�������֧��">XSLT �����</a></li>
<li><a href="xsl_transformation.asp" title="ʹ��XSLTת��XML">XSLT ת��</a></li>
<li><a href="xsl_templates.asp" title="xsl:templateԪ��">XSLT &lt;template&gt;</a></li>
<li><a href="xsl_value_of.asp" title="xsl:value-ofԪ��">XSLT &lt;xsl:value-of&gt;</a></li>
<li><a href="xsl_for_each.asp" title="xsl:for-eachԪ��">XSLT &lt;for-each&gt;</a></li>
<li><a href="xsl_sort.asp" title="xsl:sortԪ��">XSLT &lt;sort&gt;</a></li>
<li><a href="xsl_if.asp" title="xsl:ifԪ��">XSLT &lt;if&gt;</a></li>
<li><a href="xsl_choose.asp" title="xsl:chooseԪ��">XSLT &lt;choose&gt;</a></li>
<li><a href="xsl_apply_templates.asp" title="xsl:apply-templatesԪ��">XSLT apply</a></li>
</ul>

<h2>XSLT �߼�</h2>
<ul>
<li><a href="xsl_client.asp" title="�ڿͻ��˵�XSLT">XSLT �ڿͻ���</a></li>
<li><a href="xsl_server.asp" title="�ڷ������ϵ�XSLT">XSLT �ڷ�������</a></li>
<li><a href="xsl_editxml.asp" title="�༭XML">XSLT �༭XML</a></li>
<li><a href="xsl_editors.asp" title="XSLT�༭��">XSLT �༭��</a></li>
<li><a href="xsl_summary.asp" title="XSLT�̳��ܽ�">XSLT �ܽ�</a></li>
</ul>

<h2>�ο��ֲ�</h2>
<ul>
<li><a href="xsl_w3celementref.asp" title="XSLTԪ��">XSLT Ԫ��</a></li>
<li><a href="xsl_functions.asp" title="XSLT����">XSLT ����</a></li>
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

<h1>XSLT &lt;xsl:value-of&gt; Ԫ��</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="xsl_templates.asp">Previous Page</a></li>

<li class="next"><a href="xsl_for_each.asp">Next Page</a></li>
</ul>

</div>

<div id="intro">
<p><strong>&lt;xsl:value-of&gt; Ԫ��������ȡĳ��ѡ���ڵ��ֵ��</strong></p>
</div>

<div>
<h2>&lt;xsl:value-of&gt; Ԫ��</h2>
<p>&lt;xsl:value-of&gt; Ԫ��������ȡĳ��ѡ���ڵ��ֵ������ֵ���ӵ�ת����������У�</p>
<pre>&lt;?xml version=&quot;1.0&quot; encoding=&quot;ISO-8859-1&quot;?&gt;
&lt;xsl:stylesheet version=&quot;1.0&quot;
xmlns:xsl=&quot;http://www.w3.org/1999/XSL/Transform&quot;&gt;

&lt;xsl:template match=&quot;/&quot;&gt;
 &lt;html&gt;
 &lt;body&gt;
   &lt;h2&gt;My CD Collection&lt;/h2&gt;
   &lt;table border=&quot;1&quot;&gt;
     &lt;tr bgcolor=&quot;#9acd32&quot;&gt;
       &lt;th&gt;Title&lt;/th&gt;
       &lt;th&gt;Artist&lt;/th&gt;
     &lt;/tr&gt;
     &lt;tr&gt;
      &lt;td&gt;<code>&lt;xsl:value-of select=&quot;catalog/cd/title&quot;/&gt;</code>&lt;/td&gt;
      &lt;td&gt;<code>&lt;xsl:value-of select=&quot;catalog/cd/artist&quot;/&gt;</code>&lt;/td&gt;
     &lt;/tr&gt;
   &lt;/table&gt;
 &lt;/body&gt;
 &lt;/html&gt;
&lt;/xsl:template&gt;

&lt;/xsl:stylesheet&gt;</pre>

<p class="note"><span>ע�ͣ�</span><em>select</em> ���Ե�ֵ��һ�� XPath ����ʽ���˱���ʽ�Ĺ�����ʽ�����ڶ�λĳ���ļ�ϵͳ����������б�ܿ�ѡ����Ŀ¼��</p>

<h3>�����ת���������������</h3>
<img class="illustration" src="i/xsl_value_of_01.gif" />

<p><a href="cdcatalog.xml">�鿴�� XML �ļ�</a>��<a href="cdcatalog_ex2.xsl">�鿴�� XSL �ļ�</a>��<a href="cdcatalog_with_ex2.xml">���鿴���</a>��</p>
<p>������ӵĽ����һ��ȱ�ݣ�����һ�����ݴ� XML �ĵ�����������������</p>
<p>��������½��У��㽫ѧϰ���ʹ�� <em>&lt;xsl:for-each&gt;</em> Ԫ����ѭ������ XML Ԫ�أ�����ʾ���еļ�¼��</p>
</div>

<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="xsl_templates.asp">Previous Page</a></li>

<li class="next"><a href="xsl_for_each.asp">Next Page</a></li>
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
<h5 id="tools_reference"><a href="xsl_w3celementref.asp">XSLT �ο��ֲ�</a></h5>
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