
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

<title>SMIL Transition</title>
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

<h1>SMIL Transition</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="smil_parallel.asp">Previous Page</a></li>

<li class="next"><a href="smil_media.asp">Next Page</a></li>
</ul>

</div>

<div id="intro">
<p><strong>Transition �ܹ�ΪԪ�����ɡ����뵭�����Լ�����������Ч����</strong></p>
</div>

<div>
<h2>Transition ���� SMIL 2.0</h2>

<p>Transition �� SMIL 2.0 �е������ԡ�Transition ������ SMIL 1.0 �淶����ɲ��֡�</p>

<p>Internet Explorer 6 ֧�ֻ��� SMIL 2.0 �淶�� Transition��Transition �� &lt;transitionfilter&gt; Ԫ��ʵ�֡�</p>
</div>

<div>
<h2>����</h2>

<p>&lt;transitionfilter&gt; Ԫ��ӵ������Ԫ�أ���õ��У�</p>

<table class="dataintable">
<tr>
<th>����</th>
<th>����</th>
<th>����</th>
</tr>

<tr>
<td>type</td>
<td>���� transition �˾������ͣ����� transition �˾��б���</td>
<td>type=&quot;clockWipe&quot;</td>
</tr>

<tr>
<td>begin</td>
<td>�����ʱ��ʼ transition</td>
<td>begin=&quot;0s&quot;</td>
</tr>

<tr>
<td>mode</td>
<td>���� transition ģʽ</td>
<td>mode=&quot;in&quot;</td>
</tr>

<tr>
<td>from</td>
<td>���� transition �Ŀ�ʼֵ</td>
<td>from=&quot;0.2&quot;</td>
</tr>

<tr>
<td>to</td>
<td>���� transition �Ľ���ֵ</td>
<td>to=&quot;0.8&quot;</td>
</tr>
</table>
</div>

<div>
<h2>Transition �˾�</h2>

<p>��ʹ������� transition �˾���</p>

<pre>fade, barnDoorWipe, barWipe, clockWipe, ellipseWipe, fanWipe, irisWipe, 
pushWipe, slideWipe, snakeWipe, spiralWipe, starWipe </pre>
</div>

<div>
<h2>ʵ������ʾ Transition</h2>

<pre>&lt;html xmlns:t=&quot;urn:schemas-microsoft-com:time&quot;&gt;
&lt;head&gt;
&lt;?import namespace=&quot;t&quot; implementation=&quot;#default#time2&quot;&gt;
&lt;style&gt;.t {behavior: url(#default#time2)}&lt;/style&gt;
&lt;/head&gt;
&lt;body&gt;

&lt;t:transitionfilter targetelement=&quot;keyb&quot;
type=&quot;clockWipe&quot;
begin=&quot;keyb.begin&quot; dur=&quot;2s&quot; /&gt;

&lt;img id=&quot;keyb&quot; class=&quot;t&quot; src=&quot;pic_keyb.jpg&quot; dur=&quot;4s&quot;
width=&quot;128&quot; height=&quot;107&quot; /&gt;

&lt;/body&gt;
&lt;/html&gt;</pre>

<p>������������У�ͼ����ʾ 4 ���ӡ�Transition �˾����� 2 ������ &quot;clockWipe&quot; �ķ�ʽ��ͼ����ʾ������</p>

<p class="tip"><span>��ʾ��</span>���������� Internet Explorer 6 ����ʾ������ӡ�</p>

<p><a href="../tiy/t.asp@f=smil_trans">TIY</a></p>
</div>

<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="smil_parallel.asp">Previous Page</a></li>

<li class="next"><a href="smil_media.asp">Next Page</a></li>
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