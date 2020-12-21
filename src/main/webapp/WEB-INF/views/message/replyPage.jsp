<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		var frmObj = $('.frm');
		
		$('.ty_2').click(function(){
			
			frmObj.submit();
		});
	});
	
</script>
 <!-- Content :S -->
<div id="content">
	<div id="txt">
		<h3 class="title">답변 작성페이지</h3>
			<div class="layout">
			  <!--컨텐츠 S-->
              <div class="align_right mb_05"></div>
              	<form name="message" id="message" class="frm" method="POST">
              		<div class="board_insert">
                	  <ul class="detail">
                     	 <li class="title">
                         	<div class="titles">
                              <span>
                                  <strong>
                                      <label for="message_title">제목</label>
                                  </strong>
                               </span>
                          	</div>
                          <div class="txts">
                              <input id="message_title" name="message_title" class="div_nField" title="제목을 입력하세요." type="text" value="">
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
                          	<input id="message_recevice_id" name="message_recevice_id" class="div_nField" title="" type="text" readonly="readonly" value="${messageDTO.message_id }" style="width: 1073px;">
                          	<input id="message_recevice_no" name="message_recevice_no" class="div_nField" title="" type="hidden" readonly="readonly" value="${messageDTO.message_send_no }" style="width: 1073px;">
                          </div>
                     	  </li>
                      
                      	  <li class="content">
                          <div class="titles">
                             <span>
                                 <strong><label for="message_content">내용</label></strong>
                              </span>
                          </div>
                          <div class="txts">
                              <textarea id="message_content" name="message_content" class="ckeditor div_nField" title="내용을 입력하세요."></textarea>
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
             </form>
              <div class="align_right mt_30">
                  <a href="#create" class="btn ty_2">보내기</a>
				<!-- <button type="submit" class="btn ty_2">등록하기</button> -->
                  <a href="/message/messageList" class="btn bg_02">취소</a>
              </div>
               
	<!--컨텐츠 E-->
		</div>
	</div>

</div>
<!-- Content :E -->
	
	</div>	
	<!-- Container :E -->
	
<%@ include file="../include/footer.jsp" %>