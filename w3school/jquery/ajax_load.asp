
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

<title>jQuery ajax - load() ����</title>
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

<h1>jQuery ajax - load() ����</h1>

<div class="backtoreference">
<p><a href="jquery_ref_ajax.asp" title="jQuery �ο��ֲ� - Ajax">jQuery Ajax �ο��ֲ�</a></p>
</div>


<div>
<h2>ʵ��</h2>

<p>ʹ�� AJAX �������ı� div Ԫ�ص��ı���</p>

<pre>
$(&quot;button&quot;).click(function(){
  $(&quot;div&quot;).load('demo_ajax_load.txt');
});
</pre>

<p><a href="../tiy/t.asp@f=jquery_ajax_load">������һ��</a></p>

<p><a href="ajax_load.asp#more_example">��������ҳ��ײ��ҵ����� TIY ʵ��</a></p>
</div>


<div>
<h2>������÷�</h2>

<p>load() ����ͨ�� AJAX ����ӷ������������ݣ����ѷ��ص����ݷ��õ�ָ����Ԫ���С�</p>

<p class="note"><span>ע�ͣ�</span>������һ����Ϊ <a href="event_load.asp" title="jQuery �¼� - load() ����">load</a> �� jQuery <a href="jquery_ref_events.asp" title="jQuery �ο��ֲ� - �¼�">�¼�</a>�����������ĸ���ȡ���ڲ�����</p>


<h3>�﷨</h3>

<pre>load(<i>url</i>,<i>data</i>,<i>function(response,status,xhr)</i>)</pre>

<table class="dataintable">
<tr>
<th style="width:25%;">����</th>
<th>����</th>
</tr>

<tr>
<td><i>url</i></td>
<td>�涨Ҫ�������͵��ĸ� URL��</td>
</tr>

<tr>
<td><i>data</i></td>
<td>��ѡ���涨��ͬ�����͵������������ݡ�</td>
</tr>

<tr>
<td><i>function(response,status,xhr)</i></td>
<td>
	<p>��ѡ���涨���������ʱ���еĺ�����</p>
	<p>����Ĳ�����</p>
	<ul class="listintable">
	<li><i>response</i> - ������������Ľ������</li>
	<li><i>status</i> - ���������״̬��&quot;success&quot;, &quot;notmodified&quot;, &quot;error&quot;, &quot;timeout&quot; �� &quot;parsererror&quot;��</li>
	<li><i>xhr</i> - ���� XMLHttpRequest ����</li>
	</ul>
</td>
</tr>
</table>

<h3>��ϸ˵��</h3>

<p>�÷�������򵥵Ĵӷ�������ȡ���ݵķ������������� $.get(url, data, success) �ȼۣ���ͬ����������ȫ�ֺ�����������ӵ����ʽ�Ļص�����������⵽�ɹ�����Ӧʱ�����磬�� textStatus Ϊ &quot;success&quot; �� &quot;notmodified&quot; ʱ����.load() ��ƥ��Ԫ�ص� HTML ��������Ϊ���ص����ݡ�����ζ�Ÿ÷����Ĵ����ʹ�û�ǳ��򵥣�</p>

<pre>$(&quot;#result&quot;).load(&quot;ajax/test.html&quot;);</pre>

<p>����ṩ�ص������������ִ�� post-processing ֮��ִ�иú�����</p>

<pre>
$(&quot;#result&quot;).load(&quot;ajax/test.html&quot;, function() {
  alert(&quot;Load was performed.&quot;);
});
</pre>

<p>��������������У������ǰ�ĵ������� &quot;result&quot; ID���򲻻�ִ�� .load() ������</p>

<p>����ṩ�������Ƕ�����ʹ�� POST ����������ʹ�� GET ������</p>

</div>


<div>
<h2>����ҳ��Ƭ��</h2>

<p>.load() �������� $.get() ��ͬ���������ǹ涨Ҫ�����Զ���ĵ���ĳ�����֡���һ����ͨ�� url �����������﷨ʵ�ֵġ�������ַ����а���һ�������ո񣬽��ӵ�һ���ո���ַ������Ǿ������������ݵ� jQuery ѡ������</p>

<p>���ǿ����޸���������ӣ������Ϳ���ʹ��������ĵ���ĳ���֣�</p>

<pre>$(&quot;#result&quot;).load(&quot;ajax/test.html #container&quot;);</pre>

<p>���ִ�и÷��������ȡ�� ajax/test.html �����ݣ�����Ȼ��jQuery ����������ص��ĵ��������Ҵ������� ID ��Ԫ�ء���Ԫ�أ���ͬ�����ݣ��ᱻ������н�� ID ��Ԫ���У���ȡ���ĵ������ಿ�ֻᱻ������</p>

<p>jQuery ʹ��������� .innerHTML ������������ȡ�ص��ĵ������������뵱ǰ�ĵ����ڴ˹����У������������ĵ��й��˵�Ԫ�أ����� &lt;html&gt;, &lt;title&gt; �� &lt;head&gt; Ԫ�ء�����ǣ��� .load() ȡ�ص�Ԫ�ؿ������������ֱ��ȡ�ص��ĵ�����ȫ��ͬ��</p>

<p class="note"><span>ע�ͣ�</span>�����������ȫ��������ƣ������ &quot;Ajax&quot; ��������ͬԴ���ԣ������޷��Ӳ�ͬ���������Э��ɹ���ȡ�����ݡ�</p>
</div>


<div>
<h2>����ʵ��</h2>

<h3>���� 1</h3>

<p>���� feeds.html �ļ����ݣ�</p>

<pre>
$(&quot;#feeds&quot;).load(&quot;feeds.html&quot;);
</pre>

<h3>���� 2</h3>

<p>�������ʵ�����ƣ������� POST ��ʽ���͸��Ӳ������ڳɹ�ʱ��ʾ��Ϣ��</p>

<pre>
$(&quot;#feeds&quot;).load(&quot;feeds.php&quot;, {limit: 25}, function(){
  alert(&quot;The last 25 entries in the feed have been loaded&quot;);
});
</pre>

<h3>���� 3</h3>

<p>�������²��������������һ�������б���</p>

<p>HTML ���룺</p>
<pre>
&lt;b&gt;jQuery Links:&lt;/b&gt;
&lt;ul id=&quot;links&quot;&gt;&lt;/ul&gt;
</pre>

<p>jQuery ���룺</p>
<pre>
$(&quot;#links&quot;).load(&quot;/Main_Page #p-Getting-Started li&quot;);
</pre>
</div>


<div class="example" id="more_example">
<h2>���� TIY ʵ��</h2>

<dl>
<dt><a href="../tiy/t.asp@f=jquery_ajax_load_data">���� AJAX ���󣬲�ͨ��������������</a></dt>
<dd>���ʹ�� data ����ͨ�� AJAX �������������ݡ��������� AJAX �̳��н��͹�����</dd>

<dt><a href="../tiy/t.asp@f=jquery_ajax_load_func">���� AJAX ���󣬲�ʹ�ûص�����</a></dt>
<dd>���ʹ�� function ������������ AJAX ��������ݽ����</dd>

<dt><a href="../tiy/t.asp@f=jquery_ajax_load_err">���ɴ��д���� AJAX ����</a></dt>
<dd>���ʹ�� function ���������� AJAX �����еĴ���ʹ�� XMLHttpRequest ��������</dd>
</dl>
</div>

<div class="backtoreference">
<p><a href="jquery_ref_ajax.asp" title="jQuery �ο��ֲ� - Ajax">jQuery Ajax �ο��ֲ�</a></p>
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