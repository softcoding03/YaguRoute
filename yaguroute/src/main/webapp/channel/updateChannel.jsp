<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Insert title here</title>
				<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
		
		<script type="text/javascript">
			$(function(){
				$("a[href='#']:contains('확인')").on('click', function(){
					console.log('확인 클릭');
					self.location="/channel/listChannel"
				})
			})
		</script>
		
	</head>
	
	<body>
		<h1>channel update 완료 화면</h1>
		
		<button type="button" class="btn btn-primary btn-xs">
			<a href="#">확인</a>
		</button>
	</body>
</html>