<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=2.0,user-scalable=yes, target-densitydpi=device-dpi" />
<meta name="format-detection" content="telephone=no,email=no,address=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta property="og:type" content="website" />
<meta property="og:title" content="대전광역시 동구청 청년공간" />
<meta property="og:description" content="대전광역시 동구청 청년공간" />
<meta property="og:image" content="/images/core/logo.ico" />
<meta name="twitter:image" content="/images/core/logo.ico" />
<meta name="naver-site-verification" content="" />
<title>ManageMent</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/assets/images/core/favicon.ico" />
<link rel="apple-touch-icon" href="/resources/assets/images/core/favicon.ico" />
<link rel="stylesheet" href="/resources/assets/font/NanumSquareRound/nanumsquareround.min.css" media="all" />
<link rel="stylesheet" href="/resources/assets/font/TTSoopilmyungjoR/font.css" media="all" />
<link rel="stylesheet" href="/resources/assets/js/core/plug/calendar/jquery-ui.css" media="all" />
<link rel="stylesheet" href="/resources/assets/js/core/plug/custom-scrollbar-plugin/jquery.mCustomScrollbar.css" media="all" />
<link rel="stylesheet" href="/resources/assets/css/site/core/core.css" media="all" />
<link rel="stylesheet" href="/resources/assets/css/site/kor/skin.css" media="all" />
<link rel="stylesheet" href="/resources/assets/css/site/kor/layout.css" media="all" />
<link rel="stylesheet" href="/resources/assets/css/site/kor/board.css" media="all" />
<link rel="stylesheet" href="/resources/assets/css/site/kor/content.css" media="all" />

<script src="/resources/assets/js/core/plug/calendar/jquery-1.9.1.js"></script>
<script src="/resources/assets/js/core/plug/calendar/jquery-ui.js"></script>
<script src="/resources/assets/js/core/plug/jquery-mousewheel-3.1.11/jquery.mousewheel.min.js"></script>
<script src="/resources/assets/js/core/plug/jquery.scrollTo-1.4.13/jquery.scrollTo.min.js"></script>
<script src="/resources/assets/js/core/plug/custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>

<script src="/resources/assets/js/core/core.js"></script>
<script src="/resources/assets/js/site/kor/content.js"></script>
<script src="/resources/assets/js/core/html5.js"></script>
<script src="/resources/assets/js/core/print/jquery.printElement.js"></script>
<script src="/resources/assets/js/core/respond.min.js"></script>


</head>

<script>
$(document).ready(function() {
	if('${message}' != ''){
		alert('${message}');
	}
	
});
</script>


<body id="sub" class="user">
<!-- Skip :S -->
<div id="skip">
	<strong class="hidden">반복영역 건너뛰기</strong>
	<ul>
		<li><a href="#content">본문 바로가기</a></li>
		<li><a href="#gnb">상단메뉴 바로가기</a></li>
	</ul>
</div>
<!-- Skip :E -->

<div id="wrap">
	<div class="js_mobile_check"></div>
	
	<!-- Header :S -->
	<div id="header">
		<h1 class="logo"><a href="/">ManageMent</a></h1>
		<div id="nav">
			<div id="blind"></div>
			<div id="gnb">
				<ul>
					<li><a href="#"><span>ManageMent</span></a>
						<ul>
							<li><a href="/member/memberList">이용 회원</a></li>
							<li><a href="/locker/lockerList">개인 사물함</a></li>
						</ul>
					</li>
					<li><a href="sub.html"><span>이용 시설 소개</span></a>
						<ul>
							<li><a href="sub.html">공간 소개</a></li>
							<li><a href="sub.html">이용 안내</a></li>
							<li><a href="sub.html">오시는 길</a></li>
						</ul>
					</li>
					<li><a href="sub.html"><span>커뮤니티</span></a>
						<ul>
							<li><a href="/memo/calender">나의 일정 관리</a></li>
							<li><a href="/message/messageList">메세지함</a></li>
							<li><a href="/message/sendList">보낸편지함</a></li>
						</ul>
					</li>
					<li><a href="/bmm/F/pageList"><span>게시판</span></a>
						<ul>
							<li><a href="/bmm/P/pageList">개인게시판</a></li>
							<li><a href="/bmm/S/pageList">공유게시판</a></li>
							<li><a href="/bmm/F/pageList">자유게시판</a></li>
							<li><a href="/bmm/Q/pageList">문의게시판</a></li>
						</ul>
					</li>
					<li><a href="/bmm/N/pageList"><span>공지사항</span></a>
						<ul>
							<li><a href="/bmm/N/pageList">공지사항</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<div class="toputil_control">
			<c:catch>
				<c:choose>
					<c:when test="${login == null }">
						<a href="/login/loginForm" class="allmenu_btn_open">전체메뉴<span>열기</span></a>
						<a href="/login/register" class="allmenu_btn_open_1">전체메뉴<span>열기</span></a> 
					</c:when>
					<c:otherwise>
						<ul class="nav">
							<li><a href="/login/logout"><span>${login.member_id }</span>님</a>  
						</ul>
					</c:otherwise>
				</c:choose>
			</c:catch>
		</div>
	</div>	
	<script type="text/javascript">
		Tmenu_setting("000000");
	</script>
	<!-- Header :E -->
<!-- Visual :S -->
	<div id="visual" class="visu01"> 
		<h2 class="title"><p>비쥬얼멘트 <span>비쥬얼멘트</span></p> ManageMent</h2>
	</div>
	<!-- Visual :E -->

	