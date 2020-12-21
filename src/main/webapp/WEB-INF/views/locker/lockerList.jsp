<%@page import="com.spring.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- page list.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#searchBtn").click(function(){
			self.location = "lockerList"+"${pagingMaker.makeUri(1)}"
							+"&searchType="+$('select option:selected').val()
							+"&keyword="+$('#searchWord').val();
		});
		
		
		var result = '${result}';
		
		if(result == 'modifySuccess'){
			alert("수정 되었습니다");
		}
	});
</script>
<%@ include file="../include/header.jsp" %>

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
					사물함
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
									<option value="S" <c:out value="${sc.searchType == 'S' ? 'selected' : '' }" />>사물함번호</option>
									<option value="C" <c:out value="${sc.searchType == 'C' ? 'selected' : '' }" />>회원ID</option>
<%-- 									<option value="W" <c:out value="${sc.searchType == 'W' ? 'selected' : '' }" />>보낸사람</option> --%>
                                </select>
                                <label for="searchWord" class="hidden">검색어 입력</label>
                                <input type="text" name="keyword" id="searchWord" class="input_val" title="검색어를 입력해주세요." value="<c:out value='${sc.keyword }'/>">
                                <button type="button" class="search_btn" value="검색" id="searchBtn" title="검색">검색</button>
                        </div>
                    </div>
                    <form  role="form" action="/locker/lockerList" class="form-horizontal style-form frm" method="post">
                    	<input type="hidden" name="locker_no" value="${lockerDTO.locker_no }" />
		           		<input type="hidden" name="page" value="${sc.page }"/>
		           		<input type="hidden" name="numPerPage" value="${sc.numPerPage }"/>
		           		
		           		<!-- 검색조건 + keyword -->
			     		<input type="hidden" name="searchType" value="${sc.searchType }"/>
			     		<input type="hidden" name="keyword" value="${sc.keyword }"/>
                    <div class="notice_list">
                        <ul>
                            <li class="thead">
                                <strong class="no" style="width: 20%;">사물함 번호</strong>
                                <strong class="subject" style="width: 20%;">회원 ID</strong>
                          		 <strong class="date" style="width: auto;">시설 이용기간</strong>
                            </li>
<%--                             <c:set var="num" value="${pagingMaker.totalData - ((pagingMaker.cri.page -1) * 10) }"/>  --%>
                           						 <!-- 현재 게시판의 토탈 갯수 - ((현재 페이지-1) * 한 화면에 보여질 데이터의 갯수)-->
                           						 <!-- 1페이지의 10개의 게시물이다. 10 - ((1-1)*10) = 10.. for문 다 돌리고 -1 해줌으로써 역순으로 보여짐 -->
                            <c:forEach var="ldto" items="${lockerlist }">
	                            <li>
	                                <p class="no">${ldto.locker_no }</p>
	                                <p class="subject align_left" style="padding-left: 93px;">
	                                <c:catch>
	                                <c:choose>
	                                	<c:when test="${login.member_code eq 'S' }">
	                                		<a href="/locker/readPage${pagingMaker.makeSearch(pagingMaker.cri.page) }&locker_no=${ldto.locker_no }" class="new">
	                                			<strong>
	                                          	  ${ldto.locker_id }
	                                        	</strong>
 	                                    	</a>
	                                	</c:when>
	                                	<c:when test="${login.member_code eq 'U' }">
	                                		<strong>
	                                            ${ldto.locker_id }
	                                        </strong>
	                                	</c:when>
	                                </c:choose>
	                                </c:catch>
	                                </p>
	                                <p class="date">${ldto.locker_startdate } ~ ${ldto.locker_enddate }</p>
	                            </li>
                            </c:forEach>
                        </ul>
                    </div>
                    </form>
                    <div class="align_right mt_30">
                    <c:if test="${login != null}">
                        <a href="/locker/write" class="btn">사물함 등록</a>
                    </c:if>
                    </div>
                    <div class="page">
                        <c:if test="${pagingMaker.prev }">
						  <a href="lockerList${pagingMaker.makeSearch(pagingMaker.startPage - 1 ) }" class="page_left">
						  이전</a>
						</c:if>
                        <c:forEach begin="${pagingMaker.startPage }" end="${pagingMaker.endPage }" var="pNum" >
						  <a href="lockerList${pagingMaker.makeSearch(pNum) }" <c:if test="${sc.page eq pNum}">class="on"</c:if> >${pNum }</a>
						</c:forEach>
                        <!-- <a href="#" class="on" title="현재 페이지">5</a> --> 
                        <c:if test="${pagingMaker.next && pagingMaker.endPage > 0}">
						  <a href="lockerList${pagingMaker.makeSearch(pagingMaker.endPage + 1) }" class="page_right">
						  	다음
						  </a>
						</c:if>
                    </div>
					<!--컨텐츠 E-->
				</div>
			</div>
		</div>
		<!-- Content :E -->
		
	</div>	

<%@ include file="../include/footer.jsp" %>