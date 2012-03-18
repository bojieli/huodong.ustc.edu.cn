
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

<title>jQuery ajax - serializeArray() ����</title>
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

<h1>jQuery ajax - serializeArray() ����</h1>

<div class="backtoreference">
<p><a href="jquery_ref_ajax.asp" title="jQuery �ο��ֲ� - Ajax">jQuery Ajax �ο��ֲ�</a></p>
</div>


<div>
<h2>ʵ��</h2>

<p>�����������ʽ���л�����ֵ�Ľ����</p>

<pre>
$("button").click(function(){
  x=$("form").serializeArray();
  $.each(x, function(i, field){
    $("#results").append(field.name + ":" + field.value + " ");
  });
});
</pre>

<p><a href="../tiy/t.asp@f=jquery_ajax_serializearray">������һ��</a></p>
</div>


<div>
<h2>������÷�</h2>

<p>serializeArray() ����ͨ�����л�����ֵ�������������飨���ƺ�ֵ����</p>

<p>������ѡ��һ����������Ԫ�أ����� input ��/�� textarea�������� form Ԫ�ر�����</p>

<h3>�﷨</h3>

<pre>$(<i>selector</i>).serializeArray()</pre>

<h3>��ϸ˵��</h3>

<p>serializeArray() �������л�����Ԫ�أ����� <a href="ajax_serialize.asp">.serialize() ����</a>�������� JSON ���ݽṹ���ݡ�</p>

<p class="important"><span>ע�⣺</span>�˷������ص��� JSON ������� JSON �ַ�������Ҫʹ�ò�����ߵ�����������ַ�����������</p>

<p>���ص� JSON ��������һ������������ɵģ�����ÿ���������һ����������ֵ�� ���� name ������ value ��������� value ��Ϊ�յĻ�����������˵��</p>

<pre>
[ 
  {name: 'firstname', value: 'Hello'}, 
  {name: 'lastname', value: 'World'},
  {name: 'alias'}, <span>// ֵΪ��</span>
]
</pre>

<p>.serializeArray() ����ʹ���� W3C ���� <a href="http://www.w3.org/TR/html401/interact/forms.html#h-17.13.2">successful controls</a>����Ч�ؼ��� �ı�׼�������ЩԪ��Ӧ���������ڡ��ر�˵����Ԫ�ز��ܱ����ã����õ�Ԫ�ز��ᱻ�������ڣ�������Ԫ��Ӧ���к��� name ���ԡ��ύ��ť��ֵҲ���ᱻ���л����ļ�ѡ��Ԫ�ص�����Ҳ���ᱻ���л���

<p>�÷������Զ���ѡ�񵥶�����Ԫ�صĶ�����в��������� &lt;input&gt;, &lt;textarea&gt;, �� &lt;select&gt;��������������ķ����ǣ�ֱ��ѡ�� &lt;form&gt; ��ǩ�������������л�������

<pre>
$(&quot;form&quot;).submit(function() {
  console.log($(this).serializeArray());
  return false;
});
</pre>

<p>����Ĵ��������������ݽṹ�����������֧�� console.log����</p>

<pre>
[
  {
    name: a
    value: 1
  },
  {
    name: b
    value: 2
  },
  {
    name: c
    value: 3
  },
  {
    name: d
    value: 4
  },
  {
    name: e
    value: 5
  }
]
</pre>

<h3>ʾ��</h3>

<p>ȡ�ñ������ݲ����뵽��ҳ�У�</p>

<p>HTML ���룺</p>

<pre>
&lt;p id=&quot;results&quot;&gt;&lt;b&gt;Results:&lt;/b&gt; &lt;/p&gt;
&lt;form&gt;
  &lt;select name=&quot;single&quot;&gt;
    &lt;option&gt;Single&lt;/option&gt;
    &lt;option&gt;Single2&lt;/option&gt;
  &lt;/select&gt;
  &lt;select name=&quot;multiple&quot; multiple=&quot;multiple&quot;&gt;
    &lt;option selected=&quot;selected&quot;&gt;Multiple&lt;/option&gt;
    &lt;option&gt;Multiple2&lt;/option&gt;
    &lt;option selected=&quot;selected&quot;&gt;Multiple3&lt;/option&gt;
  &lt;/select&gt;&lt;br/&gt;
  &lt;input type=&quot;checkbox&quot; name=&quot;check&quot; value=&quot;check1&quot;/&gt; check1
  &lt;input type=&quot;checkbox&quot; name=&quot;check&quot; value=&quot;check2&quot; checked=&quot;checked&quot;/&gt; check2
  &lt;input type=&quot;radio&quot; name=&quot;radio&quot; value=&quot;radio1&quot; checked=&quot;checked&quot;/&gt; radio1
  &lt;input type=&quot;radio&quot; name=&quot;radio&quot; value=&quot;radio2&quot;/&gt; radio2
&lt;/form&gt;
</pre>

<p>jQuery ���룺</p>

<pre>
var fields = <code>$(&quot;select, :radio&quot;).serializeArray()</code>;
jQuery.each( fields, function(i, field){
  $(&quot;#results&quot;).append(field.value + &quot; &quot;);
});
</pre>

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