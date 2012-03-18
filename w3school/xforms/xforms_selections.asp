
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

<title>XForms ѡ��ؼ�</title>
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
<h2>XForms �̳�</h2>
<ul>
<li><a href="index.asp" title="XForms �̳�">XForms ��ҳ</a></li>
<li><a href="xforms_intro.asp" title="XForms ���">XForms ���</a></li>
<li><a href="xforms_model.asp" title="XForms ģ��">XForms ģ��</a></li>
<li><a href="xforms_namespace.asp" title="XForms �����ռ�">XForms �����ռ�</a></li>
<li><a href="xforms_example.asp" title="XForms ʵ��">XForms ʵ��</a></li>
<li><a href="xforms_xpath.asp" title="XForms �� XPath">XForms XPath</a></li>
<li><a href="xforms_input.asp" title="XForms ����ؼ�">XForms ����</a></li>
<li><a href="xforms_selections.asp" title="XForms ѡ��ؼ�">XForms ѡ��</a></li>
<li><a href="xforms_datatypes.asp" title="XForms ��������">XForms ��������</a></li>
<li><a href="xforms_properties.asp" title="XForms ����">XForms ����</a></li>
<li><a href="xforms_actions.asp" title="XForms ��Ϊ��Actions��">XForms ��Ϊ</a></li>
<li><a href="xforms_functions.asp" title="XForms ����">XForms ����</a></li>
</ul>

<h2>�ο��ֲ�</h2>
<ul>
<li><a href="xforms_typeref.asp" title="XForms �������Ͳο��ֲ�">XForms ��������</a></li>
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

<h1>XForms ѡ��ؼ�</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="xforms_input.asp">Previous Page</a></li>

<li class="next"><a href="xforms_datatypes.asp">Next Page</a></li>
</ul>

</div>

<div id="intro">
<p><strong>XForms �û�����ʹ�� XForms �ؼ���</strong></p>
</div>

<div>
<h2>Select1 �ؼ�</h2>
<p>select1 �ؼ����ڴ�һ����Ŀ�б���ѡȡһ����Ŀ��</p>
<pre>&lt;select1 ref=&quot;status&quot;&gt;
  &lt;label&gt;Status:&lt;/label&gt;
  &lt;item&gt;
    &lt;label&gt;Male&lt;/label&gt;
    &lt;value&gt;M&lt;/value&gt;
  &lt;/item&gt;
  &lt;item&gt;
    &lt;label&gt;Female&lt;/label&gt;
    &lt;value&gt;F&lt;/value&gt;
  &lt;/item&gt;
&lt;/select1&gt;</pre>
<p>������������У��û���������ֵ��ѡ������֮һ��Male ���� Female���洢�� XForms ʵ����XML �ĵ����е����ݽ��� M �� F��</p>
<p>Try it yourself</p>
</div>

<div>
<h2>Select �ؼ�</h2>
<p>Select �ؼ����ڴ�һ����Ŀ�б���ѡȡ��Ŀ��һ����������</p>
<pre>&lt;select ref=&quot;languages&quot;&gt;
  &lt;label&gt;Languages:&lt;/label&gt;
  &lt;item&gt;
    &lt;label&gt;English&lt;/label&gt;
    &lt;value&gt;E&lt;/value&gt;
  &lt;/item&gt;
  &lt;item&gt;
    &lt;label&gt;French&lt;/label&gt;
    &lt;value&gt;F&lt;/value&gt;
  &lt;/item&gt;
  &lt;item&gt;
    &lt;label&gt;Spanish&lt;/label&gt;
    &lt;value&gt;S&lt;/value&gt;
  &lt;/item&gt;
  &lt;item&gt;
    &lt;label&gt;German&lt;/label&gt;
    &lt;value&gt;G&lt;/value&gt;
  &lt;/item&gt;
&lt;/select&gt;</pre>
</div>

<div>
<h2>Range �ؼ�</h2>
<p>Range �ؼ����ڴ�ֵ��һ����Χ��ѡȡֵ��</p>
<pre>&lt;range ref=&quot;length&quot; start=&quot;0&quot; end=&quot;100&quot; step=&quot;5&quot;&gt;
  &lt;label&gt;Length:&lt;/label&gt;
&lt;/range&gt;</pre>
<p>������������У��û��ɰ��ղ��� 5 ѡ����� 0 �� 100 ֮���ĳ��ֵ��</p>
</div>

<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="xforms_input.asp">Previous Page</a></li>

<li class="next"><a href="xforms_datatypes.asp">Next Page</a></li>
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
<h5 id="tools_reference"><a href="xforms_typeref.asp">XForms �ο��ֲ�</a></h5>
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