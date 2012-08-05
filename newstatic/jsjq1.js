// JavaScript Document
/*取得浏览器的窗口的可视长宽*/
	hhh= 0;
	www=0; 	
    function getwindowWH(){	
	     //获取窗口高
         if (window.innerHeight) hhh = window.innerHeight;		 
         else if ((document.body) && (document.body.clientHeight)) hhh = document.body.clientHeight;
		 //宽度
		 if (window.innerWidth) www = window.innerWidth;
		 else if ((document.body) && (document.body.clientWidth)) www = document.body.clientWidth;
	     //通过深入Document内部对body进行检测，获取窗口大小
         if (document.documentElement  && document.documentElement.clientHeight  && document.documentElement.clientWidth)
		     { hhh = document.documentElement.clientHeight;
			   www = document.documentElement.clientWidth;
			 }
    };//function getwindowWH
/*JQ部分*/
$(document).ready(function(){


/*删除的弹出框*/
/*$(".delete1").click(function(event){
	   var xx=0;
	   var yy=0;
	   xx=event.pageX-360+"px";
	   yy=event.pageY-145+"px";
	   $("#del").css("top",yy);
	   $("#del").css("left",xx);
	   $("#outerbox").slideDown(300);
	   $("#del").show(300);	
	});
$(".yesyes, .nono").click(function(){
	$("#outerbox").slideUp(300);
	$("#del").hide(300);	
	})
*/
/*登陆框弹出*/
	   var xx=0;
	   var yy=0;
	   var sx;
$("#login").click(function(event){	
	   sx=document.body.scrollWidth;  
	   xx=parseInt(sx/2)-240+"px";
	   yy=document.body.scrollTop+parseInt(hhh/2)-130+"px";
	   $("#outlogdiv").css("top",yy);
	   $("#outlogdiv").css("left",xx);
	   $("#backbg").slideDown(300);
	   $("#outlogdiv").show(300);	
	});
$("#outlogdiv").click(function(){
	$("#backbg").slideUp(300);
	$("#outlogdiv").hide(300);
	});
/*弹出与收起筛选*/
var slcflag=0;
$("#selectm").click(function(){
	if(slcflag==0){
		getwindowWH();
		if(hhh<520){
			yy=document.body.scrollTop+120+"px";
			$("#slcdetail").css("position","absolute");
			$("#slcdetail").css("top",yy);
		}
		else{
			$("#slcdetail").css("position","fixed");
			}
		$("#slcdetail").show(300);
		$("#selectm").animate({right:160},300); 
		slcflag=1;
		}
	else{
		$("#slcdetail").hide(300);
		$("#selectm").animate({right:0},300); 
		slcflag=0;
		};	
});
/*弹出海报展示框*/
$(".haibao").live('click',function(event){	   
	   xx=parseInt(www/2)-560;
	   if(xx<0){xx=0;}
	   xx=xx+"px";
	   yy=hhh-10+"px";
	   $("#outhaibao").css("left",xx);
	   $("#outhaibao").css("height",yy);
	   $("body").css("overflow","hidden");	   
	   $("#backbg").slideDown(300);
	   $("#outhaibao").slideDown(300);	
	});
$(".closehb").live('click',function(){
	$("body").css("overflow","auto");
	$("#backbg").slideUp(300);
	$("#outhaibao").slideUp(300);
	});
/*outhaibao
$("#edittj, #editqx").click(function(){
	$("#outerbox").slideUp(300);
	$("#edithd").hide(300);	
	})
*/
/*活动详细信息修改*/
/*
$("#edithdxq").click(function(event){
	   var xx=0;
	   var yy=0;
	   xx=event.pageX-600+"px";
	   yy=event.pageY-15+"px";
	   $("#edithd2").css("top",yy);
	   $("#edithd2").css("left",xx);
	   $("#outerbox").slideDown(300);
	   $("#edithd2").show(300);	
	});
$("#edittj2, #editqx2").click(function(){
	$("#outerbox").slideUp(300);
	$("#edithd2").hide(300);	
	})
*/
});