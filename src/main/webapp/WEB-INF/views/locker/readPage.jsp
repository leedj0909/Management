<%@page import="com.spring.dto.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- page list.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script language="javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 부트스트랩 -->
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
	$(function(){
		
		var frmObj = $('.frm');
		
		$('.modify').click(function(){
			if(confirm("수정 하시겠습니까?")){
				frmObj.attr('method', 'get');
				frmObj.attr('action', '/locker/delPage');
				frmObj.submit();
			}
		});
	});

	var result = '${result}';
	
	if(result == 'modifySuccess'){
		alert("수정 되었습니다.");
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
				<h3 class="title">이용회원</h3>
				<form role="form" method="post" class="frm">
		     		<input type="hidden" name="locker_no" value="${lockerDTO.locker_no }" />
		     		<input type="hidden" name="page" value="${sc.page }" />
		     		<input type="hidden" name="numPerPage" value="${sc.numPerPage }" />
		     		
		     		<!-- 검색조건 + keyword -->
		     		<input type="hidden" name="searchType" value="${sc.searchType }"/>
		     		<input type="hidden" name="keyword" value="${sc.keyword }"/>
	     		</form>
				<div class="layout">
					<!--컨텐츠 S-->
                    <div class="align_right mb_05">
                    
	                    <div class="board_insert">
	                        <ul class="detail">
	                            <li class="title">
	                                <div class="titles">
	                                    <span>
	                                        <strong>
	                                            <label for="locker_no">사물함 번호</label>
	                                        </strong>
	                                    </span>
	                                </div>
	                                <div class="txts" style="text-align: left; display: block;">
	                                    <input id="locker_no" name="locker_no" class="div_nField" 
	                                    type="text" style="width: 70%" value="${lockerDTO.locker_no }" readonly="readonly">
	                                </div>
	                            </li>
	                            
	                            <li class="title">
	                                <div class="titles">
	                                    <span>
	                                        <strong>
	                                            <label for="member_id">회원 ID</label>
	                                        </strong>
	                                    </span>
	                                </div>
	                                <div class="txts" style="text-align: left; display: block;">
	                                    <input id="member_id" name="member_id" class="div_nField" value="${lockerDTO.locker_id }" type="text" style="width: 70%" readonly="readonly">
	                                </div>
	                            </li>
	                            
	                             <li class="secretSts">
                                <div class="titles">
                                   <span>
                                       <strong>
	                          	         <label for="member_name">회원 이름</label>
	                                   </strong>
                                   </span>
                                </div>
                                <div class="txts" style="text-align: left;">
                               		 <input id="member_name" name="member_name" class="div_nField" value="${lockerDTO.locker_name }" type="text" style="width: 70%" readonly="readonly">	
                                </div>
                            </li>
	                            
                            <li class="title">
                                <div class="titles">
                                    <span>
                                        <strong>
                                            <label for="member_phone">휴대전화</label>
                                        </strong>
                                    </span>
                                </div>
                                <div class="txts" style="text-align: left; display: block;">
                                    <input id="member_phone" name="member_phone" class="div_nField" style="width: 70%" value="${lockerDTO.locker_phone }" type="text" readonly="readonly">
                                </div>
                            </li>
	                            
                            <li class="title">
                                <div class="titles">
                                    <span>
                                        <strong>
                                            <label for="member_email">이메일</label>
                                        </strong>
                                    </span>
                                </div>
                                <div class="txts" style="text-align: left; display: block;">
                                    <input id="member_email" name="member_email" class="div_nField" style="width: 70%" value="${lockerDTO.locker_email }" type="text" readonly="readonly">
                                </div>
                            </li>
                            
                            <li class="title">
                                <div class="titles">
                                    <span>
                                        <strong>
                                            <label for="member_date">시설 이용기간</label>
                                        </strong>
                                    </span>
                                </div>
                                <div class="txts" style="text-align: left; display: block;">
	                                <input type="text" name="member_startdate" id="member_startdate" class="js_cal" value="${lockerDTO.locker_startdate }" readonly="readonly" /> ~ 
	                                <input type="text" name="member_enddate" id="member_enddate" class="js_cal" value="${lockerDTO.locker_enddate }" readonly="readonly"/>
                                </div>
                            </li>
	                            
	                        </ul>
	                    </div>
                    <div class="align_center mt_30">
                        <a href="/locker/lockerList" class="btn ty_2">목록으로</a>
                        <a href="#" class="btn modify">수정하기</a>
                    </div>
					<!--컨텐츠 E-->
				</div>
			</div>
		</div>
		<!-- Content :E -->
	</div>
	</div>	
	<!-- Container :E -->
	
<%@ include file="../include/footer.jsp" %>	