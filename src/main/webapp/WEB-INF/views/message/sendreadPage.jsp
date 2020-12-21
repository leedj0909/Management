<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- readPage.jsp -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
	table, tr, th, td{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 20px;
	}
	
	#modifyDiv{
		width: 500px;
		height: 140px;
		background-color: #e0e0e0;
		position: absolute;
		top: 65%;
		left : 30%;
		padding: 20px;
	}
	
</style>
<script type="text/javascript">
	$(function(){
		
		var frmObj = $('.frm');
		
		
		$('.bg_02').click(function(){  
// 			console.log('click');
// 			console.log(frmObj);
			if(confirm("삭제하시겠습니까?")){
				frmObj.attr('method', 'get');
				frmObj.attr('action', '/message/delPage');
				frmObj.submit();
			}
		});
		
		// 답장하기로 변경
		
		 $('.ty_2').click(function(){
			
			frmObj.attr('action', '/message/replyPage');
			frmObj.attr('method', 'get');
			frmObj.submit();
		}); 
	});
	
	
</script>
<%@ include file="../include/header.jsp" %>

<!-- Container :S -->
	<div id="container">
	    <div id="remote" class="type_02">
			<div id="lnb" class="js_menu">
				<ul>
					<li class="home">
						<a href="#">Home<em class="hidden">열기</em></a>
					</li>
					<li>
						<a href="#" title="1뎁스 메뉴 선택 링크리스트, 클릭시 해당 페이지로 이동합니다."><span>1뎁스</span><em class="hidden">열기</em></a>
						<ul style="display: none;">
							<li class="sub01"><a href="#"><span>1뎁스</span></a></li>
							<li class="sub02"><a href="#"><span>1뎁스</span></a></li>
							<li class="sub03"><a href="#"><span>1뎁스</span></a></li>
							<li class="sub04"><a href="#"><span>1뎁스</span></a></li>
							<li class="sub05"><a href="#"><span>1뎁스</span></a></li>
						</ul>
					</li>
					<li>
						<a href="#" title="2뎁스 메뉴 선택 링크리스트, 클릭시 해당 페이지로 이동합니다."><span>2뎁스</span><em class="hidden">열기</em></a>
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
				<h3 class="title">메세지함</h3>
				
			<form role="form" method="post" class="frm">
	     		<input type="hidden" name="message_no" value="${messageDTO.message_no }" />
	     		<input type="hidden" name="message_send_no" value="${messageDTO.message_send_no }" />
	     		<input type="hidden" name="message_recevice_no" value="${messageDTO.message_recevice_no }" />
	     		<input type="hidden" name="page" value="${sc.page }" />
	     		<input type="hidden" name="numPerPage" value="${sc.numPerPage }" />
	     		
	     		<!-- 검색조건 + keyword -->
	     		<input type="hidden" name="searchType" value="${sc.searchType }"/>
	     		<input type="hidden" name="keyword" value="${sc.keyword }"/>
	     	</form>
				<div class="layout">
					<!--컨텐츠 S-->
                    <div class="align_right mb_05"></div>
                    <div class="board_insert">
                        <ul class="detail">
                            <li class="title">
                                <div class="titles">
                                    <span>  
                                        <strong>  
                                            <label for="message_title">제목 </label>
                                        </strong>
                                    </span>
                                </div>
                                <div class="txts">
                                    <input id="message_title" name="message_title" class="div_nField" title="제목을 입력하세요." type="text" readonly="readonly" value="${messageDTO.message_title }">
                                </div>
                            </li>
                           <li class="regName">
                                <div class="titles">
                                    <span>
                                        <strong>
                                            <label for="message_send_no">보낸사람</label>
                                        </strong>
                                    </span>
                                </div>
                                <div class="txts"> 
                                	${login.member_id }
                                </div>
                            </li>
                            
                            <li class="regName">
                                <div class="titles">
                                    <span>
                                        <strong>
                                            <label for="message_recevice_no">받는사람</label>
                                        </strong>
                                    </span>
                                </div>
                                <div class="txts"> 
                                	${messageDTO.message_id }
                                </div>
                            </li>
                            
                            <li class="content">
                                <div class="titles">
                                   <span>
                                       <strong><label for="message_content">내용</label></strong>
                                    </span>
                               </div>
                                <div class="txts">
                                    <textarea id="message_content" name="message_content" class="ckeditor div_nField" title="내용을 입력하세요." readonly="readonly" >${messageDTO.message_content }</textarea>
                                </div>
                            </li>
                            <!-- <li class="filebox">
                                <div class="titles">
                                    <span><strong>첨부파일</strong></span>
                                </div>
                                <div class="txts">
                                    <div class="file_find"> 
                                        <label for="input-file">찾아보기</label> 	
                                        <input class="upload-name" value="" type="text" disabled="disabled"> 
                                        <input type="file" id="input-file" class="upload-hidden">
                                    </div>
                                </div>
                            </li> -->
                        </ul>
                    </div>
                    <!-- 버튼 div -->
                    <div class="align_right mt_30">
                    	<a href="/message/messageList" class="btn ty_2">목록으로</a>
                    <c:if test="${login.member_no == messageDTO.message_recevice_no }">
                        <a href="#create" class="btn ty_2">답변하기</a>
                        <a href="#list" class="btn bg_02">삭제하기</a>
                    </c:if>
                    </div>
			<!--컨텐츠 E-->
			</div>
		</div>
	</div>
	<!-- Content :E -->
		
	</div>	
	<!-- Container :E -->


<%@ include file="../include/footer.jsp" %>