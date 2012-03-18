
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

<title>jQuery �ο��ֲ� - Ajax</title>
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

<h1>jQuery �ο��ֲ� - Ajax</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="jquery_ref_css.asp">Previous Page</a></li>

<li class="next"><a href="jquery_ref_traversing.asp">Next Page</a></li>
</ul>

</div>


<div>
<h2>jQuery Ajax ��������</h2>

<p>jQuery ��ӵ�������� Ajax �����׼������еĺ����ͷ������������ڲ�ˢ�������������´ӷ������������ݡ�</p>

<table class="dataintable">
<tr>
<th>����</th>
<th>����</th>
</tr>

<tr>
<td><a href="ajax_ajax.asp" title="jQuery ajax - ajax() ����">jQuery.ajax()</a></td>
<td>ִ���첽 HTTP (Ajax) ����</td>
</tr>

<tr>
<td><a href="ajax_ajaxcomplete.asp" title="jQuery ajax - ajaxComplete() ����">.ajaxComplete()</a></td>
<td>�� Ajax �������ʱע��Ҫ���õĴ�����������һ�� Ajax �¼���</td>
</tr>

<tr>
<td><a href="ajax_ajaxerror.asp" title="jQuery ajax - ajaxError() ����">.ajaxError()</a></td>
<td>�� Ajax ��������ҳ��ִ���ʱע��Ҫ���õĴ�����������һ�� Ajax �¼���</td>
</tr>

<tr>
<td><a href="ajax_ajaxsend.asp" title="jQuery ajax - ajaxSend() ����">.ajaxSend()</a></td>
<td>�� Ajax ������֮ǰ��ʾһ����Ϣ��</td>
</tr>

<tr>
<td><a href="ajax_ajaxsetup.asp" title="jQuery ajax - ajaxSetup() ����">jQuery.ajaxSetup()</a></td>
<td>���ý����� Ajax �����Ĭ��ֵ��</td>
</tr>

<tr>
<td><a href="ajax_ajaxstart.asp" title="jQuery ajax - ajaxStart() ����">.ajaxStart()</a></td>
<td>���׸� Ajax ������ɿ�ʼʱע��Ҫ���õĴ�����������һ�� Ajax �¼���</td>
</tr>

<tr>
<td><a href="ajax_ajaxstop.asp" title="jQuery ajax - ajaxStop() ����">.ajaxStop()</a></td>
<td>������ Ajax �������ʱע��Ҫ���õĴ�����������һ�� Ajax �¼���</td>
</tr>

<tr>
<td><a href="ajax_ajaxsuccess.asp" title="jQuery ajax - ajaxSuccess() ����">.ajaxSuccess()</a></td>
<td>�� Ajax ����ɹ����ʱ��ʾһ����Ϣ��</td>
</tr>

<tr>
<td><a href="ajax_get.asp" title="jQuery ajax - get() ����">jQuery.get()</a></td>
<td>ʹ�� HTTP GET ����ӷ������������ݡ�</td>
</tr>

<tr>
<td><a href="ajax_getjson.asp" title="jQuery ajax - getJSON() ����">jQuery.getJSON()</a></td>
<td>ʹ�� HTTP GET ����ӷ��������� JSON �������ݡ�</td>
</tr>

<tr>
<td><a href="ajax_getscript.asp" title="jQuery ajax - getScript() ����">jQuery.getScript()</a></td>
<td>ʹ�� HTTP GET ����ӷ��������� JavaScript �ļ���Ȼ��ִ�и��ļ���</td>
</tr>

<tr>
<td><a href="ajax_load.asp" title="jQuery ajax - load() ����">.load()</a></td>
<td>�ӷ������������ݣ�Ȼ��ѷ��ص� HTML ����ƥ��Ԫ�ء�</td>
</tr>

<tr>
<td><a href="ajax_param.asp" title="jQuery ajax - param() ����">jQuery.param()</a></td>
<td>����������������л���ʾ���ʺ��� URL ��ѯ�ַ����� Ajax ������ʹ�á�</td>
</tr>

<tr>
<td><a href="ajax_post.asp" title="jQuery ajax - post() ����">jQuery.post()</a></td>
<td>ʹ�� HTTP POST ����ӷ������������ݡ�</td>
</tr>

<tr>
<td><a href="ajax_serialize.asp" title="jQuery ajax - serialize() ����">.serialize()</a></td>
<td>�������������л�Ϊ�ַ�����</td>
</tr>

<tr>
<td><a href="ajax_serializearray.asp" title="jQuery ajax - serializeArray() ����">.serializeArray()</a></td>
<td>���л�����Ԫ�أ����� JSON ���ݽṹ���ݡ�</td>
</tr>
</table>
</div>


<div>
<h2>����</h2>

<p>�̳̣�<a href="../ajax/index.asp">Ajax �̳�</a></p>
</div>


<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="jquery_ref_css.asp">Previous Page</a></li>

<li class="next"><a href="jquery_ref_traversing.asp">Next Page</a></li>
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