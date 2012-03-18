
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

<title>jQuery ajax - ajax() ����</title>
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

<h1>jQuery ajax - ajax() ����</h1>

<div class="backtoreference">
<p><a href="jquery_ref_ajax.asp" title="jQuery �ο��ֲ� - Ajax">jQuery Ajax �ο��ֲ�</a></p>
</div>


<div>
<h2>ʵ��</h2>

<p>ͨ�� AJAX ����һ���ı���</p>

<p>jQuery ���룺</p>

<pre>
$(document).ready(function(){
  $(&quot;#b01&quot;).click(function(){
  htmlobj=<code>$.ajax({url:&quot;/jquery/test1.txt&quot;,async:false})</code>;
  $(&quot;#myDiv&quot;).html(htmlobj.responseText);
  });
});
</pre>

<p>HTML ���룺</p>

<pre>
&lt;div id=&quot;myDiv&quot;&gt;&lt;h2&gt;Let AJAX change this text&lt;/h2&gt;&lt;/div&gt;
&lt;button id=&quot;b01&quot; type=&quot;button&quot;&gt;Change Content&lt;/button&gt;
</pre>

<p><a href="../tiy/t.asp@f=jquery_ajax2">������һ��</a></p>
</div>


<div>
<h2>������÷�</h2>

<p>ajax() ����ͨ�� HTTP �������Զ�����ݡ�</p>

<p>�÷����� jQuery �ײ� AJAX ʵ�֡������õĸ߲�ʵ�ּ� $.get, $.post �ȡ�$.ajax() �����䴴���� XMLHttpRequest ���󡣴���������������ֱ�Ӳ����ú�������������Ҫ���������õ�ѡ��Ի�ø��������ԡ�</p>

<p>��򵥵�����£�$.ajax() ���Բ����κβ���ֱ��ʹ�á�</p>

<p class="important"><span>ע�⣺</span>���е�ѡ�����ͨ�� $.ajaxSetup() ������ȫ�����á�</p>


<h3>�﷨</h3>

<pre>jQuery.ajax([<i>settings</i>])</pre>

<table class="dataintable">
<tr>
<th style="width:30%;">����</th>
<th>����</th>
</tr>

<tr>
<td>settings</td>
<td>
	<p>��ѡ���������� Ajax ����ļ�ֵ�Լ��ϡ�</p>
	<p>����ͨ�� $.ajaxSetup() �����κ�ѡ���Ĭ��ֵ��</p>
</td>
</tr>
</table>

<h3>����</h3>

<dl class="define">
<dt>options</dt>
<dd>
<p>���ͣ�Object</p>
<p>��ѡ��AJAX �������á�����ѡ��ǿ�ѡ�ġ�</p>
</dd>

<dt>async</dt>
<dd>
<p>���ͣ�Boolean</p>
<p>Ĭ��ֵ: true��Ĭ�������£����������Ϊ�첽���������Ҫ����ͬ�������뽫��ѡ������Ϊ false��</p>
<p>ע�⣬ͬ��������ס��������û�������������ȴ�������ɲſ���ִ�С�</p>
</dd>


<dt>beforeSend(XHR)</dt>
<dd>
<p>���ͣ�Function</p>
<p>��������ǰ���޸� XMLHttpRequest ����ĺ������������Զ��� HTTP ͷ��</p>
<p>XMLHttpRequest ������Ψһ�Ĳ�����</p>
<p>����һ�� Ajax �¼���������� false ����ȡ������ ajax ����</p>
</dd>

<dt>cache</dt>
<dd>
<p>���ͣ�Boolean</p>
<p>Ĭ��ֵ: true��dataType Ϊ script �� jsonp ʱĬ��Ϊ false������Ϊ false ���������ҳ�档</p>
<p>jQuery 1.2 �¹��ܡ�</p>
</dd>

<dt>complete(XHR, TS)</dt>
<dd>
<p>���ͣ�Function</p>
<p>������ɺ�ص����� (����ɹ���ʧ��֮�������)��</p>
<p>������ XMLHttpRequest �����һ�������������͵��ַ�����</p>
<p>����һ�� Ajax �¼���</p>
</dd>

<dt>contentType</dt>
<dd>
<p>���ͣ�String</p>
<p>Ĭ��ֵ: &quot;application/x-www-form-urlencoded&quot;��������Ϣ��������ʱ���ݱ������͡�</p>
<p>Ĭ��ֵ�ʺϴ����������������ȷ�ش�����һ�� content-type �� $.ajax() ��ô���ض��ᷢ�͸�����������ʹû������Ҫ���ͣ���</p>
</dd>

<dt>context</dt>
<dd>
<p>���ͣ�Object</p>
<p>��������������� Ajax ��ػص������������ġ�Ҳ����˵���ûص������� this ָ���������������趨�����������ô this ��ָ����ñ��� AJAX ����ʱ���ݵ� options ������������ָ��һ�� DOM Ԫ����Ϊ context ������������������ success �ص�������������Ϊ��� DOM Ԫ�ء�</p>

<p>����������</p>

<pre>
$.ajax({ url: &quot;test.html&quot;, context: document.body, success: function(){
        $(this).addClass(&quot;done&quot;);
      }});
</pre>
</dd>

<dt>dataObject</dt>
<dd>
<p>���ͣ�String</p>
<p>���͵������������ݡ����Զ�ת��Ϊ�����ַ�����ʽ��GET �����н������� URL �󡣲鿴 processData ѡ��˵���Խ�ֹ���Զ�ת��������Ϊ Key/Value ��ʽ�����Ϊ���飬jQuery ���Զ�Ϊ��ֵͬ��Ӧͬһ�����ơ��� {foo:[&quot;bar1&quot;, &quot;bar2&quot;]} ת��Ϊ '&amp;foo=bar1&amp;foo=bar2'��</p>
</dd>

<dt>dataFilter</dt>
<dd>
<p>���ͣ�Function</p>
<p>�� Ajax ���ص�ԭʼ���ݵĽ���Ԥ�����ĺ������ṩ data �� type ����������data �� Ajax ���ص�ԭʼ���ݣ�type �ǵ��� jQuery.ajax ʱ�ṩ�� dataType �������������ص�ֵ���� jQuery ��һ��������</p>
</dd>

<dt>dataType</dt>
<dd>
<p>���ͣ�String</p>
<p>Ԥ�ڷ��������ص��������͡������ָ����jQuery ���Զ����� HTTP �� MIME ��Ϣ�������жϣ����� XML MIME ���;ͱ�ʶ��Ϊ XML���� 1.4 �У�JSON �ͻ�����һ�� JavaScript ���󣬶� script ���ִ������ű������������˷��ص����ݻ�������ֵ�����󣬴��ݸ��ص�����������ֵ: </p>

<ul>
<li>&quot;xml&quot;: ���� XML �ĵ������� jQuery ������</li>
<li>&quot;html&quot;: ���ش��ı� HTML ��Ϣ�������� script ��ǩ���ڲ��� dom ʱִ�С�</li>
<li>&quot;script&quot;: ���ش��ı� JavaScript ���롣�����Զ������������������� &quot;cache&quot; ������ע�⣺��Զ������ʱ(����ͬһ������)������ POST ���󶼽�תΪ GET ���󡣣���Ϊ��ʹ�� DOM �� script��ǩ�����أ�</li>
<li>&quot;json&quot;: ���� JSON ���� ��</li>
<li>&quot;jsonp&quot;: JSONP ��ʽ��ʹ�� JSONP ��ʽ���ú���ʱ���� &quot;myurl?callback=?&quot; jQuery ���Զ��滻 ? Ϊ��ȷ�ĺ���������ִ�лص�������</li>
<li>&quot;text&quot;: ���ش��ı��ַ���</li>
</ul>
</dd>

<dt>error</dt>
<dd>
<p>���ͣ�Function</p>
<p>Ĭ��ֵ: �Զ��ж� (xml �� html)������ʧ��ʱ���ô˺�����</p>
<p>����������������XMLHttpRequest ���󡢴�����Ϣ������ѡ��������쳣����</p>
<p>��������˴��󣬴�����Ϣ���ڶ������������˵õ� null ֮�⣬�������� &quot;timeout&quot;, &quot;error&quot;, &quot;notmodified&quot; �� &quot;parsererror&quot;��</p>
<p>����һ�� Ajax �¼���</p>
</dd>

<dt>global</dt>
<dd>
<p>���ͣ�Boolean</p>
<p>�Ƿ񴥷�ȫ�� AJAX �¼���Ĭ��ֵ: true������Ϊ false �����ᴥ��ȫ�� AJAX �¼����� ajaxStart �� ajaxStop �����ڿ��Ʋ�ͬ�� Ajax �¼���</p>
</dd>

<dt>ifModified</dt>
<dd>
<p>���ͣ�Boolean</p>
<p>���ڷ��������ݸı�ʱ��ȡ�����ݡ�Ĭ��ֵ: false��ʹ�� HTTP �� Last-Modified ͷ��Ϣ�жϡ��� jQuery 1.4 �У���Ҳ���������ָ���� 'etag' ��ȷ������û�б��޸Ĺ���</p>
</dd>

<dt>jsonp</dt>
<dd>
<p>���ͣ�String</p>
<p>��һ�� jsonp ��������д�ص����������֡����ֵ��������� &quot;callback=?&quot; ���� GET �� POST ������ URL ������� &quot;callback&quot; ���֣����� {jsonp:'onJsonPLoad'} �ᵼ�½� &quot;onJsonPLoad=?&quot; ������������</p>
</dd>

<dt>jsonpCallback</dt>
<dd>
<p>���ͣ�String</p>
<p>Ϊ jsonp ����ָ��һ���ص������������ֵ������ȡ�� jQuery �Զ����ɵ����������������Ҫ������ jQuery ���ɶȶ��صĺ�����������������������ף�Ҳ�ܷ�����ṩ�ص������ʹ���������Ҳ������������������� GET �����ʱ��ָ������ص���������</p>
</dd>

<dt>password</dt>
<dd>
<p>���ͣ�String</p>
<p>������Ӧ HTTP ������֤���������</p>
</dd>

<dt>processData</dt>
<dd>
<p>���ͣ�Boolean</p>
<p>Ĭ��ֵ: true��Ĭ������£�ͨ��dataѡ��ݽ��������ݣ������һ������(�����Ͻ�ֻҪ�����ַ���)�����ᴦ��ת����һ����ѯ�ַ����������Ĭ���������� &quot;application/x-www-form-urlencoded&quot;�����Ҫ���� DOM ����Ϣ��������ϣ��ת������Ϣ��������Ϊ false��</p>
</dd>

<dt>scriptCharset</dt>
<dd>
<p>���ͣ�String</p>
<p>ֻ�е�����ʱ dataType Ϊ &quot;jsonp&quot; �� &quot;script&quot;������ type �� &quot;GET&quot; �Ż�����ǿ���޸� charset��ͨ��ֻ�ڱ��غ�Զ�̵����ݱ��벻ͬʱʹ�á�</p>
</dd>

<dt>success</dt>
<dd>
<p>���ͣ�Function</p>
<p>����ɹ���Ļص�������</p>
<p>�������ɷ��������أ������� dataType �������д���������ݣ�����״̬���ַ�����</p>
<p>����һ�� Ajax �¼���</p>
</dd>

<dt>traditional</dt>
<dd>
<p>���ͣ�Boolean</p>
<p>�������Ҫ�ô�ͳ�ķ�ʽ�����л����ݣ���ô������Ϊ true����ο����߷�������� jQuery.param ������</p>
</dd>

<dt>timeout</dt>
<dd>
<p>���ͣ�Number</p>
<p>��������ʱʱ�䣨���룩�������ý�����ȫ�����á�</p>
</dd>

<dt>type</dt>
<dd>
<p>���ͣ�String</p>
<p>Ĭ��ֵ: &quot;GET&quot;)������ʽ (&quot;POST&quot; �� &quot;GET&quot;)�� Ĭ��Ϊ &quot;GET&quot;��ע�⣺���� HTTP ���󷽷����� PUT �� DELETE Ҳ����ʹ�ã��������������֧�֡�</p>
</dd>

<dt>url</dt>
<dd>
<p>���ͣ�String</p>
<p>Ĭ��ֵ: ��ǰҳ��ַ����������ĵ�ַ��</p>
</dd>

<dt>username</dt>
<dd>
<p>���ͣ�String</p>
<p>������Ӧ HTTP ������֤������û�����</p>
</dd>

<dt>xhr</dt>
<dd>
<p>���ͣ�Function</p>
<p>��Ҫ����һ�� XMLHttpRequest ����Ĭ���� IE ���� ActiveXObject ������������� XMLHttpRequest ��������д�����ṩһ����ǿ�� XMLHttpRequest ������������� jQuery 1.3 ��ǰ�����á�</p>
</dd>
</dl>
</div>


<div>
<h2>�ص�����</h2>

<p>���Ҫ���� $.ajax() �õ������ݣ�����Ҫʹ�ûص�������beforeSend��error��dataFilter��success��complete��</p>

<h3>beforeSend</h3>
<p>�ڷ�������֮ǰ���ã����Ҵ���һ�� XMLHttpRequest ��Ϊ������</p>

<h3>error</h3>
<p>���������ʱ���á����� XMLHttpRequest ���������������͵��ַ����Լ�һ���쳣��������еĻ���</p>

<h3>dataFilter</h3>
<p>������ɹ�֮����á����뷵�ص������Լ� &quot;dataType&quot; ������ֵ�����ұ��뷵���µ����ݣ������Ǵ������ģ����ݸ� success �ص�������</p>

<h3>success</h3>
<p>������֮����á����뷵�غ�����ݣ��Լ������ɹ�������ַ�����</p>

<h3>complete</h3>
<p>���������֮�����������������۳ɹ���ʧ�ܡ����� XMLHttpRequest �����Լ�һ�������ɹ�����������ַ�����</p>
</div>


<div>
<h2>��������</h2>

<p>$.ajax() ���������������ṩ����Ϣ���������ص����ݡ��������������˵���ص������� XML����ô���صĽ���Ϳ�������ͨ�� XML �������� jQuery ��ѡ������������������õ��������ͣ����� HTML�������ݾ����ı���ʽ���Դ���</p>

<p>ͨ�� dataType ѡ�����ָ��������ͬ���ݴ�����ʽ�����˵����� XML��������ָ�� html��json��jsonp��script ���� text��</p>

<p>���У�text �� xml ���ͷ��ص����ݲ��ᾭ�����������ݽ����򵥵Ľ� XMLHttpRequest �� responseText �� responseHTML ���Դ��ݸ� success �ص�������</p>

<p class="important"><span>ע�⣺</span>���Ǳ���ȷ����ҳ����������� MIME ����������ѡ��� dataType ��ƥ�䡣����˵��XML�Ļ����������˾ͱ������� text/xml ���� application/xml �����һ�µĽ����</p>

<p>���ָ��Ϊ html ���ͣ��κ���Ƕ�� JavaScript ������ HTML ��Ϊһ���ַ�������֮ǰִ�С����Ƶأ�ָ�� script ���͵Ļ���Ҳ����ִ�з����������� JavaScript��Ȼ���ٰѽű���Ϊһ���ı����ݷ��ء�</p>

<p>���ָ��Ϊ json ���ͣ����ѻ�ȡ����������Ϊһ�� JavaScript ���������������Ұѹ����õĶ�����Ϊ������ء�Ϊ��ʵ�����Ŀ�ģ������ȳ���ʹ�� JSON.parse()������������֧�֣���ʹ��һ��������������</p>

<p>JSON ������һ���ܷܺ���ͨ�� JavaScript �����Ľṹ�����ݡ������ȡ�������ļ������Զ�̷������ϣ�������ͬ��Ҳ���ǿ����ȡ���ݣ�������Ҫʹ�� jsonp ���͡�ʹ���������͵Ļ����ᴴ��һ����ѯ�ַ������� callback=? ������������������� URL ���档��������Ӧ���� JSON ����ǰ���ϻص����������Ա����һ����Ч�� JSONP �������Ҫָ���ص������Ĳ�������ȡ��Ĭ�ϵ� callback������ͨ������ $.ajax() �� jsonp ������</p>

<p class="important"><span>ע�⣺</span>JSONP �� JSON ��ʽ����չ����Ҫ��һЩ�������˵Ĵ�������Ⲣ������ѯ�ַ���������</p>

<p>���ָ���� script ���� jsonp ���ͣ���ô���ӷ��������յ�����ʱ��ʵ���������� &lt;script&gt; ��ǩ������ XMLHttpRequest ������������£�$.ajax() ���ٷ���һ�� XMLHttpRequest ���󣬲���Ҳ���ᴫ���¼��������������� beforeSend��</p>
</div>


<div>
<h2>�������ݵ�������</h2>

<p>Ĭ������£�Ajax ����ʹ�� GET ���������Ҫʹ�� POST �����������趨 type ����ֵ�����ѡ��Ҳ��Ӱ�� data ѡ���е�������η��͵���������</p>

<p>data ѡ��ȿ��԰���һ����ѯ�ַ��������� key1=value1&key2=value2 ��Ҳ������һ��ӳ�䣬���� {key1: 'value1', key2: 'value2'} �����ʹ���˺��ߵ���ʽ���������ٷ������ᱻת���ɲ�ѯ�ַ����������������Ҳ����ͨ������ processData ѡ��Ϊ false ���رܡ��������ϣ������һ�� XML �����������ʱ�����ִ������ܲ������ʡ���������������£�����ҲӦ���ı� contentType ѡ���ֵ�����������ʵ� MIME ������ȡ��Ĭ�ϵ� application/x-www-form-urlencoded ��</p>
</div>


<div>
<h2>�߼�ѡ��</h2>

<p>global ѡ��������ֹ��Ӧע��Ļص����������� .ajaxSend������ ajaxError���Լ����Ƶķ�����������Щʱ������ã����緢�͵�����ǳ�Ƶ���Ҽ�̵�ʱ�򣬾Ϳ����� ajaxSend ����������</p>

<p>�����������Ҫ HTTP ��֤������ʹ���û������������ͨ�� username �� password ѡ�������á�</p>

<p>Ajax ��������ʱ�ģ����Դ��󾯸汻���񲢴����󣬿������������û����顣����ʱ�������ͨ���ͱ�����Ĭ��ֵ��Ҫ����ͨ�� jQuery.ajaxSetup ��ȫ���趨������Ϊ�ض��������������� timeout ѡ�</p>

<p>Ĭ������£������ܻᱻ����ȥ����������п��ܴ����Ļ����е�ȡ���ݡ�Ҫ��ֹʹ�û���Ľ������������ cache ����Ϊ false�����ϣ���ж������Դ��ϴ������û�и��Ĺ��ͱ�������Ļ����������� ifModified Ϊ true��</p>

<p>scriptCharset ������ &lt;script&gt; ��ǩ�������趨һ���ض����ַ��������� script ���� jsonp ���Ƶ����ݡ����ű���ҳ���ַ�����ͬʱ�����ر���á�</p>

<p>Ajax �ĵ�һ����ĸ�� asynchronous �Ŀ�ͷ��ĸ������ζ�����еĲ������ǲ��еģ���ɵ�˳��û��ǰ���ϵ��$.ajax() �� async �����������ó�true�����־��������ʼ������������Ȼ�ܹ�ִ�С�ǿ�Ҳ���������ѡ�����ó� false������ζ�����е����󶼲������첽���ˣ���Ҳ�ᵼ���������������</p>

<p>$.ajax ���������������� XMLHttpRequest ����ͨ�� jQuery ֻ���ڲ�����������������󣬵��û�Ҳ����ͨ�� xhr ѡ��������һ���Լ������� xhr ���󡣷��صĶ���ͨ���Ѿ��������ˣ�����Ȼ�ṩһ���ײ�ӿ����۲�Ͳٿ����󡣱���˵�����ö����ϵ� .abort() �������������ǰ��������</p>
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