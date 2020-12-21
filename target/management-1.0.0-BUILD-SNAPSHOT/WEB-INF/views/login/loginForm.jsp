<%@page import="com.spring.dto.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- page list.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script language="javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<!-- 부트스트랩 -->
<!-- <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
		
	function loginForm(){
		if ($("#member_id").val() == "") {
		    alert("아이디를 입력해주세요");
		    $("#member_id").focus();
		    return false;
		}
		
		if ($("#member_password").val() == "") {
		    alert("비밀번호를 입력해주세요");
		    $("#member_password").focus();
		    return false;
		}
		
		$("#member").submit();
		
	}


</script>

 




<!-- Container :S -->
	<div id="container">
	    <div id="remote" class="type_02">
			<div id="lnb" class="js_menu">
				<ul>
					<li class="home">
						<a href="#">Home<em class="hidden">열기</em></a>
					</li>
					<li>
						<a href="#" title="1뎁스 메뉴 선택 링크리스트, 클릭시 해당 페이지로 이동합니다."><span>ManageMent</span><em class="hidden">열기</em></a>
						<ul style="display: none;">
							<li class="sub01"><a href="#"><span>ManageMent</span></a></li>
							<li class="sub02"><a href="#"><span>MY AREA</span></a></li>
							<li class="sub03"><a href="#"><span>이용 시설 소개</span></a></li>
							<li class="sub04"><a href="#"><span>커뮤니티</span></a></li>
							<li class="sub05"><a href="#"><span>공지사항</span></a></li>
						</ul>
					</li>
					<li>
						<a href="#" title="2뎁스 메뉴 선택 링크리스트, 클릭시 해당 페이지로 이동합니다."><span>ManageMent</span><em class="hidden">열기</em></a>
						<ul style="display: none;">
							<li class="sub01_01"><a href="#"><span>이용 회원</span></a></li>
							<li class="sub01_02"><a href="#"><span>LOCKER</span></a></li>
						</ul>
					</li>
				</ul>
			</div>
			<div id="path">
				<ul class="sns">
					<li><a href="#" class="fb" onclick="facebookOpen();return false;" target="_blank" title="새창이동, 페이스북 공유">페이스북</a></li>
					<li><a href="#" class="tw" onclick="twitterOpen();return false;" target="_blank" title="새창이동, 트위터 공유">트위터</a></li>
					<li><a href="#" class="ks" onclick="shareKakaoStory();return false;" target="_blank" title="새창이동, 카카오스토리 공유">카카오스토리</a></li>
					<li><a href="#" class="bd" onclick="shareNaverBand();return false;" target="_blank" title="새창이동, 밴드 공유">밴드</a></li>
				</ul>
				<a href="#" class="btn_share">SNS공유<em>열기</em></a>
				<a href="#" class="print">print</a>
			</div>
		</div>
	    
		<!-- Content :S -->
		<div id="content">
			<div id="txt">
				<h3 class="title">로그인</h3>
				<div class="layout">
					<!--컨텐츠 S-->
                    <div class="align_right mb_05">
                    <form name="member" id="member" class="frm" action="/login/loginPost" method="POST">
	                    <div class="board_insert">
	                        <ul class="detail">
	                            <li class="title">
	                                <div class="titles">
	                                    <span>
	                                        <strong>
	                                            <label for="member_id">아이디</label>
	                                        </strong>
	                                    </span>
	                                </div>
	                                <div class="txts">
	                                    <input id="member_id" name="member_id" class="div_nField" title="아이디를 입력하세요." type="text">
	                                </div>
	                            </li>
	                           <li class="regName">
	                                <div class="titles">
	                                    <span>
	                                        <strong>  
	                                            <label for="member_password">비밀번호</label>
	                                        </strong>
	                                    </span>
	                                </div>
	                                <div class="txts">
	                                    <input id="member_password" name="member_password" style="max-width: 100%;" class="div_nField" title="비밀번호를 입력하세요." type="password">
	                                </div>
	                            </li>
	                        </ul>
	                    </div>
                    </form>
                    <div class="align_center mt_30">
                        <a href="#create" class="btn ty_2" onclick="loginForm(); return false;">로그인</a>  
                        <a href="/login/register" class="btn bg_02" onclick="register(); return false;">회원가입</a>  
                    </div>
					<!--컨텐츠 E-->
				</div>
			</div>
		</div>
		<!-- Content :E -->
		
	</div>	
	<!-- Container :E -->


<%@ include file="../include/footer.jsp" %>	