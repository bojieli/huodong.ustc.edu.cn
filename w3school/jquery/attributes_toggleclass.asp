
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

<title>jQuery ���Բ��� - toggleClass() ����</title>
</head>

<body class="browserscripting">
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
<h2>jQuery �̳�</h2>
<ul>
<li><a href="index.asp" title="jQuery �̳�">jQuery �̳�</a></li>
<li><a href="jquery_intro.asp" title="jQuery ���">jQuery ���</a></li>
<li><a href="jquery_syntax.asp" title="jQuery �﷨">jQuery �﷨</a></li>
<li><a href="jquery_selectors.asp" title="jQuery ѡ����">jQuery ѡ����</a></li>
<li><a href="jquery_events.asp" title="jQuery �¼�">jQuery �¼�</a></li>
<li><a href="jquery_effects.asp" title="jQuery Ч��">jQuery Ч��</a></li>
<li><a href="jquery_callback.asp" title="jQuery Callback">jQuery Callback</a></li>
<li><a href="jquery_html.asp" title="jQuery HTML">jQuery HTML</a></li>
<li><a href="jquery_css.asp" title="jQuery CSS">jQuery CSS</a></li>
<li><a href="jquery_ajax.asp" title="jQuery AJAX ����">jQuery AJAX</a></li>
<li><a href="jquery_examples.asp" title="jQuery ʵ��">jQuery ʵ��</a></li>
</ul>

<h2>jQuery �ο��ֲ�</h2>
<ul>
<li><a href="jquery_reference.asp" title="jQuery �ο��ֲ�">jQuery �ο��ֲ�</a></li>
<li><a href="jquery_ref_selectors.asp" title="jQuery �ο��ֲ� - ѡ����">jQuery ѡ����</a></li>
<li><a href="jquery_ref_events.asp" title="jQuery �ο��ֲ� - �¼�">jQuery �¼�</a></li>
<li><a href="jquery_ref_effects.asp" title="jQuery �ο��ֲ� - Ч��">jQuery Ч��</a></li>
<li><a href="jquery_ref_manipulation.asp" title="jQuery �ο��ֲ� - �ĵ�����">jQuery �ĵ�����</a></li>
<li><a href="jquery_ref_attributes.asp" title="jQuery �ο��ֲ� - ����">jQuery ����</a></li>
<li><a href="jquery_ref_css.asp" title="jQuery �ο��ֲ� - CSS">jQuery CSS</a></li>
<li><a href="jquery_ref_ajax.asp" title="jQuery Ajax �ο��ֲ�">jQuery Ajax</a></li>
<li><a href="jquery_ref_traversing.asp" title="jQuery ���� �ο��ֲ�">jQuery ����</a></li>
<li><a href="jquery_ref_data.asp" title="jQuery �ο��ֲ� - ����">jQuery ����</a></li>
<li><a href="jquery_ref_dom_element_methods.asp" title="jQuery �ο��ֲ� - DOM Ԫ�ط���">jQuery DOM Ԫ��</a></li>
<li><a href="jquery_ref_core.asp" title="jQuery �ο��ֲ� - ����">jQuery ����</a></li>
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

<h1>jQuery ���Բ��� - toggleClass() ����</h1>

<div class="backtoreference">
<p><a href="jquery_ref_attributes.asp" title="jQuery �ο��ֲ� - ���Բ���">jQuery ���Բ����ο��ֲ�</a></p>
</div>


<div>
<h2>ʵ��</h2>

<p>�����ú��Ƴ����� &lt;p&gt; Ԫ�ص� &quot;main&quot; ������л���</p>

<pre>
$(&quot;button&quot;).click(function(){
  $(&quot;p&quot;).<code>toggleClass(&quot;main&quot;)</code>;
});
</pre>

<p><a href="../tiy/t.asp@f=jquery_attributes_toggleclass">������һ��</a></p>
</div>


<div>
<h2>������÷�</h2>

<p>toggleClass() �����û��Ƴ���ѡԪ�ص�һ������������л���</p>

<p>�÷������ÿ��Ԫ����ָ�����ࡣ����������������࣬�����������ɾ��֮���������ν���л�Ч����</p>

<p>������ͨ��ʹ�� &quot;switch&quot; ���������ܹ��涨ֻɾ����ֻ�����ࡣ</p>

<h3>�﷨</h3>

<pre>$(<i>selector</i>).toggleClass(<i>class</i>,<i>switch</i>)</pre>

<table class="dataintable">
<tr>
<th style="width:30%;">����</th>
<th>����</th>
</tr>

<tr>
<td><i>class</i></td>
<td>
	<p>���衣�涨���ӻ��Ƴ� class ��ָ��Ԫ�ء�</p>
	<p>����涨���� class����ʹ�ÿո����ָ�������</p>
</td>
</tr>

<tr>
<td><i>switch</i></td>
<td>��ѡ������ֵ���涨�Ƿ����ӻ��Ƴ� class��</td>
</tr>
</table>
</div>


<div>
<h2>ʹ�ú������л���</h2>

<pre>$(<i>selector</i>).toggleClass(<i>function(index,class)</i>,<i>switch</i>)</pre>

<p><a href="../tiy/t.asp@f=jquery_attributes_toggleclass_func">������һ��</a></p>

<table class="dataintable">
<tr>
<th style="width:30%;">����</th>
<th>����</th>
</tr>

<tr>
<td><i>function(index,class)</i></td>
<td>
	<p>���衣�涨������Ҫ���ӻ�ɾ����һ�����������ĺ�����</p>
	<ul class="listintable">
	<li>index - ��ѡ������ѡ������ index λ�á�</li>
	<li>class - ��ѡ������ѡ�����ĵ�ǰ���ࡣ</li>
	</ul>
</td>
</tr>

<tr>
<td><i>switch</i></td>
<td>��ѡ������ֵ���涨�Ƿ�����(true)���Ƴ�(false)�ࡣ</td>
</tr>
</table>
</div>


<div class="backtoreference">
<p><a href="jquery_ref_attributes.asp" title="jQuery �ο��ֲ� - ���Բ���">jQuery ���Բ����ο��ֲ�</a></p>
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
<h5 id="tools_reference"><a href="jquery_reference.asp" title="jQuery �ο��ֲ�">jQuery �ο��ֲ�</a></h5>
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