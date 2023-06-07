<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
<!-- <link rel="icon" href="/images/favicon.ico" type="image/x-icon"/> -->
<link href="/css/style.min.css" rel="stylesheet" type="text/css" />


<!-- socket.io CDN -->
<script src="https://cdn.socket.io/3.1.3/socket.io.min.js"></script>
<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<!-- Video.js CDN, CSS CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/video.js/7.11.4/video.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/video.js/7.11.4/video-js.min.css" rel="stylesheet">


<style>
.match {
	background-color: #ffffff;
	color: #dddddd;
	font-family: Open Sans, sans-serif;
}

.chat-container {
	display: "flex";
	align-items: flex-start;
	margin: 50px auto;
	height: 90%;
	width: 90%;
	position: relative;
	background-color: #e5e5e5;
}

#message-input {
	width: 100%;
	height: 20px;
	margin-bottom: 20px;
}

.button-container {
	background-color: #f2f2f2;
	margin: 100px auto;
	width: 100%;
}

.chat-messages {
	background-color: #f2f2f2;
	/* padding: 30px; */
	/* border-radius: 5px; */
/* 	height: 390px;
	overflow-y: auto;
	margin-bottom: 20px;
	margin-top: 20px; */
	width: 100%;
	height: 100%;
}

.chat-message {
	display: flex;
	align-items: flex-start;
	margin-top: 15px;
	margin-bottom: 15px;
	width: 100%;
}

.message-bubble {
	background-color: #fff;
	border-radius: 10px;
	padding: 10px;
	margin-right: 10px;
	margin-left: 5px;
	font-size: 5px;
}

.content {
	color: #666;
}

.chat-message .sender {
	font-weight: bold;
	color: #333;
}

.chat-message .content {
	margin-top: 5px;
	color: #666;
}

.fireworkAway {
	position: absolute;
	width: 30px;
	height: 30px;
	background-image:
		url('https://kr.object.ncloudstorage.com/mainpjt/Imogi/like.png');
	background-size: cover;
}

.fireworkHome {
	position: absolute;
	width: 30px;
	height: 30px;
	background-image:
		url('https://kr.object.ncloudstorage.com/mainpjt/Imogi/like.png');
	background-size: cover;
}

.drop-area {
	display: none;
	width: 100%;
	height: 200px;
	border: 2px dashed #ccc;
	border-radius: 10px;
	text-align: center;
	padding: 20px;
	font-size: 16px;
	color: #999;
}

.drop-area.active {
	background-color: #f7f7f7;
}

.table-container {
	display: flex;
}

.table-container table {
	flex: 1;
}

.broadCast, #streaming {
	width: 100%;
	height: 550px;
}

.userImg img {
	display: inline-block;
	width: 20px;
	height: 20px;
	border-radius: 50%;
	background-color: gray;
}

.content img {
	display: inline-block;
	width: 200px;
	height: 200px;
	background-color: gray;
}

.teamTopBar {
	width: auto;
	height: auto;
}

.image-container {
	position: relative;
	display: inline-block;
	width: auto;
	heigth: auto;
}

h1 {
	color: white;
}

.text-overlay {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 18px;
	margin-left: 300px;
	/* 기타 스타일 속성 설정 */
}

.home{
	background-color: ${channel.gameInfo.homeTeam.teamColor};
}

.away{
	background-color: ${channel.gameInfo.awayTeam.teamColor};
}
</style>


<script type="text/javascript">
	$(function(){
		var socket = io.connect('http://192.168.0.36:3001/', {
			withCredentials: true,
			 extraHeaders: {
				'Access-Control-Allow-Origin': 'http://192.168.0.36:3001'
			 },
			 path: '/socket.io',
			 query: {
				 gameCode: '${channel.gameInfo.gameCode}',
				 userID: '${sessionScope.user.userId}'
			 }
		});
		
	
		
		$(window).on("load", function(){
			socket.emit('join');
			socket.emit('getMessageData');
			console.log("${gameRecord}");		
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
				 				height: "700px"
							});
						} else {
							console.log("방송 시작 전");
							$('video').attr("poster", "${channel.gameInfo.homeTeam.teamEmblem}").attr("height", "700px");
							
							//var html = "<img src='${channel.gameInfo.homeTeam.teamEmblem}' width='854' heigth='480'/>"
						}
								
					}		
				}
			});
			
			/* $.ajax({
				url:"/game/json/getStreamingInfo/${channel.gameInfo.gameCode}",
				method:"POST",
				dataType:"json",
				success: function(jsonData, status){
					console.log(jsonData);
					console.log(jsonData.homeScoreList);
					var tbody = $("tbody");
					var homeRow = $("<tr></tr>");
					var awayRow = $("<tr></tr>");
					var homeTeamName = $("<td></td>").text(jsonData.gameInfo.homeTeam.teamNickName);
					var awayTeamName = $("<td></td>").text(jsonData.gameInfo.awayTeam.teamNickName);
					tbody.empty();
					
					jsonData.homeScoreList.forEach((element) => {
						var score = $("<td></td>").text(element);
						homeRow.append(score);
					});
					homeRow.prepend(homeTeamName);
					tbody.append(homeRow);

					
					jsonData.awayScoreList.forEach((element) => {
						var score = $("<td></td>").text(element);
						awayRow.append(score);
					});
					awayRow.prepend(awayTeamName);
					tbody.append(awayRow);
				}
			}); */
			

		});
		
		$(document).ready(function(){
			//homeClick
			$("#homeClick").on('click', function(e){
				socket.emit('homeClick', 1);
				
				var fireworkHome = $('<div class="fireworkHome"></div>');
				
				fireworkHome.css({
			    	top: e.pageY - 10, // 마우스 클릭 시 커서 위치로 설정
			        left: e.pageX - 10
			    });
				
				$('body').append(fireworkHome);
				
				fireworkHome.animate({
					top: "-=100px",
		            opacity: 0
				}, 1000, function(){
					$(this).remove();
				});
				
				/* setTimeout(function() {
					fireworkHome.remove(); // 일정 시간 후에 폭죽 요소 제거
			    }, 1000); */

			});
			
			//awayClick
			$("#awayClick").on('click', function(e){
				socket.emit('awayClick', 1);
				
				var fireworkAway = $('<div class="fireworkAway"></div>');
				
				fireworkAway.css({
			    	top: e.pageY - 10, // 마우스 클릭 시 커서 위치로 설정
			        left: e.pageX - 10
			    });
				
				$('body').append(fireworkAway);
				
				fireworkAway.animate({
					top: "-=100px",
		            opacity: 0
				}, 1000, function(){
					$(this).remove();
				});
			});
			
			//이미지 드래그&다운
			 var dropZone = $('#chat-messages');
			 dropZone.on('dragover', handleDragOver);
			 dropZone.on('dragleave', handleDragLeave);
			 dropZone.on('drop', handleFileSelect);
			 
			/*  dropZone.on('dragenter', function(){
				dropZone.show();
			 });
			 
			 dropZone.on('dragleave', function() {
				 dropZone.hide();
			 }); */
			 
			 function handleDragOver(event) {
				    event.stopPropagation();
				    event.preventDefault();
				    event.originalEvent.dataTransfer.dropEffect = 'copy';
				    dropZone.addClass('active');
			}
			 
			function handleDragLeave(event) {
				    event.stopPropagation();
				    event.preventDefault();
				    dropZone.removeClass('active');
			}
			 
			function handleFileSelect(event) {
				    event.stopPropagation();
				    event.preventDefault();
				    dropZone.removeClass('active');
				    
				    var files = event.originalEvent.dataTransfer.files;
				    // 파일 업로드 처리 로직을 여기에 구현하세요.
				    if (files.length > 0) {
				    	var formData = new FormData();
				        formData.append('image', files[0]);
				        
				        $.ajax({
				            url: "http://192.168.0.36:3001/image/upload",
				            type: "POST",
				            processData: false,
				            contentType: false,
				            data: formData,
				            dataType: "json",
				            success: function(data, status) {
				              console.log(data);
				              socket.emit("image", data.image_path);
				            }
				          });
				    	
				    }
			}
		});
		
		
		
		//click 받기
		socket.on('homeCount', (data) => {
			$('#homeCount').text(data);
		});
		
		socket.on('awayCount', (data) => {
			$('#awayCount').text(data);
		})
		
		
		//채팅 송수신
		$('#chat-form').submit(function(e) {
		    e.preventDefault();
		    var message = $('#message-input').val().trim();
		    if (message) {
		      socket.emit('sendMessage', message);
		      $('#message-input').val('');
		    }
		  });
		
		socket.on("responseMessage", (data) => {
			console.log("흐으음,,,",data);
			var chatMessage = $('<div class="chat-message"></div>');
			var messageBubble = $('<div class="message-bubble"></div>');
			var userProfileImg = $('<img></img>').attr("src", data.userImage).attr("alt", "이미지 없음");
			
			var userImage = $('<span class="userImg"></span>').append(userProfileImg);
			var sender = $('<span class="sender"></span>').text(data.userID + " : ");
			var content = $('<span class="content"></span>').text(data.data);
			messageBubble.append(userImage, sender, content);
			chatMessage.append(messageBubble);
			$('#chat-messages').append(chatMessage);
			$('#chat-messages').scrollTop($('#chat-messages')[0].scrollHeight);
		});
		
		socket.on("getChattingData", (data) => {
			console.log(data);
			
			for(i in data){
				if(data[i].user_id != null){
					if(data[i].message == null){
						var chatMessage = $('<div class="chat-message"></div>'); // 채팅 메시지를 감싸는 요소 생성
						var messageBubble = $('<div class="message-bubble"></div>');
						var userProfileImg = $('<img></img>').attr("src", data[i].userImage).attr("alt", "이미지 없음");
						
						var userImage = $('<span class="userImg"></span>').append(userProfileImg);
						var sender = $('<span class="sender"></span>').text(data[i].user_id + " : ");
						var content = $('<span class="content "></span>').append($('<img></img>').attr("src", data[i].chat_image));
						
						//chatMessage.append($('<span class="sender"></span>').text(data[i].user_id + " : ")); // 유저 아이디 표시
						//chatMessage.append($('<img>').attr('src', data[i].chat_image).attr('width', 200).attr('height', 200)); // 이미지 표시
						
						messageBubble.append(userImage, sender, content);
						chatMessage.append(messageBubble);
						$('#chat-messages').append(chatMessage); // 채팅 메시지 요소를 채팅 영역에 추가
					} else {
						var chatMessage = $('<div class="chat-message"></div>');
						
						var messageBubble = $('<div class="message-bubble"></div>');
						var userProfileImg = $('<img></img>').attr("src", data[i].userImage).attr("alt", "이미지 없음");
						
						var userImage = $('<span class="userImg"></span>').append(userProfileImg);
						var sender = $('<span class="sender"></span>').text(data[i].user_id + " : ");
						var content = $('<span class="content"></span>').text(data[i].message);
						messageBubble.append(userImage, sender, content);
						chatMessage.append(messageBubble);
						$('#chat-messages').append(chatMessage);
					}
				} else{
					console.log("채팅 내역이 없습니다.");
				}
			}
		});
		
		//이미지 파일 받기
		socket.on("responseImage", (data)=>{
			console.log(data);
			$('#chat-messages').append($('<div>').text(data.userID+" : "));
			$('#chat-messages').append($('<div>').append($('<img>').attr('src', data.Image).attr('width',200).attr('heigth', 200)));
			$('#chat-messages').scrollTop($('#chat-messages')[0].scrollHeight);
		});
	});
</script>






</head>
<body>
<!-- topBar start -->
<jsp:include page="/common/topBar.jsp"/>
<!-- topBar End -->


<div class="image-container">
  <div class="row">
  	<div class=" col-md-6">
		<img class="teamTopBar" src="${channel.gameInfo.homeTeam.teamTopBar}">
	</div>
	<div class=" col-md-6">
		<img class="teamTopBar col-md-6" src="${channel.gameInfo.awayTeam.teamTopBar}">
	</div>
  </div>
</div>


<div class="match-live-date">
	<div class="container">
		<div class="row">
			<div class="col-md-6"><div class="date">${channel.gameInfo.gameDate}</div></div>
		</div>
	</div>
</div>


<div class="match">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="match-live-info">
					<div class="title"> ${channel.gameInfo.homeTeam.teamNickName} – ${channel.gameInfo.awayTeam.teamNickName} </div>
					<div class="match-info">
						<div class="team wpb_animate_when_almost_visible wpb_flipInX flipInX wpb_start_animation animated">
							<div class="avatar">
								<img src="${channel.gameInfo.homeTeam.teamEmblem}" alt="team-logo">
							</div>
							<div class="text">
								<h4>${channel.gameInfo.homeTeam.teamNickName}</h4>
							</div>
						</div>
						
						<div class="score">
            				${channel.gameInfo.gameScore}       
            			</div>
            			
            			<div class="team right  wpb_animate_when_almost_visible wpb_flipInX flipInX wpb_start_animation animated">
            				<div class="text">
            					<h4>${channel.gameInfo.awayTeam.teamNickName}</h4>
            				</div>
            				<div class="avatar">
            					<img src="${channel.gameInfo.awayTeam.teamEmblem}" alt="team-logo">
            				</div>
            			</div>
            			
						</div>
					</div>
					<div class="title">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!--BROADCASTS BEGIN 스트리밍 구역-->

<div class="container">
	<div class="row">
		<div class="col-md-8">
			<h3>broadcasts</h3>
			
			<div class="mathc-live-broadcasts">
				<div class="background">
					<div class="tab-content">
						<div class="tab-pane fade in active" role="tabpanel" id="title1">
							<video id="streaming" class="video-js vjs-big-play-button vjs-big-play-centered">
							</video>
						</div>
						
						<div class="table-container">
							<table id="gameScore">
								<thead class="thead-dark">
									<tr>
										<th scope="col">팀 명</th>						
										<th scope="col">1</th>
										<th scope="col">2</th>
										<th scope="col">3</th>
										<th scope="col">4</th>
										<th scope="col">5</th>
										<th scope="col">6</th>
										<th scope="col">7</th>
										<th scope="col">8</th>
										<th scope="col">9</th>
									</tr>
								</thead>
									
								<tbody>
									<tr>
										<td>${channel.gameInfo.awayTeam.teamNickName}</td>
										<c:set var="i" value="0"/>
										<c:forEach var="awayScoreList" items="${gameRecord.awayScoreList}">
											<td>${gameRecord.awayScoreList[i]}</td>
											<c:set var="i" value="${i+1}"/>
										</c:forEach>
									</tr>
									
									<tr>
										<td>${channel.gameInfo.homeTeam.teamNickName}</td>
										<c:set var="i" value="0"/>
										<c:forEach var="homeScoreList" items="${gameRecord.homeScoreList}">
											<td>${gameRecord.homeScoreList[i]}</td>
											<c:set var="i" value="${i+1}"/>
										</c:forEach>
									</tr>
								</tbody>
							</table>
	
							<table id="totalScore">
								<thead class="thead-dark">
									<tr>
										<th scope="col"></th>
										<th scope="col">R</th>						
										<th scope="col">H</th>
										<th scope="col">E</th>
										<th scope="col">B</th>
									</tr>
								</thead>
								
								<tbody>
								
									<tr>
										<td></td>
										<c:set var="i" value="0"/>
										<c:forEach var="awayRecord" items="${gameRecord.awayRecord}">
											<td>${gameRecord.awayRecord[i]}</td>
											<c:set var="i" value="${i+1}"/>
										</c:forEach>
									</tr>
									
									<tr>
										<td></td>
										<c:set var="i" value="0"/>
										<c:forEach var="homeRecord" items="${gameRecord.homeRecord}">
											<td>${gameRecord.homeRecord[i]}</td>
											<c:set var="i" value="${i+1}"/>
										</c:forEach>
									</tr>
									
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 채팅 구역 -->
		<div class="col-md-4">
			<div class="container button-container">
				<div class="cheer">
					<span class="text-center">
						<h3>당신의 팀을 응원하세요</h3>
					</span>
								
					<div class="row">
						<div class="col-md-6 text-left">
							<div class="home">
								<div id="homeClick">
									<img src="${channel.gameInfo.homeTeam.teamEmblem}" alt width="50" height="50"/>
								</div>
							</div>
							<div class="name" id="homeCount">${channel.homeClick}</div>
							
						</div>

						<div class="col-md-6 text-right">
							<div class="away">
								<div id="awayClick">
									<img src="${channel.gameInfo.awayTeam.teamEmblem}" alt width="50" height="50"/>
								</div>
							</div>
							<div class="name" id="awayCount">${channel.awayClick}</div>							
						</div>
					</div>
				</div>	
			</div>
			
			<div class="row">
				<div class="col">
					<div class="container chat-container">
						<div class="chat-messages" id="chat-messages" class="drop-area">
					    	<!-- 채팅 메시지를 표시할 영역 -->
					    </div>
					    
					    <form id="chat-form">
					     	<div class="input-group">
					        	<input type="text" id="message-input" class="form-control" placeholder="메시지를 입력하세요">
					    	</div>
				    	</form>
				    </div>
			    </div>
			</div>
		</div>
	</div>
</div>

<!-- line Up -->
<section>
	<div class="col-md-12">
		<div class="row">
			<div class="col-md-12">
				<h3>lineups</h3>

				<div class='match-lineup'>
					<div class="no-gutter">
					
						<div class="col-md-6">
							<div class="head">
								<div class="name">${channel.gameInfo.homeTeam.teamNickName} 선발</div>
							</div>
							
							<div class="team-wrap">
								<c:set var="i" value="0"/>
								<c:forEach var="homePlayerList" items="${lineUp.homePlayerList}">
									<div class="member">
										<img src="${lineUp.homePlayerList[i].playerImage}" alt="member-avatar" widtg="150" height="150">
										<div class="info">
											<div class="wrap">
												<div class="name">${lineUp.homePlayerList[i].playerName}</div>
												<div class="country">${lineUp.homePlayerList[i].playerPosition}</div>
											</div>
										</div>
									</div>
									<hr/>
									<c:set var="i" value="${i+1}"/>
								</c:forEach>								
							</div>
						</div>
						
						<div class="col-md-6">
							<div class="head">
								<div class="name right">${channel.gameInfo.awayTeam.teamNickName} 선발</div>
							</div>
							
							<div class="team-wrap right">
								<c:set var="i" value="0"/>
								<c:forEach var="homePlayerList" items="${lineUp.awayPlayerList}">
									<div class="member">
										
										<div class="info">
											<div class="wrap">
												<div class="name right">${lineUp.awayPlayerList[i].playerName}</div>
												<div class="country">${lineUp.awayPlayerList[i].playerPosition}</div>
											</div>
										</div>
										<img src="${lineUp.awayPlayerList[i].playerImage}" alt="member-avatar" widtg="150" height="150">
									</div>
									<hr/>
									<c:set var="i" value="${i+1}"/>
								</c:forEach>								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript" src="/js/library/jquery.js"></script>
<script type="text/javascript" src="/js/library/jquery.js"></script>
<script type="text/javascript" src="/js/library/jquery-ui.js"></script>
<script type="text/javascript" src="/js/library/bootstrap.js"></script>
<script type="text/javascript" src="/js/library/jquery.sticky.js"></script>
<script type="text/javascript" src="/js/library/jquery.jcarousel.js"></script>
<script type="text/javascript" src="/js/library/jcarousel.connected-carousels.js"></script>
<script type="text/javascript" src="/js/library/owl.carousel.js"></script>
<script type="text/javascript" src="/js/library/progressbar.js"></script>
<script type="text/javascript" src="/js/library/jquery.bracket.min.js"></script>
<script type="text/javascript" src="/js/library/chartist.js"></script>
<script type="text/javascript" src="/js/library/Chart.js"></script>
<script type="text/javascript" src="/js/library/fancySelect.js"></script>
<script type="text/javascript" src="/js/library/isotope.pkgd.js"></script>
<script type="text/javascript" src="/js/library/imagesloaded.pkgd.js"></script>

<script type="text/javascript" src="/js/jquery.team-coundown.js"></script>
<script type="text/javascript" src="/js/matches-slider.js"></script>
<script type="text/javascript" src="/js/header.js"></script>
<script type="text/javascript" src="/js/matches_broadcast_listing.js"></script>
<script type="text/javascript" src="/js/news-line.js"></script>
<script type="text/javascript" src="/js/match_galery.js"></script>
<script type="text/javascript" src="/js/main-club-gallery.js"></script>
<script type="text/javascript" src="/js/product-slider.js"></script>
<script type="text/javascript" src="/js/circle-bar.js"></script>
<script type="text/javascript" src="/js/standings.js"></script>
<script type="text/javascript" src="/js/shop-price-filter.js"></script>
<script type="text/javascript" src="/js/timeseries.js"></script>
<script type="text/javascript" src="/js/radar.js"></script>
<script type="text/javascript" src="/js/slider.js"></script>
<script type="text/javascript" src="/js/preloader.js"></script>
<script type="text/javascript" src="/js/diagram.js"></script>
<script type="text/javascript" src="/js/bi-polar-diagram.js"></script>
<script type="text/javascript" src="/js/label-placement-diagram.js"></script>
<script type="text/javascript" src="/js/donut-chart.js"></script>
<script type="text/javascript" src="/js/animate-donut.js"></script>
<script type="text/javascript" src="/js/advanced-smil.js"></script>
<script type="text/javascript" src="/js/svg-path.js"></script>
<script type="text/javascript" src="/js/pick-circle.js"></script>
<script type="text/javascript" src="/js/horizontal-bar.js"></script>
<script type="text/javascript" src="/js/gauge-chart.js"></script>
<script type="text/javascript" src="/js/stacked-bar.js"></script>

<script type="text/javascript" src="/js/library/chartist-plugin-legend.js"></script>
<script type="text/javascript" src="/js/library/chartist-plugin-threshold.js"></script>
<script type="text/javascript" src="/js/library/chartist-plugin-pointlabels.js"></script>

<script type="text/javascript" src="/js/treshold.js"></script>
<script type="text/javascript" src="/js/visible.js"></script>
<script type="text/javascript" src="/js/anchor.js"></script>
<script type="text/javascript" src="/js/landing_carousel.js"></script>
<script type="text/javascript" src="/js/landing_sport_standings.js"></script>
<script type="text/javascript" src="/js/twitterslider.js"></script>
<script type="text/javascript" src="/js/champions.js"></script>
<script type="text/javascript" src="/js/landing_mainnews_slider.js"></script>
<script type="text/javascript" src="/js/carousel.js"></script>
<script type="text/javascript" src="/js/video_slider.js"></script>
<script type="text/javascript" src="/js/footer_slides.js"></script>
<script type="text/javascript" src="/js/player_test.js"></script>

<script type="text/javascript" src="/js/main.js"></script>

</body>
</html>