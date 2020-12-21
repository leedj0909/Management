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
	
	function member(){
		var url = "/member/member";
		var name = "member";
		window.open(url, name, "width=1000, height=1000,toolbar=no,status=no,location=no,scrollbars=yes,left=50,right=50");
	}
		
	
</script>

 <!-- Content :S -->
		<div id="content">
			<div id="txt">
				<h3 class="title">작성 페이지</h3>
				<div class="layout">
					<!--컨텐츠 S-->
                    <div class="align_right mb_05"></div>
                    <form name="message" id="message" class="frm" method="POST">
                    <div class="board_insert">
                        <ul class="detail">
                           <li class="regName">
                                <div class="titles">
                                    <span>
                                        <strong>
                                            <label for="member_id">회원ID</label>
                                        </strong>
                                    </span>
                                </div>
                                <div class="txts">
                                	<input id="message_recevice_id" name="message_recevice_id" class="div_nField" title="" type="text" value="" style="width: 1073px;">
                                	<input type="hidden" name="message_recevice_no_temp" id="message_recevice_no_temp" value="" />
                                	<input type="button" onclick="member(); return false;" value="주소록" style="height: 35px; width: 62px;" />
                                </div>
                            </li>
                            
                            <li class="content">
                                <div class="titles">
                                   <span>
                                       <strong><label for="member_date">기간</label></strong>
                                       <input id="member_startdate" name="member_startdate" class="div_nField" title="" type="text" value="">
                                       <label for="">~</label>
                                       <input id="member_enddate" name="member_enddate" class="div_nField" title="" type="text" value="" >
                                    </span>
                               </div>
                                <div class="txts">
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
<!-- 						<button type="submit" class="btn ty_2">등록하기</button> -->
                        <a href="/message/messageList" class="btn bg_02">취소</a>
                    </div>
                     
					<!--컨텐츠 E-->
				</div>
			</div>
		
		</div>
		<!-- Content :E -->
	
<%@ include file="../include/footer.jsp" %>