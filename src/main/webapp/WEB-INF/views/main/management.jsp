<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
<meta property="og:title" content="ManageMent" />
<meta property="og:description" content="ManageMent" />
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
<link rel="stylesheet" href="/resources/assets/css/site/kor/main.css" media="all" />
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
	if('${adminmessage}' != ''){
		alert('${adminmessage}');
	}

});
</script>
<body id="main" class="user">
<!-- Skip :S -->
<div id="skip">
	<strong class="hidden">반복영역 건너뛰기</strong>
	<ul>
		<li><a href="#content">본문 </a></li>
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
				<ul class="nav">
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
			<div class="q_link"><a href="#">HOME</a><a href="#">SITEMAP</a></div>
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
	<div id="main_visual"> 
		<div class="js_slide type_03">
			<div class="layout">
				<div class="control">
					<a href="#" class="btn_left"><span>이전</span></a>
					<a href="#" class="btn_play"><span>재생</span></a>
					<a href="#" class="btn_stop"><span>정지</span></a>
					<a href="#" class="btn_right"><span>다음</span></a>
				</div>
				<div class="txts">
					<p class="title">
					</p>

				</div>
			</div>
			<div class="move">
				<ul>
					<li>비쥬얼1</li>
					<li>비쥬얼2</li>
					<li>비쥬얼3</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- Visual :E -->

	<!-- Container :S -->
	<div id="container">
	
		<!-- Content :S -->
		<div id="content">
			<div class="layout">
				<!--공지사항, 팝업, sns S-->
				<div class="section1">
                    <div class="notice_wrap">
                        <h4>공지사항</h4>
                        <ul>
                        <c:forEach var="main" items="${list }" end="3">
                            <li class="new">
                                <span class="subject">
                                    <a href="/bmm/N/readPage?board_no=${main.board_no}">${main.board_title}</a>
                                </span>
                                <span class="date"><fmt:formatDate value="${main.board_regdate }" pattern="yyyy/MM/dd" /></span>
                            </li>
                         </c:forEach>
                        </ul>
                        <a href="/" class="more_btn">공지사항 더보기</a>
                    </div>
					<div class="qu_wrap">
                        <ul>
                            <li>
                                <a href="#">
                                    <span>ManageMent</span>
                                </a>
                            </li>
                            <li>
                                <a href="/email/keeplist">
                                    <span>Q&amp;A</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span>이용안내</span>
                                </a>
                            </li>
                        </ul>
					</div>
					<div class="popup_wrap">
                        <div class="js_slide type_02">
                            <div class="control">
                                <a href="#link" class="btn_left"><span>이전</span></a>
                                <a href="#link" class="btn_play"><span>재생</span></a>
                                <a href="#link" class="btn_stop"><span>정지</span></a>
                                <a href="#link" class="btn_right"><span>다음</span></a>
                            </div>
                            <div class="move">
                                <ul>
                                    <li><a href="#"><span><img src="/resources/assets/images/site/kor/main/exercise.jpg" alt="" /></span></a></li>
                                    <li><a href="#"><span><img src="/resources/assets/images/site/kor/main/exercise1.jpg" alt="" /></span></a></li>
                                    <li><a href="#"><span><img src="/resources/assets/images/site/kor/main/exercise2.jpg" alt="" /></span></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
				</div>
				<!--공지사항, 팝업, sns E-->
				<!--마지막 베너 S-->
				<div class="section2">
				    <div>
                        <h4>프로그램 안내</h4>
                        <div class="prg_s">
                            <a href="#">프로그램</a>
                            <a href="#">프로그램</a>
                            <a href="#">프로그램</a>
                        </div>
                        
				    </div>
				</div>
				<!--마지막 베너 E-->

			</div>
		</div>
		<!-- Content :E -->
		
	</div>	
	<!-- Container :E -->

	<div id="footer">
		<div class="layout">
		<ul class="menu_link">
				<li><a href="#">개인정보처리방침</a></li>
				<li><a href="#">이메일주소무단수집거부</a></li>
				<li><a href="#">이용약관</a></li>
				<li><a href="#">영상정보처리기기 운영&middot;관리</a></li>
			</ul>
			<p class="address">MANAGEMENT <span>인천광역시 <a href="tel:032-000-0000">032-000-0000</a></span></p>
			<p class="copy">COPYRIGHT(C) 2020 BY MANAGEMENT DISTRICT. <span>ALL RIGHT RESERVED.</span></p>
		</div>
	</div>
	<!-- footer :E -->
	
</div>   
</body>
</html>

