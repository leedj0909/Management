<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
	$(function(){
		
		var frmObj = $('.frm');
		
		$('.ty_2').click(function(){
			
		if ($("#locker_no").val() == "") {
		      alert("사물함 번호를 입력해주세요");
		      $("#locker_no").focus();
		      return false;
	      }
			frmObj.submit();
		});
	});
	
</script>

 <!-- Content :S -->
		<div id="content">
			<div id="txt">
				<h3 class="title">등록 페이지</h3>
				<div class="layout">
					<!--컨텐츠 S-->
                    <div class="align_right mb_05"></div>
                    <form name="locker" id="locker" class="frm" method="POST">
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
                                	<input id="member_id" name="member_id" class="div_nField" title="" type="text" value="${login.member_id }" style="width: 150px;" readonly="readonly">
                                	<input type="hidden" name="member_no" id="member_no" value="${lockerDTO.member_no }" />
                                </div>
                            </li>
                            
                            <li class="regName">
                                <div class="titles">
                                   <span>
                                       <strong>
                                       		<label for="locker_no">사물함 번호</label>
                                       </strong>
                                    </span>
                               </div>
                               <div class="txts">
<!--                               		<input id="locker_no" name="locker_no" class="div_nField" title="" type="text" value="" style="width: 150px;"> -->
									<select name="locker_no" id="locker_no" style="min-width: 150px;">
                                		<c:forEach begin="1" end="15" varStatus="varStatus">
                                			<option value="${varStatus.count }">${varStatus.count }</option>
                                		</c:forEach>
	                           		</select>번 사물함
                               </div>
                            </li>
                        </ul>
                    </div>
                   </form>
                    <div class="align_right mt_30">
                        <a href="#create" class="btn ty_2">저장하기</a>
                        <a href="/locker/lockerList" class="btn bg_02">취소</a>
                    </div>
					<!--컨텐츠 E-->
				</div>
			</div>
		
		</div>
		<!-- Content :E -->
	
<%@ include file="../include/footer.jsp" %>