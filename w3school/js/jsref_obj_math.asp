
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

<title>JavaScript Math ����Ĳο��ֲ�</title>
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

<h1>JavaScript Math ����Ĳο��ֲ�</h1>


<div id="intro">
<h2>Math ����</h2>

<p>Math ��������ִ����ѧ����</p>

<h3>ʹ�� Math �����Ժͷ������﷨��</h3>
<pre>var pi_value=Math.PI;
var sqrt_value=Math.sqrt(15);</pre>

<p class="note"><span>ע�ͣ�</span>Math ���󲢲��� Date �� String �����Ƕ�����࣬���û�й��캯�� Math()���� Math.sin() �����ĺ���ֻ�Ǻ���������ĳ������ķ����������贴������ͨ���� Math ��Ϊ����ʹ�þͿ��Ե������������Ժͷ�����</p>
</div>


<div>
<h2>Math ��������</h2>

<p>FF: Firefox, IE: Internet Explorer</p>

<table class="dataintable">
  <tr>
    <th style="width:20%">����</th>
    <th style="width:66%">����</th>
    <th style="width:7%">FF</th>
    <th style="width:7%">IE</th>
  </tr>

  <tr>
    <td><a href="jsref_e.asp">E</a></td>
    <td>������������ e������Ȼ�����ĵ�����Լ����2.718����</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_ln2.asp">LN2</a></td>
    <td>���� 2 ����Ȼ������Լ����0.693����</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_ln10.asp">LN10</a></td>
    <td>���� 10 ����Ȼ������Լ����2.302����</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_log2e.asp">LOG2E</a></td>
    <td>������ 2 Ϊ�׵� e �Ķ�����Լ���� 1.414����</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_log10e.asp">LOG10E</a></td>
    <td>������ 10 Ϊ�׵� e �Ķ�����Լ����0.434����</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_pi.asp">PI</a></td>
    <td>����Բ���ʣ�Լ����3.14159����</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_sqrt1_2.asp">SQRT1_2</a></td>
    <td>���ط��� 2 ��ƽ�����ĵ�����Լ���� 0.707����</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_sqrt2.asp">SQRT2</a></td>
    <td>���� 2 ��ƽ������Լ���� 1.414����</td>
    <td>1</td>
    <td>3</td>
  </tr>
</table>
</div>


<div>
<h2>Math ���󷽷�</h2>

<p>FF: Firefox, IE: Internet Explorer</p>

<table class="dataintable">
  <tr>
    <th style="width:20%">����</th>
    <th style="width:66%">����</th>
    <th style="width:7%">FF</th>
    <th style="width:7%">IE</th>
  </tr>

  <tr>
    <td><a href="jsref_abs.asp">abs(x)</a></td>
    <td>�������ľ���ֵ��</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_acos.asp">acos(x)</a></td>
    <td>�������ķ�����ֵ��</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_asin.asp">asin(x)</a></td>
    <td>�������ķ�����ֵ��</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_atan.asp">atan(x)</a></td>
    <td>�Խ��� -PI/2 �� PI/2 ����֮�����ֵ������ x �ķ�����ֵ��</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_atan2.asp">atan2(y,x)</a></td>
    <td>���ش� x �ᵽ�� (x,y) �ĽǶȣ����� -PI/2 �� PI/2 ����֮�䣩��</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_ceil.asp">ceil(x)</a></td>
    <td>�������������롣</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_cos.asp">cos(x)</a></td>
    <td>�����������ҡ�</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_exp.asp">exp(x)</a></td>
    <td>���� e ��ָ����</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_floor.asp">floor(x)</a></td>
    <td>�������������롣</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_log.asp">log(x)</a></td>
    <td>����������Ȼ��������Ϊe����</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_max.asp">max(x,y)</a></td>
    <td>���� x �� y �е����ֵ��</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_min.asp">min(x,y)</a></td>
    <td>���� x �� y �е����ֵ��</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_pow.asp">pow(x,y)</a></td>
    <td>���� x �� y ���ݡ�</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_random.asp">random()</a></td>
    <td>���� 0 ~ 1 ֮����������</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_round.asp">round(x)</a></td>
    <td>������������Ϊ��ӽ���������</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_sin.asp">sin(x)</a></td>
    <td>�����������ҡ�</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_sqrt.asp">sqrt(x)</a></td>
    <td>��������ƽ������</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_tan.asp">tan(x)</a></td>
    <td>���ؽǵ����С�</td>
    <td>1</td>
    <td>3</td>
  </tr>

  <tr>
    <td><a href="jsref_tosource_math.asp">toSource()</a></td>
    <td>���ظö����Դ���롣</td>
    <td>1</td>
    <td>-</td>
  </tr>

  <tr>
    <td><a href="jsref_valueof_math.asp">valueOf()</a></td>
    <td>���� Math �����ԭʼֵ��</td>
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