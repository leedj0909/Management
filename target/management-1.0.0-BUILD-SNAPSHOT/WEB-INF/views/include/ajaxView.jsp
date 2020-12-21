<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajaxView.jsp</title>
<style type="text/css">
	table, tr, th, td{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 20px;
	}
	
	#modifyDiv{
		width: 500px;
		height: 100px;
		background-color: gray;
		position: absolute;
		top: 20%;
		left : 30%;
		padding: 20px;
	}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		var board_no = '${boardDTO.board_no}';
		
		function replyAll(){
			$.getJSON("/comment/selectAll/"+board_no, function(data){
				
				var str = '';
				
				$(data).each(function(){
					str += "<li data-comment_no='"+this.comment_no+"'class='coList'>"
							+ this.comment_no + " : " + this.comment_content
							+ "<button>수정</button>"
							+"</li>";
				});
				
				$("#reply").html(str);
				
			});
		}
		
		// 댓글 쓰기
		$('#replyBtn').click(function(){
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
						replyAll();
					}
				}
			})
		
		});
		
		// 댓글 목록에 있는 수정버튼 처리
		$('#reply').on('click', '.coList Button', function(){
			var li = $(this).parent();
			
			var comment_no = li.attr('data-comment_no');
			var comment_content = li.text();
			
			// alert('댓글 번호 : '+ rebid + ", 현재 내용 : " + reContent);
			$('.title-dialog').html(comment_no);
			$('#comment_content').val(comment_content);
			$('#modifyDiv').show('slow');
		});
		
		// 선택된 번호의 댓글 수정 처리
		$('#remodifyBtn').click(function(){
			var rebid = $('.title-dialog').html();
			var comment_content = $('#comment_content').val();
			
			$.ajax({
				type : 'PUT',
				url : '/comment/'+comment_no,
				headers : {
					'Content-Type' : 'application/json',
					'X-HTTP-Method-Override' : 'PUT'
				},
				data : JSON.stringify({
						comment_content : comment_content		
				}),
				dataType : 'text',
				success : function(result){
					if(result == 'Success'){
						/* alert('수정 성공'); */
						$('#modifyDiv').hide('slow');
						replyAll();
					}
				}
			}); // ajax end
		});
		
		// 선택된 댓글 삭제하기
		$('#reDelBtn').click(function(){
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
						/* alert('수정 성공'); */
						$('#modifyDiv').hide('slow');
						replyAll();
					}
				}
			}); // ajax end
		});
		
		// 수정창 닫기
		$('#closeBtn').click(function(){
			$('#modifyDiv').hide('slow');
			replyAll();
		});
		replyAll();
	});

</script>
</head>
<body>
	<h2>REST + Ajax</h2>
	<div id="modifyDiv" style="display: none; text-align: center;">
		<span class="title-dialog"></span> 번 댓글
		<div>
			<input type="text" name="" id="comment_no" size="50" />
		</div>
		
		<div align="center" style="padding-top: 35px;">
			<button id="remodifyBtn">수정</button>
			<button id="reDelBtn">삭제</button>
			<button id="closeBtn">닫기</button>
		</div>
		
	</div>
	
	
	
	<div>
		<table>
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="comment_writer" id="comment_writer" />
				</td>
			</tr>
			<tr>
				<th>댓글</th>
				<td>
					<input type="text" name="comment_content" id="comment_content" size="50" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button id="replyBtn">작성</button>
				</td>
			</tr>
		</table>
	</div>
	
	<div>
		<h2>댓글 리스트</h2>
		<ul id="reply"></ul>
	</div>

</body>
</html>