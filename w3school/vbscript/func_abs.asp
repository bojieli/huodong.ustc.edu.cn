
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

<title>VBScript Abs ����</title>
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
<h2>VBScript �̳�</h2>
<ul>
<li><a href="index.asp" title="VBScript �̳�">VB �̳�</a></li>
<li><a href="vbscript_intro.asp" title="VBScript���">VB ���</a></li>
<li><a href="vbscript_howto.asp" title="VBScript How to">VB How to</a></li>
<li><a href="vbscript_whereto.asp" title="VBScript Where to">VB Where to</a></li>
<li><a href="vbscript_variables.asp" title="VBScript����">VB ����</a></li>
<li><a href="vbscript_procedures.asp" title="VBScript����">VB ����</a></li>
<li><a href="vbscript_conditionals.asp" title="VBScript�������">VB �������</a></li>
<li><a href="vbscript_looping.asp" title="VBScriptѭ�����">VB ѭ�����</a></li>
<li><a href="vbscript_summary.asp" title="���Ѿ�ѧϰ��VBScript����һ���أ�">VB �ܽ�</a></li>
</ul>

<h2>ʵ��</h2>
<ul>
<li><a href="../example/vbst_examples.asp" title="VBScriptʵ��">VB ʵ��</a></li>
</ul>

<h2>�ο��ֲ�</h2>
<ul>
<li><a href="vbscript_ref_functions.asp" title="VBScript����">VB ����</a></li>
<li><a href="vbscript_ref_keywords.asp" title="VBScript�ؼ���">VB �ؼ���</a></li>
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
<h1>VBScript Abs ����</h1>

<div class="backtoreference">
<p><a href="vbscript_ref_functions.asp" title="VBScript ����">VBScript �����ο��ֲ�</a></p>
</div>

<div>
<h2>������÷�</h2>
<p>Abs �����ɷ���ָ�������ֵľ���ֵ��</p>
<p class="note"><span>ע�ͣ�</span>��� number ��������Null���򷵻� Null ��</p>
<p class="note"><span>ע�ͣ�</span>��� number ������һ��δ��ʼ���ı������򷵻� 0 ��</p>

<h3>�﷨</h3>
<pre>Abs(number)</pre>

<table class="dataintable"> 
  <tr>
    <th>����</th>
    <th>����</th>
  </tr>  
  <tr>
    <td>number</td>
    <td>����ġ�һ����ֵ����ʽ��</td>
  </tr>
</table>
</div>

<div>
<h2>ʵ��</h2>
<h3>���� 1</h3>
<pre>document.write(Abs(1))
document.write(Abs(-1))</pre>
<p>�����</p>
<pre>1
1</pre>

<h3>���� 2</h3>
<pre>document.write(Abs(48.4))
document.write(Abs(-48.4))</pre>
<p>�����</p>
<pre>48.4
48.4</pre>
</div>

<div class="backtoreference">
<p><a href="vbscript_ref_functions.asp" title="VBScript ����">VBScript �����ο��ֲ�</a></p>
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
<h5 id="tools_reference"><a href="vbscript_ref_functions.asp">VBScript �ο��ֲ�</a></h5>
<h5 id="tools_example"><a href="../example/vbst_examples.asp">VBScript ʵ��</a></h5>
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