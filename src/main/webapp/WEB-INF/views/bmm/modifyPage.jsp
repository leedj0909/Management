<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ include file="../include/header.jsp" %> --%>
<!-- modifyPage.jsp -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		var frmObj = $('.frm');
		
		$('.bg_02').click(function(){
// 			console.log('click');
			self.location = "/bmm/${board_gubunCode}/pageList?page=${sc.page}&numPerPage=${sc.numPerPage}"+
					"&searchType=${sc.searchType}&keyword=${sc.keyword}";
		});
		
		$('.ty_2').click(function(){
			
			frmObj.submit();
			
		});
		
	});
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
				<h3 class="title">수정 페이지</h3>
				
			
				<div class="layout">
					<!--컨텐츠 S-->
                    <div class="align_right mb_05"></div>
                     <form  role="form" action="/bmm/${board_gubunCode }/modifyPage" class="form-horizontal style-form frm" method="post">
		           		<input type="hidden" name="board_no" value="${boardDTO.board_no }" />
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
                                            <label for="board_no">글번호 </label>
                                        </strong>
                                    </span>
                                </div>
                                <div class="txts">
                                    <input id="board_no" name="board_no" class="div_nField" title="제목을 입력하세요." type="text" readonly="readonly" value="${boardDTO.board_no }">
                                </div>
                            </li>
                        
                            <li class="title">
                                <div class="titles">
                                    <span>  
                                        <strong>  
                                            <label for="board_title">제목 </label>
                                        </strong>
                                    </span>
                                </div>
                                <div class="txts">
                                    <input id="board_title" name="board_title" class="div_nField" title="제목을 입력하세요." type="text" value="${boardDTO.board_title }">
                                </div>
                            </li>
                           <li class="regName">
                                <div class="titles">
                                    <span>
                                        <strong>
                                            <label for="regName">작성자</label>
                                        </strong>
                                    </span>
                                </div>
                                <div class="txts"> 
                                 	 ${boardDTO.board_writer }
                                </div>
                            </li>
                            
                            <li class="content">
                                <div class="titles">
                                   <span>
                                       <strong><label for="board_content">내용</label></strong>
                                    </span>
                               </div>
                                <div class="txts">
                                    <textarea id="board_content" name="board_content" class="ckeditor div_nField" title="내용을 입력하세요." >${boardDTO.board_content }</textarea>
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
                    <div class="align_right mt_30">
                        <a href="#create" class="btn ty_2">저장하기</a>
                        <a href="#list" class="btn bg_02">취소하기</a>
                    </div>
                  </form>
					<!--컨텐츠 E-->
				</div>
			</div>
		</div>
		<!-- Content :E -->
		
	</div>	
	<!-- Container :E -->


<!--  <!--read main--> -->
<!--  <section id="main-content"> -->
<!--      <section class="wrapper"> -->
<!--      	<h3><i class="fa fa-angle-right">Modify Page</i></h3> -->
     	
<!--      	BASIC FORM ELELEMNTS -->
<!-- 	<div class="row mt"> -->
<!-- 		<div class="col-lg-12"> -->
<!-- 	       <div class="form-panel"> -->
<!-- 	       	  <h4 class="mb"><i class="fa fa-angle-right">수정 내용</i> </h4> -->
<!-- 	           <form  role="form" action="/bmm/modifyPage" class="form-horizontal style-form frm" method="post"> -->
<%-- 	           		<input type="hidden" name="bid" value="${boardDTO.board_no }" /> --%>
<%-- 	           		<input type="hidden" name="page" value="${sc.page }"/> --%>
<%-- 	           		<input type="hidden" name="numPerPage" value="${sc.numPerPage }"/> --%>
	           		
<!-- 	           		검색조건 + keyword -->
<%-- 		     		<input type="hidden" name="searchType" value="${sc.searchType }"/> --%>
<%-- 		     		<input type="hidden" name="keyword" value="${sc.keyword }"/> --%>
	           		
<!--            			<div class="form-group"> -->
<!-- 	                   <label class="col-sm-2 col-sm-2 control-label">글 번호</label> -->
<!-- 	                   <div class="col-sm-10"> -->
<!-- 	                       <input type="text" class="form-control" name="board_no" -->
<%-- 	                       	value="${boardDTO.board_no }"  readonly="readonly"> --%>
<!-- 	               </div> -->
<!-- 	               </div> -->
<!-- 	               <div class="form-group"> -->
<!-- 	                   <label class="col-sm-2 col-sm-2 control-label">제목</label> -->
<!-- 	                   <div class="col-sm-10"> -->
<!-- 	                       <input type="text" class="form-control" name="board_title" -->
<%-- 	                       	value="${boardDTO.board_title }"> --%>
<!-- 		               </div> -->
<!-- 		               </div> -->
<!-- 		               <div class="form-group"> -->
<!-- 		                   <label class="col-sm-2 col-sm-2 control-label">내용</label> -->
<!-- 		                   <div class="col-sm-10"> -->
<%-- 		                       <textarea class="form-control" name="board_content" rows="4">${boardDTO.board_content }</textarea> --%>
<!-- 		                   </div> -->
<!-- 		               </div> -->
<!-- 		               <div class="form-group"> -->
<!-- 		                   <label class="col-sm-2 col-sm-2 control-label">작성자</label> -->
<!-- 		                   <div class="col-sm-10"> -->
<!-- 		                       <input type="text" class="form-control" name="board_writer" -->
<%-- 		                       	value="${boardDTO.board_writer }" readonly="readonly"> --%>
<!-- 		                   </div> -->
<!-- 		               </div> -->
<!-- 		               <div class="form-group"> -->
<!-- 		               		<div class="col-sm-12" align="center"> -->
<!-- 								<button type="button" class="btn btn-primary">저장하기</button>		               		 -->
<!-- 								<button type="button" class="btn btn-info">취소하기</button>		               		 -->
		               		
<!-- 		               		</div> -->
<!--                			</div> -->
<!--            		 </form> -->
<!--              </div> -->
<!--         </div> -->
<!--       </div> -->
<!--    </section> -->
<!-- </section>  -->
     


<%-- <%@ include file="../include/footer.jsp" %> --%>