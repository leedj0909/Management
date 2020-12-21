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
			
			frmObj.submit();
			
		});
	});

	var result = '${result}';
	
	if(result == 'modifySuccess'){
		alert("등록 되었습니다.");
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
				<div class="layout">
					<!--컨텐츠 S-->
                    <div class="align_right mb_05">
                    <form name="member" id="member" class="frm" action="/member/modifyPage" method="POST" >
	                    <input type="hidden" name="member_no" value="${memberDTO.member_no }" />
		           		<input type="hidden" name="page" value="${sc.page }"/>
		           		<input type="hidden" name="numPerPage" value="${sc.numPerPage }"/>
		           		
		           		<!-- 검색조건 + keyword -->
			     		<input type="hidden" name="searchType" value="${sc.searchType }"/>
			     		<input type="hidden" name="keyword" value="${sc.keyword }"/>
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
	                                <div class="txts" style="text-align: left; display: block;">
	                                    <input id="member_id" name="member_id" class="div_nField" 
	                                    type="text" style="width: 70%" value="${memberDTO.member_id }" readonly="readonly">
	                                </div>
	                            </li>
	                            
	                            <li class="title">
	                                <div class="titles">
	                                    <span>
	                                        <strong>
	                                            <label for="member_name">이름</label>
	                                        </strong>
	                                    </span>
	                                </div>
	                                <div class="txts" style="text-align: left; display: block;">
	                                    <input id="member_name" name="member_name" class="div_nField" value="${memberDTO.member_name }" type="text" style="width: 70%" readonly="readonly">
	                                </div>
	                            </li>
	                            
	                             <li class="secretSts">
                                <div class="titles">
                                   <span>
                                       <strong>성별</strong>
                                   </span>
                                </div>
                                <div class="txts" style="text-align: left;">
                                    <input type="radio" name="member_gander" value="남자" id="member_gander1" checked="checked"><label for="member_gender1">${memberDTO.member_gander }</label>
                                </div>
                            </li>
	                            
	                            <li class="title">
	                                <div class="titles">
	                                    <span>
	                                        <strong>
	                                            <label for="member_birth">생년월일</label>
	                                        </strong>
	                                    </span>
	                                </div>
	                                <div class="txts" style="text-align: left; display: block;">
	                                	<input id="member_birth_year" name="member_birth_year" class="div_nField" value="${memberDTO.member_birth_year }" type="text" style="width: 60px;" readonly="readonly">년
	                                	<input id="member_birth_month" name="member_birth_month" class="div_nField" value="${memberDTO.member_birth_month }" type="text" style="width: 60px;" readonly="readonly">월
	                                	<input id="member_birth_date" name="member_birth_date" class="div_nField" value="${memberDTO.member_birth_date }" type="text" style="width: 60px;" readonly="readonly">일
	                                </div>
	                            </li>
	                            
	                            <li class="title">
	                                <div class="titles">
	                                    <span>
	                                        <strong>
	                                            <label for="member_address">주소</label>
	                                        </strong>
	                                    </span>
	                                </div>
	                                <div class="txts" style="text-align: left; display: block;">
	                                    <input type="text" name="member_postCode" id="member_postCode" size="29" value="${memberDTO.member_postCode }" style="width: 70%;" readonly="readonly">
										<input type="text" name="member_roadAddress" id="member_roadAddress" size="45" value="${memberDTO.member_roadAddress }" style="width: 70%; margin-top: 10px;" readonly="readonly">
										<input type="text" name="member_detailAddress" id="member_detailAddress" size="45" value="${memberDTO.member_detailAddress }" style="width: 70%; margin-top: 10px;" readonly="readonly">
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
	                                    <input id="member_phone" name="member_phone" class="div_nField" style="width: 70%" value="${memberDTO.member_phone }" type="text" readonly="readonly">
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
	                                    <input id="member_email" name="member_email" class="div_nField" style="width: 70%" value="${memberDTO.member_email }" type="text" readonly="readonly">
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
		                                <input type="text" name="member_startdate" id="member_startdate" class="js_cal" pattern="yyyy-MM-dd" value="" /> ~ 
		                                <input type="text" name="member_enddate" id="member_enddate" class="js_cal" pattern="yyyy-MM-dd" value="" />
	                                </div>
	                            </li>
	                            
	                            <li class="title">
	                                <div class="titles">
	                                    <span>
	                                        <strong>
	                                            <label for="member_date">연장 월수</label>
	                                        </strong>
	                                    </span>
	                                </div>
	                                <div class="txts" style="text-align: left; display: block;">
	                                	<select name="addMonth" id="addMonth">
	                                		<c:forEach begin="1" end="36" varStatus="varStatus">
	                                			<option value="${varStatus.count }">${varStatus.count }</option>
	                                		</c:forEach>
	                                	</select> 개월
	                                	<a href="#link" onclick="addMonth(); return false;" class="btn ty_2">날짜계산</a>
	                                </div>
	                            </li>
	                            
	                        </ul>
	                    </div>
                    </form>
                    <div class="align_center mt_30">
                        <a href="/member/memberList" class="btn ty_2">목록으로</a>
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

<script type="text/javascript">
	function addMonth(){
		var member_startdate = $("#member_startdate").val();
		var addMonth = $("#addMonth").val();
		$.ajax({
			// 설정안하면 GET으러 감, 생략가능하지만 가독성? 때문에 적는 경우가 많음
			type : 'POST',
			// url : 보낼 주소를 적음/ 없어서는 안됨
			url : '/member/addMonth',
			dataType : 'json', 
			// body에 data를 실을때 사용
			// 위에서 var로 선언해준 값들을 앞 변수를 가지고 컨트롤러에 전달해줌
			// 그래서 controller에 보면 addStartDate를 가지고 데이터를 확인함.
			data : {"addStartDate" : member_startdate, "addMonth" : addMonth},
			success : function(result){
				// 작업이 성공했다면 그 값을 result에 담아진다.
				// 결과값을 가져가야되기때문에 result에서 (.)을 이용해서 원하는 값을 꺼내온다
				$("#member_startdate").val(result.addStartDate);
				$("#member_enddate").val(result.addEndDate);
			}
		});
	}
</script>
	
	
<%@ include file="../include/footer.jsp" %>	