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
		
		
		<!-- bootstreap template -->
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	    <meta name="description" content="" />
	    <meta name="keywords" content="" />
	    <meta name="viewport" content="width=device-width,initial-scale=1">
	    <title>Team HTML</title>
	    <link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
	    <link rel="icon" href="favicon.ico" type="image/x-icon">
	    <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
	    
		<!-- socket.io CDN -->
		<script src="https://cdn.socket.io/3.1.3/socket.io.min.js"></script>
		
		<style>
		    
		</style>
		
		<script type="text/javascript">
			$(function(){
				
				//socket 연결
				var socket = io.connect('http://223.130.133.54:3000', {
					withCredentials: true,
					 extraHeaders: {
						'Access-Control-Allow-Origin': 'http://223.130.133.54:3000'
					 },
					 path: '/socket.io',
					 query: {
						 gameCode: '${channel.gameInfo.gameCode}',
						 userID: '${sessionScope.user.userId}'
					 }
				});
				
				$(window).on("load", function(){
					console.log("1. 채널 상태 확인");
					socket.emit('join');
					socket.emit('getMessageData');
										
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
						 				width : 1050,
						 				height : 480										
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
						
						setTimeout(function() {
							fireworkHome.remove(); // 일정 시간 후에 폭죽 요소 제거
					    }, 1000);

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
						
						setTimeout(function() {
							fireworkAway.remove(); // 일정 시간 후에 폭죽 요소 제거
					    }, 1000);
					});
				
				});
				
				
				
				//click 받기
				socket.on('homeCount', (data) => {
					$('#homeClick').text("${channel.gameInfo.homeTeam.teamNickName} : "+data);
				});
				
				socket.on('awayCount', (data) => {
					$('#awayClick').text("${channel.gameInfo.awayTeam.teamNickName} : "+data);
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
					console.log(data);
					$('#chat-messages').append($('<div>').text(data));
					$('#chat-messages').scrollTop($('#chat-messages')[0].scrollHeight);
				});
				
				socket.on("getChattingData", (data) => {
					console.log(data);
					
					for(i in data){
						if(data[i].user_id != null){
							if(data[i].message == null){
								$('#chat-messages').append($('<div>').text(data[i].user_id+" : "));
								$('#chat-messages').append($('<div>').append($('<img>').attr('src', data[i].chat_image).attr('width', 200).attr('heigth', 200)));
							} else {
								$('#chat-messages').append($('<div>').text(data[i].user_id+" : "+data[i].message));	
							}
							console.log(data[i].user_id+" : "+data[i].message);
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
				})
				
				//이미지 업로드 하기
				$('#uploadForm').submit(function(e){
					e.preventDefault();
					
					var formData = new FormData();
					var fileInput = $('#fileInput')[0].files[0];
					formData.append('image', fileInput);
					
					$.ajax({
						url: "http://192.168.0.36:3001/image/upload",
						type: "POST",
						processData: false,
				        contentType: false,
						data: formData,
						dataType: "json",
						success: function(data, status){
							console.log(data);
							socket.emit("image", data.image_path);
						}
						
					})
				});
			});
		
		</script>
		
		<style>
		  
		  .chat-container {
	      max-width: 500px;
	      margin: 50px auto;
	      }
	      
	      .chat-messages {
	      height: 300px;
	      overflow-y: scroll;
	      border: 1px solid #ccc;
	      padding: 10px;
	      }
	      
	      .fireworkAway {
		      position: absolute;
		      width: 30px;
		      height: 30px;
		      background-image: url('https://kr.object.ncloudstorage.com/mainpjt/Imogi/like.png'); /* 이미지 경로를 적절히 수정하세요 */
      		  background-size: cover;
		    }
		    
		    .fireworkHome {
		      position: absolute;
		      width: 30px;
		      height: 30px;
		      background-image: url('https://kr.object.ncloudstorage.com/mainpjt/Imogi/like.png'); /* 이미지 경로를 적절히 수정하세요 */
      		  background-size: cover;
		    }
		</style>
	</head>
	
	<body>
		<!-- topBar start -->
		<jsp:include page="/common/topBar.jsp"/>
		<!-- topBar End -->
				
		<div class='row'>
			<div class="col-xs-12 col-md-8">
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
  		 
  		 <div class="container chat-container">
		 	<div class="chat-messages" id="chat-messages">
		    	<!-- 채팅 메시지를 표시할 영역 -->
		    </div>

		    <form id="chat-form">
		     	<div class="input-group">
		        	<input type="text" id="message-input" class="form-control" placeholder="메시지를 입력하세요">
			        <div class="input-group-append">
			        	<button type="button" class="btn btn-primary">전송</button>
			        </div>
		    	</div>
		    </form>
		    
		    <form id="uploadForm" enctype="multipart/form-data">
			    <input type="file" name="file" id="fileInput">
			    <button type="submit">+</button>
		  	</form>
  		</div>
  		
  		

	</body>
<link href="css/style.min.css" rel="/stylesheet" type="text/css" />
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
</html>