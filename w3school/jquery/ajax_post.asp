
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

<title>jQuery ajax - post() ����</title>
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

<h1>jQuery ajax - post() ����</h1>

<div class="backtoreference">
<p><a href="jquery_ref_ajax.asp" title="jQuery �ο��ֲ� - Ajax">jQuery Ajax �ο��ֲ�</a></p>
</div>


<div>
<h2>ʵ��</h2>

<p>���� test.php ��ҳ�����Է���ֵ��</p>

<pre>$.post(&quot;test.php&quot;);</pre>


<h3>TIY ʵ��</h3>

<p>ͨ�� AJAX POST ����ı� div Ԫ�ص��ı���</p>

<pre>
$(&quot;input&quot;).keyup(function(){
  txt=$(&quot;input&quot;).val();
  $.post(&quot;demo_ajax_gethint.asp&quot;,{suggest:txt},function(result){
    $(&quot;span&quot;).html(result);
  });
});
</pre>

<p><a href="../tiy/t.asp@f=jquery_ajax_post">������һ��</a></p>
</div>


<div>
<h2>������÷�</h2>

<p>post() ����ͨ�� HTTP POST ����ӷ������������ݡ�</p>

<h3>�﷨</h3>

<pre>jQuery.post(<i>url</i>,<i>data</i>,<i>success(data, textStatus, jqXHR)</i>,<i>dataType</i>)</pre>

<table class="dataintable">
<tr>
<th style="width:35%;">����</th>
<th>����</th>
</tr>

<tr>
<td><i>url</i></td>
<td>���衣�涨�������͵��ĸ� URL��</td>
</tr>

<tr>
<td><i>data</i></td>
<td>��ѡ��ӳ����ַ���ֵ���涨��ͬ�����͵������������ݡ�</td>
</tr>

<tr>
<td><i>success(data, textStatus, jqXHR)</i></td>
<td>��ѡ������ɹ�ʱִ�еĻص�������</td>
</tr>

<tr>
<td><i>dataType</i></td>
<td>
<p>��ѡ���涨Ԥ�ڵķ�������Ӧ���������͡�</p>
<p>Ĭ��ִ�������жϣ�xml��json��script �� html����</p>
</td>
</tr>
</table>

<h3>��ϸ˵��</h3>

<p>�ú����Ǽ�д�� Ajax �������ȼ��ڣ�</p>

<pre>$.ajax({
  type: 'POST',
  url: <i>url</i>,
  data: <i>data</i>,
  success: <i>success</i>,
  dataType: <i>dataType</i>
});</pre>

<p>������Ӧ�Ĳ�ͬ�� MIME ���ͣ����ݸ� success �ص������ķ�������Ҳ������ͬ����Щ���ݿ����� XML ��Ԫ�ء��ı��ַ�����JavaScript �ļ����� JSON ����Ҳ���� success �ص�����������Ӧ���ı�״̬��</p>

<p>���� jQuery 1.5��Ҳ������ success �ص��������� <a href="ajax_post.asp#jqxhr_object">jqXHR ����</a>��jQuery 1.4 �д��ݵ��� XMLHttpRequest ���󣩡�</p>

<p>�󲿷�ʵ�ֻ�涨һ�� success ������</p>

<pre>
$.post(&quot;ajax/test.html&quot;, function(data) {
  $(&quot;.result&quot;).html(data);
});
</pre>

<p>������ȡ������� HTML Ƭ�Σ�������ҳ���С�</p>

<p>ͨ�� POST ��ȡ��ҳ�治�����棬��� <a href="ajax_ajaxsetup.asp" title="jQuery ajax - ajaxSetup() ����">jQuery.ajaxSetup()</a> �е� cache �� ifModified ѡ���Ӱ����Щ����</p>

<p class="note"><span>ע�ͣ�</span>�����������ȫ��������ƣ������ "Ajax" ��������ͬԴ���ԣ������޷��Ӳ�ͬ���������Э��ɹ���ȡ�����ݡ�</p>

<p class="note"><span>ע�ͣ�</span>����� jQuery.post() ��������󷵻ش�����룬��ô�������κ���ʾ�����ǽű��ѵ�����ȫ�ֵ� <a href="ajax_ajaxerror.asp" title="jQuery ajax - ajaxError() ����">.ajaxError() ����</a>�����߶��� jQuery 1.5��jQuery.post() ���ص� jqXHR ����� .error() ����Ҳ�������ڴ�������</p>
</div>


<div id="jqxhr_object">
<h2>jqXHR ����</h2>

<p>���� jQuery 1.5������ jQuery �� AJAX �������ص��� XMLHTTPRequest ����ĳ������� $.post() ���ص� jQuery XHR ����� &quot;jqXHR,&quot;ʵ����Լ���Ľӿڣ����������е����ԡ��������Լ�Լ������Ϊ�����ڶ��� <a href="ajax_ajax.asp" title="jQuery ajax - ajax() ����">$.ajax()</a> ʹ�õĻص��������Ʊ����Ժ�һ���ԵĿ��ǣ����ṩ�� .error(), .success() �Լ� .complete() ��������Щ����ʹ��������ֹʱ���õĺ����������ú����������Ӧ������ $.ajax() �ص�������ͬ�Ĳ�����</p>

<p>jQuery 1.5 �е�Լ���ӿ�ͬ������ jQuery �� Ajax ���������� $.post()��������ͬһ����Ķ�� .success()��.complete() �Լ� .error() �ص�������������������Ҳ���Ѿ���ɺ������Щ�ص�������</p>

<pre>
<span>// �������ɺ��������䴦���������ס��������� jqxhr ����</span>
    var jqxhr = $.post(&quot;example.php&quot;, function() {
      alert(&quot;success&quot;);
    })
    .success(function() { alert(&quot;second success&quot;); })
    .error(function() { alert(&quot;error&quot;); })
    .complete(function() { alert(&quot;complete&quot;); });

    <span>// ������ִ����������</span>
	
    <span>// Ϊ���������������һ����ɺ���</span>
    jqxhr.complete(function(){ alert(&quot;second complete&quot;); });
</pre>
</div>


<div>
<h2>����ʵ��</h2>

<h3>���� 1</h3>

<p>���� test.php ҳ�棬��һ����һЩ��������ݣ�ͬʱ��Ȼ���Է���ֵ����</p>

<pre>$.post(&quot;test.php&quot;, { name: &quot;John&quot;, time: &quot;2pm&quot; } );</pre>

<h3>���� 2</h3>

<p>������������������飨ͬʱ��Ȼ���Է���ֵ����</p>

<pre>$.post(&quot;test.php&quot;, { 'choices[]': [&quot;Jon&quot;, &quot;Susan&quot;] });</pre>

<h3>���� 3</h3>

<p>ʹ�� ajax �����ͱ������ݣ�</p>

<pre>$.post(&quot;test.php&quot;, $(&quot;#testform&quot;).serialize());</pre>

<h3>���� 4</h3>

<p>�����������ҳ�� test.php �Ľ����HTML �� XML��ȡ���������ص����ݣ���</p>

<pre>
$.post(&quot;test.php&quot;, function(data){
   alert(&quot;Data Loaded: &quot; + data);
 });
</pre>

<h3>���� 5</h3>

<p>��ҳ�� test.php �������ݣ�����������HTML �� XML��ȡ���������ص����ݣ���</p>

<pre>
$.post(&quot;test.php&quot;, { name: &quot;John&quot;, time: &quot;2pm&quot; },
   function(data){
     alert(&quot;Data Loaded: &quot; + data);
   });
</pre>

<h3>���� 6</h3>

<p>��� test.php ҳ������ݣ����洢Ϊ XMLHttpResponse ���󣬲�ͨ�� process() ��� JavaScript �������д�����</p>

<pre>
$.post(&quot;test.php&quot;, { name: &quot;John&quot;, time: &quot;2pm&quot; },
   function(data){
     process(data);
   }, &quot;xml&quot;);
</pre>

<h3>���� 7</h3>

<p>��� test.php ҳ�淵�ص� json ��ʽ�����ݣ�</p>

<pre>
$.post(&quot;test.php&quot;, { &quot;func&quot;: &quot;getNameAndTime&quot; },
   function(data){
     alert(data.name); // John
     console.log(data.time); //  2pm
   }, &quot;json&quot;);
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