<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>Insert title here</title>
				<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
		
		<script type="text/javascript">
			$(function(){
				$("button:contains('수정')").on('click', function(){
					console.log('집에 가지마');
					$('form').attr("method", "post").attr("action", "/channel/updateChannel").submit();
				});
			});
		</script>
		
	</head>
	
	<body>
		<h1>updateChannelView Test</h1>
		<form class="form-horizontal">
			<div class="form-group">
				<div class="col-xs-4 col-md-2">
					<strong>채널 아이디</strong>
				</div>
				<div class="col-xs-8 col-md-4">
					${channel.channelID}
					<input type="hidden" name="channelID" value="${channel.channelID}">
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-xs-4 col-md-2">
					<strong>게임 코드</strong>
				</div>
				<div class="col-xs-8 col-md-4">
					<input type="text" name="lastgameCode" value="${channel.gameInfo.gameCode}" class="ct_input_g" style="width: 100px; height: 19px" maxLength="20" readonly/>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-xs-4 col-md-2">
					<strong>오늘의 게임 리스트</strong>
				</div>
				
				<div class="col-xs-8 col-md-4">
					<c:set var="i" value="0"/>
					<c:forEach var="game" items="${gamelist}">
						<input type="radio" name="gameCode" class="ct_input_g" value="${game.gameCode}">${game.gameCode}</input>
					</c:forEach>
				</div>
				
			</div>
			
			<div class="form-group">
				<div class="col-xs-4 col-md-2">
					<strong>채널 이름</strong>
				</div>
				<div class="col-xs-8 col-md-4">
					<input type="text" name="channelName" value="${channel.channelName}" class="ct_input_g" style="width: 100px; height: 19px" maxLength="20"/>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-xs-4 col-md-2">
					<strong>버켓 이름</strong>
				</div>
				<div class="col-xs-8 col-md-4">
					<!-- ${channel.bucketName} -->
					<input type="text" name="bucketName" value="${channel.bucketName}" class="ct_input_g" style="width: 100px; height: 19px" maxLength="20" readonly/>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-xs-4 col-md-2">
					<strong>저장 경로</strong>
				</div>
				<div class="col-xs-8 col-md-4">
					<input type="text" name="uploadPath" value="${channel.uploadPath}" class="ct_input_g" style="width: 100px; height: 19px" maxLength="10" minLength="6"/>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-xs-4 col-md-2">
					<strong>채널 타입</strong>
				</div>
				<div class="col-xs-8 col-md-4">
					${channel.envType}
					<input type="hidden" name="envType" value="${channel.envType}">
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-xs-4 col-md-2">
					<strong>게임 코드</strong>
				</div>
				<div class="col-xs-8 col-md-4">
					${channel.gameInfo.gameCode}
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
			
			<input type="hidden" name="channelCDN" value="${channel.channelCDN}"/>
			<input type="hidden" name="streamKey" value="${channel.streamKey}"/>
			<input type="hidden" name="streamKey" value="${channel.streamURL}"/>
		</form>
		
		<button  type="button" class="btn btn-primary btn-xs">
			수정
		</button>
		
	</body>

</html>