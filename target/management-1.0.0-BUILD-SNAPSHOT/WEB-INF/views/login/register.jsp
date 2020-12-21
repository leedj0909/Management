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

<script>
	 function daumPost(){
			new daum.Postcode({
		        oncomplete: function(data) {
	        	document.getElementById("member_postCode").value = data.zonecode;
                document.getElementById("member_roadAddress").value = data.roadAddress;
		        }
		    }).open();
		}	
	 

	 function login(){
		  var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	      var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
	      var getName= RegExp(/^[가-힣]+$/);
	 
	      
	      //아이디 공백 확인
	      console.log('start');
	      if($("#member_id").val() == ""){
		      alert("아이디를 입력해주세요.");
		      $("#member_id").focus();
		      return false;
	      }
	      
	   	  // form에서 서브밋 버튼 클릭 시 실행할 check() 메소드 생성
	      if ($('#idCheck').val() == 'false') {
			  $('#idDiv').html('이미 사용 중인 아이디 입니다.');
			  $('#idDiv').css('color', 'red');
			  alert("이미 사용 중인 아이디 입니다.");
			  return false;
		  }
	 
	      //아이디의 유효성 검사
	      if(!getCheck.test($("#member_id").val())){
	      alert("ID 형식에 맞게 입력해주세요.");
		      $("#member_id").focus();
		      return false;
	      }
	 
	      //비밀번호
	      if(!getCheck.test($("#member_password").val())) {
		      alert("PW 형식에 맞게 입력해주세요.");
		      $("#member_password").val("");
		      $("#member_password").focus();
		      return false;
	      }
	 
	      //아이디랑 비밀번호랑 같은지
	      if ($("#member_id").val() == ($("#member_password").val())) {
		      alert("비밀번호가 ID와 똑같으면 안됩니다.");
		      $("#member_password").val("");
		      $("#member_password").focus();
		      return false;
	    }
	 
	      //비밀번호 똑같은지
	      if($("#member_password").val() != ($("#member_passwordCk").val())){ 
		      alert("비밀번호 확인과 비밀번호의 값이 다릅니다.");
		      $("#member_passwordCk").val("");
		      $("#member_passwordCk").focus();
		      return false;
	     }
	 
	      //이름 유효성
	      if (!getName.test($("#member_name").val())) {
		      alert("이름을 정확히 입력해주세요.");
		      $("#member_name").focus();
		      return false;
	      }
	      
	     //주소 유효성
	      if ($("#member_postCode").val() == "") {
		      alert("우편번호를 입력해주세요");
		      $("#member_postCode").focus();
		      return false;
	      }
	     
	      if ($("#member_roadAddress").val() == "") {
		      alert("도로명 주소를 입력해주세요");
		      $("#member_roadAddress").focus();
		      return false;
	      }
	      
	      if ($("#member_detailAddress").val() == "") {
		      alert("상세주소를 입력해주세요");
		      $("#member_detailAddress").focus();
		      return false;
	      }
	     
	     
	    
	    //전화번호 유효성
	      if ($("#member_phone").val() == "") {
		      alert("전화번호를 입력해주세요");
	          $("#member_phone").focus();
	          return false;
	      }
	      
	      
	      //이메일 공백 확인
	      if($("#member_email").val() == ""){
		      alert("이메일을 입력해주세요");
		      $("#member_email").focus();
		      return false;
	      }
	           
	      //이메일 유효성 검사
	      if(!getMail.test($("#member_email").val())){
	        alert("이메일형식에 맞게 입력해주세요");
	        $("#member_email").focus();
	        return false;
	      }
		 
			$('#member').submit();
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
				<h3 class="title">회원가입</h3>
				<div class="layout">
					<!--컨텐츠 S-->
                    <div class="align_right mb_05">
                    <form name="member" id="member" action="/login/register" method="POST" >
                    <input type="hidden" id="idCheck" value="false" />
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
	                                    <input id="member_id" name="member_id" class="div_nField" title="아이디를 입력하세요."
	                                     onblur="confirmID()" type="text" style="width: 70%">
	                                    <!-- 아이디 중복 검사 후 결과를 출력할 공간  -->
										<div style="display: inline-block;" id="idDiv"></div>
	                                </div>
	                            </li>
	                            
	                           <li class="regName">
	                                <div class="titles">
	                                    <span>
	                                        <strong>  
	                                            <label for="member_password">비밀번호</label>
	                                        </strong>
	                                    </span>
	                                </div>
	                                <div class="txts" style="text-align: left; display: block;" >
	                                    <input id="member_password" name="member_password" style="max-width: 70%" class="div_nField" title="비밀번호를 입력하세요." type="password">
	                                </div>
	                            </li>
	                            
	                             <li class="regName">
	                                <div class="titles">
	                                    <span>
	                                        <strong>  
	                                            <label for="member_passwordCk">비밀번호 확인</label>
	                                        </strong>
	                                    </span>
	                                </div>
	                                <div class="txts" style="text-align: left; display: block;" >
	                                    <input id="member_passwordCk" name="member_passwordCk" style="max-width: 70%" class="div_nField" title="비밀번호를 입력하세요." type="password">
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
	                                    <input id="member_name" name="member_name" class="div_nField" title="이름을 입력하세요." type="text" style="width: 70%">
	                                </div>
	                            </li>
	                            
	                             <li class="secretSts">
                                <div class="titles">
                                   <span>
                                       <strong>성별</strong>
                                   </span>
                                </div>
                                <div class="txts">
                                    <ul class="radio_btn">
                                        <li><input type="radio" name="member_gander" value="남자" id="member_gander1" checked="checked"><label for="member_gender1">남자</label></li>
                                        <li><input type="radio" name="member_gander" value="여자" id="member_gander2"><label for="member_gender2">여자</label></li>
                                    </ul>
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
	                                	<select name="member_birth_year"> 
	                                		<c:forEach begin="1970" end="2020" var="year">
	                                			<option value="${year }">${year }</option>
	                                		</c:forEach>
	                                	</select>
	                                	<select name="member_birth_month">
	                                		<c:forEach begin="1" end="12" var="month">
	                                			<option value="${month }">${month }</option>
	                                		</c:forEach>
	                                	</select>
	                                	<select name="member_birth_date">
	                                		<c:forEach begin="1" end="31" var="date">
	                                			<option value="${date }">${date }</option>
	                                		</c:forEach>
	                                	</select>
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
	                                    <input type="text" name="member_postCode" id="member_postCode" size="29" placeholder="우편번호" style="width: 70%;">
	                                    <a href="#create" class="btn ty_2" onclick="daumPost()">우편번호 찾기</a><br>
										<input type="text" name="member_roadAddress" id="member_roadAddress" size="45" placeholder="도로명주소" style="width: 70%; margin-top: 10px;">
										<input type="text" name="member_detailAddress" id="member_detailAddress" size="45" placeholder="상세주소" style="width: 70%; margin-top: 10px;">
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
	                                    <input id="member_phone" name="member_phone" class="div_nField" title="전화번호를 입력하세요." style="width: 70%" placeholder="전화번호 입력" type="text">
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
	                                    <input id="member_email" name="member_email" class="div_nField" title="이메일을 입력하세요." style="width: 70%" placeholder="이메일 입력" type="text">
	                                </div>
	                            </li>
	                            
	                        </ul>
	                    </div>
                    </form>
                    <div class="align_center mt_30">
                        <a href="#create" class="btn ty_2" onclick="login(); return false;">가입하기</a>  
                        <!-- <a href="#list" class="btn bg_02">회원가입</a> -->  
                    </div>
					<!--컨텐츠 E-->
				</div>
			</div>
		</div>
		<!-- Content :E -->
		
	</div>	
	<!-- Container :E -->
	
	<script>		  
		// 아이디 입력 창에서 포커스가 이동하면 아이디 중복 체크 결과에 따라 메세지를 idDiv에 출력  
		function confirmID() {
			// 1) 요청 주소 저장  
			var addr = '/idCheck';
			// 2) 요청에 넘겨 줄 파라미터 id 값 가져와서 저장
			var member_id = $('#member_id').val();
			// 3) ajax로 컨트롤러에서 전달한 JSON 결과 가져오기
			// url  요청 주소
			// data  파라미터 넘길 값 (없으면 생략)
			// dataType 받아오는 결과 값의 타입
			// success 성공 했을 때 실행되는 함수 
			// error 실패 했을 때 실행되는 함수 설정 
			$.ajax({
				url : addr,
				data : {
					'member_id' : member_id
				},
				dataType : 'json',
				success : function(data) {
					//alert(data.result);
					if (data.result == true) {
						// 사용가능한 아이디 
						// (1) idDiv에 성공 메세지 출력
						$('#idDiv').html('사용 가능한 아이디 입니다.');
						$('#idDiv').css('color', 'blue');
						// (2) idCheck 히든 태그에 true 저장
						$('#idCheck').val('true');
					} else {
						// 사용할 수 없는 아이디 
						// (1) idDiv에 실패 메세지 출력
						$('#idDiv').html('이미 사용 중인 아이디 입니다.');
						$('#idDiv').css('color', 'red');
						// (2) idCheck 히든 태그에 false 저장
						$('#idCheck').val('false');
					}
				}
			});
		}
	</script>

	
<%@ include file="../include/footer.jsp" %>	