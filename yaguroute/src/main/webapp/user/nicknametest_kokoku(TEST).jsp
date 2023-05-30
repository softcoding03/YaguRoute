<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<script type="text/javascript">
	
	$(function(){
		
		$('#nicknameCheck').keyup(function(){
			
			var nickname = $('#nicknameCheck').val();
			console.log(nickname);
			
			$.ajax({
				url : "/users/userNickNameCheck",
				method : "POST",
				data : {userNickName : nickname},
				dataType : 'json',
				success : function(result){
					if(result == 1){
						$("#nickname_use").html('이미 사용중인 닉네임입니다.');
						$("#nickname_use").attr('color', '#dc3545');
					
					}else{
						$('#nickname_use').html('사용 가능한 닉네임입니다.');
						$('#nickname_use').attr('color', '#2fb380');
					}
				},
				error : function(){
					alert("서버 요청 실패");
				}
			})
		})
	});
</script>

</head>

<body>
	<div class="form-group">
	<label for="nicknameCheck" class="form-Label mt-4">닉네임을 입력하세요.</label><br>
	<input type="text" class="form-control" name="nickname" id="nicknameCheck">
	<div><font id="nickname_use" size="2"></font></div>
	</div>
</body>

</html>