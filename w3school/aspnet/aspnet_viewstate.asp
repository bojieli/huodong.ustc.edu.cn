
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

<title>ASP.NET - ά�� ViewState</title>
</head>

<body class="dotnet">
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
<h2>ASP.NET �̳�</h2>
<ul>
<li><a href="index.asp" title="ASP.NET�̳�">ASP.NET ��ҳ</a></li>
<li><a href="aspnet_intro.asp" title="ASP.NET ���">ASP.NET ���</a></li>
<li><a href="aspnet_vsasp.asp" title="ASP �� ASP.NET ֮��Ĳ���">ASP.NET vs ASP</a></li>
<li><a href="aspnet_install.asp" title="ASP.NET ��װ">ASP.NET ��װ</a></li>
<li><a href="aspnet_pages.asp" title="ASP.NET - Web ҳ��">ASP.NET ҳ��</a></li>
<li><a href="aspnet_controls.asp" title="ASP.NET - �������ؼ�">ASP.NET �ؼ�</a></li>
<li><a href="aspnet_events.asp" title="ASP.NET - �¼�">ASP.NET �¼�</a></li>
</ul>

<h2>ASP.NET ����</h2>
<ul>
<li><a href="aspnet_forms.asp" title="ASP.NET Web ����">ASP.NET ����</a></li>
<li><a href="aspnet_viewstate.asp" title="ASP.NET - ά�� ViewState">ASP.NET ViewState</a></li>
<li><a href="aspnet_textbox.asp" title="ASP .NET - TextBox �ؼ�">asp:TextBox</a></li>
<li><a href="aspnet_button.asp" title="ASP.NET - Button �ؼ�">asp:Button</a></li>
</ul>

<h2>ASP.NET ��</h2>
<ul>
<li><a href="aspnet_databinding.asp" title="ASP.NET - ���ݰ�">���ݰ�</a></li>
<li><a href="aspnet_arraylist.asp" title="ASP NET - ArrayList ����">ArrayList</a></li>
<li><a href="aspnet_hashtable.asp" title="ASP.NET - Hashtable ����">Hashtable</a></li>
<li><a href="aspnet_sortedlist.asp" title="ASP.NET - SortedList ����">SortedList</a></li>
<li><a href="aspnet_xml.asp" title="ASP .NET - XML �ļ�">XML �ļ�</a></li>
<li><a href="aspnet_repeater.asp" title="ASP.NET - Repeater �ؼ�">asp:Repeater</a></li>
<li><a href="aspnet_datalist.asp" title="ASP.NET - DataList �ؼ�">asp:DataList</a></li>
</ul>

<h2>ASP.NET ���ݿ�</h2>
<ul>
<li><a href="aspnet_dbconnection.asp" title="ASP.NET - ���ݿ�����">���ݿ�����</a></li>
</ul>

<h2>ASP.NET 2.0</h2>
<ul>
<li><a href="aspnet_newfeatures.asp" title="ASP.NET 2.0 - ������">2.0 ������</a></li>
<li><a href="aspnet_masterpages.asp" title="ASP.NET 2.0 - ĸ��ҳ��Master Pages��">2.0 ĸ��ҳ</a></li>
<li><a href="aspnet_navigation.asp" title="ASP.NET 2.0 - ������Navigation��">2.0 ����</a></li>
</ul>

<h2>�ο��ֲ�</h2>
<ul>
<li><a href="aspnet_refhtmlcontrols.asp" title="HTML �������ؼ�">HTML �ؼ�</a></li>
<li><a href="aspnet_refwebcontrols.asp" title="Web �������ؼ�">Web �ؼ�</a></li>
<li><a href="aspnet_refvalidationcontrols.asp" title="Validation �������ؼ�">Validation �ؼ�</a></li>
</ul>

<h2>ʵ��</h2>
<ul>
<li>ASP.NET ʵ��</li>
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

<h1>ASP.NET - ά�� ViewState</h1>

<div id="tpn">
<ul class="prenext">

<li class="pre"><a href="aspnet_forms.asp">Previous Page</a></li>

<li class="next"><a href="aspnet_textbox.asp">Next Page</a></li>
</ul>

</div>


<div id="intro">
<p><strong>ͨ���� Web ������ά�ֶ���� ViewState ����ͼ״̬����������ʡȥ�����ı��빤����</strong></p>
</div>


<div>
<h2>ά�� ViewState ����ͼ״̬��</h2>

<p>�� classic ASP �еı������ύʱ�����еı���ֵ���ᱻ��ա�����һ�£����ύ��һ�Ŵ��д�����Ϣ�ı�������������������һ�������������ò����ر�����Ȼ��������е���Ϣ����������˰�ť��Ȼ��ᷢ��ʲô��... ���еı���ֵ��������ˣ����������ò����¿�ʼ���е�һ�С�վ�㲻��ά������ ViewState��</p>

<p>�� ASP .NET �еı������ύʱ�������������б���ֵһͬ���³��֡�����������أ��������� ASP .NET ά�������� ViewState��ViewState ����ҳ�汻�ύ��������ʱָʾ��״̬��ͨ����ÿ��ҳ���е�һ�� &lt;form runat=&quot;server&quot;&gt; �ؼ��з���һ�����������ǾͿ��Զ���ҳ���״̬�ˡ�Դ�����������������</p>

<pre>&lt;form name=&quot;_ctl0&quot; method=&quot;post&quot; action=&quot;page.aspx&quot; id=&quot;_ctl0&quot;&gt;
&lt;input type=&quot;hidden&quot; name=&quot;__VIEWSTATE&quot;
value=&quot;dDwtNTI0ODU5MDE1Ozs+ZBCF2ryjMpeVgUrY2eTj79HNl4Q=&quot; /&gt;

<span>.....some code</span>

&lt;/form&gt;</pre>

<p>ά�� ViewState �� ASP.NET Web ������Ĭ�����á��������ϣ��ά�� ViewState������ .aspx ҳ��Ķ�������ָ� &lt;%@ Page EnableViewState=&quot;false&quot; %&gt;����Ϊ����ؼ��������ԣ�EnableViewState=&quot;false&quot;��</p>

<p>�뿴����� .aspx �ļ�������ʾ���ϵ����з�ʽ�����������ύ��ťʱ������ֵ�ͻ���ʧ��</p>

<pre>&lt;html&gt;
&lt;body&gt;

&lt;form action=&quot;demo_classicasp.aspx&quot; method=&quot;post&quot;&gt;
Your name: &lt;input type=&quot;text&quot; name=&quot;fname&quot; size=&quot;20&quot;&gt;
&lt;input type=&quot;submit&quot; value=&quot;Submit&quot;&gt;
&lt;/form&gt;
&lt;%
dim fname
fname=Request.Form(&quot;fname&quot;)
If fname&lt;&gt;&quot;&quot; Then
Response.Write(&quot;Hello &quot; &amp; fname &amp; &quot;!&quot;)
End If
%&gt;

&lt;/body&gt;
&lt;/html&gt;</pre>

<p><a href="../tiy/s.asp@f=demo_aspnet_viewstate_classicasp">��ʾ�������</a></p>

<p>�����µ� ASP .NET ��ʽ����������ύ��ťʱ������ֵ������ʧ��</p>

<pre>&lt;script runat=&quot;server&quot;&gt;
Sub submit(sender As Object, e As EventArgs)
lbl1.Text=&quot;Hello &quot; &amp; txt1.Text &amp; &quot;!&quot;
End Sub
&lt;/script&gt;

&lt;html&gt;
&lt;body&gt;

&lt;form runat=&quot;server&quot;&gt;
Your name: &lt;asp:TextBox id=&quot;txt1&quot; runat=&quot;server&quot; /&gt;
&lt;asp:Button OnClick=&quot;submit&quot; Text=&quot;Submit&quot; runat=&quot;server&quot; /&gt;
&lt;p&gt;&lt;asp:Label id=&quot;lbl1&quot; runat=&quot;server&quot; /&gt;&lt;/p&gt;
&lt;/form&gt;

&lt;/body&gt;
&lt;/html&gt;</pre>

<p><a href="../tiy/s.asp@f=demo_aspnet_button">��ʾ�������</a> �������ұߵĿ���е�����鿴ԭ�ĵ����������Կ��� ASP .NET �Ѿ��������������һ�������������Ϳ���ά�� ViewState����</p>
</div>


<div id="bpn">
<ul class="prenext">

<li class="pre"><a href="aspnet_forms.asp">Previous Page</a></li>

<li class="next"><a href="aspnet_textbox.asp">Next Page</a></li>
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
<h5 id="tools_reference"><a href="aspnet_reference.asp">ASP.NET �ο��ֲ�</a></h5>
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