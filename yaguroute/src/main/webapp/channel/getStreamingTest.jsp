<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	.match{
		background-color:#3D3D3D;
		font-family : Open Sans, sans-serif;
	}
	.chat-container {
		max-width: 500px;
		margin: 50px auto;
	}
	
	#message-input{
		width : 450px;
		height : 20px;
	}
	
	.button-container{
		background-color: #f2f2f2;
		max-width: 500px;
		margin: 100px auto;
	}
	      
	.chat-messages {
		background-color: #f2f2f2;
		padding: 30px;
		border-radius: 5px;
		max-height: 300px;
		overflow-y: auto;
		margin-bottom: 20px;
	}
	
	.chat-message {
		display: flex;
		align-items: flex-start;
        margin-bottom: 15px;
    }
    
    .message-bubble {
    background-color: #fff;
    border-radius: 10px;
    padding: 10px;
    margin-right: 10px;
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
	background-image: url('https://kr.object.ncloudstorage.com/mainpjt/Imogi/like.png');
    background-size: cover;
    transition: top 1s ease-out, opacity 1s ease-out;
	}
		    
	.fireworkHome {
	position: absolute;
	width: 30px;
	height: 30px;
	background-image: url('https://kr.object.ncloudstorage.com/mainpjt/Imogi/like.png');
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
				 				width : "650px",
				 				height : "480px"										
							});
						} else {
							console.log("방송 시작 전");
							$('video').css({
								width: '650px',
								height: '480px'
								
							});
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
				fireworkAway.css('top', (e.clientY - 15) + 'px');
				fireworkAway.css('left', (e.clientX - 15) + 'px');
				$('#firework-container-away').append(fireworkAway);
				
				setTimeout(function() {
					fireworkAway.css('top', '-50px');
					fireworkAway.css('opacity', '0');
		        }, 100);
				
				//$('body').append(fireworkAway);
				
				setTimeout(function() {
					fireworkAway.remove(); // 일정 시간 후에 폭죽 요소 제거
			    }, 2000);
			});
			
			//이미지 드래그&다운
			 var dropZone = $('#chat-messages');
			 dropZone.on('dragover', handleDragOver);
			 dropZone.on('dragleave', handleDragLeave);
			 dropZone.on('drop', handleFileSelect);
			 
			 dropZone.on('dragenter', function(){
				dropZone.show();
			 });
			 
			 dropZone.on('dragleave', function() {
			 	dragDropContainer.hide();
			 });
			 
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
			console.log(data);
			var chatMessage = $('<div class="chat-message"></div>');
			var messageBubble = $('<div class="message-bubble"></div>');
			var sender = $('<span class="sender"></span>').text(data.userID + " : ");
			var content = $('<span class="content"></span>').text(data.data);
			messageBubble.append(sender, content);
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
						chatMessage.append($('<span class="sender"></span>').text(data[i].user_id + " : ")); // 유저 아이디 표시
						chatMessage.append($('<img>').attr('src', data[i].chat_image).attr('width', 200).attr('height', 200)); // 이미지 표시
						$('#chat-messages').append(chatMessage); // 채팅 메시지 요소를 채팅 영역에 추가
					} else {
						var chatMessage = $('<div class="chat-message"></div>');
						var messageBubble = $('<div class="message-bubble"></div>');
						var sender = $('<span class="sender"></span>').text(data[i].user_id + " : ");
						var content = $('<span class="content"></span>').text(data[i].message);
						messageBubble.append(sender, content);
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

<!-- <div class="preloader-wrapper" id="preloader">
    <div class="motion-line dark-big"></div>
    <div class="motion-line yellow-big"></div>
    <div class="motion-line dark-small"></div>
    <div class="motion-line yellow-normal"></div>
    <div class="motion-line yellow-small1"></div>
    <div class="motion-line yellow-small2"></div>
</div>
 -->
<section class="image-header">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="info">
                    <div class="wrap">
                        <ul class="breadcrumbs">
                            <li>Main/</li>
                            <li>Category</li>
                        </ul>
                        <h1>${channel.gameInfo.homeTeam.teamNickName} VS ${channel.gameInfo.awayTeam.teamNickName}</h1>
                    </div>
                </div>
            </div>	
        </div>
    </div>
</section>

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

<!--BROADCASTS BEGIN-->
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
							
							<h3>경기 점수 출력</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="col-md-4">
			<div class="container button-container">
			<span class="text-center">
			<h3>당신의 팀을 응원하세요</h3>
			</span>
				<div class="row">
					<div class="col-md-4 position-relative">
							<button class="btn btn-primary" type="button" id="homeClick">
								<img src="${channel.gameInfo.homeTeam.teamEmblem}" alt width="50" height="50"/>
								<span class="badge" id="homeCount">${channel.homeClick}</span>
							</button>
					</div>
					
					<div class="col-md-4 position-relative text-center mt-5">
						<h1>VS</h1>
					</div>
					
					<div class="col-md-4 position-relative">
						<button class="btn btn-primary" type="button" id="awayClick">
							<img src="${channel.gameInfo.awayTeam.teamEmblem}" alt width="50" height="50"/>
							<span class="badge" id="awayCount">${channel.awayClick}</span>
						</button>
						<div id="firework-container-away" class="position-relative"/>
					</div>
				</div>
			</div>
			<div class="container chat-container">
				<div class="chat-messages" id="chat-messages" class="drop-area">
			    	<!-- 채팅 메시지를 표시할 영역 -->
			    </div>
			    
			    <form id="chat-form">
			     	<div class="input-group">
			        	<input type="text" id="message-input" class="form-control" placeholder="메시지를 입력하세요">
			    	</div>
		    	</form>
		    	

		    	<!-- <form id="uploadForm" enctype="multipart/form-data">
				    <input type="file" name="file" id="fileInput">
				    <button type="submit">+</button>
		  		</form> -->
		  	
		    </div>
		</div>
	</div>
</div>

<section class="live-match-stat">
	<div class="col-md-12">
		<div class="row">
			<div class="col-md-6 position-relative">
				<h1>경기 내용 출력1</h1>		
			</div>
			
			<div class="col-md-6 position-relative">
				<h1>경기 내용 출력2</h1>		
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