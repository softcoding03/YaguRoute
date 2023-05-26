<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		
		<!-- Video.js CDN, CSS CDN -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/video.js/7.11.4/video.min.js"></script>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/video.js/7.11.4/video-js.min.css" rel="stylesheet">
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
		<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
		
		<!-- socket.io CDN -->
		<script src="https://cdn.socket.io/3.1.3/socket.io.min.js"></script>
		
		<script type="text/javascript">
			$(function(){
				
				//socket 연결
				var socket = io.connect('http://192.168.0.36:3001/', {
					withCredentials: true,
					 extraHeaders: {
						'Access-Control-Allow-Origin': 'http://192.168.0.36:3001'
					 },
					 path: '/socket.io',
					 query: {
						 gameCode: '${channel.gameInfo.gameCode}'
					 }
				});
				
				$(window).on("load", function(){
					console.log("1. 채널 상태 확인");
					
					socket.emit('join', '${channel.gameInfo.gameCode}');
					
					$.ajax({
						url:"/channel/rest/status?channelID=${channel.channelID}",
						method:"GET",
						dataType : "json",
						success : function(jsonData, status){
							if(status=="success"){
								var channel = jsonData.channelState;
								if(channel=='PUBLISHING'){
									console.log("channel 송출 중");
									var player = videojs('streaming', {
										sources : [
											{src:"${channel.channelCDN}", type:"application/x-mpegURL"}
										],
										poster: '${channel.gameInfo.homeTeam.teamEmblem}',
										controls: true,
										platsinline : true,
					 					muted : true,
					 					preload : "auto",
					 					width : "854",
					 					height : "480"
									
									});
								} else {
									console.log("방송 시작 전");
									$('video').attr("poster", "${channel.gameInfo.homeTeam.teamEmblem}");
									//var html = "<img src='${channel.gameInfo.homeTeam.teamEmblem}' width='854' heigth='480'/>"
									
								}
								
								
							}		
						}
					});
				});
				
				
				
				//homeClick
				$("#homeClick").on('click', function(){
					socket.emit('homeClick');
				});
				
				//awayClick
				$("#awayClick").on('click', function(){
					socket.emit('awayClick');
				});
				
				//click 받기
				socket.on('homeCount', (data) => {
					$('#homeClick').text("${channel.gameInfo.homeTeam.teamNickName} : "+data);
				});
				
				socket.on('awayCount', (data) => {
					$('#awayClick').text("${channel.gameInfo.awayTeam.teamNickName} : "+data);
				})
				
				socket.on('msg', (data) => {
					console.log(data);
				})
				
				
			});
		
		</script>
		
	</head>
	<body>
		<h1>${channel.channelName}</h1>
		
		<div class='row'>
			<div class="col-xs-12 col-md-8">
				<h2>videoJS Test</h2>
		  		<video id="streaming" class="video-js vjs-big-play-button vjs-big-play-centered">
				</video>
			</div>
			
			<div class="col-xs-6 col-md-4">
				<h2>채팅할 자리</h2>
				<div class="col-xs-3 col-md-2">
					<img src="${channel.gameInfo.homeTeam.teamEmblem}" alt width="50" height="50"/>
					<button class="btn btn-primary" type="button" id="homeClick">
						응원1
						<span class="badge" id="homeCount">${channel.homeClick}</span>
					</button>
				</div>
				
				<div class="col-xs-3 col-md-2">
					<img src="${channel.gameInfo.awayTeam.teamEmblem}" alt width="50" height="50"/>
					<button class="btn btn-primary" type="button" id="awayClick">
						응원
						<span class="badge" id="awayCount">${channel.awayClick}</span>
					</button>
				</div>
			</div>
  		 </div>
	</body>
</html>