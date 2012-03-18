
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

<title>HTML DOM CanvasRenderingContext2D 对象</title>
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
<h2>HTML DOM</h2>
<ul>
<li><a href="index.asp" title="DOM教程首页">DOM 首页</a></li>
<li><a href="dom_intro.asp" title="DOM简介">DOM 简介</a></li>
<li><a href="dom_nodes.asp" title="HTML DOM 节点">DOM 节点</a></li>
<li><a href="dom_nodetree.asp" title="HTML DOM 节点树">DOM 节点树</a></li>
<li><a href="dom_nodes_access.asp" title="HTML DOM 访问节点">DOM 节点访问</a></li>
<li><a href="dom_nodes_info.asp" title="HTML DOM 节点信息">DOM 节点信息</a></li>
<li><a href="dom_example.asp" title="一个 HTML DOM 实例">DOM How To</a></li>
<li><a href="htmldom_reference.asp" title="">DOM 参考</a></li>
<li><a href="dom_summary.asp" title="">DOM 总结</a></li>
</ul>

<h2>DOM 实例</h2>
<ul>
<li><a href="../example/hdom_examples.asp" title="">DOM 实例</a></li>
</ul>

<h2>Browser 对象</h2>
<ul class="small">
<li><a href="dom_obj_window.asp" title="HTML DOM Window 对象">DOM Window</a></li>
<li><a href="dom_obj_navigator.asp" title="HTML DOM Navigator 对象">DOM Navigator</a></li>
<li><a href="dom_obj_screen.asp" title="HTML DOM Screen 对象">DOM Screen</a></li>
<li><a href="dom_obj_history.asp" title="HTML DOM History 对象">DOM History</a></li>
<li><a href="dom_obj_location.asp" title="HTML DOM Location 对象">DOM Location</a></li>
</ul>

<h2>HTML DOM 对象</h2>
<ul class="small">
<li><a href="dom_obj_document.asp" title="HTML DOM Document 对象">DOM Document</a></li>
<li><a href="dom_obj_anchor.asp" title="HTML DOM Anchor 对象">DOM Anchor</a></li>
<li><a href="dom_obj_area.asp" title="HTML DOM Area 对象">DOM Area</a></li>
<li><a href="dom_obj_base.asp" title="HTML DOM Base 对象">DOM Base</a></li>
<li><a href="dom_obj_body.asp" title="HTML DOM Body 对象">DOM Body</a></li>
<li><a href="dom_obj_pushbutton.asp" title="HTML DOM Button 对象">DOM Button</a></li>
<li><a href="dom_obj_canvas.asp" title="HTML DOM Canvas 对象">DOM Canvas</a></li>
<li><a href="dom_obj_event.asp" title="HTML DOM Event 对象">DOM Event</a></li>
<li><a href="dom_obj_form.asp" title="HTML DOM Form 对象">DOM Form</a></li>
<li><a href="dom_obj_frame.asp" title="HTML DOM Frame 对象">DOM Frame</a></li>
<li><a href="dom_obj_frameset.asp" title="HTML DOM Frameset 对象">DOM Frameset</a></li>
<li><a href="dom_obj_iframe.asp" title="HTML DOM IFrame 对象">DOM IFrame</a></li>
<li><a href="dom_obj_image.asp" title="HTML DOM Image 对象">DOM Image</a></li>
<li><a href="dom_obj_button.asp" title="HTML DOM Button 对象">DOM Input Button</a></li>
<li><a href="dom_obj_checkbox.asp" title="HTML DOM Checkbox 对象">DOM Input Checkbox</a></li>
<li><a href="dom_obj_fileupload.asp" title="HTML DOM FileUpload 对象">DOM Input File</a></li>
<li><a href="dom_obj_hidden.asp" title="HTML DOM Hidden 对象">DOM Input Hidden</a></li>
<li><a href="dom_obj_password.asp" title="HTML DOM Password 对象">DOM Input Password</a></li>
<li><a href="dom_obj_radio.asp" title="HTML DOM Radio 对象">DOM Input Radio</a></li>
<li><a href="dom_obj_reset.asp" title="HTML DOM Reset 对象">DOM Input Reset</a></li>
<li><a href="dom_obj_submit.asp" title="HTML DOM Submit 对象">DOM Input Submit</a></li>
<li><a href="dom_obj_text.asp" title="HTML DOM Text 对象">DOM Input Text</a></li>
<li><a href="dom_obj_link.asp" title="HTML DOM Link 对象">DOM Link</a></li>
<li><a href="dom_obj_meta.asp" title="HTML DOM Meta 对象">DOM Meta</a></li>
<li><a href="dom_obj_object.asp" title="HTML DOM Object 对象">DOM Object</a></li>
<li><a href="dom_obj_option.asp" title="HTML DOM Option 对象">DOM Option</a></li>
<li><a href="dom_obj_select.asp" title="HTML DOM Select 对象">DOM Select</a></li>
<li><a href="dom_obj_style.asp" title="HTML DOM Style 对象">DOM Style</a></li>
<li><a href="dom_obj_table.asp" title="HTML DOM Table 对象">DOM Table</a></li>
<li><a href="dom_obj_tabledata.asp" title="HTML DOM TableCell 对象">DOM TableCell</a></li>
<li><a href="dom_obj_tablerow.asp" title="HTML DOM TableRow 对象">DOM TableRow</a></li>
<li><a href="dom_obj_textarea.asp" title="HTML DOM Textarea 对象">DOM Textarea</a></li>
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

<h1>HTML DOM CanvasRenderingContext2D 对象</h1>


<div>
<h2>CanvasRenderingContext2D 对象</h2>

<p>CanvasRenderingContext2D 对象提供了一组用来在画布上绘制的图形函数。可用的函数非常丰富，它们可以分为以下几类：</p>


<h3>绘制矩形</h3>

<p>可以使用 <a href="met_canvasrenderingcontext2d_strokerect.asp" title="HTML DOM strokeRect() 方法">strokeRect()</a> 和 <a href="met_canvasrenderingcontext2d_fillrect.asp" title="HTML DOM fillRect() 方法">fillRect()</a> 来绘制矩形的边框和填充矩形。此外，可以使用 <a href="met_canvasrenderingcontext2d_clearrect.asp" title="HTML DOM clearRect() 方法">clearRect()</a> 来清除矩形所定义的区域。</p>


<h3>绘制图像</h3>

<p>在 Canvas API 中，图像通过表示 <a href="../tags/tag_img.asp" title="HTML &lt;img&gt; 标签">HTML &lt;img&gt; 元素</a>的 <a href="dom_obj_image.asp" title="HTML DOM Image 对象">Image 对象</a>来指定，或者通过使用 Image() 构造函数所创建的屏幕外图像来指定。一个 <a href="dom_obj_canvas.asp" title="HTML DOM Canvas 对象">Canvas 对象</a>也可以用作图像来源。</p>

<p>可以使用 <a href="met_canvasrenderingcontext2d_drawimage.asp" title="HTML DOM drawImage() 方法">drawImage() 方法</a>在一个画布上绘制图像；而更为常见的形式是，允许源图像的任意矩形区域缩放或绘制到画布上。</p>


<h3>创建和渲染路径</h3>

<p>画布的一项强大功能是，它能够从基本的绘图操作来构建图形，然后，绘制这些图形的框架（勾勒它们）或者给这些图形的内容涂色（填充它们）。累计起来的操作统一叫做<em>当前路径</em>。一个画布只保持一条当前路径。</p>

<p>为了构建一个多条线段所构成的一个连续的封闭形状，绘制操作之间需要一个连接点。为此，画布保存了一个<em>当前位置</em>。画布绘制操作显式地使用这个位置作为它们的起始点，并且更新它直到到达终点。可以把这看做是使用钢笔或纸来绘画：当您完成了一条具体的线段或曲线，当前位置就是完成这一操作之后钢笔所停留的点。</p>

<p>可以在当前路径中创建一系列互相不连续的形状，它们都使用同样的绘制参数一起渲染。要分隔开这些形状，请使用 <a href="met_canvasrenderingcontext2d_moveto.asp" title="HTML DOM moveTo() 方法">moveTo()</a> 方法，这个方法把当前的位置移动到一个新的位置而不添加一条连接线段。当您这么做的时候，就创建了一条新的路径，这是用来表示一组连接起来的操作的画布术语。</p>

<p>一旦您所想要的路径形成了，可以使用 <a href="met_canvasrenderingcontext2d_stroke.asp" title="HTML DOM stroke() 方法">stroke()</a> 绘制其边框，使用 <a href="met_canvasrenderingcontext2d_fill.asp" title="HTML DOM fill() 方法">fill()</a> 来绘制其内容；或者两件事都做。</p>

<p>可用的图形操作有：用来绘制直线的 <a href="met_canvasrenderingcontext2d_lineto.asp" title="HTML DOM lineTo() 方法">lineTo()</a>，用于绘制矩形的 <a href="met_canvasrenderingcontext2d_rect.asp" title="HTML DOM rect() 方法">rect()</a>，用于绘制部分圆形的 <a href="met_canvasrenderingcontext2d_arc.asp" title="HTML DOM arc() 方法">arc()</a> 或 <a href="met_canvasrenderingcontext2d_arcto.asp" title="HTML DOM arcTo() 方法">arcTo()</a>，以及用于绘制曲线的 <a href="met_canvasrenderingcontext2d_beziercurveto.asp" title="HTML DOM bezierCurveTo() 方法">bezierCurveTo()</a> 或 <a href="met_canvasrenderingcontext2d_quadraticcurveto.asp" title="HTML DOM quadraticCurveTo() 方法">quadraticCurveTo()</a>。</p>

<p>除了勾勒和填充，还可以使用当前路径来指定绘制时画布所使用的剪切区域。这个区域中的像素是显示的，区域之外的像素是不显示的。剪切区域是累加性的；调用 <a href="met_canvasrenderingcontext2d_clip.asp" title="HTML DOM clip() 方法">clip()</a> 可以将当前路径和当前绘制区域取交集，产生一个新的区域。不幸的是，没有直接的方法把当前的剪切区域设置为画布的范围；要做到这一点，必须保存和恢复画布的整个图形状态。</p>

<p>如果任何子路径中的线段没有形成一个闭合的图形，<a href="met_canvasrenderingcontext2d_fill.asp" title="HTML DOM fill() 方法">fill()</a> 和 <a href="met_canvasrenderingcontext2d_clip.asp" title="HTML DOM clip() 方法">clip()</a> 操作通过添加一条从子路径的起点到终点的、虚拟（勾勒的时候看不到）线段来闭合它。可选的是，也可以调用 <a href="met_canvasrenderingcontext2d_closepath.asp" title="HTML DOM closePath() 方法">closePath()</a> 来显示地添加这条线段。</p>


<h3>颜色、渐变和模式</h3>

<p>在填充和勾勒路径时，可用 fillStyle 和 strokeStyle 属性来指定线段或者绘制区域如何绘制。CSS 样式颜色字符串，以及描述渐变和模式的 <a href="dom_obj_canvasgradient.asp" title="HTML DOM CanvasGradient 对象">CanvasGradient</a> 或 <a href="dom_obj_createpattern.asp" title="HTML DOM CanvasPattern 对象">CanvasPattern</a> 都是可以接受的。要创建一个渐变，请使用 <a href="met_canvasrenderingcontext2d_createlineargradient.asp" title="HTML DOM createLinearGradient() 方法">createLinearGradient()</a> 或 <a href="met_canvasrenderingcontext2d_createradialgradient.asp" title="HTML DOM createRadialGradient() 方法">createRadialGradient()</a>。要创建一个模式，请使用 <a href="met_canvasrenderingcontext2d_createpattern.asp" title="HTML DOM createPattern() 方法">createPattern()</a>。</p>

<p>要用 CSS 表示法来指定不透明的颜色，就采用 &quot;#RRGGBB&quot; 形式的字符串，其中 RR、GG 和 BB 分别是指定颜色的红色、绿色和蓝色成分的十六进制，其值都在 00 和 FF 之间。例如，完全红色的值是 &quot;#FF0000&quot;。要指定部分透明的颜色，请使用一个 &quot;rgba(R,G,B,A)&quot; 形式的字符串。在这种形式中，R、G 和 B 将颜色的红色、绿色和蓝色成分指定为 0 到 255 之间的十进制整数，并且 A 把 alpha（不透明）成分指定为 0.0 （完全透明）和 1.0 （完全不透明）之间的一个浮点数值。例如，半透明的完全红色为 &quot;rgba(255,0,0,0.5)&quot;。</p>


<h3>线条宽度、线帽和线条连接</h3>

<p>画布为调整各种线条显示提供了几个选项。可以使用 lineWidth 属性来指定线条的宽度，用 <a href="prop_canvasrenderingcontext2d_linecap.asp" title="HTML DOM lineCap 属性">lineCap 属性</a>来指定的端点如何绘制，并且用 <a href="prop_canvasrenderingcontext2d_linejoin.asp" title="HTML DOM lineJoin 属性">lineJoin 属性</a>来指定线条如何连接。</p>


<h3>坐标空间和转换</h3>

<p>默认情况下，一个画布的坐标空间使用画布的左上角 (0,0) 作为原点，x 值向右增加，y 值向下增加。这个坐标空间中的一个单位通常转换为像素。</p>

<p>然后，可以转换坐标空间，产生你在绘图操作中所指定的用来移动、缩放或旋转的任何坐标或范围。这通过 <a href="met_canvasrenderingcontext2d_translate.asp" title="HTML DOM translate() 方法">translate()</a>、<a href="met_canvasrenderingcontext2d_scale.asp" title="HTML DOM scale() 方法">scale()</a> 和 <a href="met_canvasrenderingcontext2d_rotate.asp" title="HTML DOM rotate() 方法">rotate() 方法</a>来实现，它们会对画布的变换矩阵产生影响。由于坐标空间可以像这样转换，您传递给 <a href="met_canvasrenderingcontext2d_lineto.asp" title="HTML DOM lineTo() 方法">lineTo()</a> 这样方法的坐标可能无法用像素来度量。因此，Canvas API 使用浮点数而不是整数。</p>

<p>变换按照它们被指定的顺序相反的顺序来处理。例如，调用 scale() 之后，紧接着调用 translate()，这会首先变换坐标系统，然后再缩放。</p>


<h3>组合</h3>

<p>通常，图形是一个绘制于另一个的上面，新的图形使得在它之前绘制在其下方的图形变得模糊。这是一个画布中的默认行为。然而，您可以通过为 <a href="prop_canvasrenderingcontext2d_globalcompositeoperation.asp" title="HTML DOM globalCompositeOperation 属性">globalCompositeOperation 属性</a>指定不同的值来执行很多有趣的操作，范围包括从 XOR 操作到增量或减暗图形区域。</p>


<h3>阴影</h3>

<p>Canvas API 包含了可以自动为您所绘制的任何图形添加下拉阴影的属性。然而，在编写本参考页时，Safari 是唯一实现了这一 API 的浏览器。阴影的颜色可用 shadowColor 属性来指定，并且可以通过 shadowOffsetX 和 shadowOffsetY 属性来改变。另外，应用到阴影边缘的羽化量也可以使用 shadowBlur 属性来设置。</p>


<h3>保存图形状态</h3>

<p><a href="met_canvasrenderingcontext2d_save.asp" title="HTML DOM save() 方法">save()</a> 和 <a href="met_canvasrenderingcontext2d_restore.asp" title="HTML DOM restore() 方法">restore()</a> 方法允许你保存和恢复一个 CanvasRenderingContext2D 对象的状态。save() 把当前状态推入到栈中，而 restore() 从栈的顶端弹出最近保存的状态，并且根据这些存储的值来设置当前绘图状态。</p>

<p>CanvasRenderingContext2D 对象的所有属性（除了画布的属性是一个常量）都是保存的状态的一部分。变换矩阵和剪切区域也是这个状态的一部分，但是当前路径和当前点并不是。</p>

</div>

<div>
<h2>CanvasRenderingContext2D 对象的属性</h2>


<h3>canvas 属性</h3>

<p>这个环境可以绘制于其上的 Canvas 元素。</p>


<h3>fillStyle 属性</h3>

<p>用来填充路径的当前的颜色、模式或渐变。这个属性可以设置为一个字符串或者一个 <a href="dom_obj_canvasgradient.asp" title="HTML DOM CanvasGradient 对象">CanvasGradient 对象</a> 或 <a href="dom_obj_createpattern.asp" title="HTML DOM CanvasPattern 对象">CanvasPattern 对象</a>。当设置为一个字符串时，它被解析为一个 CSS 颜色值并且用来进行实心填充。当设置为一个 CanvasGradient 或 CanvasPattern 对象，通过使用指定的渐变或模式来完成填充。</p>

<h3>globalAlpha 属性</h3>

<p>指定在画布上绘制的内容的不透明度。这个值的范围在 0.0（完全透明）和 1.0（完全不透明）之间。默认值为 1.0。</p>

<h3>globalCompositeOperation 属性</h3>

<p>指定颜色如何与画布上已有的颜色组合（合成）。如需更多细节，请参阅 <a href="prop_canvasrenderingcontext2d_globalcompositeoperation.asp" title="HTML DOM globalCompositeOperation 属性">globalCompositeOperation 属性参考页</a>。</p>

<h3>lineCap 属性</h3>

<p>指定线条的末端如何绘制。合法的值是 &quot;butt&quot;、&quot;round&quot; 和 &quot;square&quot;。默认值是 &quot;butt&quot;。如需更多细节，请参阅 <a href="prop_canvasrenderingcontext2d_linecap.asp" title="HTML DOM lineCap 属性">lineCap 属性参考页</a>。</p>

<h3>lineJoin 属性</h3>

<p>指定两条线条如何连接。合法的值是 &quot;round&quot;、&quot;bevel&quot; 和 &quot;miter&quot;。默认值是 &quot;miter&quot;。如需更多细节，请参阅 <a href="prop_canvasrenderingcontext2d_linejoin.asp" title="HTML DOM lineJoin 属性">lineJoin 属性参考页</a>。</p>

<h3>lineWidth 属性</h3>

<p>指定了画笔（绘制线条）操作的线条宽度。默认值是 1.0，并且这个属性必须大于 0.0。较宽的线条在路径上居中，每边有线条宽的一半。</p>

<h3>miterLimit 属性</h3>

<p>当 lineJoin 属性为 &quot;miter&quot; 的时候，这个属性指定了斜连接长度和线条宽度的最大比率。如需更多细节，请参阅 <a href="prop_canvasrenderingcontext2d_miterlimit.asp" title="HTML DOM miterLimit 属性">miterLimit 属性参考页</a>。</p>

<h3>shadowBlur 属性</h3>

<p>指定羽化阴影的程度。默认值是 0。阴影效果得到 safari 的支持，但是并没有得到 FireFox 1.5 或 Opera 9 的支持。</p>

<h3>shadowColor 属性</h3>

<p>把阴影的颜色指定为一个 CSS 字符串或 Web 样式字符串，并且可以包含一个 alpha 部分来表示透明度。默认值是 black。阴影效果得到 Safari 的支持，但是并没有得到 FireFox 1.5 或 Opera 9 的支持。</p>

<h3>shadowOffsetX, shadowOffsetY 属性</h3>

<p>指定阴影的水平偏移和垂直偏移。较大的值使得阴影化的对象似乎漂浮在背景的较高位置上。默认值是 0。阴影效果得到 Safari 的支持，但是并没有得到 FireFox 1.5 或 Opera 9 的支持。</p>

<h3>strokeStyle 属性</h3>

<p>指定了用于画笔（绘制）路径的颜色、模式和渐变。这个属性可能是一个字符串，或者一个 <a href="dom_obj_canvasgradient.asp" title="HTML DOM CanvasGradient 对象">CanvasGradient 对象</a> 或 <a href="dom_obj_createpattern.asp" title="HTML DOM CanvasPattern 对象">CanvasPattern 对象</a>。如果是一个字符串，它被解析为一个 CSS 颜色值，并且画笔用所得的实色来绘制。如果这个属性的值是一个 CanvasGradient 对象或 CanvasPattern 对象，画笔使用这个渐变或模式来实现。</p>
</div>


<div>
<h2>CanvasRenderingContext2D 对象的方法</h2>

<table class="dataintable">
<tr>
<th>方法</th>
<th>描述</th>
</tr>

<tr>
<td><a href="met_canvasrenderingcontext2d_arc.asp" title="HTML DOM arc() 方法">arc()</a></td>
<td>用一个中心点和半径，为一个画布的当前子路径添加一条弧线。</td>
</tr>

<tr>
<td><a href="met_canvasrenderingcontext2d_arcto.asp" title="HTML DOM arcTo() 方法">arcTo()</a></td>
<td>使用目标点和一个半径，为当前的子路径添加一条弧线。</td>
</tr>

<tr>
<td><a href="met_canvasrenderingcontext2d_beginpath.asp" title="HTML DOM beginPath() 方法">beginPath()</a></td>
<td>开始一个画布中的一条新路径（或者子路径的一个集合）。</td>
</tr>

<tr>
<td><a href="met_canvasrenderingcontext2d_beziercurveto.asp" title="HTML DOM bezierCurveTo() 方法">bezierCurveTo()</a></td>
<td>为当前的子路径添加一个三次贝塞尔曲线。</td>
</tr>

<tr>
<td><a href="met_canvasrenderingcontext2d_clearrect.asp" title="HTML DOM clearRect() 方法">clearRect()</a></td>
<td>在一个画布的一个矩形区域中清除掉像素。</td>
</tr>

<tr>
<td><a href="met_canvasrenderingcontext2d_clip.asp" title="HTML DOM clip() 方法">clip()</a></td>
<td>使用当前路径作为连续绘制操作的剪切区域。</td>
</tr>

<tr>
<td><a href="met_canvasrenderingcontext2d_closepath.asp" title="HTML DOM closePath() 方法">closePath()</a></td>
<td>如果当前子路径是打开的，就关闭它。</td>
</tr>

<tr>
<td><a href="met_canvasrenderingcontext2d_createlineargradient.asp" title="HTML DOM createLinearGradient() 方法">createLinearGradient()</a></td>
<td>返回代表线性颜色渐变的一个 CanvasGradient 对象。</td>
</tr>

<tr>
<td><a href="met_canvasrenderingcontext2d_createpattern.asp" title="HTML DOM createPattern() 方法">createPattern()</a></td>
<td>返回代表贴图图像的一个 CanvasPattern 对象。</td>
</tr>

<tr>
<td><a href="met_canvasrenderingcontext2d_createradialgradient.asp" title="HTML DOM createRadialGradient() 方法">createRadialGradient()</a></td>
<td>返回代表放射颜色渐变的一个 CanvasGradient 对象。</td>
</tr>

<tr>
<td><a href="met_canvasrenderingcontext2d_drawimage.asp" title="HTML DOM drawImage() 方法">drawImage()</a></td>
<td>绘制一幅图像。</td>
</tr>

<tr>
<td><a href="met_canvasrenderingcontext2d_fill.asp" title="HTML DOM fill() 方法">fill()</a></td>
<td>使用指定颜色、渐变或模式来绘制或填充当前路径的内部。</td>
</tr>

<tr>
<td><a href="met_canvasrenderingcontext2d_fillrect.asp" title="HTML DOM fillRect() 方法">fillRect()</a></td>
<td>绘制或填充一个矩形。</td>
</tr>

<tr>
<td><a href="met_canvasrenderingcontext2d_lineto.asp" title="HTML DOM lineTo() 方法">lineTo()</a></td>
<td>为当前的子路径添加一条直线线段。</td>
</tr>

<tr>
<td><a href="met_canvasrenderingcontext2d_moveto.asp" title="HTML DOM moveTo() 方法">moveTo()</a></td>
<td>设置当前位置并开始一条新的子路径。</td>
</tr>

<tr>
<td><a href="met_canvasrenderingcontext2d_quadraticcurveto.asp" title="HTML DOM quadraticCurveTo() 方法">quadraticCurveTo()</a></td>
<td>为当前路径添加一条贝塞尔曲线。</td>
</tr>

<tr>
<td><a href="met_canvasrenderingcontext2d_rect.asp" title="HTML DOM rect() 方法">rect()</a></td>
<td>为当前路径添加一条矩形子路径。</td>
</tr>

<tr>
<td><a href="met_canvasrenderingcontext2d_restore.asp" title="HTML DOM restore() 方法">restore()</a></td>
<td>为画布重置为最近保存的图像状态。</td>
</tr>

<tr>
<td><a href="met_canvasrenderingcontext2d_rotate.asp" title="HTML DOM rotate() 方法">rotate()</a></td>
<td>旋转画布。</td>
</tr>

<tr>
<td><a href="met_canvasrenderingcontext2d_save.asp" title="HTML DOM save() 方法">save()</a></td>
<td>保存 CanvasRenderingContext2D 对象的属性、剪切区域和变换矩阵。</td>
</tr>

<tr>
<td><a href="met_canvasrenderingcontext2d_scale.asp" title="HTML DOM scale() 方法">scale()</a></td>
<td>标注画布的用户坐标系统。</td>
</tr>

<tr>
<td><a href="met_canvasrenderingcontext2d_stroke.asp" title="HTML DOM stroke() 方法">stroke()</a></td>
<td>沿着当前路径绘制或画一条直线。</td>
</tr>

<tr>
<td><a href="met_canvasrenderingcontext2d_strokerect.asp" title="HTML DOM strokeRect() 方法">strokeRect()</a></td>
<td>绘制（但不填充）一个矩形。</td>
</tr>

<tr>
<td><a href="met_canvasrenderingcontext2d_translate.asp" title="HTML DOM translate() 方法">translate()</a></td>
<td>转换画布的用户坐标系统。</td>
</tr>
</table>
</div>


<div>
<h2>参阅</h2>

<p><a href="dom_obj_canvas.asp" title="HTML DOM Canvas 对象">Canvas</a></p>
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
<h5 id="tools_reference"><a href="htmldom_reference.asp">HTML DOM 参考手册</a></h5>
<h5 id="tools_example"><a href="../example/hdom_examples.asp">HTML DOM 实例</a></h5>
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