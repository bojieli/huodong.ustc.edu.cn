// JavaScript Document
var $oldc11 ;

function substate(){
	
	$('#send').css('color','#000');
	setTimeout("$('#send').css('color','#666');",100);
	
}
$(function(){
	
	

/*默认第一项底为白色，但是默认打开第一项的对应布局还是很麻烦的，且默认打开第一项并不好，所以功能删除,改为默认显示网站信息*/
/*
$(document).ready(function() {  
	$(".activitytitle:first").parent().css('background',"#FFF");  
});  	 
*/ 
/*定义鼠标移上去变色，移出去后恢复原来颜色，若有点击，则移出去后保留点击色activity指活动activity1指对话*/	 
$(".activity,.activity1").hover(function() {
   $oldc11=$(this).css("background-color");   
   $(this).css('background',"#FFC");
   /*鼠标移动上去发生点击事件后处理*/
   $(".activity,").click(function(){
	  $(".activity,.activity1").css('background',"#E6E6FA");
	  $(this).css('background',"#FFF");	  
	  $oldc11="#FFF";
	  /*右边显示对应项的窗口，屏蔽别的 #huodong11 #duihua11*/
	  $("#duihua11,#huodong11").hide();
	  setTimeout($(function(){$("#huodong11").show(300)}),50); 
   });
      $(".activity1").click(function(){
	  $(".activity,.activity1").css('background',"#E6E6FA");
	  $(this).css('background',"#FFF");	  
	  $oldc11="#FFF";
	  /*右边显示对应项的窗口，屏蔽别的 #huodong11 #duihua11*/
	  $("#duihua11,#huodong11").hide();
	  setTimeout($(function(){$("#duihua11").show(300)}),50);
   });
}, /*下面是鼠标移开后动作*/
function() {
   $(this).css('background-color', $oldc11);
});	

$(".biaoqian11").hover(function() {
   $oldc11=$(this).css("background-color");   
   $(this).css('background',"#FFC");
   /*鼠标移动上去发生点击事件后处理*/
   $("#laixinx").click(function(){
	  $(".biaoqian11").css('z-index',"40");
	  $(this).css('z-index',"80");
	  $(".activity").hide();
	  setTimeout($(function(){$(".activity1").show(300)}),50); 
   });
   $("#tongzhix").click(function(){
      $(".biaoqian11").css('z-index',"40");
	  $(this).css('z-index',"80");
	  $(".activity1").hide();
	  setTimeout($(function(){$(".activity").show(300)}),50);
   });
}, /*下面是鼠标移开后动作*/
function() {
   $(this).css('background-color', $oldc11);
});	


	 	


	$("#upscroll").click(function(){
						if($("#leftscroll").get(0).scrollTop>0);
							$("#leftscroll").get(0).scrollTop=$("#leftscroll").get(0).scrollTop-80;
			 
								  
								  
	});
	$("#downscroll").click(function(){
						if($("#leftscroll").get(0).scrollHeight>$("#leftscroll").get(0).scrollTop);
							$("#leftscroll").get(0).scrollTop=$("#leftscroll").get(0).scrollTop+80;				  
								  
								  
	});
	$("#leftscroll").mousewheel(function(event, delta, deltaX, deltaY) {
						var o = '';
						if (delta > 0)
							o = '#test6: up ('+delta+')';
						else if (delta < 0)
							o = '#test6: down ('+delta+')';
						
						if (deltaX > 0)
							o = o + ', east ('+deltaX+')';
						else if (deltaX < 0)
							o = o + ', west ('+deltaX+')';
						
						if (deltaY > 0)
							o = o + ', north ('+deltaY+')';
						else if (deltaY < 0)
							o = o + ', south ('+deltaY+')';
						
						if( o != '' )
						//	log( o );
					
						if(delta > 0 && $("#leftscroll").get(0).scrollTop>0)
							$("#leftscroll").get(0).scrollTop=$("#leftscroll").get(0).scrollTop-80;
						else if(delta < 0 &&$( "#leftscroll").get(0).scrollHeight>$("#leftscroll").get(0).scrollTop)
							$("#leftscroll").get(0).scrollTop=$("#leftscroll").get(0).scrollTop+80;	
						
					});

});
