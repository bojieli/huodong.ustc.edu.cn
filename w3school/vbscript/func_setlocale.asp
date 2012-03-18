
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

<title>VBScript SetLocale 函数</title>
</head>

<body class="browserscripting">
<div id="wrapper">

<div id="header">
<a href="../index.html" title="w3school 在线教程" style="float:left;">w3school 在线教程</a>
<div id="ad_head">
<script type="text/javascript"><!--
google_ad_client = "pub-3381531532877742";
/* 728x90, 创建于 08-12-1 */
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
<li id="h"><a href="../h.asp" title="HTML 系列教程">HTML教程</a></li>
<li id="x"><a href="../x.asp" title="XML 系列教程">XML教程</a></li>
<li id="b"><a href="../b.asp" title="浏览器脚本系列教程">浏览器脚本</a></li>
<li id="s"><a href="../s.asp" title="服务器脚本系列教程">服务器脚本</a></li>
<li id="d"><a href="../d.asp" title=".NET (dotnet) 教程">dot net教程</a></li>
<li id="m"><a href="../m.asp" title="多媒体系列教程">多媒体教程</a></li>
<li id="w"><a href="../w.asp" title="网站构建手册">建站手册</a></li>
</ul>
</div><div id="navsecond">

<div id="course">
<h2>VBScript 教程</h2>
<ul>
<li><a href="index.asp" title="VBScript 教程">VB 教程</a></li>
<li><a href="vbscript_intro.asp" title="VBScript简介">VB 简介</a></li>
<li><a href="vbscript_howto.asp" title="VBScript How to">VB How to</a></li>
<li><a href="vbscript_whereto.asp" title="VBScript Where to">VB Where to</a></li>
<li><a href="vbscript_variables.asp" title="VBScript变量">VB 变量</a></li>
<li><a href="vbscript_procedures.asp" title="VBScript程序">VB 程序</a></li>
<li><a href="vbscript_conditionals.asp" title="VBScript条件语句">VB 条件语句</a></li>
<li><a href="vbscript_looping.asp" title="VBScript循环语句">VB 循环语句</a></li>
<li><a href="vbscript_summary.asp" title="您已经学习了VBScript，下一步呢？">VB 总结</a></li>
</ul>

<h2>实例</h2>
<ul>
<li><a href="../example/vbst_examples.asp" title="VBScript实例">VB 实例</a></li>
</ul>

<h2>参考手册</h2>
<ul>
<li><a href="vbscript_ref_functions.asp" title="VBScript函数">VB 函数</a></li>
<li><a href="vbscript_ref_keywords.asp" title="VBScript关键字">VB 关键字</a></li>
</ul>
</div>

<div id="selected">
<h2>建站手册</h2>
<ul>
<li><a href="../site/index.asp" title="网站构建">网站构建</a></li>
<li><a href="../w3c/index.asp" title="万维网联盟 (W3C)">万维网联盟 (W3C)</a></li>
<li><a href="../browsers/index.asp" title="浏览器信息">浏览器信息</a></li>
<li><a href="../quality/index.asp" title="网站品质">网站品质</a></li>
<li><a href="../semweb/index.asp" title="语义网">语义网</a></li>
<li><a href="../careers/index.asp" title="职业规划">职业规划</a></li>
<li><a href="../hosting/index.asp" title="网站主机">网站主机</a></li>
</ul>

<h2><a href="../about/index.asp" title="关于 W3School" id="link_about">关于 W3School</a></h2>
<h2><a href="../about/about_helping.asp" title="帮助 W3School" id="link_help">帮助 W3School</a></h2>

</div>

</div>

<div id="maincontent">

<h1>VBScript SetLocale 函数</h1>

<div class="backtoreference">
<p><a href="vbscript_ref_functions.asp" title="VBScript 函数">VBScript 函数参考手册</a></p>
</div>

<div>
<h2>定义和用法</h2>
<p>SetLocale 函数可设置 locale ID，并返回之前的 locale ID。</p>
<p>locale 是用户参考信息集合，比如用户的语言、国家和文化传统。locale 可决定键盘布局、字母排序顺序和日期、时间、数字与货币格式等等。</p>

<h3>语法</h3>
<pre>SetLocale(lcid)</pre>

<table class="dataintable">
  <tr>
    <th>参数</th>
    <th>描述</th>
  </tr>  
  <tr>
    <td>lcid</td>
    <td>必需的。任意一个在 <a href="func_setlocale.asp#localeid">Locale ID 表</a> 中的短字符串、十六进制值、十进制值，该值必须唯一标识一个地理区域。如果 lcid 参数被设置为 0 ，则 locale 将由系统设置。</td>
  </tr>
</table>
</div>

<div>
<h2>实例</h2>
<pre>document.write(SetLocale(2057))
document.write(SetLocale(2058))</pre>
<p>输出：</p>
<pre>
1033
2057
</pre>
</div>

<div>
<h2><a id="localeid">Locale ID 表</a></h2>
<table class="dataintable"> 
    <tr>
      <th>Locale 描述</th>
      <th>简写</th>
      <th>十六进制值</th>
      <th>十进制值</th>
    </tr>
    <tr>
      <td>Afrikaans</td>
      <td>af</td>
      <td>0x0436 </td>
      <td>1078</td>
    </tr>
    <tr>
      <td>Albanian</td>
      <td>sq</td>
      <td>0x041C </td>
      <td>1052</td>
    </tr>
    <tr>
      <td>Arabic ?United Arab Emirates</td>
      <td>ar-ae</td>
      <td>0x3801 </td>
      <td>14337</td>
    </tr>
    <tr>
      <td>Arabic - Bahrain</td>
      <td>ar-bh</td>
      <td>0x3C01 </td>
      <td>15361</td>
    </tr>
    <tr>
      <td>Arabic - Algeria</td>
      <td>ar-dz</td>
      <td>0x1401 </td>
      <td>5121</td>
    </tr>
    <tr>
      <td>Arabic - Egypt</td>
      <td>ar-eg</td>
      <td>0x0C01 </td>
      <td>3073</td>
    </tr>
    <tr>
      <td>Arabic - Iraq</td>
      <td>ar-iq</td>
      <td>0x0801 </td>
      <td>2049</td>
    </tr>
    <tr>
      <td>Arabic - Jordan</td>
      <td>ar-jo</td>
      <td>0x2C01 </td>
      <td>11265</td>
    </tr>
    <tr>
      <td>Arabic - Kuwait</td>
      <td>ar-kw</td>
      <td>0x3401 </td>
      <td>13313</td>
    </tr>
    <tr>
      <td>Arabic - Lebanon</td>
      <td>ar-lb</td>
      <td>0x3001 </td>
      <td>12289</td>
    </tr>
    <tr>
      <td>Arabic - Libya</td>
      <td>ar-ly</td>
      <td>0x1001 </td>
      <td>4097</td>
    </tr>
    <tr>
      <td>Arabic - Morocco</td>
      <td>ar-ma</td>
      <td>0x1801 </td>
      <td>6145</td>
    </tr>
    <tr>
      <td>Arabic - Oman</td>
      <td>ar-om</td>
      <td>0x2001 </td>
      <td>8193</td>
    </tr>
    <tr>
      <td>Arabic - Qatar</td>
      <td>ar-qa</td>
      <td>0x4001 </td>
      <td>16385</td>
    </tr>
    <tr>
      <td>Arabic - Saudi Arabia</td>
      <td>ar-sa</td>
      <td>0x0401 </td>
      <td>1025</td>
    </tr>
    <tr>
      <td>Arabic - Syria</td>
      <td>ar-sy</td>
      <td>0x2801 </td>
      <td>10241</td>
    </tr>
    <tr>
      <td>Arabic - Tunisia</td>
      <td>ar-tn</td>
      <td>0x1C01 </td>
      <td>7169</td>
    </tr>
    <tr>
      <td>Arabic - Yemen</td>
      <td>ar-ye</td>
      <td>0x2401 </td>
      <td>9217</td>
    </tr>
    <tr>
      <td>Armenian</td>
      <td>hy</td>
      <td>0x042B</td>
      <td>1067</td>
    </tr>
    <tr>
      <td>Azeri ?Latin</td>
      <td>az-az</td>
      <td>0x042C</td>
      <td>1068</td>
    </tr>
    <tr>
      <td>Azeri ?Cyrillic</td>
      <td>az-az</td>
      <td>0x082C</td>
      <td>2092</td>
    </tr>
    <tr>
      <td>Basque</td>
      <td>eu</td>
      <td>0x042D </td>
      <td>1069</td>
    </tr>
    <tr>
      <td>Belarusian</td>
      <td>be</td>
      <td>0x0423 </td>
      <td>1059</td>
    </tr>
    <tr>
      <td>Bulgarian</td>
      <td>bg</td>
      <td>0x0402 </td>
      <td>1026</td>
    </tr>
    <tr>
      <td>Catalan</td>
      <td>ca</td>
      <td>0x0403 </td>
      <td>1027</td>
    </tr>
    <tr>
      <td>Chinese - China</td>
      <td>zh-cn</td>
      <td>0x0804 </td>
      <td>2052</td>
    </tr>
    <tr>
      <td>Chinese - Hong Kong S.A.R.</td>
      <td>zh-hk</td>
      <td>0x0C04 </td>
      <td>3076</td>
    </tr>
    <tr>
      <td>Chinese ?Macau S.A.R</td>
      <td>zh-mo</td>
      <td>0x1404</td>
      <td>5124</td>
    </tr>
    <tr>
      <td>Chinese - Singapore</td>
      <td>zh-sg</td>
      <td>0x1004 </td>
      <td>4100</td>
    </tr>
    <tr>
      <td>Chinese - Taiwan</td>
      <td>zh-tw</td>
      <td>0x0404 </td>
      <td>1028</td>
    </tr>
    <tr>
      <td>Croatian</td>
      <td>hr</td>
      <td>0x041A </td>
      <td>1050</td>
    </tr>
    <tr>
      <td>Czech</td>
      <td>cs</td>
      <td>0x0405 </td>
      <td>1029</td>
    </tr>
    <tr>
      <td>Danish</td>
      <td>da</td>
      <td>0x0406 </td>
      <td>1030</td>
    </tr>
    <tr>
      <td>Dutch ?The Netherlands</td>
      <td>nl-nl</td>
      <td>0x0413 </td>
      <td>1043</td>
    </tr>
    <tr>
      <td>Dutch - Belgium</td>
      <td>nl-be</td>
      <td>0x0813 </td>
      <td>2067</td>
    </tr>
    <tr>
      <td>English - Australia</td>
      <td>en-au</td>
      <td>0x0C09 </td>
      <td>3081</td>
    </tr>
    <tr>
      <td>English - Belize</td>
      <td>en-bz</td>
      <td>0x2809 </td>
      <td>10249</td>
    </tr>
    <tr>
      <td>English - Canada</td>
      <td>en-ca</td>
      <td>0x1009 </td>
      <td>4105</td>
    </tr>
    <tr>
      <td>English ?Carribbean</td>
      <td>en-cb</td>
      <td>0x2409</td>
      <td>9225</td>
    </tr>
    <tr>
      <td>English - Ireland</td>
      <td>en-ie</td>
      <td>0x1809 </td>
      <td>6153</td>
    </tr>
    <tr>
      <td>English - Jamaica</td>
      <td>en-jm</td>
      <td>0x2009 </td>
      <td>8201</td>
    </tr>
    <tr>
      <td>English - New Zealand</td>
      <td>en-nz</td>
      <td>0x1409 </td>
      <td>5129</td>
    </tr>
    <tr>
      <td>English ?Phillippines</td>
      <td>en-ph</td>
      <td>0x3409</td>
      <td>13321</td>
    </tr>
    <tr>
      <td>English - South Africa</td>
      <td>en-za</td>
      <td>0x1C09 </td>
      <td>7177</td>
    </tr>
    <tr>
      <td>English - Trinidad</td>
      <td>en-tt</td>
      <td>0x2C09 </td>
      <td>11273</td>
    </tr>
    <tr>
      <td>English - United Kingdom</td>
      <td>en-gb</td>
      <td>0x0809 </td>
      <td>2057</td>
    </tr>
    <tr>
      <td>English - United States</td>
      <td>en-us</td>
      <td>0x0409 </td>
      <td>1033</td>
    </tr>
    <tr>
      <td>Estonian</td>
      <td>et</td>
      <td>0x0425 </td>
      <td>1061</td>
    </tr>
    <tr>
      <td>Farsi</td>
      <td>fa</td>
      <td>0x0429 </td>
      <td>1065</td>
    </tr>
    <tr>
      <td>Finnish</td>
      <td>fi</td>
      <td>0x040B </td>
      <td>1035</td>
    </tr>
    <tr>
      <td>Faroese</td>
      <td>fo</td>
      <td>0x0438 </td>
      <td>1080</td>
    </tr>
    <tr>
      <td>French - France</td>
      <td>fr-fr</td>
      <td>0x040C </td>
      <td>1036</td>
    </tr>
    <tr>
      <td>French - Belgium</td>
      <td>fr-be</td>
      <td>0x080C </td>
      <td>2060</td>
    </tr>
    <tr>
      <td>French - Canada</td>
      <td>fr-ca</td>
      <td>0x0C0C </td>
      <td>3084</td>
    </tr>
    <tr>
      <td>French - Luxembourg</td>
      <td>fr-lu</td>
      <td>0x140C </td>
      <td>5132</td>
    </tr>
    <tr>
      <td>French - Switzerland</td>
      <td>fr-ch</td>
      <td>0x100C </td>
      <td>4108</td>
    </tr>
    <tr>
      <td>Gaelic ?Ireland</td>
      <td>gd-ie</td>
      <td>0x083C</td>
      <td>2108</td>
    </tr>
    <tr>
      <td>Gaelic - Scotland</td>
      <td>gd</td>
      <td>0x043C </td>
      <td>1084</td>
    </tr>
    <tr>
      <td>German - Germany</td>
      <td>de-de</td>
      <td>0x0407 </td>
      <td>1031</td>
    </tr>
    <tr>
      <td>German - Austria</td>
      <td>de-at</td>
      <td>0x0C07 </td>
      <td>3079</td>
    </tr>
    <tr>
      <td>German - Liechtenstein</td>
      <td>de-li</td>
      <td>0x1407 </td>
      <td>5127</td>
    </tr>
    <tr>
      <td>German - Luxembourg</td>
      <td>de-lu</td>
      <td>0x1007 </td>
      <td>4103</td>
    </tr>
    <tr>
      <td>German - Switzerland</td>
      <td>de-ch</td>
      <td>0x0807 </td>
      <td>2055</td>
    </tr>
    <tr>
      <td>Greek</td>
      <td>el</td>
      <td>0x0408 </td>
      <td>1032</td>
    </tr>
    <tr>
      <td>Hebrew</td>
      <td>he</td>
      <td>0x040D </td>
      <td>1037</td>
    </tr>
    <tr>
      <td>Hindi</td>
      <td>hi</td>
      <td>0x0439 </td>
      <td>1081</td>
    </tr>
    <tr>
      <td>Hungarian</td>
      <td>hu</td>
      <td>0x040E </td>
      <td>1038</td>
    </tr>
    <tr>
      <td>Icelandic</td>
      <td>is</td>
      <td>0x040F </td>
      <td>1039</td>
    </tr>
    <tr>
      <td>Indonesian</td>
      <td>id</td>
      <td>0x0421 </td>
      <td>1057</td>
    </tr>
    <tr>
      <td>Italian - Italy</td>
      <td>it-it</td>
      <td>0x0410 </td>
      <td>1040</td>
    </tr>
    <tr>
      <td>Italian - Switzerland</td>
      <td>it-ch</td>
      <td>0x0810 </td>
      <td>2064</td>
    </tr>
    <tr>
      <td>Japanese</td>
      <td>ja</td>
      <td>0x0411 </td>
      <td>1041</td>
    </tr>
    <tr>
      <td>Korean</td>
      <td>ko</td>
      <td>0x0412 </td>
      <td>1042</td>
    </tr>
    <tr>
      <td>Latvian</td>
      <td>lv</td>
      <td>0x0426 </td>
      <td>1062</td>
    </tr>
    <tr>
      <td>Lithuanian</td>
      <td>lt</td>
      <td>0x0427 </td>
      <td>1063</td>
    </tr>
    <tr>
      <td>FYRO Macedonian</td>
      <td>mk</td>
      <td>0x042F </td>
      <td>1071</td>
    </tr>
    <tr>
      <td>Malay - Malaysia</td>
      <td>ms-my</td>
      <td>0x043E </td>
      <td>1086</td>
    </tr>
    <tr>
      <td>Malay ?Brunei</td>
      <td>ms-bn</td>
      <td>0x083E</td>
      <td>2110</td>
    </tr>
    <tr>
      <td>Maltese</td>
      <td>mt</td>
      <td>0x043A </td>
      <td>1082</td>
    </tr>
    <tr>
      <td>Marathi</td>
      <td>mr</td>
      <td>0x044E</td>
      <td>1102</td>
    </tr>
    <tr>
      <td>Norwegian - Bokm錶</td>
      <td>no-no</td>
      <td>0x0414 </td>
      <td>1044</td>
    </tr>
    <tr>
      <td>Norwegian ?Nynorsk</td>
      <td>no-no</td>
      <td>0x0814</td>
      <td>2068</td>
    </tr>
    <tr>
      <td>Polish</td>
      <td>pl</td>
      <td>0x0415 </td>
      <td>1045</td>
    </tr>
    <tr>
      <td>Portuguese - Portugal</td>
      <td>pt-pt</td>
      <td>0x0816 </td>
      <td>2070</td>
    </tr>
    <tr>
      <td>Portuguese - Brazil</td>
      <td>pt-br</td>
      <td>0x0416 </td>
      <td>1046</td>
    </tr>
    <tr>
      <td>Raeto-Romance</td>
      <td>rm</td>
      <td>0x0417 </td>
      <td>1047</td>
    </tr>
    <tr>
      <td>Romanian - Romania</td>
      <td>ro</td>
      <td>0x0418 </td>
      <td>1048</td>
    </tr>
    <tr>
      <td>Romanian - Moldova</td>
      <td>ro-mo</td>
      <td>0x0818 </td>
      <td>2072</td>
    </tr>
    <tr>
      <td>Russian</td>
      <td>ru</td>
      <td>0x0419 </td>
      <td>1049</td>
    </tr>
    <tr>
      <td>Russian - Moldova</td>
      <td>ru-mo</td>
      <td>0x0819 </td>
      <td>2073</td>
    </tr>
    <tr>
      <td>Sanskrit</td>
      <td>sa</td>
      <td>0x044F</td>
      <td>1103</td>
    </tr>
    <tr>
      <td>Serbian - Cyrillic</td>
      <td>sr-sp</td>
      <td>0x0C1A </td>
      <td>3098</td>
    </tr>
    <tr>
      <td>Serbian ?Latin</td>
      <td>sr-sp</td>
      <td>0x081A</td>
      <td>2074</td>
    </tr>
    <tr>
      <td>Setsuana</td>
      <td>tn</td>
      <td>0x0432 </td>
      <td>1074</td>
    </tr>
    <tr>
      <td>Slovenian</td>
      <td>sl</td>
      <td>0x0424 </td>
      <td>1060</td>
    </tr>
    <tr>
      <td>Slovak</td>
      <td>sk</td>
      <td>0x041B </td>
      <td>1051</td>
    </tr>
    <tr>
      <td>Sorbian</td>
      <td>sb</td>
      <td>0x042E </td>
      <td>1070</td>
    </tr>
    <tr>
      <td>Spanish - Spain</td>
      <td>es-es</td>
      <td>0x0C0A </td>
      <td>1034</td>
    </tr>
    <tr>
      <td>Spanish - Argentina</td>
      <td>es-ar</td>
      <td>0x2C0A </td>
      <td>11274</td>
    </tr>
    <tr>
      <td>Spanish - Bolivia</td>
      <td>es-bo</td>
      <td>0x400A </td>
      <td>16394</td>
    </tr>
    <tr>
      <td>Spanish - Chile</td>
      <td>es-cl</td>
      <td>0x340A </td>
      <td>13322</td>
    </tr>
    <tr>
      <td>Spanish - Colombia</td>
      <td>es-co</td>
      <td>0x240A </td>
      <td>9226</td>
    </tr>
    <tr>
      <td>Spanish - Costa Rica</td>
      <td>es-cr</td>
      <td>0x140A </td>
      <td>5130</td>
    </tr>
    <tr>
      <td>Spanish - Dominican Republic</td>
      <td>es-do</td>
      <td>0x1C0A </td>
      <td>7178</td>
    </tr>
    <tr>
      <td>Spanish - Ecuador</td>
      <td>es-ec</td>
      <td>0x300A </td>
      <td>12298</td>
    </tr>
    <tr>
      <td>Spanish - Guatemala</td>
      <td>es-gt</td>
      <td>0x100A </td>
      <td>4106</td>
    </tr>
    <tr>
      <td>Spanish - Honduras</td>
      <td>es-hn</td>
      <td>0x480A </td>
      <td>18442</td>
    </tr>
    <tr>
      <td>Spanish - Mexico</td>
      <td>es-mx</td>
      <td>0x080A </td>
      <td>2058</td>
    </tr>
    <tr>
      <td>Spanish - Nicaragua</td>
      <td>es-ni</td>
      <td>0x4C0A </td>
      <td>19466</td>
    </tr>
    <tr>
      <td>Spanish - Panama</td>
      <td>es-pa</td>
      <td>0x180A </td>
      <td>6154</td>
    </tr>
    <tr>
      <td>Spanish - Peru</td>
      <td>es-pe</td>
      <td>0x280A </td>
      <td>10250</td>
    </tr>
    <tr>
      <td>Spanish - Puerto Rico</td>
      <td>es-pr</td>
      <td>0x500A </td>
      <td>20490</td>
    </tr>
    <tr>
      <td>Spanish - Paraguay</td>
      <td>es-py</td>
      <td>0x3C0A </td>
      <td>15370</td>
    </tr>
    <tr>
      <td>Spanish - El Salvador</td>
      <td>es-sv</td>
      <td>0x440A </td>
      <td>17418</td>
    </tr>
    <tr>
      <td>Spanish - Uruguay</td>
      <td>es-uy</td>
      <td>0x380A </td>
      <td>14346</td>
    </tr>
    <tr>
      <td>Spanish - Venezuela</td>
      <td>es-ve</td>
      <td>0x200A </td>
      <td>8202</td>
    </tr>
    <tr>
      <td>Sutu</td>
      <td>sx</td>
      <td>0x0430 </td>
      <td>1072</td>
    </tr>
    <tr>
      <td>Swahili</td>
      <td>sw</td>
      <td>0x0441</td>
      <td>1089</td>
    </tr>
    <tr>
      <td>Swedish - Sweden</td>
      <td>sv-se</td>
      <td>0x041D </td>
      <td>1053</td>
    </tr>
    <tr>
      <td>Swedish - Finland</td>
      <td>sv-fi</td>
      <td>0x081D </td>
      <td>2077</td>
    </tr>
    <tr>
      <td>Tamil</td>
      <td>ta</td>
      <td>0x0449</td>
      <td>1097</td>
    </tr>
    <tr>
      <td>Tatar</td>
      <td>tt</td>
      <td>0X0444</td>
      <td>1092</td>
    </tr>
    <tr>
      <td>Thai</td>
      <td>th</td>
      <td>0x041E </td>
      <td>1054</td>
    </tr>
    <tr>
      <td>Turkish</td>
      <td>tr</td>
      <td>0x041F </td>
      <td>1055</td>
    </tr>
    <tr>
      <td>Tsonga</td>
      <td>ts</td>
      <td>0x0431 </td>
      <td>1073</td>
    </tr>
    <tr>
      <td>Ukrainian</td>
      <td>uk</td>
      <td>0x0422 </td>
      <td>1058</td>
    </tr>
    <tr>
      <td>Urdu</td>
      <td>ur</td>
      <td>0x0420 </td>
      <td>1056</td>
    </tr>
    <tr>
      <td>Uzbek ?Cyrillic</td>
      <td>uz-uz</td>
      <td>0x0843</td>
      <td>2115</td>
    </tr>
    <tr>
      <td>Uzbek ?Latin</td>
      <td>uz-uz</td>
      <td>0x0443</td>
      <td>1091</td>
    </tr>
    <tr>
      <td>Vietnamese</td>
      <td>vi</td>
      <td>0x042A </td>
      <td>1066</td>
    </tr>
    <tr>
      <td>Xhosa</td>
      <td>xh</td>
      <td>0x0434 </td>
      <td>1076</td>
    </tr>
    <tr>
      <td>Yiddish</td>
      <td>yi</td>
      <td>0x043D </td>
      <td>1085</td>
    </tr>
    <tr>
      <td>Zulu</td>
      <td>zu</td>
      <td>0x0435 </td>
      <td>1077</td>
    </tr>
    </table>
</div>

<div class="backtoreference">
<p><a href="vbscript_ref_functions.asp" title="VBScript 函数">VBScript 函数参考手册</a></p>
</div>
</div>

<div id="sidebar">

<div id="searchui">
<form method="get" id="searchform" action="http://www.google.com.hk/search">
<p><label for="searched_content">Search:</label></p>
<p><input type="hidden" name="sitesearch" value="w3school.com.cn" /></p>
<p>
<input type="text" name="as_q" class="box"  id="searched_content" title="在此输入搜索内容。" />
<input type="submit" value="Go" class="button" title="搜索！" />
</p>
</form>
</div>

<div id="tools">
<h5 id="tools_reference"><a href="vbscript_ref_functions.asp">VBScript 参考手册</a></h5>
<h5 id="tools_example"><a href="../example/vbst_examples.asp">VBScript 实例</a></h5>
</div>

<div id="ad">
<h2>赞助商链接</h2>
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
<p>W3School提供的内容仅用于培训。我们不保证内容的正确性。通过使用本站内容随之而来的风险与本站无关。当使用本站时，代表您已接受了本站的<a href="../about/about_use.asp" title="关于使用">使用条款</a>和<a href="../about/about_privacy.asp" title="关于隐私">隐私条款</a>。</p>
<p>版权所有，保留一切权利。未经书面许可，不得转载。W3School 简体中文版的所有内容仅供测试，对任何法律问题及风险不承担任何责任。<a href="http://www.yktz.net/" title="上海赢科投资有限公司">上海赢科投资公司</a>。</p>
</div>

</div>
</body>
</html>