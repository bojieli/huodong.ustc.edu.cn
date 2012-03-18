
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

<title>JavaScript RegExp ����ο��ֲ�</title>
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
<h2>JS &amp; DOM �ο��ֲ�</h2>
<ul>
<li><a href="js_reference.asp">�ο��ֲ����</a></li>
</ul>

<h2>JavaScript ����</h2>
<ul class="small">
<li><a href="jsref_obj_array.asp">JS Array</a></li>
<li><a href="jsref_obj_boolean.asp">JS Boolean</a></li>
<li><a href="jsref_obj_date.asp">JS Date</a></li>
<li><a href="jsref_obj_math.asp">JS Math</a></li>
<li><a href="jsref_obj_number.asp">JS Number</a></li>
<li><a href="jsref_obj_string.asp">JS String</a></li>
<li><a href="jsref_obj_regexp.asp">JS RegExp</a></li>
<li><a href="jsref_obj_global.asp">JS Functions</a></li>
<li><a href="jsref_events.asp">JS Events</a></li>
</ul>

<h2>Browser ����</h2>
<ul class="small">
<li><a href="../htmldom/dom_obj_window.asp" title="HTML DOM Window ����">DOM Window</a></li>
<li><a href="../htmldom/dom_obj_navigator.asp" title="HTML DOM Navigator ����">DOM Navigator</a></li>
<li><a href="../htmldom/dom_obj_screen.asp" title="HTML DOM Screen ����">DOM Screen</a></li>
<li><a href="../htmldom/dom_obj_history.asp" title="HTML DOM History ����">DOM History</a></li>
<li><a href="../htmldom/dom_obj_location.asp" title="HTML DOM Location ����">DOM Location</a></li>
</ul>

<h2>HTML DOM ����</h2>
<ul class="small">
<li><a href="../htmldom/dom_obj_document.asp" title="HTML DOM Document ����">DOM Document</a></li>
<li><a href="../htmldom/dom_obj_anchor.asp" title="HTML DOM Anchor ����">DOM Anchor</a></li>
<li><a href="../htmldom/dom_obj_area.asp" title="HTML DOM Area ����">DOM Area</a></li>
<li><a href="../htmldom/dom_obj_base.asp" title="HTML DOM Base ����">DOM Base</a></li>
<li><a href="../htmldom/dom_obj_body.asp" title="HTML DOM Body ����">DOM Body</a></li>
<li><a href="../htmldom/dom_obj_pushbutton.asp" title="HTML DOM Button ����">DOM Button</a></li>
<li><a href="../htmldom/dom_obj_canvas.asp" title="HTML DOM Canvas ����">DOM Canvas</a></li>
<li><a href="../htmldom/dom_obj_event.asp" title="HTML DOM Event ����">DOM Event</a></li>
<li><a href="../htmldom/dom_obj_form.asp" title="HTML DOM Form ����">DOM Form</a></li>
<li><a href="../htmldom/dom_obj_frame.asp" title="HTML DOM Frame ����">DOM Frame</a></li>
<li><a href="../htmldom/dom_obj_frameset.asp" title="HTML DOM Frameset ����">DOM Frameset</a></li>
<li><a href="../htmldom/dom_obj_iframe.asp" title="HTML DOM IFrame ����">DOM IFrame</a></li>
<li><a href="../htmldom/dom_obj_image.asp" title="HTML DOM Image ����">DOM Image</a></li>
<li><a href="../htmldom/dom_obj_button.asp" title="HTML DOM Button ����">DOM Input Button</a></li>
<li><a href="../htmldom/dom_obj_checkbox.asp" title="HTML DOM Checkbox ����">DOM Input Checkbox</a></li>
<li><a href="../htmldom/dom_obj_fileupload.asp" title="HTML DOM FileUpload ����">DOM Input File</a></li>
<li><a href="../htmldom/dom_obj_hidden.asp" title="HTML DOM Hidden ����">DOM Input Hidden</a></li>
<li><a href="../htmldom/dom_obj_password.asp" title="HTML DOM Password ����">DOM Input Password</a></li>
<li><a href="../htmldom/dom_obj_radio.asp" title="HTML DOM Radio ����">DOM Input Radio</a></li>
<li><a href="../htmldom/dom_obj_reset.asp" title="HTML DOM Reset ����">DOM Input Reset</a></li>
<li><a href="../htmldom/dom_obj_submit.asp" title="HTML DOM Submit ����">DOM Input Submit</a></li>
<li><a href="../htmldom/dom_obj_text.asp" title="HTML DOM Text ����">DOM Input Text</a></li>
<li><a href="../htmldom/dom_obj_link.asp" title="HTML DOM Link ����">DOM Link</a></li>
<li><a href="../htmldom/dom_obj_meta.asp" title="HTML DOM Meta ����">DOM Meta</a></li>
<li><a href="../htmldom/dom_obj_object.asp" title="HTML DOM Object ����">DOM Object</a></li>
<li><a href="../htmldom/dom_obj_option.asp" title="HTML DOM Option ����">DOM Option</a></li>
<li><a href="../htmldom/dom_obj_select.asp" title="HTML DOM Select ����">DOM Select</a></li>
<li><a href="../htmldom/dom_obj_style.asp" title="HTML DOM Style ����">DOM Style</a></li>
<li><a href="../htmldom/dom_obj_table.asp" title="HTML DOM Table ����">DOM Table</a></li>
<li><a href="../htmldom/dom_obj_tabledata.asp" title="HTML DOM TableCell ����">DOM TableCell</a></li>
<li><a href="../htmldom/dom_obj_tablerow.asp" title="HTML DOM TableRow ����">DOM TableRow</a></li>
<li><a href="../htmldom/dom_obj_textarea.asp" title="HTML DOM Textarea ����">DOM Textarea</a></li>
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

<h1>JavaScript RegExp ����ο��ֲ�</h1>


<div>
<h2>RegExp ����</h2>

<p>RegExp �����ʾ�������ʽ�����Ƕ��ַ���ִ��ģʽƥ���ǿ�󹤾ߡ�</p>

<h3>ֱ�����﷨</h3>
<pre>/pattern/attributes</pre>

<h3>���� RegExp ������﷨��</h3>
<pre>new RegExp(<i>pattern</i>, <i>attributes</i>);</pre>

<h3>����</h3>

<p>���� <i>pattern</i> ��һ���ַ�����ָ�����������ʽ��ģʽ�������������ʽ��</p>
<p>���� <i>attributes</i> ��һ����ѡ���ַ������������� &quot;g&quot;��&quot;i&quot; �� &quot;m&quot;���ֱ�����ָ��ȫ��ƥ�䡢���ִ�Сд��ƥ��Ͷ���ƥ�䡣ECMAScript ��׼��֮ǰ����֧�� m ���ԡ���� <i>pattern</i> ���������ʽ���������ַ����������ʡ�Ըò�����</p>

<h3>����ֵ</h3>

<p>һ���µ� RegExp ���󣬾���ָ����ģʽ�ͱ�־��������� <i>pattern</i> ���������ʽ�������ַ�������ô RegExp() ���캯��������ָ���� RegExp ��ͬ��ģʽ�ͱ�־����һ���µ� RegExp ����</p>
<p>������� new ����������� RegExp() ��Ϊ�������ã���ô������Ϊ���� new ���������ʱһ����ֻ�ǵ� <i>pattern</i> ���������ʽʱ����ֻ���� <i>pattern</i>�������ٴ���һ���µ� RegExp ����</p>

<h3>�׳�</h3>

<p>SyntaxError - ��� <i>pattern</i> ���ǺϷ����������ʽ���� <i>attributes</i> ���� &quot;g&quot;��&quot;i&quot; �� &quot;m&quot; ֮����ַ����׳����쳣��</p>
<p>TypeError - ��� <i>pattern</i> �� RegExp ���󣬵�û��ʡ�� <i>attributes</i> �������׳����쳣��</p>
</div>


<div>
<h2>���η�</h2>

<table class="dataintable">
  <tr>
    <th style="width:20%">���η�</th>
    <th>����</th>
  </tr>
  <tr>
    <td><a href="jsref_regexp_i.asp">i</a></td>
    <td>ִ�жԴ�Сд�����е�ƥ�䡣</td>
  </tr>
  <tr>
    <td><a href="jsref_regexp_g.asp">g</a></td>
    <td>ִ��ȫ��ƥ�䣨��������ƥ��������ҵ���һ��ƥ���ֹͣ����</td>
  </tr>
  <tr>
    <td>m</td>
    <td>ִ�ж���ƥ�䡣</td>
  </tr>
</table>
</div>


<div>
<h2>������</h2>

<p>���������ڲ���ĳ����Χ�ڵ��ַ���</p>

<table class="dataintable">
  <tr>
    <th style="width:20%">����ʽ</th>
    <th>����</th>
  </tr>

  <tr>
    <td><a href="jsref_regexp_charset.asp">[abc]</a></td>
    <td>���ҷ�����֮����κ��ַ���</td>
  </tr>
  <tr>
    <td><a href="jsref_regexp_charset_not.asp">[^abc]</a></td>
    <td>�����κβ��ڷ�����֮����ַ���</td>
  </tr>
  <tr>
    <td>[0-9]</td>
    <td>�����κδ� 0 �� 9 �����֡�</td>
  </tr>
  <tr>
    <td>[a-z]</td>
    <td>�����κδ�Сд a ��Сд z ���ַ���</td>
  </tr>
  <tr>
    <td>[A-Z]</td>
    <td>�����κδӴ�д A ����д Z ���ַ���</td>
  </tr>
  <tr>
    <td>[A-z]</td>
    <td>�����κδӴ�д A ��Сд z ���ַ���</td>
  </tr>
	<tr>
    <td>[adgk]</td>
    <td>���Ҹ��������ڵ��κ��ַ���</td>
  </tr>
  <tr>
    <td>[^adgk]</td>
    <td>���Ҹ�����������κ��ַ���</td>
  </tr>
	<tr>
    <td>(red|blue|green)</td>
    <td>�����κ�ָ����ѡ�</td>
  </tr>
</table>
</div>


<div>
<h2>Ԫ�ַ�</h2>

<p>Ԫ�ַ���Metacharacter����ӵ�����⺬����ַ���</p>

<table class="dataintable">
  <tr>
    <th style="width:20%">Ԫ�ַ�</th>
    <th>����</th>
  </tr>

  <tr>
    <td><a href="jsref_regexp_dot.asp">.</a></td>
    <td>���ҵ����ַ������˻��к��н�������</td>
  </tr>

  <tr>
    <td><a href="jsref_regexp_wordchar.asp">\w</a></td>
    <td>���ҵ����ַ���</td>
  </tr>
  <tr>
    <td><a href="jsref_regexp_wordchar_non.asp">\W</a></td>
    <td>���ҷǵ����ַ���</td>
  </tr>
  <tr>
    <td><a href="jsref_regexp_digit.asp">\d</a></td>
    <td>�������֡�</td>
  </tr>
  <tr>
    <td><a href="jsref_regexp_digit_non.asp">\D</a></td>
    <td>���ҷ������ַ���</td>
  </tr>
  <tr>
    <td><a href="jsref_regexp_whitespace.asp">\s</a></td>
    <td>���ҿհ��ַ���</td>
  </tr>
	<tr>
    <td><a href="jsref_regexp_whitespace_non.asp">\S</a></td>
    <td>���ҷǿհ��ַ���</td>
  </tr>
  <tr>
    <td><a href="jsref_regexp_begin.asp">\b</a></td>
    <td>����λ�ڵ��ʵĿ�ͷ���β��ƥ�䡣</td>
  </tr>
  <tr>
    <td><a href="jsref_regexp_begin_not.asp">\B</a></td>
    <td>���Ҳ����ڵ��ʵĿ�ͷ���β��ƥ�䡣</td>
  </tr>
  <tr>
    <td>\0</td>
    <td>���� NUL �ַ���</td>
  </tr>
  <tr>
    <td><a href="jsref_regexp_newline.asp">\n</a></td>
    <td>���һ��з���</td>
  </tr>
  <tr>
    <td>\f</td>
    <td>���һ�ҳ����</td>
  </tr>
  <tr>
    <td>\r</td>
    <td>���һس�����</td>
  </tr>
	<tr>
    <td>\t</td>
    <td>�����Ʊ�����</td>
  </tr>
  <tr>
    <td>\v</td>
    <td>���Ҵ�ֱ�Ʊ�����</td>
  </tr>
  <tr>
    <td><a href="jsref_regexp_octal.asp">\xxx</a></td>
    <td>�����԰˽����� xxx �涨���ַ���</td>
  </tr>
  <tr>
    <td><a href="jsref_regexp_hex.asp">\xdd</a></td>
    <td>������ʮ�������� dd �涨���ַ���</td>
  </tr>
  <tr>
    <td><a href="jsref_regexp_unicode_hex.asp">\uxxxx</a></td>
    <td>������ʮ�������� xxxx �涨�� Unicode �ַ���</td>
  </tr>
</table>
</div>


<div>
<h2>����</h2>

<table class="dataintable">
  <tr>
    <th style="width:20%">����</th>
    <th>����</th>
  </tr>
  <tr>
    <td><a href="jsref_regexp_onemore.asp">n+</a></td>
    <td>ƥ���κΰ�������һ�� n ���ַ�����</td>
  </tr>
  <tr>
    <td><a href="jsref_regexp_zeromore.asp">n*</a></td>
    <td>ƥ���κΰ���������� n ���ַ�����</td>
  </tr>
  <tr>
    <td><a href="jsref_regexp_zeroone.asp">n?</a></td>
    <td>ƥ���κΰ��������һ�� n ���ַ�����</td>
  </tr>
  <tr>
    <td><a href="jsref_regexp_nx.asp">n{X}</a></td>
    <td>ƥ����� X �� n �����е��ַ�����</td>
  </tr>
  <tr>
    <td><a href="jsref_regexp_nxy.asp">n{X,Y}</a></td>
    <td>ƥ����� X �� Y �� n �����е��ַ�����</td>
  </tr>
  <tr>
    <td><a href="jsref_regexp_nxcomma.asp">n{X,}</a></td>
    <td>ƥ��������� X �� n �����е��ַ�����</td>
  </tr>
  <tr>
    <td><a href="jsref_regexp_ndollar.asp">n$</a></td>
    <td>ƥ���κν�βΪ n ���ַ�����</td>
  </tr>
  <tr>
    <td><a href="jsref_regexp_ncaret.asp">^n</a></td>
    <td>ƥ���κο�ͷΪ n ���ַ�����</td>
  </tr>
  <tr>
    <td><a href="jsref_regexp_nfollow.asp">?=n</a></td>
    <td>ƥ���κ�������ָ���ַ��� n ���ַ�����</td>
  </tr>
  <tr>
    <td><a href="jsref_regexp_nfollow_not.asp">?!n</a></td>
    <td>ƥ���κ����û�н���ָ���ַ��� n ���ַ�����</td>
  </tr>
</table>
</div>


<div>
<h2>RegExp ��������</h2>

<p>FF: Firefox, IE: Internet Explorer</p>

<table class="dataintable">
  <tr>
    <th style="width:20%">����</th>
    <th style="width:66%">����</th>
    <th style="width:7%">FF</th>
    <th style="width:7%">IE</th>
  </tr>
  <tr>
    <td><a href="jsref_regexp_global.asp">global</a></td>
    <td>RegExp �����Ƿ���б�־ g��</td>
    <td>1</td>
    <td>4</td>
  </tr>
  <tr>
    <td><a href="jsref_regexp_ignorecase.asp">ignoreCase</a></td>
    <td>RegExp �����Ƿ���б�־ i��</td>
    <td>1</td>
    <td>4</td>
  </tr>
  <tr>
    <td><a href="jsref_lastindex_regexp.asp">lastIndex</a></td>
    <td>һ����������ʾ��ʼ��һ��ƥ����ַ�λ�á�</td>
    <td>1</td>
    <td>4</td>
  </tr>
  <tr>
    <td><a href="jsref_multiline_regexp.asp">multiline</a></td>
    <td>RegExp �����Ƿ���б�־ m��</td>
    <td>1</td>
    <td>4</td>
  </tr>
  <tr>
    <td><a href="jsref_source_regexp.asp">source</a></td>
    <td>�������ʽ��Դ�ı���</td>
    <td>1</td>
    <td>4</td>
  </tr>
</table>
</div>


<div>
<h2>RegExp ���󷽷�</h2>

<p>FF: Firefox, IE: Internet Explorer</p>

<table class="dataintable">
  <tr>
    <th style="width:20%">����</th>
    <th style="width:66%">����</th>
    <th style="width:7%">FF</th>
    <th style="width:7%">IE</th>
  </tr>
  <tr>
    <td><a href="jsref_regexp_compile.asp">compile</a></td>
    <td>�����������ʽ��</td>
    <td>1</td>
    <td>4</td>
  </tr>
  <tr>
    <td><a href="jsref_exec_regexp.asp">exec</a></td>
    <td>�����ַ�����ָ����ֵ�������ҵ���ֵ����ȷ����λ�á�</td>
    <td>1</td>
    <td>4</td>
  </tr>
  <tr>
    <td><a href="jsref_test_regexp.asp">test</a></td>
    <td>�����ַ�����ָ����ֵ������ true �� false��</td>
    <td>1</td>
    <td>4</td>
  </tr>
</table>
</div>



<div>
<h2>֧���������ʽ�� String ����ķ���</h2>

<p>FF: Firefox, IE: Internet Explorer</p>

<table class="dataintable">
  <tr>
    <th style="width:20%">����</th>
    <th style="width:66%">����</th>
    <th style="width:7%">FF</th>
    <th style="width:7%">IE</th>
  </tr>
  <tr>
    <td><a href="jsref_search.asp">search</a></td>
    <td>�������������ʽ��ƥ���ֵ��</td>
    <td>1</td>
    <td>4</td>
  </tr>
  <tr>
    <td><a href="jsref_match.asp">match</a></td>
    <td>�ҵ�һ�������������ʽ��ƥ�䡣</td>
    <td>1</td>
    <td>4</td>
  </tr>
  <tr>
    <td><a href="jsref_replace.asp">replace</a></td>
    <td>�滻���������ʽƥ����Ӵ���</td>
    <td>1</td>
    <td>4</td>
  </tr>
  <tr>
    <td><a href="jsref_split.asp">split</a></td>
    <td>���ַ����ָ�Ϊ�ַ������顣</td>
    <td>1</td>
    <td>4</td>
  </tr>
</table>
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
<h5 id="tools_reference"><a href="js_reference.asp">JavaScript �ο��ֲ�</a></h5>
<h5 id="tools_example"><a href="../example/jseg_examples.asp">JavaScript ʵ��</a></h5>
<h5 id="tools_quiz"><a href="js_quiz.asp">JavaScript ����</a></h5>
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