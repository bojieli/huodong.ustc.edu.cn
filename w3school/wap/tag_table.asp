
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

<title>WML &lt;table&gt; ��ǩ</title>
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
<h2>WAP �̳�</h2>
<ul>
<li><a href="index.asp" title="WAP �̳�">WAP �̳�</a></li>
<li><a href="wap_intro.asp" title="WAP���">WAP ���</a></li>
<li><a href="wap_basic.asp" title="WAP ����">WAP ����</a></li>
<li><a href="wml_format.asp" title="WML ��ʽ��">WML ��ʽ��</a></li>
<li><a href="wml_links.asp" title="WML ���Ӻ�ͼ��">WML ����</a></li>
<li><a href="wml_input.asp" title="WML ����">WML ����</a></li>
<li><a href="wml_tasks.asp" title="WML ����">WML ����</a></li>
<li><a href="wml_timer.asp" title="WML ��ʱ��">WML ��ʱ��</a></li>
<li><a href="wml_variables.asp" title="WML ����">WML ����</a></li>
<li><a href="wml_examples.asp" title="WML ʵ��">WML ʵ��</a></li>
<li><a href="wap_demo.asp" title="WAP ��ʾ">WAP ��ʾ</a></li>
<li><a href="wap_pages.asp" title="�������ƶ��绰���� W3School.com.cn">WAP W3School</a></li>
</ul>

<h2>�ο��ֲ�</h2>
<ul>
<li><a href="wml_reference.asp" title="WML �ο��ֲ�">WML �ο��ֲ�</a></li>
<li><a href="wml_entities.asp" title="WML ʵ��">WML ʵ��</a></li>
<li><a href="wml_dtd.asp" title="WML DTD">WML DTD</a></li>
</ul>

<h2>��Դ</h2>
<ul>
<li><a href="wap_forum.asp" title="WAP ��̳/OMA">WAP ��̳/OMA</a></li>
<li><a href="wap_software.asp" title="WAP ����">WAP ����</a></li>
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

<h1>WML &lt;table&gt; ��ǩ</h1>

<div class="backtoreference">
<p><a href="wml_reference.asp" title="WML �ο��ֲ�">WML �ο��ֲ�</a></p>
</div>

<div>
<h2>������÷�</h2>

<p>table ��ǩ�������</p>
<p class="note"><span>ע�ͣ�</span>&lt;table&gt; ��ǩ�� &lt;tr&gt; �� &lt;td&gt; һ��ʹ�ã���������������</p>
<p class="note"><span>ע�ͣ�</span>number �����Ǳ���ġ�ֵ 0 ������ʹ�á�</p>
<p class="note"><span>ע�ͣ�</span>WML ����û�б߿�</p>

<h3>�﷨</h3>
<pre>&lt;table columns=&quot;a number&quot;&gt;
..&lt;tr&gt;..
..&lt;td&gt;..
&lt;/table&gt;</pre>


<h3>����</h3>

<table class="dataintable">
<tr>
<th>����</th>
<th>ֵ</th>
<th>����</th>
</tr>

<tr>
<td>columns</td>
<td>number</td>
<td>���衣���ñ����е�������</td>
</tr>

<tr>
<td>align</td>
<td>
<ul>
<li>c</li>
<li>l</li>
<li>r</li>
</ul>
</td>
<td>�������е��ı����涨һϵ�еĶ���ֵ��ÿ����Ӧһ�С�</td>
</tr>

<tr>
<td>title</td>
<td>cdata</td>
<td>���ñ���ı��⡣</td>
</tr>

<tr>
<td>xml:lang</td>
<td>language_code</td>
<td>����Ԫ����ʹ�õ����ԡ�</td>
</tr>

<tr>
<td>class</td>
<td>cdata</td>
<td>Ϊ��Ԫ�����õ� class ������� class ���Դ�Сд���С�һ��Ԫ�ؿ����Ӷ�� class��claas �����еĶ�� class ��ͨ���ո���зָ���</td>
</tr>

<tr>
<td>id</td>
<td>id</td>
<td>Ϊ��Ԫ�����õ�Ψһ���ơ�</td>
</tr>
</table>

<h3>ʵ��</h3>

<pre>&lt;?xml version=&quot;1.0&quot;?&gt;
&lt;!DOCTYPE wml PUBLIC &quot;-//WAPFORUM//DTD WML 1.1//EN&quot;
&quot;http://www.wapforum.org/DTD/wml_1.1.xml&quot;&gt;

&lt;wml&gt;
&lt;card title=&quot;Table&quot;&gt;
&lt;p&gt;
 &lt;table columns=&quot;3&quot;&gt;
  &lt;tr&gt;
   &lt;td&gt;Cell 1&lt;/td&gt;
   &lt;td&gt;Cell 2&lt;/td&gt;
   &lt;td&gt;Cell 3&lt;/td&gt;
  &lt;/tr&gt;
 &lt;/table&gt;
&lt;/p&gt;
&lt;/card&gt;
&lt;/wml&gt;</pre>

</div>

<div class="backtoreference">
<p><a href="wml_reference.asp" title="WML �ο��ֲ�">WML �ο��ֲ�</a></p>
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
<h5 id="tools_reference"><a href="wml_reference.asp">WML �ο��ֲ�</a></h5>
<h5 id="tools_example"><a href="wap_demo.asp">WAP ��ʾ</a></h5>
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