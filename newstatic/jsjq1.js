hhh=0;www=0;function getwindowWH(){if(window.innerHeight)hhh=window.innerHeight;else if((document.body)&&(document.body.clientHeight))hhh=document.body.clientHeight;if(window.innerWidth)www=window.innerWidth;else if((document.body)&&(document.body.clientWidth))www=document.body.clientWidth;if(document.documentElement&&document.documentElement.clientHeight&&document.documentElement.clientWidth){hhh=document.documentElement.clientHeight;www=document.documentElement.clientWidth}};$(document).ready(function(){var xx=0;var yy=0;var sx;$("#login").click(function(event){sx=document.body.scrollWidth;xx=parseInt(sx/2)-240+"px";yy=document.body.scrollTop+parseInt(hhh/2)-130+"px";$("#outlogdiv").css("top",yy);$("#outlogdiv").css("left",xx);$("#backbg").slideDown(300);$("#outlogdiv").show(300)});$("#outlogdiv").click(function(){$("#backbg").slideUp(300);$("#outlogdiv").hide(300)});var slcflag=0;$("#selectm").click(function(){if(slcflag==0){getwindowWH();if(hhh<520){yy=document.body.scrollTop+120+"px";$("#slcdetail").css("position","absolute");$("#slcdetail").css("top",yy)}else{$("#slcdetail").css("position","fixed")}$("#slcdetail").show(300);$("#selectm").animate({right:160},300);slcflag=1}else{$("#slcdetail").hide(300);$("#selectm").animate({right:0},300);slcflag=0}});$(".haibao").live('click',function(event){xx=parseInt(www/2)-560;if(xx<0){xx=0}xx=xx+"px";yy=hhh-10+"px";$("#outhaibao").css("left",xx);$("#outhaibao").css("height",yy);$("#backbg").slideDown(300);$("#outhaibao").show(300)});$(".closehb").live('click',function(){$("#backbg").slideUp(300);$("#outhaibao").hide(300)})});