/* ///////////////////////////////////////////////////////////////////////////////////////////////////////////

	Top Menu Function
	
	ex)
	var Tmenu_code = "0101";//메뉴코드
	Tmenu_setting(Tmenu_code);//실행	

/////////////////////////////////////////////////////////////////////////////////////////////////////////// */
function Tmenu_setting(str){
	var params = str;
	var code = new Array();	
		
	code[0] = parseInt(params.substr(0,2)) -1; //eq(n) n번지수 찾기
	code[1] = parseInt(params.substr(2,2)) -1; //eq(n) n번지수 찾기
	code[2] = parseInt(params.substr(4,2)) -1; //eq(n) n번지수 찾기	
	
	var gnb_obj = $("#nav > #gnb > ul");
		gnb_obj.intervals = "";
		gnb_obj.li = gnb_obj.find(">li"); 
		gnb_obj.li.a = gnb_obj.li.find(">a");
		gnb_obj.li.ul = gnb_obj.li.find(">ul");
		gnb_obj.li.ul.li = gnb_obj.li.ul.find(">li"); 
		gnb_obj.li.ul.li.a = gnb_obj.li.ul.li.find(">a");
		gnb_obj.h = $("#header #nav"); 
		gnb_obj.blind = $("#nav > #blind"); 
		
	//default
	setTimeout(function(){
		gnb_def();
	},100);
	
	$(window).resize(function() {
		gnb_def();
	});
	
	gnb_obj.mouseenter(function(){
		clearTimeout(gnb_obj.intervals);
	});	
	
	gnb_obj.mouseleave(function(){
		gnb_obj.intervals = setTimeout(function(){
			gnb_def(gnb_obj);
		},500);
	});
		
	gnb_obj.li.a.on("mouseover focus",function(){
		var idx = gnb_obj.li.index($(this).parent());
		gnb_open(idx);
	});
	
	gnb_obj.li.ul.mouseenter(function(){
		var idx = $(this).parent().index();
		
		gnb_obj.li.find(">a.on").removeClass("on");
		$(this).siblings("a").addClass("on");
		gnb_obj.li.ul.not($(this)).removeClass("on");
		$(this).addClass("on");
	});
	
	gnb_obj.li.ul.li.a.on("mouseover focus",function(){
		var idx = $(this).parent().parent().parent().index();

		gnb_obj.li.find(">a.on").removeClass("on");
		$(this).parent().parent().siblings("a").addClass("on");
		gnb_obj.li.find(">ul.on").removeClass("on");
		$(this).parent().parent().addClass("on");
	});	
	
	gnb_obj.li.ul.li.last().find(">a").on("focusout",function(){
		gnb_obj.intervals = setTimeout(function(){
			gnb_def(gnb_obj);
		},500);
	});
	
	function gnb_def(){
		$("#header").removeClass("on");
		gnb_obj.find("a").removeClass("on");
		gnb_obj.li.find(">ul.on").removeClass("on");
		gnb_obj.li.ul.stop().animate({"opacity":0},150,function(){$(this).hide();});
		gnb_obj.h.stop().animate({"height":gnb_obj.li.a.innerHeight()+"px"},300);
		gnb_obj.blind.stop().animate({"height":0+"px"},300);
		
		if(code[0] > -1){
			var obj = gnb_obj.li.eq(code[0]);
			obj.find(">a").addClass("on");
			
			if(code[1] > -1){
				obj = obj.find(">ul>li").eq(code[1]);
				obj.find(">a").addClass("on");
				if(code[2] > -1){
					obj = obj.find(">ul>li").eq(code[2]);
					obj.find(">a").addClass("on");

				}
			}
		}
	}
	
	function gnb_open(idx){
		$("#header").addClass("on");	
		gnb_obj.li.find(">a.on").removeClass("on");
		gnb_obj.li.eq(idx).find(">a").addClass("on");	
		gnb_obj.li.find(">ul.on").removeClass("on");
		gnb_obj.li.eq(idx).find(">ul").addClass("on");
		gnb_obj.maxH = 0;
		for(var i=0; i<gnb_obj.li.size(); i++){
			gnb_obj.maxH = Math.max(gnb_obj.maxH,gnb_obj.li.eq(i).find(">ul").removeAttr("style").innerHeight());
		}
		gnb_obj.li.ul.innerHeight(gnb_obj.maxH -2).show().stop().animate({"opacity":1},300);
		gnb_obj.h.stop().animate({"height":(gnb_obj.maxH + gnb_obj.li.a.innerHeight())+"px"},300);
		gnb_obj.blind.stop().animate({"height":gnb_obj.maxH+"px"},300);
	}
	
	//Sitemap
	$('<div id="slide_map"><div class="inner"><div class="binds"></div></div></div>').prependTo($("#wrap"));
	gnb_obj.clone(false).appendTo($("#slide_map >.inner > .binds"));

		
	$(".allmenu_btn").click(function(){
		
		if(!$("#slide_map").is(":hidden")){
			if(!$(this).hasClass("on")){
				$(this).addClass("on");
				$("body").addClass("fixed");
				$("#header").addClass("ov");
			} else {
				$(this).removeClass("on");
				$("body").removeClass("fixed");	
				$("#header").removeClass("ov");
			}
			return false;		
		} else {
			return true;
		}
		
	});
	
	//Mobile Menu
		var mob_gnb_obj = $("#slide_map"); 
		mob_gnb_obj.box = mob_gnb_obj.find(">.inner"); 
		mob_gnb_obj.box.gnb = mob_gnb_obj.box.find(">.binds"); 
		mob_gnb_obj.box.gnb.ul = mob_gnb_obj.box.gnb.find(">ul");
		mob_gnb_obj.box.gnb.ul.li = mob_gnb_obj.box.gnb.ul.find(">li");
		mob_gnb_obj.box.gnb.ul.li.a = mob_gnb_obj.box.gnb.ul.li.find(">a");
		mob_gnb_obj.box.gnb.ul.li.ul = mob_gnb_obj.box.gnb.ul.li.find(">ul");
		mob_gnb_obj.box.gnb.ul.li.ul.li = mob_gnb_obj.box.gnb.ul.li.ul.find(">li");
		mob_gnb_obj.box.gnb.ul.li.ul.li.a = mob_gnb_obj.box.gnb.ul.li.ul.li.find(">a");

	//def
	mob_def();

	if($("body").hasClass("fixed")){
		$("#header").addClass("ov");
	}else{
		$("#header").removeClass("ov");
	}
	$(window).resize(function(){
		
		if($("body").hasClass("fixed")){
			$("#header").addClass("ov");
		}else{
			$("#header").removeClass("ov");
		}

		
		mob_def();	
		
	});	
	mob_gnb_obj.box.gnb.ul.li.ul.li.a.each(function(){
		if($(this).siblings("ul").size() != 0){
			$(this).addClass("plus");	
		}
	});
	
	function mob_def(){
		mob_gnb_obj.box.find("a").removeClass("on");

		if(code[0] > -1){
			var obj = mob_gnb_obj.box.gnb.ul.li.eq(code[0]);
			obj.find(">a").addClass("on");
			
			if(code[1] > -1){
				obj = obj.find(">ul>li").eq(code[1]);
				obj.parent().css({"display":"block"});
				obj.find(">a").addClass("on");
				if(code[2] > -1){
					obj = obj.find(">ul>li").eq(code[2]);
					obj.parent().css({"display":"block"});
					obj.find(">a").addClass("on");

				}
			}
			
		}


	}
	
	mob_gnb_obj.box.gnb.ul.li.a.click(function(){
		if(mob_gnb_obj.box.gnb.ul.li.ul.is(":animated")) return false;
		if($(this).siblings("ul").size() != 0){
			mob_gnb_obj.box.gnb.ul.li.a.not(this).removeClass("on").siblings("ul").slideUp();
			$(this).toggleClass("on").siblings("ul").slideToggle();
			return false;	
		} else {
			return true;	
		}
	});
	
	mob_gnb_obj.box.gnb.ul.li.ul.li.a.click(function(){
		if(mob_gnb_obj.box.gnb.ul.li.ul.is(":animated")) return false;
		if($(this).siblings("ul").size() != 0){
			mob_gnb_obj.box.gnb.ul.li.ul.li.a.not(this).removeClass("on").siblings("ul").slideUp();
			$(this).toggleClass("on").siblings("ul").slideToggle(300);
			return false;	
		} else {
			return true;	
		}
	});
}

/* ///////////////////////////////////////////////////////////////////////////////////////////////////////////

	allmenu Function

/////////////////////////////////////////////////////////////////////////////////////////////////////////// */
$(document).ready(function(){
	$('<div class="side_link"></div>').prependTo($("#slide_map >.inner > .binds"));
	$("#header .toputil_control > div.q_link").clone(false).prependTo($("#slide_map >.inner > .binds >.side_link"));
	
		
	$(".allmenu_btn_open").click(function() {	
		
		if(!$("#slide_map").is(":hidden")){
				$("body").addClass("fixed");
				$(this).toggleClass("on");
				if($(this).hasClass("on")){
					$(this).html("<span>닫기</span>");
				} else {
					$(this).html("<span>열기</span>");	
					$("body").removeClass("fixed");		
				}
				return false;
			} else {
				$(this).removeClass("on");
				return true;
			}
	});
	
	$(window).resize(function() {
		if(!$("#slide_map").is(":hidden")){
			$("#slide_map .inner").css({"margin-right":0});
		}
	});
});	




/* ///////////////////////////////////////////////////////////////////////////////////////////////////////////

	sitmap Function

/////////////////////////////////////////////////////////////////////////////////////////////////////////// */
$(document).ready(function() {
	if($(".sitemap").size() != 0){
		$(".sitemap").empty();
		$("#gnb >ul").clone(false).appendTo($(".sitemap"));
	}
});

/* ///////////////////////////////////////////////////////////////////////////////////////////////////////////

	프린트 Function

/////////////////////////////////////////////////////////////////////////////////////////////////////////// */
$(document).ready(function() {
	$("a.print").click(function() {
		printElem({ 
			printMode: 'popup',
			pageTitle:'프린트 미리보기', //팝업 타이틀
			printDelay : 1000,
			leaveOpen:false, //인쇄하고도 창을 띄우기(true)/안띄우기(false). Default는 false
			printBodyOptions : {
				classNameToAdd : 'user',
				styleToAdd: 'width:1023px; overflow-x:hidden;'
			}
		});
		return false;
	});
});

function printElem(options){
	$('#txt').printElement(options); //팝업으로 띄울 영역 Div 아이디
}


/* ///////////////////////////////////////////////////////////////////////////////////////////////////////////

	js_lnbToggle Function

/////////////////////////////////////////////////////////////////////////////////////////////////////////// */
$(document).ready(function() {
	if($("#lnb").size() != 0){
		js_lnb();
	}
});
function js_lnb (){
	var obj = $("#remote.type_02 > #lnb >ul >li"); 

	obj.each(function() {
		var t = $(this);
			t.btn = t.find(">a"); 
			t.ul = t.find(">ul"); 
			t.ul.li = t.ul.find(">li"); 
		
		$("<em class='hidden'>열기</em>").appendTo(t.btn);		
			
		t.btn.on("click",function() {
			if(t.ul.is(":animated")) return false;
			
			$(this).toggleClass("on").siblings("ul").slideToggle(300);
			if($(this).hasClass("on")){
				$(this).find(">em").text("닫기");
			} else {
				$(this).find(">em").text("열기");
			}
			return false;
		});
		
		t.on("mouseleave",function() {
			//if($(this).find(">ul").is(":animated")) return false;
			
			$(this).find(">a").removeAttr("class");
			$(this).find(">ul").slideUp(300);
			t.btn.find(">em").text("열기");
			return false;
		});
		
		t.ul.li.last().find(">a").on("focusout",function() {
			$(this).parent().parent().siblings("a").removeAttr("class");
			$(this).parent().parent().slideUp(300);
			t.btn.find(">em").text("열기");
			return false;
		});		
	});
	
	$(".btn_share").click(function() {
		$(this).toggleClass("on");
		$(this).siblings(".sns").toggleClass("on");

		return false;
	});
}

/* ///////////////////////////////////////////////////////////////////////////////////////////////////////////

	sns share

/////////////////////////////////////////////////////////////////////////////////////////////////////////// */
$(document).ready(function() {
	if($(".btn_share").size() != 0){
		$(".btn_share").click(function() {
            $(this).toggleClass("on");
			if($(".sns").is(":animated")) return false;
			
			$(this).toggleClass("on");
			$(".sns").fadeToggle(300);
			
			return false;
		});
	}
});

/* ///////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	SNS 퍼가기

	ex)
	<a href="#" onclick="facebookOpen();return false;">페이스북</a>
	<a href="#" onclick="twitterOpen();return false;">트위터</a>
	<a href="#" onclick="blogOpen();return false;">블로그</a>

/////////////////////////////////////////////////////////////////////////////////////////////////////////// */
function blogOpen(){
	var titl = $("#txt h3").text();
	titl = titl.replace ('"', '&quot;');
	titl = titl.replace ('"', '&quot;');
	titl = encodeURIComponent(titl);
	var link = encodeURIComponent(location.href); 
	var url = "http://blog.naver.com/openapi/share?url=" + link + "&title=" + titl;
	snswindowOpen (url, 900, 450, 'no');
}
//페이스북
function facebookOpen(){
	var titl = $("#txt h3").text();
	titl = titl.replace ('"', '&quot;');
	titl = titl.replace ('"', '&quot;');
	titl = encodeURIComponent(titl);
	var link = encodeURIComponent(location.href); 
	var url = "http://www.facebook.com/sharer.php?u=" + link + "&t=" + titl;
	snswindowOpen (url, 900, 450, 'no');
}
//twitter
function twitterOpen(){
	var titl = $("#txt h3").text();
	titl = titl.replace ('"', '&quot;');
	titl = titl.replace ('"', '&quot;');
	titl = titl.replace('&gt;','>');
	titl = titl.replace('&gt;','>');
	titl = encodeURIComponent(titl);
	var link = encodeURIComponent(location.href); 
	var url = "http://twitter.com/share?text=" + titl + "&url=" + link;
	snswindowOpen (url, 800, 400, 'yes');
}
function snswindowOpen(){
	var nUrl; var nWidth; var nHeight; var nLeft; var nTop; var nScroll;
	nUrl = arguments[0];
	nWidth = arguments[1];
	nHeight = arguments[2];
	nScroll = (arguments.length > 3 ? arguments[3] : "no");
	nLeft = (arguments.length > 4 ? arguments[4] : (screen.width/2 - nWidth/2));
	nTop = (arguments.length > 5 ? arguments[5] : (screen.height/2 - nHeight/2));
	winopen=window.open(nUrl, 'SNS', "left="+nLeft+",top="+nTop+",width="+nWidth+",height="+nHeight+",scrollbars="+nScroll+",toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=no");
}
//naver band
function shareNaverBand() {
	var content = $("#txt h3").text();
	var url = encodeURIComponent(location.href + '\n');
	// var link = 'https://band.us/plugin/share?body='+content+'&route='+url;
	var link = 'https://band.us/plugin/share?body='+encodeURIComponent(content)+encodeURIComponent('\n')+url+'&route='+url;
	window.open( link, 'share', 'width=500, height=500' );
}
//kakao story
function shareKakaoStory() { 
	var content = $("#txt h3").text();
	var url = encodeURIComponent(location.href); 
	var link = 'https://story.kakao.com/share?url='+url; 
	window.open( link, 'share', 'width=500, height=500' ); 
}

/* ///////////////////////////////////////////////////////////////////////////////////////////////////////////

	첨부파일 js

/////////////////////////////////////////////////////////////////////////////////////////////////////////// */
$(document).ready(function(){

	var fileTarget = $('.file_find .upload-hidden');

	fileTarget.each(function(index) { 
	if($(this).siblings('.upload-name').val()!='null' && $(this).siblings('.upload-name').val()!=''){
		$(this).siblings('.upload-name').next().css("display","inline-block");
		}
	});

	fileTarget.on('change', function(){
		if(window.FileReader){
			// 파일명 추출
			var filename = $(this)[0].files[0].name;
		}else {
			// Old IE 파일명 추출
			var filename = $(this).val().split('/').pop().split('\\').pop();
		};

		$(this).siblings('.upload-name').val(filename);

		if($(this).siblings('.upload-name').val()!='null' && $(this).siblings('.upload-name').val()!=''){
		$(this).siblings('.upload-name').next().css("display","inline-block");
		}
	});

});

/* ///////////////////////////////////////////////////////////////////////////////////////////////////////////

API map

/////////////////////////////////////////////////////////////////////////////////////////////////////////// */
$(document).ready(function(){
	if($("#map").size() != 0){
		map_AC();
	}
});
function map_AC(){
	var obj = $("#map");
	for(var i = 0; i < obj.size(); i++){
		obj.vals = $.trim(obj.eq(i).text()).split("/");
		obj.codes = obj.vals[0];
		obj.keys = obj.vals[1];
		
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng(obj.codes, obj.keys), // 지도의 중심좌표
	        level: 5, // 지도의 확대 레벨
	        mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
	    }; 

	// 지도를 생성한다 
	var map = new daum.maps.Map(mapContainer, mapOption); 

	// 지도에 마커를 생성하고 표시한다
	var marker = new daum.maps.Marker({
	    position: new daum.maps.LatLng(obj.codes, obj.keys), // 마커의 좌표
	    map: map // 마커를 표시할 지도 객체
	});
	}
	
}

/* ///////////////////////////////////////////////////////////////////////////////////////////////////////////

sitemap Function

/////////////////////////////////////////////////////////////////////////////////////////////////////////// */
$(window).load(function() {
	if($("#sitemap").size() != 0){
		$("#gnb >ul").clone(false).appendTo($("#sitemap"));
	}
});