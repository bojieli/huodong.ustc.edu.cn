
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

<title>XSL-FO ҳ��</title>
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

<h1>XSL-FO ҳ��</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="xslfo_flow.asp">Previous Page</a></li>

<li class="next"><a href="xslfo_blocks.asp">Next Page</a></li>
</ul>

</div>


<div id="intro">
<p><strong>XSL-FO ʹ����Ϊ &quot;Page Masters&quot; ��ҳ��ģ��������ҳ��Ĳ��֡�</strong></p>
</div>


<div>
<h2>XSL-FO ҳ��ģ��</h2>

<p>XSL-FO ʹ����Ϊ &quot;Page Masters&quot; ��ҳ��ģ��������ҳ��Ĳ��֡�ÿ��ģ�����ӵ��һ��Ψһ�����ƣ�</p>
<pre>&lt;fo:simple-page-master master-name=&quot;intro&quot;&gt;
  &lt;fo:region-body margin=&quot;5in&quot; /&gt;
&lt;/fo:simple-page-master&gt;

&lt;fo:simple-page-master master-name=&quot;left&quot;&gt;
  &lt;fo:region-body margin-left=&quot;2in&quot; margin-right=&quot;3in&quot; /&gt;
&lt;/fo:simple-page-master&gt;

&lt;fo:simple-page-master master-name=&quot;right&quot;&gt;
  &lt;fo:region-body margin-left=&quot;3in&quot; margin-right=&quot;2in&quot; /&gt;
&lt;/fo:simple-page-master&gt;</pre>
<p>������������У����� &lt;fo:simple-page-master&gt; Ԫ�أ�������������ͬ��ģ�塣ÿ��ģ�壨page-master�����в�ͬ�����ơ�</p>
<p>��һ��ģ����Ϊ &quot;intro&quot;��������Ϊ����ҳ���ģ��ʹ�á�</p>
<p>�ڶ����͵�����ģ����Ϊ &quot;left&quot; �� &quot;right&quot;�����ǿɱ�����ż��������ҳ���ҳ�档</p>
</div>


<div>
<h2>XSL-FO ҳ��ߴ�</h2>

<p>XSL-FO ʹ�����������������ҳ��ߴ磺</p>

<dl class="define">
<dt>page-width</dt>
<dd>����ҳ��Ŀ���</dd>
<dt>page-height</dt>
<dd>����ҳ��ĸ߶�</dd>
</dl>
</div>


<div>
<h2>XSL-FO ҳ��߾�</h2>

<p>XSL-FO ʹ����������Զ���ҳ��߾ࣺ</p>

<dl class="define">
<dt>margin-top</dt>
<dd>�����ϱ߾�</dd>
<dt>margin-bottom</dt>
<dd>�����±߾�</dd>
<dt>margin-left</dt>
<dd>������߾�</dd>
<dt>margin-right</dt>
<dd>�����ұ߾�</dd>
<dt>margin</dt>
<dd>�������бߵı߾�</dd>
</dl>
</div>


<div>
<h2>XSL-FO ҳ������Page Regions��</h2>

<p>XSL-FO ʹ�������Ԫ��������ҳ�������</p>

<dl class="define">
<dt>region-body</dt>
<dd>����������</dd>
<dt>region-before</dt>
<dd>���嶥���� (ҳü)</dd>
<dt>region-after</dt>
<dd>����ײ��� (ҳ��)</dd>
<dt>region-start</dt>
<dd>��������� (�����)</dd>
<dt>region-end</dt>
<dd>�����Ҳ��� (�Ҳ���)</dd>
</dl>
<p class="note"><span>ע�ͣ�</span>region-before��region-after��region-start �Լ� region-end ����������һ���֡�Ϊ�˱������������ı����ǵ���Щ�����������ı߾�����Ҫ�����������ĳߴ硣</p>

<h3>ͼʾ��</h3>
<img class="illustration" src="i/xslfo_pages_01.gif" />
</div>


<div>
<h2>XSL-FO ʵ��</h2>

<p>���Ǵ�ĳ�� XSL-FO �ĵ�����ȡ��һ��Ƭ�ϣ�</p>

<pre>&lt;fo:simple-page-master master-name=&quot;A4&quot;
 page-width=&quot;297mm&quot; page-height=&quot;210mm&quot;
 margin-top=&quot;1cm&quot;   margin-bottom=&quot;1cm&quot;
 margin-left=&quot;1cm&quot;  margin-right=&quot;1cm&quot;&gt;
  &lt;fo:region-body   margin=&quot;3cm&quot;/&gt;
  &lt;fo:region-before extent=&quot;2cm&quot;/&gt;
  &lt;fo:region-after  extent=&quot;2cm&quot;/&gt;
  &lt;fo:region-start  extent=&quot;2cm&quot;/&gt;
  &lt;fo:region-end    extent=&quot;2cm&quot;/&gt;
&lt;/fo:simple-page-master&gt;</pre>

<p>����Ĵ��붨��������Ϊ &quot;A4&quot; �� &quot;Simple Page Master Template&quot;��</p>
<p>ҳ��Ŀ����� 297 ���ף��߶��� 210 ���ס�</p>
<p>ҳ����ĸ��߾��Ϊ 1 ���ס�</p>
<p>����ı߾��� 3 ���ף��ĸ��߶��ǣ���</p>
<p>before��after��start �Լ� end ����Ϊ 2 ���ס�</p>
<p>����������е�����Ŀ��ȿ�ͨ��ҳ����ȼ�ȥ���ұ߾��Լ� region-body �ı߾�������ó���</p>
<p>297mm - (2 x 1cm) - (2 x 3cm) = 297mm - 20mm - 60mm = 217mm.</p>
<p class="note"><span>ע�ͣ�</span>region ��region-start �� region-end�� û�б��������������֮ǰ������ģ���Щ����region�����������ɲ��֡�</p>
</div>


<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="xslfo_flow.asp">Previous Page</a></li>

<li class="next"><a href="xslfo_blocks.asp">Next Page</a></li>
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