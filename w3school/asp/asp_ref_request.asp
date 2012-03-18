
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="Content-Language" content="zh-cn" />

<meta name="robots" content="all" />
<meta name="keywords" content="ASP Request Object" />
<meta name="description" content="Request��������ã���������ӣ���صļ��������Լ�������" />

<meta name="author" content="w3school.com.cn" />
<meta name="Copyright" content="Copyright W3school.com.cn All Rights Reserved." />
<meta name="MSSmartTagsPreventParsing" content="true" />
<meta http-equiv="imagetoolbar" content="false" />

<link rel="stylesheet" type="text/css" href="../c3.css" />

<title>ASP Request ����</title>
</head>

<body class="serverscripting">
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
<h2>ASP �̳�</h2>
<ul>
<li><a href="index.asp" title="ASP�̳���ҳ">ASP ��ҳ</a></li>
<li><a href="asp_intro.asp" title="ASP ���">ASP ���</a></li>
<li><a href="asp_install.asp" title="��ΰ�װASP�����л���">ASP ��װ</a></li>
<li><a href="asp_syntax.asp" title="ASP �﷨">ASP �﷨</a></li>
<li><a href="asp_variables.asp" title="ASP ����">ASP ����</a></li>
<li><a href="asp_procedures.asp" title="ASP�ӳ���">ASP ����</a></li>
<li><a href="asp_inputforms.asp" title="ASP ����">ASP ����</a></li>
<li><a href="asp_cookies.asp" title="ASP Cookies">ASP Cookies</a></li>
<li><a href="asp_sessions.asp" title="ASP Session">ASP Session</a></li>
<li><a href="asp_applications.asp" title="ASP Application">ASP Application</a></li>
<li><a href="asp_incfiles.asp" title="ASP #include">ASP #include</a></li>
<li><a href="asp_globalasa.asp" title="ASP Global.asa">ASP Global.asa</a></li>
<li><a href="asp_send_email.asp" title="ASP e-mail">ASP e-mail</a></li>
</ul>

<h2>ASP ����</h2>
<ul class="small">
<li><a href="asp_ref_response.asp" title="ASP Response">ASP Response</a></li>
<li><a href="asp_ref_request.asp" title="ASP Request">ASP Request</a></li>
<li><a href="asp_ref_application.asp" title="ASP Application">ASP Application</a></li>
<li><a href="asp_ref_session.asp" title="ASP Session">ASP Session</a></li>
<li><a href="asp_ref_server.asp" title="ASP Server">ASP Server</a></li>
<li><a href="asp_ref_error.asp" title="ASP Error">ASP Error</a></li>
<li class="list_apart"><a href="asp_ref_filesystem.asp" title="ASP FileSystem">ASP FileSystem</a></li>
<li><a href="asp_ref_textstream.asp" title="ASP TextStream">ASP TextStream</a></li>
<li><a href="asp_ref_drive.asp" title="ASP Drive">ASP Drive</a></li>
<li><a href="asp_ref_file.asp" title="ASP File">ASP File</a></li>
<li><a href="asp_ref_folder.asp" title="ASP Folder">ASP Folder</a></li>
<li><a href="asp_ref_dictionary.asp" title="ASP Dictionary">ASP Dictionary</a></li>
<li><a href="asp_ado.asp" title="ASP ADO">ASP ADO</a></li>
</ul>

<h2>ASP ���</h2>
<ul class="small">
<li><a href="asp_adrotator.asp" title="ASP AdRotator">ASP AdRotator</a></li>
<li><a href="asp_browser.asp" title="ASP BrowserCap">ASP BrowserCap</a></li>
<li><a href="asp_contentlinking.asp" title="ASP Content Linking">ASP Content Linking</a></li>
<li><a href="asp_contentrotator.asp" title="ASP Content Rotator">ASP Content Rotator</a></li>
</ul>

<h2>ASP �̳��ܽ�</h2>
<ul>
<li><a href="asp_quickref.asp" title="ASP ���ٲο�">ASP ���ٲο�</a></li>
<li><a href="asp_summary.asp" title="ASP �ܽ�">ASP �ܽ�</a></li>
</ul>

<h2>ʵ��/����</h2>
<ul>
<li><a href="../example/aspe_examples.asp" title="ASP ʵ��">ASP ʵ��</a></li>
<li><a href="asp_quiz.asp" title="ASP ����">ASP ����</a></li>
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

<h1>ASP Request ����</h1>

<div  id="tpn">
<ul class="prenext">

<li class="pre"><a href="asp_ref_response.asp">Previous Page</a></li>

<li class="next"><a href="asp_ref_application.asp">Next Page</a></li>
</ul>

</div>

<div id="intro">
<p><strong>ASP Request �������ڴ��û�����ȡ����Ϣ��</strong></p>
</div>

<div class="example">
<h2>ʵ��</h2>

<h3>QueryString ���� ʵ��</h3>
<dl>
<dt><a href="../tiy/s.asp@f=demo_aspe_simplequerystring">���û��������ʱ���Ͳ�ѯ��Ϣ</a></dt>
<dd>������ʾ�������������ҳ�淢��һЩ����Ĳ�ѯ��Ϣ������Ŀ��ҳ����ȡ����Щ��Ϣ���ڱ�������ͬһҳ�棩��</dd>

<dt><a href="../tiy/s.asp@f=demo_aspe_simplereqquery">�� QueryString ���ϵļ�Ӧ��</a></dt>
<dd>������ʾ <em>QueryString</em> ������δӱ���ȡ��ֵ���˱���ʹ�� GET �������������������͵���Ϣ���û���˵�ǿɼ��ģ��ڵ�ַ�У���GET ��������������������Ϣ��������</dd>

<dt><a href="../tiy/s.asp@f=demo_aspe_reqquery">���ʹ�ôӱ�����������Ϣ</a></dt>
<dd>������ʾ���ʹ�ôӱ���ȡ�ص�ֵ�����ǻ�ʹ�� <em>QueryString</em> ���ϡ��˱���ʹ�� GET ������</dd>

<dt><a href="../tiy/s.asp@f=demo_aspe_reqquery2">���Ա����ĸ�����Ϣ</a></dt>
<dd>������ʾ���������ֶΰ���������ͬ�����ƵĻ���<em>QueryString</em> �����ʲô���ݡ�����չʾ��ΰ���Щ��ͬ�����Ʒָ���������Ҳ��չʾ���ʹ�� <em>count</em> �ؼ������� &quot;name&quot; ���Խ��м������˱���ʹ�� GET ������</dd>
</dl>

<h3>Form ���� ʵ��</h3>
<dl>
<dt><a href="../tiy/s.asp@f=demo_aspe_simpleform1">һ�� Form ���ϵļ�Ӧ��</a></dt>
<dd>������ʾ <em>Form</em> ������δӱ���ȡ��ֵ���˱���ʹ�� POST ����������ζ�ŷ��͵���Ϣ���û���˵�ǲ��ɼ��ģ����Ҷ���������Ϣ����û�����ƣ��ɷ��ʹ�������Ϣ����</dd>

<dt><a href="../tiy/s.asp@f=demo_aspe_simpleform">���ʹ�����Ա�������Ϣ</a></dt>
<dd>������ʾ���ʹ�ôӱ���ȡ�ص���Ϣ������ʹ���� <em>Form</em> ���ϡ�����ʹ���� POST ������</dd>

<dt><a href="../tiy/s.asp@f=demo_aspe_form2">���Ա����ĸ�����Ϣ</a></dt>
<dd>������ʾ�������ɵ�������ʹ������ͬ�����ƣ�<em>Form</em> ���ϻ����ʲô��Ϣ������չʾ��ΰ���Щ��ͬ�����Ʒָ������Ҳ��չʾ���ʹ�� <em>count</em> �ؼ������� &quot;name&quot; ���Խ��м������˱���ʹ�� POST ������</dd>

<dt><a href="../tiy/s.asp@f=demo_aspe_radiob">���е�ѡ��ť�ı���</a></dt>
<dd>������ʾ���ʹ�� <em>Form</em> ����ͨ����ѡ��ť���û����н������˱���ʹ�� POST ������</dd>

<dt><a href="../tiy/s.asp@f=demo_aspe_checkboxes">���и�ѡ��ť�ı���</a></dt>
<dd>������ʾ���ʹ�� <em>Form</em> ����ͨ����ѡ��ť���û����н������˱���ʹ�� POST ������</dd>
</dl>

<h3>����ʵ��</h3>
<dl>
<dt><a href="../tiy/s.asp@f=demo_aspe_server">��ȡ�û���Ϣ</a></dt>
<dd>��β��������ߵ���������͡�IP ��ַ����Ϣ��</dd>

<dt><a href="../tiy/s.asp@f=demo_aspe_servervariables">��ȡ����������</a></dt>
<dd>������ʾ���ʹ�� <em>ServerVariables</em> ����ȡ�÷����ߵ���������͡�IP ��ַ����Ϣ��</dd>

<dt><a href="../tiy/s.asp@f=demo_aspe_cookies">���� welcome cookie</a></dt>
<dd>������ʾ���ʹ�� Cookies ���ϴ���һ����ӭ <em>cookie</em>��</dd>

<dt><a href="../tiy/s.asp@f=demo_aspe_totalbytes">̽���û����͵��ֽ�����</a></dt>
<dd>������ʾ���ʹ�� <em>TotalBytes</em> ������ȡ���û��� Request �����з��͵��ֽ�������</dd>
</dl>
</div>

<div>
<h2>Request ����</h2>
<p>������������������ҳ��ʱ�������Ϊ�ͱ���Ϊһ�� request�����󣩡�</p>
<p>ASP Request �������ڴ��û������ȡ��Ϣ�����ļ��ϡ����Ժͷ����������£�</p>

<h3>����</h3>
<table class="dataintable">
<tr>
<th style="width:25%">����</th>
<th>����</th>
</tr>

<tr>
<td>ClientCertificate</td>
<td>�����˴洢�ڿͻ�֤���е���ֵ��field values��</td>
</tr>

<tr>
<td><a href="coll_cookies_request.asp">Cookies</a></td>
<td>������ HTTP �����з��͵����� cookie ֵ</td>
</tr>

<tr>
<td><a href="coll_form.asp">Form</a></td>
<td>������ʹ�� post �����ɱ������͵����еı��������룩ֵ</td>
</tr>

<tr>
<td><a href="coll_querystring.asp">QueryString</a></td>
<td>������ HTTP ��ѯ�ַ��������еı���ֵ</td>
</tr>

<tr>
<td><a href="coll_servervariables.asp">ServerVariables</a></td>
<td>���������еķ���������ֵ</td>
</tr>
</table>

<h3>����</h3>
<table class="dataintable">
<tr>
<th style="width:25%">����</th>
<th>����</th>
</tr>

<tr>
<td><a href="prop_totalbytes.asp">TotalBytes</a></td>
<td>���������������пͻ��������͵��ֽ�����</td>
</tr>
</table>

<h3>����</h3>
<table class="dataintable">
<tr>
<th style="width:25%">����</th>
<th>����</th>
</tr>

<tr>
<td><a href="met_binaryread.asp">BinaryRead</a></td>
<td>ȡ����Ϊ post �����һ���ֶ��ӿͻ������������������ݣ���������ŵ�һ����ȫ������֮�С�</td>
</tr>
</table>
</div>

<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="asp_ref_response.asp">Previous Page</a></li>

<li class="next"><a href="asp_ref_application.asp">Next Page</a></li>
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
<h5 id="tools_reference"><a href="asp_ref.asp">ASP �ο��ֲ�</a></h5>
<h5 id="tools_example"><a href="../example/aspe_examples.asp">ASP ʵ��</a></h5>
<h5 id="tools_quiz"><a href="asp_quiz.asp">ASP ����</a></h5>
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