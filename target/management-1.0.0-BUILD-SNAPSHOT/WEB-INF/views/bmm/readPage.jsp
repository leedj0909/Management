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
				frmObj.attr('action', '/bmm/${board_gubunCode}/delPage');
				frmObj.submit();
			}
		});
		
		$('.ty_2').click(function(){
			
			frmObj.attr('action', '/bmm/${board_gubunCode}/modifyPage');
			frmObj.attr('method', 'get');
			frmObj.submit();
		});
	});
	
	$(function(){  
		
		var board_no = '${boardDTO.board_no}';     
		var member_no = '${login.member_no}';
		
		
		function replyAll(){
			$.getJSON("/comment/selectAll/"+board_no, function(data){
				
				var str = '';  
				
				$(data).each(function(){    
					str += "작성자 : " + this.comment_writer;
					str +=  "<li data-comment_no='"+this.comment_no+"'class='coList ckeditor div_nField' style='display: table; width: 1270px;'>"
							+ "<input type='text' style='width: 1271px;' value='" + this.comment_content + "' class='div_nField' readonly='readonly'>";
					if(this.member_no == member_no){
							str += "<button style='margin: 10 0;'>수정</button>";
					}
					str += "</li>";
				});
				$("#reply").html(str);
				
			});
		}
			
		// 댓글 쓰기
		$('#replyBtn').click(function(){
			
			if($('#comment_content').val() == ''){
				  alert("댓글을 입력해주세요.");
			      $("#comment_content").focus();
			      return false;
				}
			
// 			console.log('click');
			var comment_writer = $('#comment_writer').val();
			var comment_content = $('#comment_content').val();
			
			$.ajax({
				type : 'POST',
				url : '/comment',
				headers : {
					'Content-Type' : 'application/json',
					'X-HTTP-Method-Override' : 'POST'
				},
				dataType : 'text',  
				data : JSON.stringify({
					board_no : board_no,
					comment_writer : comment_writer,
					comment_content : comment_content
				}),
				
				success : function(result){
					if(result == 'Success'){
// 						alert('댓글 등록 성공');
						$('#comment_content').val("");
						replyAll();
					}
				}
			})
		});
		
		// 댓글 목록에 있는 수정버튼 처리
		$('#reply').on('click', '.coList Button', function(){
			var input = $(this).parent();
			
			var comment_no = input.attr('data-comment_no');
			var comment_content = input.text();
			
			// alert('댓글 번호 : '+ rebid + ", 현재 내용 : " + reContent);			
			$('.title-dialog').html(comment_no);
			$('.title-dialog').css("display","none");
			$('#comment_content').val();
			$('#modifyDiv').show('slow');
		});
		
		// 선택된 번호의 댓글 수정 처리
		$('.mod').click(function(){
			var comment_no = $('.title-dialog').html();  
			var reContent = $('#reContent').val();
			
			$.ajax({
				type : 'PUT',
				url : '/comment/'+comment_no,
				headers : {
					'Content-Type' : 'application/json',
					'X-HTTP-Method-Override' : 'PUT'
				},
				data : JSON.stringify({
						comment_content : reContent		
				}),
				dataType : 'text',
				success : function(result){
					if(result == 'Success'){
						$('#modifyDiv').hide('slow');
						$('#comment_content').val("");
						replyAll();
					}
				}
			}); // ajax end
		});
		
		// 선택된 댓글 삭제하기
		$('.del').click(function(){
			var comment_no = $('.title-dialog').html();
			
			$.ajax({
				type : 'DELETE',
				url : '/comment/'+comment_no,
				headers : {
					'Content-Type' : 'application/json',
					'X-HTTP-Method-Override' : 'DELETE'
				},
				dataType : 'text',
				success : function(result){
					if(result == 'Success'){
						$('#modifyDiv').hide('slow');
						replyAll();
					}
				}
			}); // ajax end
		});
		
		// 수정창 닫기
		$('.clo').click(function(){
			$('#modifyDiv').hide('slow');
			replyAll();
		});
		replyAll();
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
				<h3 class="title">자유게시판</h3>
				
			<form role="form" method="post" class="frm">
	     		<input type="hidden" name="board_no" value="${boardDTO.board_no }" />
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
                                            <label for="board_title">제목 </label>
                                        </strong>
                                    </span>
                                </div>
                                <div class="txts">
                                    <input id="board_title" name="board_title" class="div_nField" title="제목을 입력하세요." type="text" readonly="readonly" value="${boardDTO.board_title }">
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
                                    <textarea id="board_content" name="board_content" class="ckeditor div_nField" title="내용을 입력하세요." readonly="readonly" >${boardDTO.board_content }</textarea>
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
                    	<a href="/bmm/${board_gubunCode }/pageList" class="btn ty_2">목록으로</a>
                    <c:if test="${login.member_id == boardDTO.board_writer }">
                        <a href="#create" class="btn ty_2">수정하기</a>
                        <a href="#list" class="btn bg_02">삭제하기</a>
                    </c:if>
                    </div>
                    
                    <div id="modifyDiv" style="display: none; text-align: center;">
						<span class="title-dialog"></span>
						<span class="text-dialog">댓글 수정창입니다.</span>
						<div>
							<input type="text" name="reContent" id="reContent" size="50" />
						</div>
						
						<div align="center" style="padding-top: 35px;">
<!-- 							<button id="remodifyBtn">수정</button> -->
<!-- 							<button id="reDelBtn">삭제</button> -->
<!-- 							<button id="closeBtn">닫기</button>  -->
							<a href="#create" class="btn mod">수정</a>
							<a href="#create" class="btn del">삭제</a>
							<a href="#create" class="btn clo">닫기</a>
							 
						</div>
						
					</div>
					<c:if test="${login != null }">
						<div class="board_insert" style="margin-top: 20px;">
	                        <ul class="detail">
	                            <li class="title">
	                                <div class="titles">
	                                    <span>  
	                                        <strong>  
	                                            <label for="comment_writer">작성자 </label>
	                                        </strong>
	                                    </span>
	                                </div>
	                                <div class="txts">
	                                	<input id="comment_writer" name="comment_writer" class="div_nField" title="" type="text" readonly="readonly" value="${login.member_id }">
	                                </div>
	                            </li>
	                            
	                            <li class="title">
	                                <div class="titles">
	                                    <span>  
	                                        <strong>  
	                                            <label for="comment_content">댓글 내용 </label>
	                                        </strong>
	                                    </span>
	                                </div>
	                                <div class="txts">
	                                    <input id="comment_content" name="comment_content" class="div_nField" type="text" title="댓글을 입력하세요.">
	                                </div>
	                            </li>
	                         </ul>
	                      </div>
	                      
	                       <div class="align_right mt_30">
	                    		<a href="#create" class="btn wri" id="replyBtn">작성</a>
	                   	   </div>
					</c:if>
						<div class="board_insert" style="margin-top: 20px;">
							<h2 style="display: table; margin-top: 10px; margin-bottom: 10px; font-size: 20px;">댓글 리스트</h2>
							<div id="reply" style="display: table;"></div>
						</div>
			<!--컨텐츠 E-->
			</div>
		</div>
	</div>
	<!-- Content :E -->
		
	</div>	
	<!-- Container :E -->


<%@ include file="../include/footer.jsp" %>