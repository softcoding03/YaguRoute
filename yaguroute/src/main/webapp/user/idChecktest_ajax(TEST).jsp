<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script type ="text/javascript">

$(function(){
$('#idCheck').keyup(function(){
	let mb_id = $('#idCheck').val(); // 입력 중인 id의 val을 변수에 선언한다.
	console.log(mb_id); // 현재 가져오는 id를 log로 출력해봄.
		//alert("여기까지 옴!");
	 $.ajax({
		url : "/users/userIdCheck", // 해당 url의 Controller로 진입
		type : "POST", // POST방식으로 전달
		data : {userId : mb_id}, // data는 Key[userId], value[mb_id](위의 value)...
		dataType : 'json', // json데이터형식으로 보낸다.
		success : function(result){ // 서버에서 response(result값)가 전송된다.
			if(result == 1){ // 위 result가 1과 같으면 이미 사용중...
				$("#id_feedback").html('이미 사용중인 아이디입니다.');
				$("#id_feedback").attr('color','#dc3545');
			} else{
				$("#id_feedback").html('사용할 수 있는 아이디입니다.');
				$("#id_feedback").attr('color','#2fb380');
			} 
		},
		error : function(){
			alert("서버요청실패");
			}
		})
	})
})

$(function(){
	$('#idCheck').on("click", function(){
	
		//alert("호날두ㅜ우우");
	})
})

</script>
</head>	

<body>
  <div class="form-group">
	<label for="idCheck" class="form-label mt-4">아이디를 입력하세요.</label><br>
	<input type="text" class="form-control" name="mb_id" id="idCheck">
	<div><font id="id_feedback" size="2"></font></div>
</div>
</body>

</html>
