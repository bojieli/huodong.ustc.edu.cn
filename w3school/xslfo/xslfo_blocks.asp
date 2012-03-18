
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

<title>XSL-FO Blocks���飩</title>
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
<h2>XSLFO �̳�</h2>
<ul>
<li><a href="index.asp" title="XSLFO�̳���ҳ">XSLFO ��ҳ</a></li>
<li><a href="xslfo_intro.asp" title="XSL-FO���">XSLFO ���</a></li>
<li><a href="xslfo_documents.asp" title="XSL-FO�ĵ�">XSLFO �ĵ�</a></li>
<li><a href="xslfo_areas.asp" title="XSL-FO Areas">XSLFO ����</a></li>
<li><a href="xslfo_output.asp" title="XSLFO Output">XSLFO ���</a></li>
<li><a href="xslfo_flow.asp" title="XSLFO Flow">XSLFO ��</a></li>
<li><a href="xslfo_pages.asp" title="XSLFOҳ��">XSLFO ҳ��</a></li>
<li><a href="xslfo_blocks.asp" title="XSL-FO Blocks">XSLFO ��</a></li>
<li><a href="xslfo_lists.asp" title="XSL-FO�б�">XSLFO �б�</a></li>
<li><a href="xslfo_tables.asp" title="XSLFO����">XSLFO ����</a></li>
<li><a href="xslfo_xslt.asp" title="XSL-FO��XSLT�Ĺ�ϵ">XSLFO �� XSLT</a></li>
</ul>

<h2>XSLFO �ο��ֲ�</h2>
<ul>
<li><a href="xslfo_reference.asp" title="XSL-FO����ο��ֲ�">XSLFO ����</a></li>
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

<h1>XSL-FO Blocks���飩</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="xslfo_pages.asp">Previous Page</a></li>

<li class="next"><a href="xslfo_lists.asp">Next Page</a></li>
</ul>

</div>

<div id="intro">
<p><strong>XSL-FO �����λ�ڿ������С�</strong></p>
</div>

<div>
<h2>XSL-FO ҳ�桢���Լ���</h2>
<p>���ݡ��顱�ᡰ�����롰ҳ�桱�У�Ȼ�������ý�顣</p>
<p>XSL-FO ���ͨ����Ƕ���� &lt;fo:block&gt; Ԫ���У�&lt;fo:block&gt; Ƕ���� &lt;fo:flow&gt; Ԫ���У�&lt;fo:flow&gt; Ƕ���� &lt;fo:page-sequence&gt; Ԫ���У�</p>

<pre>&lt;fo:page-sequence&gt;
  &lt;fo:flow flow-name=&quot;xsl-region-body&quot;&gt;
    &lt;fo:block&gt;
      &lt;!-- Output goes here --&gt;
    &lt;/fo:block&gt;
  &lt;/fo:flow&gt;
&lt;/fo:page-sequence&gt;</pre>
</div>

<div>
<h2>�����������</h2>
<p>����λ�ھ��ο��е�������У�</p>
<pre>&lt;fo:block border-width=&quot;1mm&quot;&gt;
����������Χ��һ��һ���׵ı߿�
&lt;/fo:block&gt;</pre>
<p>���ڿ������Ǿ��ο����Կɹ������๫�����������ԣ�</p>
<ul>
<li>space before �� space after</li>
<li>margin</li>
<li>border</li>
<li>padding</li>
<li>space before</li>
</ul>

<h3>ͼʾ��</h3>
<img class="illustration" src="i/xslfo_blocks_01.gif" />
<p> <em>space before</em> �� <em>space after</em> �ǿ����֮����ָ����õĿհס�</p>
<p><em>margin</em> �ǿ����Ŀհ�����</p>
<p><em>border</em> �������ⲿ��Ե�ľ��Ρ����ĸ��߾����в�ͬ�Ŀ��ȡ���Ҳ�ɱ����Ϊ��ͬ����ɫ�ͱ���ͼ��</p>
<p><em>padding</em> ��λ������������߿�֮�������</p>
<p><em>����</em>����ɰ���ʵ�ʵ����ݣ������ı���ͼƬ��ͼ�εȵȡ�</p>
</div>

<div>
<h2>��߾�</h2>
<ul>
<li>margin</li>
<li>margin-top</li>
<li>margin-bottom</li>
<li>margin-left</li>
<li>margin-right</li>
</ul>
</div>

<div>
<h2>��߿�</h2>
<h3>�߿���ʽ����:</h3>
<ul>
<li>border-style</li>
<li>border-before-style</li>
<li>border-after-style</li>
<li>border-start-style</li>
<li>border-end-style</li>
<li>border-top-style ((��ͬ�� border-before)</li>
<li>border-bottom-style (��ͬ�� border-after)</li>
<li>border-left-style (��ͬ�� border-start)</li>
<li>border-right-style (��ͬ�� border-end)</li>
</ul>

<h3>�߿���ɫ����:</h3>
<ul>
<li>border-color</li>
<li>border-before-color</li>
<li>border-after-color</li>
<li>border-start-color</li>
<li>border-end-color</li>
<li>border-top-color (��ͬ�� border-before)</li>
<li>border-bottom-color (��ͬ�� border-after)</li>
<li>border-left-color (��ͬ�� border-start)</li>
<li>border-right-color (��ͬ�� border-end)</li>
</ul>

<h3>�߿��������:</h3>
<ul>
<li>border-width</li>
<li>border-before-width</li>
<li>border-after-width</li>
<li>border-start-width</li>
<li>border-end-width</li>
<li>border-top-width (��ͬ�� border-before)</li>
<li>border-bottom-width (��ͬ�� border-after)</li>
<li>border-left-width (��ͬ�� border-start)</li>
<li>border-right-width (��ͬ�� border-end)</li>
</ul>
</div>

<div>
<h2>�����</h2>
<ul>
<li>padding</li>
<li>padding-before</li>
<li>padding-after</li>
<li>padding-start</li>
<li>padding-end</li>
<li>padding-top (��ͬ�� padding-before)</li>
<li>padding-bottom (��ͬ�� padding-after)</li>
<li>padding-left (��ͬ�� padding-start)</li>
<li>padding-right (��ͬ�� padding-end)</li>
</ul>
</div>

<div>
<h2>�鱳��</h2>
<ul>
<li>background-color</li>
<li>background-image</li>
<li>background-repeat</li>
<li>background-attachment (scroll ���� fixed)</li>
</ul>
</div>

<div>
<h2>����ʽ���ԣ�</h2>
<p>���ǿɱ�������ʽ����������У�</p>
<pre>&lt;fo:block
  font-size=&quot;12pt&quot;
  font-family=&quot;sans-serif&quot;&gt;
This block of output will be written in a 12pt sans-serif font.
&lt;/fo:block&gt;</pre>

<h3>��������:</h3>
<ul>
<li>font-family</li>
<li>font-weight</li>
<li>font-style</li>
<li>font-size</li>
<li>font-variant</li>
</ul>

<h3>�ı�����:</h3>
<ul>
<li>text-align</li>
<li>text-align-last</li>
<li>text-indent</li>
<li>start-indent</li>
<li>end-indent</li>
<li>wrap-option (�����Զ����У�word wrap)</li>
<li>break-before (�����ҳ����page breaks)</li>
<li>break-after (�����ҳ����page breaks)</li>
<li>reference-orientation (���� 90&quot; �ڵ�������ת)</li>
</ul>
</div>

<div>
<h2>ʵ��</h2>
<pre>&lt;fo:block
    font-size=&quot;14pt&quot; font-family=&quot;verdana&quot; color=&quot;red&quot;
    space-before=&quot;5mm&quot; space-after=&quot;5mm&quot;&gt;
W3School
&lt;/fo:block&gt;

&lt;fo:block
    text-indent=&quot;5mm&quot;
    font-family=&quot;verdana&quot; font-size=&quot;12pt&quot;
    space-before=&quot;5mm&quot; space-after=&quot;5mm&quot;&gt;
At W3School you will find all the Web-building tutorials you
need, from basic HTML and XHTML to advanced XML, XSL, Multimedia
and WAP.
&lt;/fo:block&gt;</pre>

<h3>�����</h3>
<img class="illustration" src="i/xslfo_blocks_02.gif" />
 
<p>�뿴��������ӣ����Ҫ����һ��ӵ���������Ͷ�����ĵ�����ô������Ҫ�ǳ���Ĵ��롣</p>
<p>ͨ����XSL-FO �ĵ����������Ǹղ������������Ը�ʽ����Ϣ�����ݽ�����ϡ�</p>
<p>ͨ�� XSLT ��Щ�����������ǾͿ��԰Ѹ�ʽ����Ϣ����ģ�壬Ȼ���д�������������ݡ�</p>
<p>�����ڱ��̳̺�����½�ѧϰ�����ʹ�� XSLT ģ������� XSL-FO��</p>
</div>

<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="xslfo_pages.asp">Previous Page</a></li>

<li class="next"><a href="xslfo_lists.asp">Next Page</a></li>
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
<h5 id="tools_reference"><a href="xslfo_reference.asp">XSL-FO �ο��ֲ�</a></h5>
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