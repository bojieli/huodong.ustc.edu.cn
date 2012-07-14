// JavaScript Document
		$(document).ready(function(){
		/**
			setwaterfall($("ul li"));
			window.onresize = function(){return setwaterfall($("ul li"));};
		**/
		var obj = [];
		obj[0]=["<li class=\"b red hide\"></li>"];
		obj[1]=["<li class=\"e yellow hide\"></li>"];
		obj[2]=["<li class=\"h blue hide\"></li>"];
		obj[3]=["<li class=\"i green hide\"></li>"];
		obj[4]=["<li class=\"j eee hide\"></li>"];
		obj[5]=["<li class=\"k ccc hide\"></li>"];
		$("ul li").setwaterfall();
		$(window).scroll(function () {
			var clienth = document.documentElement.clientHeight;
			var scrollh = document.documentElement.scrollHeight;
			var scrollt = document.documentElement.scrollTop + document.body.scrollTop;
			if (clienth + scrollt + 200 > scrollh) {
				var html = obj.join("");
				$("ul").append(html);
				$(".hide").animate({opacity:1},1000);
				$("ul li").setwaterfall();
			}
		});

		});
