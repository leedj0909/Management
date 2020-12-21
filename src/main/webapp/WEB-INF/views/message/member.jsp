<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#searchBtn").click(function(){
			self.location = "member"+"${pagingMaker.makeUri(1)}"
							+"&searchType="+$('select option:selected').val()
							+"&keyword="+$('#searchWord').val();
		});
	});
	
	// 단독으로 하나만 보내지는 경우
 	/* $(function(){
 		$("#no").click(function(memeber){
 			console.log(member.id);
 			return false;
 			opener.document.getElementById("message_recevice_no").value = document.getElementById("member_no").value;
 			self.close();
 		});
 	}); */
 	
 	// 체크박스와 for문을 통해 체크된 값을 배열로 담아 보내지는 경우
 	function popClose(){
 		var memberIdGroup = '';
 		var memberId = '';
 		for(var i=0; i < $("[id*='member_no_']").length; i++){
 			if($("#member_no_"+i).is(":checked")){
 				// $("#member_no_0").is(":checked") true, false 리턴
 				if(memberIdGroup == ''){
	 				memberIdGroup += $("#member_no_"+i).val();
	 				memberId += $('#member_id_'+i).val();
 				}else{
 					memberIdGroup += ','+$("#member_no_"+i).val();
 					memberId += ','+$('#member_id_'+i).val();
 				}
 			}
 		}
 		opener.document.getElementById("message_recevice_no_temp").value = memberIdGroup;
 		opener.document.getElementById("message_recevice_id").value = memberId;
 		self.close();
 	}

</script>
    
<!-- Container :S -->
	<div id="container">
	    <div id="remote" class="type_02">
			<div id="lnb" class="js_menu">
				<ul>
					<li class="home">
						<a href="/login/loginForm">Home<em class="hidden">열기</em></a>
					</li>
					<li>
						<a href="#" title="1뎁스 메뉴 선택 링크리스트, 클릭시 해당 페이지로 이동합니다."><span>게시판</span><em class="hidden">열기</em></a>
						<ul style="display: none;">
							<li class="sub01"><a href="#"><span>1뎁스</span></a></li>
							<li class="sub02"><a href="#"><span>1뎁스</span></a></li>
							<li class="sub03"><a href="#"><span>1뎁스</span></a></li>
							<li class="sub04"><a href="#"><span>1뎁스</span></a></li>
							<li class="sub05"><a href="#"><span>1뎁스</span></a></li>
						</ul>
					</li>
					<li>
						<a href="#" title="2뎁스 메뉴 선택 링크리스트, 클릭시 해당 페이지로 이동합니다."><span>자유게시판</span><em class="hidden">열기</em></a>
						<ul style="display: none;">
							<li class="sub01_01"><a href="#"><span>2뎁스</span></a></li>
							<li class="sub01_02"><a href="#"><span>2뎁스</span></a></li>
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
				<h3 class="title">
					회원정보 조회
				</h3>
				<div class="layout">
					<!--컨텐츠 S-->
				    <div class="board_search">
<!--                         <div class="count"> -->
<!--                             <strong>총 게시물</strong> -->
<%--                             <span class="price">${pagingMaker.totalData }</span> --%>
<%--                             <span>${pagingMaker.startPage } </span>/ ${pagingMaker.endPage } --%>
<!--                         </div> -->
                        <div class="select">
                                <label for="input_sel" class="hidden">검색조건 선택</label>
                                <select name="searchType" id="input_sel">
                                    <option value="" <c:out value="${sc.searchType == '' ? 'selected' : '' }" />>전체</option>
									<option value="S" <c:out value="${sc.searchType == 'S' ? 'selected' : '' }" />>아이디</option>
									<option value="C" <c:out value="${sc.searchType == 'C' ? 'selected' : '' }" />>이름</option>
									<option value="W" <c:out value="${sc.searchType == 'W' ? 'selected' : '' }" />>이메일</option>
                                </select>
                                <label for="searchWord" class="hidden">검색어 입력</label>
                                <input type="text" name="keyword" id="searchWord" class="input_val" title="검색어를 입력해주세요." value="<c:out value='${sc.keyword }'/>">
                                <button type="button" class="search_btn" value="검색" id="searchBtn" title="검색">검색</button>
                        </div>
                    </div>
                    <form action="" name="member_form">
                    <input type="hidden" name="member_no" id="member_no" />
                    <div class="notice_list">
                        <ul>
                            <li class="thead">
                                <strong class="no" style="width: 10%;">회원번호</strong>
                                <strong class="subject" style="width: 30%;">회원아이디</strong>
                                <strong class="writer" style="width: 30%;">회원이름</strong>
                                <strong class="date" style="width: 30%;">이메일</strong>
<!--                           		 <strong class="file_atch">파일</strong>   -->
                            </li>
                            <c:forEach var="mdto" items="${memberList }" varStatus="varStatus">
	                            <li>
	                                <p class="no">
										<input type="checkbox" name="member_no" id="member_no_${varStatus.index }" value="${mdto.member_no }" />
	                               	</p>
	                                <p class="subject align_left">
                                        ${mdto.member_id }
                                        <input type="hidden" id="member_id_${varStatus.index }" value="${mdto.member_id }" />
	                                </p>
	                                <p class="writer">${mdto.member_name }</p>  
	                                <p class="date">${mdto.member_email }</p>
	                                <p class="file_atch"></p>
	                            </li>
                            </c:forEach>
                        </ul>
                    </div>
                    </form>
<!--                     <div class="align_right mt_30"> -->
<%--                     <c:if test="${login != null }"> --%>
<!--                         <a href="/message/write" class="btn">쪽지 보내기</a> -->
<%--                     </c:if> --%>
<!--                     </div> -->
                    <div class="page">
                        <c:if test="${pagingMaker.prev }">
						  <a href="member${pagingMaker.makeSearch(pagingMaker.startPage - 1 ) }" class="page_left">
						  이전</a>
						</c:if>
                        <c:forEach begin="${pagingMaker.startPage }" end="${pagingMaker.endPage }" var="pNum" >
						  <a href="member${pagingMaker.makeSearch(pNum) }" <c:if test="${sc.page eq pNum}">class="on"</c:if> >${pNum }</a>
						</c:forEach>
                        <!-- <a href="#" class="on" title="현재 페이지">5</a> --> 
                        <c:if test="${pagingMaker.next && pagingMaker.endPage > 0}">
						  <a href="member${pagingMaker.makeSearch(pagingMaker.endPage + 1) }" class="page_right">
						  	다음
						  </a>
						</c:if>
                    </div>
                    <div class="align_right mt_30">
                        <a href="#create" onclick="popClose();" class="btn ty_2">보내기</a>
                    </div>
					<!--컨텐츠 E-->
				</div>
			</div>
		</div>
		<!-- Content :E -->
		
	</div>	

<%@ include file="../include/footer.jsp" %>