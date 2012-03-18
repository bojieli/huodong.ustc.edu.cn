
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

<title>XLink �� XPointer �﷨</title>
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
<h2>XLINK ����</h2>
<ul>
<li><a href="index.asp" title="XLink �� XPointer �̳�">XLink ��ҳ</a></li>
<li><a href="xlink_intro.asp" title="XLink �Լ� XPointer ���">XLink ���</a></li>
<li><a href="xlink_syntax.asp" title="XLink �� XPointer �﷨">XLink �﷨</a></li>
<li><a href="xlink_example.asp" title="XLink ʵ��">XLink ʵ��</a></li>
<li><a href="xpointer_example.asp" title="XPointer ʵ��">XPointer ʵ��</a></li>
<li><a href="xlink_summary.asp" title="���Ѿ�ѧϰ�� XLink����һ���أ�">XLink �ܽ�</a></li>
</ul>

<h2>�ο��ֲ�</h2>
<ul>
<li><a href="xlink_reference.asp" title="XLink �ο��ֲ�">XLink ����</a></li>
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

<h1>XLink �� XPointer �﷨</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="xlink_intro.asp">Previous Page</a></li>

<li class="next"><a href="xlink_example.asp">Next Page</a></li>
</ul>

</div>

<div>
<h2>XLink �﷨</h2>
<p>�� HTML �У�����֪�� &lt;a&gt; Ԫ�ؿɶ��峬�����ӡ����� XML �������������ġ��� XML �ĵ��У�������ʹ���κ�����Ҫ������ - ��˶����������˵���޷�Ԥ֪�� XML �ĵ��пɵ��ú��ֳ�������Ԫ�ء�</p>
<p>�� XML �ĵ��ж��峬�����ӵķ�������Ԫ���Ϸ��ÿ������������ӵı�ǡ�</p>
<p>�������� XML �ĵ���ʹ�� XLink ���������ӵļ�ʵ����</p>
<pre>&lt;?xml version=&quot;1.0&quot;?&gt;

&lt;homepages <code>xmlns:xlink=&quot;http://www.w3.org/1999/xlink&quot;&gt;</code>

  &lt;homepage xlink:<code>type</code>=&quot;simple&quot;
  xlink:<code>href</code>=&quot;http://www.w3school.com.cn&quot;&gt;Visit W3School&lt;/homepage&gt;
  
  &lt;homepage xlink:<code>type</code>=&quot;simple&quot;
  xlink:<code>href</code>=&quot;http://www.w3.org&quot;&gt;Visit W3C&lt;/homepage&gt;
  
&lt;/homepages&gt;</pre>

<p>Ϊ�˷��� XLink �����Ժ����ԣ����Ǳ������ĵ��Ķ������� XLink �����ռ䡣</p>
<p>XLink �������ռ��ǣ�&quot;http://www.w3.org/1999/xlink&quot;��</p>
<p>&lt;homepage&gt; Ԫ���е� xlink:type �� xlink:href ���Զ��������� XLink �����ռ�� type �� href ���ԡ�</p>
<p>xlink:type=&quot;simple&quot; �ɴ���һ���򵥵��������ӣ���˼�ǡ������ﵽ��������Ժ����ǻ��о�������ӣ��෽�򣩡�</p>
</div>

<div>
<h2>XPointer �﷨</h2>
<p>�� HTML �У����ǿɴ���һ����ָ��ĳ�� HTML ҳ����ָ�� HTML ҳ����ĳ����ǩ�ĳ������ӣ�ʹ��#����</p>
<p>��ʱ����ָ������������ݻ���кô���������������Ҫָ��ĳ���ض����б��ĵ�������Ŀ������ָ�����εĵڶ��С�ͨ�� XPointer �Ǻ����������ġ�</p>
<p>���糬������ָ��ĳ�� XML �ĵ������ǿ����� xlink:href �����а� XPointer �������ӵ� URL ���棬�����Ϳ��Ե�����ͨ�� XPath ����ʽ�����ĵ���ĳ�������λ���ˡ�</p>
<p>������������������У�����ͨ��Ψһ�� id ��rock�� ʹ�� XPointer ָ��ĳ���б��еĵ������Ŀ��</p>
<pre>href=&quot;http://www.example.com/cdlist.xml<code>#id('rock').child(5,item)</code>&quot;</pre>
</div>

<div  id="bpn">
<ul class="prenext">

<li class="pre"><a href="xlink_intro.asp">Previous Page</a></li>

<li class="next"><a href="xlink_example.asp">Next Page</a></li>
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
<h5 id="tools_reference"><a href="xlink_reference.asp">XLink �ο��ֲ�</a></h5>
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