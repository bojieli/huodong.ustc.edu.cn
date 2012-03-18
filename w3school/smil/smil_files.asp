
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

<title>SMIL �ļ�</title>
</head>

<body class="multimedia">
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
<h2>SMIL �̳�</h2>
<ul>
<li><a href="index.asp" title="SMIL �̳�">SMIL ��ҳ</a></li>
<li><a href="smil_intro.asp" title="SMIL ���">SMIL ���</a></li>
<li><a href="smil_files.asp" title="SMIL �ļ�">SMIL �ļ�</a></li>
<li><a href="smil_html.asp" title="SMIL In HTML">SMIL HTML</a></li>
<li><a href="smil_xhtml.asp" title="XHTML+SMIL">SMIL XHTML</a></li>
<li><a href="smil_timing.asp" title="SMIL Timing">SMIL Timing</a></li>
<li><a href="smil_seq.asp" title="SMIL Sequence">SMIL Sequence</a></li>
<li><a href="smil_parallel.asp" title="SMIL in Parallel">SMIL Parallel</a></li>
<li><a href="smil_transition.asp" title="SMIL Transition">SMIL Transition</a></li>
<li><a href="smil_media.asp" title="SMIL Media Ԫ��">SMIL Media</a></li>
<li><a href="smil_reference.asp" title="SMIL �ο��ֲ�">SMIL �ο�</a></li>
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

<h1>SMIL �ļ�</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="smil_intro.asp">Previous Page</a></li>

<li class="next"><a href="smil_html.asp">Next Page</a></li>
</ul>

</div>

<div id="intro">
<p><strong>SMIL �ļ���������ý����� (multimedia presentation)��</strong></p>
</div>

<div>
<h2>SMIL �ļ�</h2>

<p>SMIL �ļ�������������ý����������������Ϣ��</p>

<p>�洢 SMIL �ļ�����չ���� *.smil��</p>

<p>SMIL �ļ�������</p>
<ul>
<li>���ֵĲ��� (the layout of the presentation )</li>
<li>���ֵ�ʱ���� (The timeline of the presentation)</li>
<li>��ý��Ԫ�ص�Դ (The source of the multimedia elements )</li>
</ul>
</div>

<div>
<h2>SMIL ���</h2>

<p>���� SMIL ���� XML��������ǩ�Դ�Сд���С����е� SMIL ��Ƕ�������Сд��ĸ��</p>

<p>SMIL �ĵ������� &lt;smil&gt; ��ǩ��ʼ������ &lt;/smil&gt; ��ǩ���������ɰ���һ�� &lt;head&gt; Ԫ�أ��ұ������һ�� &lt;body&gt; Ԫ�ء�</p>

<p>&lt;head&gt; Ԫ�����ڴ洢�йس��ֲ��ֵ���Ϣ���Լ�������Ԫ��Ϣ��</p>

<p>&lt;body&gt; ����ý��Ԫ�ء�</p>

<pre>&lt;smil&gt;
&lt;body&gt;
  &lt;seq repeatCount=&quot;indefinite&quot;&gt;
    &lt;img src=&quot;image1.jpg&quot; dur=&quot;3s&quot; /&gt;
    &lt;img src=&quot;image2.jpg&quot; dur=&quot;3s&quot; /&gt;
  &lt;/seq&gt;
&lt;/body&gt;
&lt;/smil&gt;</pre>
</div>

<div>
<h2>��β��� SMIL �ļ���</h2>

<p>���貥�� SMIL ���֣�����Ҫһ�� SMIL �����������������������ҵ���ͬ�� SMIL ��������</p>

<ul>
<li><a href="http://www.realnetworks.com/" title="RealNetworks_com">RealNetworks</a> �� <em>RealOne ƽ̨</em>�ṩ�˶� SMIL 2.0 �ĳ��֧��</li>
<li><a href="http://www.oratrix.com/" title="GRiNS for SMIL Homepage - Oratrix Development">Oratrix</a> �� <em>GRiNS for SMIL-2.0</em> �ṩ��һ�� SMIL 2.0 ������</li>
<li><a href="http://www.inobject.com/" title="InterObject - Your Source For Fast, Reliable and Cost-Effective Software">InterObject</a> �� <em>SMIL ������</em>֧�� SMIL 2.0 �Ļ������</li>
</ul>
</div>

<div>
<h2>�� Internet Explorer �в��� SMIL ����</h2>

<p>ͨ�� Internet Explorer 5.5 ����µİ汾���ܹ��� SMIL Ԫ�ز��� HTML �ļ��С�</p>

<p>ͨ�����ַ�ʽ���κ� SMIL ���ֶ�����Ϊ��׼�� HTML �ļ��������������ϡ�</p>

<p><strong>���̵̳����ಿ�ֽ�ʹ�� Internet Explorer 5.5 ����ߵİ汾����ʾ��ͬ SMIL Ԫ�ص�ʹ�á�</strong></p>
</div>

<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="smil_intro.asp">Previous Page</a></li>

<li class="next"><a href="smil_html.asp">Next Page</a></li>
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
<h5 id="tools_reference"><a href="smil_reference.asp">SMIL �ο��ֲ�</a></h5>
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