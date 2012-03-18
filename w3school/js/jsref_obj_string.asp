
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

<title>JavaScript String ����ο��ֲ�</title>
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

<h1>JavaScript String ����ο��ֲ�</h1>


<div>
<h2>String ����</h2>
<p>String �������ڴ����ı����ַ�������</p>

<h3>���� String ������﷨��</h3>
<pre>new String(<i>s</i>);
String(<i>s</i>);</pre>

<h3>����</h3>
<p>���� <i>s</i> ��Ҫ�洢�� String �����л�ת����ԭʼ�ַ�����ֵ��</p>

<h3>����ֵ</h3>
<p>�� String() ������� new һ����Ϊ���캯��ʹ��ʱ��������һ���´����� String ���󣬴�ŵ����ַ��� <i>s</i> �� <i>s</i> ���ַ�����ʾ��</p>
<p>������ new ��������� String() ʱ����ֻ�� <i>s</i> ת����ԭʼ���ַ�����������ת�����ֵ��</p>
</div>


<div>
<h2>String ��������</h2>

<p>FF: Firefox, IE: Internet Explorer</p>

<table class="dataintable">
  <tr>
    <th style="width:25%">����</th>
    <th style="width:61%">����</th>
    <th style="width:7%">FF</th>
    <th style="width:7%">IE</th>
  </tr>
  <tr>
    <td>constructor</td>
    <td>�Դ����ö���ĺ���������</td>
    <td>1</td>
    <td>4</td>
  </tr>
  <tr>
    <td><a href="jsref_length_string.asp">length</a></td>
    <td>�ַ����ĳ���</td>
    <td>1</td>
    <td>3</td>
  </tr>
  <tr>
    <td>prototype</td>
    <td>������������������Ժͷ���</td>
    <td>1</td>
    <td>4</td>
  </tr>
</table>
</div>


<div>
<h2>String ���󷽷�</h2>

<p>FF: Firefox, IE: Internet Explorer</p>

<table class="dataintable">
  <tr>
    <th style="width:25%">����</th>
    <th style="width:61%">����</th>
    <th style="width:7%">FF</th>
    <th style="width:7%">IE</th>
  </tr>
  <tr>
    <td><a href="jsref_anchor.asp">anchor()</a></td>
    <td>���� HTML ê��</td>
    <td>1</td>
    <td>3</td>
  </tr>
  <tr>
    <td><a href="jsref_big.asp">big()</a></td>
    <td>�ô��������ʾ�ַ�����</td>
    <td>1</td>
    <td>3</td>
  </tr>
  <tr>
    <td><a href="jsref_blink.asp">blink()</a></td>
    <td>��ʾ�����ַ�����</td>
    <td>1</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><a href="jsref_bold.asp">bold()</a></td>
    <td>ʹ�ô�����ʾ�ַ�����</td>
    <td>1</td>
    <td>3</td>
  </tr>
  <tr>
    <td><a href="jsref_charAt.asp">charAt()</a></td>
    <td>������ָ��λ�õ��ַ���</td>
    <td>1</td>
    <td>3</td>
  </tr>
  <tr>
    <td><a href="jsref_charCodeAt.asp">charCodeAt()</a></td>
    <td>������ָ����λ�õ��ַ��� Unicode ���롣</td>
    <td>1</td>
    <td>4</td>
  </tr>
  <tr>
    <td><a href="jsref_concat_string.asp">concat()</a></td>
    <td>�����ַ�����</td>
    <td>1</td>
    <td>4</td>
  </tr>
  <tr>
    <td><a href="jsref_fixed.asp">fixed()</a></td>
    <td>�Դ��ֻ��ı���ʾ�ַ�����</td>
    <td>1</td>
    <td>3</td>
  </tr>
  <tr>
    <td><a href="jsref_fontcolor.asp">fontcolor()</a></td>
    <td>ʹ��ָ������ɫ����ʾ�ַ�����</td>
    <td>1</td>
    <td>3</td>
  </tr>
  <tr>
    <td><a href="jsref_fontsize.asp">fontsize()</a></td>
    <td>ʹ��ָ���ĳߴ�����ʾ�ַ�����</td>
    <td>1</td>
    <td>3</td>
  </tr>
  <tr>
    <td class="no_wrap"><a href="jsref_fromCharCode.asp">fromCharCode()</a></td>
    <td>���ַ����봴��һ���ַ�����</td>
    <td>1</td>
    <td>4</td>
  </tr>
  <tr>
    <td><a href="jsref_indexOf.asp">indexOf()</a></td>
    <td>�����ַ�����</td>
    <td>1</td>
    <td>3</td>
  </tr>
  <tr>
    <td><a href="jsref_italics.asp">italics()</a></td>
    <td>ʹ��б����ʾ�ַ�����</td>
    <td>1</td>
    <td>3</td>
  </tr>
  <tr>
    <td><a href="jsref_lastIndexOf.asp">lastIndexOf()</a></td>
    <td>�Ӻ���ǰ�����ַ�����</td>
    <td>1</td>
    <td>3</td>
  </tr>
  <tr>
    <td><a href="jsref_link.asp">link()</a></td>
    <td>���ַ�����ʾΪ���ӡ�</td>
    <td>1</td>
    <td>3</td>
  </tr>
  <tr>
    <td><a href="jsref_localeCompare.asp">localeCompare()</a></td>
    <td>�ñ����ض���˳�����Ƚ������ַ�����</td>
    <td>1</td>
    <td>4</td>
  </tr>
  <tr>
    <td><a href="jsref_match.asp">match()</a></td>
    <td>�ҵ�һ���������ڱ���ʽ��ƥ�䡣</td>
    <td>1</td>
    <td>4</td>
  </tr>
  <tr>
    <td><a href="jsref_replace.asp">replace()</a></td>
    <td>�滻���������ʽƥ����Ӵ���</td>
    <td>1</td>
    <td>4</td>
  </tr>
  <tr>
    <td><a href="jsref_search.asp">search()</a></td>
    <td>�������������ʽ��ƥ���ֵ��</td>
    <td>1</td>
    <td>4</td>
  </tr>
  <tr>
    <td><a href="jsref_slice_string.asp">slice()</a></td>
    <td>��ȡ�ַ�����Ƭ�ϣ������µ��ַ����з��ر���ȡ�Ĳ��֡�</td>
    <td>1</td>
    <td>4</td>
  </tr>
  <tr>
    <td><a href="jsref_small.asp">small()</a></td>
    <td>ʹ��С�ֺ�����ʾ�ַ�����</td>
    <td>1</td>
    <td>3</td>
  </tr>
  <tr>
    <td><a href="jsref_split.asp">split()</a></td>
    <td>���ַ����ָ�Ϊ�ַ������顣</td>
    <td>1</td>
    <td>4</td>
  </tr>
  <tr>
    <td><a href="jsref_strike.asp">strike()</a></td>
    <td>ʹ��ɾ��������ʾ�ַ�����</td>
    <td>1</td>
    <td>3</td>
  </tr>
  <tr>
    <td><a href="jsref_sub.asp">sub()</a></td>
    <td>���ַ�����ʾΪ�±ꡣ</td>
    <td>1</td>
    <td>3</td>
  </tr>
  <tr>
    <td><a href="jsref_substr.asp">substr()</a></td>
    <td>����ʼ��������ȡ�ַ�����ָ����Ŀ���ַ���</td>
    <td>1</td>
    <td>4</td>
  </tr>
  <tr>
    <td><a href="jsref_substring.asp">substring()</a></td>
    <td>��ȡ�ַ���������ָ����������֮����ַ���</td>
    <td>1</td>
    <td>3</td>
  </tr>
  <tr>
    <td><a href="jsref_sup.asp">sup()</a></td>
    <td>���ַ�����ʾΪ�ϱꡣ</td>
    <td>1</td>
    <td>3</td>
  </tr>
  <tr>
    <td class="no_wrap"><a href="jsref_toLocaleLowerCase.asp">toLocaleLowerCase()</a></td>
    <td>���ַ���ת��ΪСд��</td>
    <td>-</td>
    <td>-</td>
  </tr>
  <tr>
    <td class="no_wrap"><a href="jsref_toLocaleUpperCase.asp">toLocaleUpperCase()</a></td>
    <td>���ַ���ת��Ϊ��д��</td>
    <td>-</td>
    <td>-</td>
  </tr>
  <tr>
    <td><a href="jsref_toLowerCase.asp">toLowerCase()</a></td>
    <td>���ַ���ת��ΪСд��</td>
    <td>1</td>
    <td>3</td>
  </tr>
  <tr>
    <td><a href="jsref_toUpperCase.asp">toUpperCase()</a></td>
    <td>���ַ���ת��Ϊ��д��</td>
    <td>1</td>
    <td>3</td>
  </tr>
  <tr>
    <td>toSource()</td>
    <td>���������Դ���롣</td>
    <td>1</td>
    <td>-</td>
  </tr>
  <tr>
    <td><a href="jsref_toString_string.asp">toString()</a></td>
    <td>�����ַ�����</td>
    <td>-</td>
    <td>-</td>
  </tr>
  <tr>
    <td><a href="jsref_valueOf_string.asp">valueOf()</a></td>
    <td>����ĳ���ַ��������ԭʼֵ��</td>
    <td>1</td>
    <td>4</td>
  </tr>
  </table>
</div>


<div>
<h2>String ��������</h2>

<p>�ַ����� JavaScript ��һ�ֻ������������͡�</p>

<p>String ����� length ���������˸��ַ����е��ַ�����</p>

<p>String �ඨ���˴��������ַ����ķ�����������ַ�������ȡ�ַ����Ӵ������߼����ַ����Ӵ���</p>

<p>��Ҫע����ǣ�JavaScript ���ַ����ǲ��ɱ�ģ�immutable����String �ඨ��ķ��������ܸı��ַ��������ݡ��� String.toUpperCase() �����ķ��������ص���ȫ�µ��ַ������������޸�ԭʼ�ַ�����</p>

<p>�ڽ���� Netscape ������� JavaScript ʵ���У����� Firefox ʵ���У����ַ�������Ϊ����ֻ�����ַ����顣���磬���ַ��� s ����ȡ�������ַ��������� s[2] ������ӱ�׼�� s.charAt(2)�����⣬���ַ���Ӧ�� for/in ѭ��ʱ������ö���ַ�����ÿ���ַ��������±꣨��Ҫע�⣬ECMAScript ��׼�涨������ö�� length ���ԣ�����Ϊ�ַ�����������Ϊ����׼������Ӧ�ñ���ʹ������</p>
</div>


<div id="toc">
<h2>������</h2>

<p>���������Ϣ�����Ķ� JavaScript �߼��̳��е�������ݣ�</p>

<dl>
<dt><a href="pro_js_referencetypes.asp" title="ECMAScript ��������">ECMAScript ��������</a></dt>
<dd>��������ͨ�������ࣨclass������󡣱��ڽ��� ECMAScript ��Ԥ�����������͡�</dd>
</dl>
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