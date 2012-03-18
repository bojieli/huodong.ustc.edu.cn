
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

<title>RDF ����</title>
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
<h2>RDF �̳�</h2>
<ul>
<li><a href="index.asp" title="RDF�̳���ҳ">RDF ��ҳ</a></li>
<li><a href="rdf_intro.asp" title="RDF���">RDF ���</a></li>
<li><a href="rdf_rules.asp" title="">RDF ����</a></li>
<li><a href="rdf_example.asp" title="">RDF ʵ��</a></li>
<li><a href="rdf_main.asp" title="">RDF Ԫ��</a></li>
<li><a href="rdf_containers.asp" title="">RDF ����</a></li>
<li><a href="rdf_collections.asp" title="">RDF ����</a></li>
<li><a href="rdf_schema.asp" title="">RDF Schema</a></li>
<li><a href="rdf_dublin.asp" title="">RDF �����ֺ���</a></li>
<li><a href="rdf_owl.asp" title="">RDF OWL</a></li>
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

<h1>RDF ����</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="rdf_intro.asp">Previous Page</a></li>

<li class="next"><a href="rdf_example.asp">Next Page</a></li>
</ul>

</div>

<div id="intro">
<p><strong>RDF ʹ�� Web ��ʶ�� (URIs) ����ʶ��Դ��</strong></p>
<p><strong>RDF ʹ�����Ժ�����ֵ��������Դ��</strong></p>
</div>

<div>
<h2>RDF ��Դ�����Ժ�����ֵ</h2>
<p>RDF ʹ�� Web ��ʶ������ʶ�����ͨ�����Ժ�����ֵ��������Դ��</p>

<p>����Դ�����Ժ�����ֵ�Ľ��ͣ�</p>
<ul>
<li><em>��Դ</em>�ǿ�ӵ�� URI ���κ�������� &quot;http://www.w3school.com.cn/rdf&quot;</li>
<li><em>����</em>��ӵ�����Ƶ���Դ������ &quot;author&quot; �� &quot;homepage&quot;</li>
<li><em>����ֵ</em>��ĳ�����Ե�ֵ������ &quot;David&quot; �� &quot;http://www.w3school.com.cn&quot; ����ע��һ������ֵ����������һ����Դ��</li>
</ul>

<p>����� RDF �ĵ���������Դ &quot;http://www.w3school.com.cn/rdf&quot;��</p>

<pre>&lt;?xml version=&quot;1.0&quot;?&gt;

&lt;RDF&gt;
  &lt;Description about=&quot;http://www.w3school.com.cn/RDF&quot;&gt;
    &lt;author&gt;David&lt;/author&gt;
    &lt;homepage&gt;http://www.w3school.com.cn&lt;/homepage&gt;
  &lt;/Description&gt;
&lt;/RDF&gt;</pre>

<p class="tip"><span>��ʾ��</span>������һ���򻯵����ӡ������ռ䱻�����ˡ�</p>
</div>

<div>
<h2>RDF ����</h2>

<p>��Դ�����Ժ�����ֵ����Ͽ��γ�һ��<em>����</em>������Ϊ������<em>����</em>��<em>ν��</em>��<em>����</em>����</p>

<p>�뿴һЩ�����ľ������ӣ����������⣺</p>

<p>������&quot;The author of http://www.w3school.com.cn/rdf is David.&quot;</p>
<ul>
<li>�����������ǣ�http://www.w3school.com.cn/rdf</li>
<li>ν���ǣ�author</li>
<li>�����ǣ�David</li>
</ul>

<p>������&quot;The homepage of http://www.w3school.com.cn/rdf is http://www.w3school.com.cn&quot;.</p>
<ul>
<li>�����������ǣ�http://www.w3school.com.cn/rdf</li>
<li>ν���ǣ�homepage</li>
<li>�����ǣ�http://www.w3school.com.cn</li>
</ul>
</div>

<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="rdf_intro.asp">Previous Page</a></li>

<li class="next"><a href="rdf_example.asp">Next Page</a></li>
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
<h5 id="tools_reference"><a href="rdf_reference.asp">RDF �ο��ֲ�</a></h5>
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