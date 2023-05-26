<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
    <link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/admin.css" type="text/css">
    <!-- Bootstrap Dropdown Hover JS -->
    <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
    
    <script type="text/javascript">
    	$(function() {
    		$('input[type="button"]').on('click', function(){
    			console.log("추가 버튼 클릭 성공");
    			$('form[name="detailForm"]').attr("method", "post").attr("action", "/channel/addChannel").submit();
    		})
    	});
    </script>


</head>
<body>
	<h1>addChannelView Test</h1>
	
	<form name="detailForm" class="form-horizontal">
		
			<div class="form-group">
				<div class="col-xs-4 col-md-2">
					<strong>채널 이름</strong>
				</div>
				<div class="col-xs-8 col-md-4">
					<input type="text" name="channelName" class="ct_input_g" style="width: 100px; height: 19px" maxLength="20"/>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-xs-4 col-md-2">
					<strong>버켓 이름</strong>
				</div>
				<div class="col-xs-8 col-md-4">
					<input type="text" name="bucketName" class="ct_input_g" style="width: 100px; height: 19px" maxLength="10" minLength="6"/>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-xs-4 col-md-2">
					<strong>저장 경로</strong>
				</div>
				<div class="col-xs-8 col-md-4">
					<input type="text" name="uploadPath" class="ct_input_g" style="width: 100px; height: 19px" maxLength="10" minLength="6"/>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-xs-4 col-md-2">
					<strong>채널 타입</strong>
				</div>
				<div class="col-xs-8 col-md-4">
					<input type="radio" name="envType" value="REAL" class="ct_input_g" style="width: 30px; height: 30px" maxLength="10" minLength="6">REAL</input>
					<input type="radio" name="envType" value="DEV" class="ct_input_g" style="width: 30px; height: 30px" maxLength="10" minLength="6">DEV</input>
					<input type="radio" name="envType" value="STAGE" class="ct_input_g" style="width: 30px; height: 30px" maxLength="10" minLength="6">STAGE</input>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-xs-4 col-md-2">
					<strong>채널 썸네일</strong>
				</div>
				<div class="col-xs-8 col-md-4">
					<button  type="button" class="btn btn-primary btn-xs">
						<input 	multiple="multiple"	type="file" name="file"/>
					</button>
				</div>
			</div>
			
			
		</form>
		
		<input type="button" id="submit" value="추가"/>
		
		
</body>
</html>