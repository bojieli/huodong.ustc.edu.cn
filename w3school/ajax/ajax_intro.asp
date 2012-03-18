
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

<title>AJAX ���</title>
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
<h2>AJAX ����</h2>
<ul>
<li><a href="index.asp" title="AJAX �̳�">AJAX �̳�</a></li>
<li><a href="ajax_intro.asp" title="AJAX ���">AJAX ���</a></li>
<li><a href="ajax_example.asp" title="AJAX ʵ��">AJAX ʵ��</a></li>
</ul>

<h2>AJAX XHR</h2>
<ul>
<li><a href="ajax_xmlhttprequest_create.asp" title="AJAX - ���� XMLHttpRequest ����">XHR ��������</a></li>
<li><a href="ajax_xmlhttprequest_send.asp" title="AJAX - ���������������">XHR ����</a></li>
<li><a href="ajax_xmlhttprequest_response.asp" title="AJAX - ��������Ӧ">XHR ��Ӧ</a></li>
<li><a href="ajax_xmlhttprequest_onreadystatechange.asp" title="AJAX - onreadystatechange �¼�">XHR readyState</a></li>
</ul>

<h2>AJAX �߼�</h2>
<ul>
<li><a href="ajax_asp_php.asp" title="AJAX ASP/PHP ʵ��">AJAX ASP/PHP</a></li>
<li><a href="ajax_database.asp" title="AJAX ���ݿ�ʵ��">AJAX ���ݿ�</a></li>
<li><a href="ajax_xmlfile.asp" title="AJAX XML ʵ��">AJAX XML �ļ�</a></li>
</ul>

<h2>AJAX ʵ��</h2>
<ul>
<li><a href="../example/ajax_examples.asp" title="AJAX ʵ��">AJAX ʵ��</a></li>
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

<h1>AJAX ���</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="index.asp">Previous Page</a></li>

<li class="next"><a href="ajax_example.asp">Next Page</a></li>
</ul>

</div>

<div id="intro">
<p><strong>AJAX ��һ�����������¼���������ҳ������£��ܹ����²�����ҳ�ļ�����</strong></p>
</div>


<div>
<h2>��Ӧ���߱��Ļ���֪ʶ</h2>

<p>�ڼ���ѧϰ֮ǰ������Ҫ�������֪ʶ�л������˽⣺</p>

<ul>
<li>HTML / XHTML</li>
<li>CSS</li>
<li>JavaScript / DOM</li>
</ul>

<p>�����ϣ������ѧϰ��Щ��Ŀ���������ǵ�<a href="../index.html" title="W3School ���߽̳�">��ҳ</a>������Щ�̡̳�</p>
</div>


<div>
<h2>ʲô�� AJAX ��</h2>

<p>AJAX = �첽 JavaScript �� XML��</p>

<p>AJAX ��һ�����ڴ������ٶ�̬��ҳ�ļ�����</p>

<p>ͨ���ں�̨������������������ݽ�����AJAX ����ʹ��ҳʵ���첽���¡�����ζ�ſ����ڲ����¼���������ҳ������£�����ҳ��ĳ���ֽ��и��¡�</p>

<p>��ͳ����ҳ����ʹ�� AJAX�������Ҫ�������ݣ���������������ҳ�档</p>

<p>�кܶ�ʹ�� AJAX ��Ӧ�ó�����������΢����Google ��ͼ���������ȵȡ�</p>
</div>


<div>
<h2>Google Suggest</h2>

<p>�� 2005 �꣬Google ͨ���� Google Suggest ʹ AJAX �������������</p>

<p>Google Suggest ʹ�� AJAX �������̬�Լ�ǿ�� web ���棺�����ڹȸ������������ؼ���ʱ��JavaScript �����Щ�ַ����͵���������Ȼ��������᷵��һ������������б�</p>
</div>


<div>
<h2>����Ϳ�ʼʹ�� AJAX</h2>

<p>AJAX �������еı�׼����Щ��׼�ѱ������������ʹ�ö��ꡣ</p>

<p>���Ķ���һ�£����� AJAX ����ι����ģ�</p>
</div>


<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="index.asp">Previous Page</a></li>

<li class="next"><a href="ajax_example.asp">Next Page</a></li>
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
<p>��Ȩ���У�����һ��Ȩ����δ��������ɣ�����ת�ء�W3School �������İ���������ݽ������ԣ����κη������⼰���ղ��е��κ����Ρ�<a href="http://www.yktz.net/" title="�Ϻ�Ӯ��Ͷ�����޹�˾">�Ϻ�Ӯ��Ͷ�ʹ�˾</a>��</p>
</div>

</div>
</body>
</html>