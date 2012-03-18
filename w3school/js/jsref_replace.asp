
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

<title>JavaScript replace() ����</title>
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

<h1>JavaScript replace() ����</h1>

<div class="backtoreference">
<p><a href="jsref_obj_string.asp" title="JavaScript String ����ο��ֲ�">JavaScript String ����ο��ֲ�</a></p>
</div>


<div>
<h2>������÷�</h2>

<p>replace() �����������ַ�������һЩ�ַ��滻��һЩ�ַ������滻һ�����������ʽƥ����Ӵ���</p>

<h3>�﷨</h3>
<pre>stringObject.replace(<i>regexp/substr</i>,<i>replacement</i>)</pre>

<table class="dataintable"> 
  <tr>
    <th>����</th>
    <th>����</th>
  </tr>  
  <tr>
    <td>regexp/substr</td>
    <td>
	<p>���衣�涨���ַ�����Ҫ�滻��ģʽ�� RegExp ����</p>
	<p>��ע�⣬�����ֵ��һ���ַ�����������ΪҪ������ֱ�����ı�ģʽ�����������ȱ�ת��Ϊ RegExp ����</p>
	</td>
  </tr>
  <tr>
    <td>replacement</td>
    <td>���衣һ���ַ���ֵ���涨���滻�ı��������滻�ı��ĺ�����</td>
  </tr>
</table>

<h3>����ֵ</h3>
<p>һ���µ��ַ��������� <i>replacement</i> �滻�� regexp �ĵ�һ��ƥ�������ƥ��֮��õ��ġ�</p>

<h3>˵��</h3>
<p>�ַ��� stringObject �� replace() ����ִ�е��ǲ��Ҳ��滻�Ĳ����������� stringObject �в����� regexp ��ƥ������ַ�����Ȼ���� <i>replacement</i> ���滻��Щ�Ӵ������ regexp ����ȫ�ֱ�־ g����ô replace() �������滻����ƥ����Ӵ���������ֻ�滻��һ��ƥ���Ӵ���</p>

<p><i>replacement</i> �������ַ�����Ҳ�����Ǻ�������������ַ�������ôÿ��ƥ�䶼�����ַ����滻������ replacement �е� $ �ַ������ض��ĺ��塣���±���ʾ����˵����ģʽƥ��õ����ַ����������滻��</p>

<table class="dataintable">
<tr>
<th>�ַ�</th>
<th>�滻�ı�</th>
</tr>

<tr>
<td>$1��$2��...��$99</td>
<td>�� regexp �еĵ� 1 ���� 99 ���ӱ���ʽ��ƥ����ı���</td>
</tr>

<tr>
<td>$&amp;</td>
<td>�� regexp ��ƥ����Ӵ���</td>
</tr>

<tr>
<td>$`</td>
<td>λ��ƥ���Ӵ������ı���</td>
</tr>

<tr>
<td>$'</td>
<td>λ��ƥ���Ӵ��Ҳ���ı���</td>
</tr>

<tr>
<td>$$</td>
<td>ֱ�������š�</td>
</tr>
</table>

<p class="important"><span>ע�⣺</span>ECMAScript v3 �涨��replace() �����Ĳ��� replacement �����Ǻ����������ַ���������������£�ÿ��ƥ�䶼���øú����������ص��ַ�������Ϊ�滻�ı�ʹ�á��ú����ĵ�һ��������ƥ��ģʽ���ַ������������Ĳ�������ģʽ�е��ӱ���ʽƥ����ַ����������� 0 �����������Ĳ������������Ĳ�����һ��������������ƥ���� stringObject �г��ֵ�λ�á����һ�������� stringObject ������</p>
</div>


<div>
<h2>ʵ��</h2>

<h3>���� 1</h3>

<p>�ڱ����У����ǽ�ʹ�� &quot;W3School&quot; �滻�ַ����е� &quot;Microsoft&quot;��</p>
<pre>&lt;script type=&quot;text/javascript&quot;&gt;

var str=&quot;Visit Microsoft!&quot;
document.write(<code>str.replace(/Microsoft/, &quot;W3School&quot;)</code>)

&lt;/script&gt;</pre>
<p>�����</p>
<pre>Visit W3School!</pre>

<h3>���� 2</h3>

<p>�ڱ����У����ǽ�ִ��һ��ȫ���滻��ÿ�� &quot;Microsoft&quot; ���ҵ������ͱ��滻Ϊ &quot;W3School&quot;��</p>
<pre>&lt;script type=&quot;text/javascript&quot;&gt;

var str=&quot;Welcome to Microsoft! &quot;
str=str + &quot;We are proud to announce that Microsoft has &quot;
str=str + &quot;one of the largest Web Developers sites in the world.&quot;

document.write(<code>str.replace(/Microsoft/g, &quot;W3School&quot;)</code>)

&lt;/script&gt;</pre>

<p>�����</p>
<pre>Welcome to W3School! We are proud to announce that W3School
has one of the largest Web Developers sites in the world.</pre>

<h3>���� 3</h3>

<p>������ʹ�ñ����ṩ�Ĵ�����ȷ��ƥ���ַ�����д�ַ�����ȷ��</p>
<pre>
text = &quot;javascript Tutorial&quot;;
text.replace(/javascript/i, &quot;JavaScript&quot;);
</pre>

<h3>���� 4</h3>

<p>�ڱ����У����ǽ��� &quot;Doe, John&quot; ת��Ϊ &quot;John Doe&quot; ����ʽ��</p>
<pre>name = &quot;Doe, John&quot;;
name.replace(/(\w+)\s*, \s*(\w+)/, &quot;$2 $1&quot;);</pre>

<h3>���� 5</h3>

<p>�ڱ����У����ǽ������еĻ������滻Ϊֱ���ţ�</p>

<pre>name = '&quot;a&quot;, &quot;b&quot;';
name.replace(/&quot;([^&quot;]*)&quot;/g, &quot;'$1'&quot;);</pre>

<h3>���� 6</h3>

<p>�ڱ����У����ǽ����ַ��������е��ʵ�����ĸ��ת��Ϊ��д��</p>

<pre>
name = 'aaa bbb ccc';
uw=name.replace(/\b\w+\b/g, function(word){
  return word.substring(0,1).toUpperCase()+word.substring(1);}
  );</pre>
</div>


<div class="example">
<h2>TIY</h2>
<dl>
<dt><a href="../tiy/t.asp@f=jseg_replace_1">replace() 1</a></dt>
<dd>���ʹ�� replace() ���滻�ַ����е��ַ���</dd>

<dt><a href="../tiy/t.asp@f=jseg_replace_2">replace() 2 - ȫ������</a></dt>
<dd>���ʹ�� replace() ����ȫ���滻��</dd>

<dt><a href="../tiy/t.asp@f=jseg_replace_3">replace() 3 - �Դ�Сд�����е�����</a></dt>
<dd>���ʹ�� replace() ȷ����д��ĸ����ȷ�ԡ�</dd>

<dt><a href="../tiy/t.asp@f=jseg_replace_4">replace() 4</a></dt>
<dd>���ʹ�� replace() ��ת�������ĸ�ʽ��</dd>

<dt><a href="../tiy/t.asp@f=jseg_replace_5">replace() 5</a></dt>
<dd>���ʹ�� replace() ��ת�����š�</dd>

<dt><a href="../tiy/t.asp@f=jseg_replace_6">replace() 6</a></dt>
<dd>���ʹ�� replace() �ѵ��ʵ�����ĸת��Ϊ��д��</dd>
</dl>
</div>


<div class="backtoreference">
<p><a href="jsref_obj_string.asp" title="JavaScript String ����ο��ֲ�">JavaScript String ����ο��ֲ�</a></p>
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