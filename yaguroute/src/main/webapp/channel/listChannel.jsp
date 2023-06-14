<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Team HTML</title>
<link
	href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900"
	rel="stylesheet" />
<!-- <link rel="icon" href="favicon.ico" type="image/x-icon"> -->
<link href="/css/style.min.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
/* 화면 비율 맞추기*/
	.broadcast-wrap {
		display: flex !important;
		overflow: hidden !important;
		flex-wrap: wrap !important;
        justify-content: center !important;
	}

    .modal {
       display: none; /* 초기에는 숨겨진 상태로 설정 */
       position: fixed;
       z-index: 9999;
       left: 0;
       top: 0;
       width: 100%;
       height: 100%;
       overflow: auto;
       background-color: rgba(0, 0, 0, 0.4); /* 배경에 투명한 검은색 레이어 생성 */
   }

   .modal-content {
       background-color:#f2f2f2;
       margin: 15% auto;
       padding: 20px;
       border: 1px solid #888;
       width: 80%;
   }
   
   .modal-button{
   		background-color:#f2f2f2;
   		margin-top: 10px;
   		padding:10px;
   		font-family:"Gwangyang" !important;
   		border-radius: 10px;
   }
   
   .input-style{
	   	background: #f2f2f2;
		font-size: 14px;
		color: #666 !important;
		line-height: normal ;
		outline: auto !important;
   }
   
   .text{
   		font-weight: bold;
   		font-family:"Gwangyang";
		font-size : 20px;
   }

</style>

<script type="text/javascript">
			$(function(){
				
				$("button:contains('중계보기')").on("click", function(){
					console.log("중계보기 클릭했다");
					var text = $(this).children("input[name='channelID']").val();
					console.log("조회 클릭 시 channelID : "+text);
					self.location="/channel/getChannel?channelID="+text;
				});
				
				$("button:contains('수    정')").on("click", function(){
					var text = $(this).children("input[name='channelID']").val();
					var url = "/channel/updateChannel?channelID="+text;
					window.open(url, "채널 수정" ,"width=800, height=700");
					
				})
				
				$("button:contains('삭    제')").on("click", function(){
					console.log("삭제하기");
					var channelID = $(this).children("input[name='channelID']").val();
					var channelName = $(this).children("input[name='channelName']").val();
					console.log("삭제하기 클릭 시 ChanndlID : "+channelID);
					console.log("삭제하기 클릭 시 ChanndlName : "+channelName);
					
					const data = {
						channelID : channelID,
						channelName : channelName
					}
					
					console.log(data);
					openModal(data);
					//self.location="/channel/deleteChannel?channelID="+text;
				})
				
				$("button:contains('채널 생성')").on("click", function(){
					window.open("/channel/addChannel", "채널 생성" ,"width=800, height=700");
				});
				
				function openModal(data) {
					$("#deleteModal").css("display", "block");
					
					$(".close").on("click", function() {
						closeModal();
					});
					
					$("#cancelButton").on("click", function(){
						closeModal();
					});
					
					$("#channelNameInput").keyup(function() {
						var channelName = $("#channelNameInput").val();
						
						if(channelName == 0){
							$("#channelName").html("채널 이름을 입력바랍니다.");
							$("#channelName").attr("color", "#dc3545");
							
						}
						
						if(data.channelName === channelName){
							$("#channelName").html("채널 이름 일치");
							$("#channelName").attr("color", "#4caf50");
						} else {
							$("#channelName").html("채널 이름이 일치하지 않습니다.");
							$("#channelName").attr("color", "#dc3545");
						}
					})
					 
					$("#confirmButton").on("click", function(){
						var channelName = $("#channelNameInput").val();
						console.log(channelName);
						console.log(data);
												
						if(data.channelName === channelName){
							console.log("일치");
							self.location="/channel/deleteChannel?channelID="+data.channelID;
						} else {
							console.log("채널 이름이 일치하지 않습니다.");
						}
						
						closeModal();
					});
					
					$(window).on("click", function(event) {
						if (event.target === $("#myModal")[0]) {
					        closeModal();
					    }
					});					
				}
				
				function closeModal() {
				    $("#deleteModal").css("display", "none");
				}

			});
				
</script>


</head>

<body>
<jsp:include page="/admin/getAdmin.jsp"/>

	<div id="deleteModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<div>
				<h2 class="text-center text">삭제하시겠습니까?</h2>
				<font size="2" color="red">* 삭제하기 전 채널 이름을 입력해주세요</font>
			</div>
			
			<label for="channelNameInput">채널 이름:</label> 
			<input class="input-style" type="text" id="channelNameInput"/>
			<font id="channelName" size="2"></font>
			
			<div>
				<button class="modal-button" id="confirmButton">삭제</button>
				<button class="modal-button" id="cancelButton">취소</button>
			</div>
		</div>
	</div>

	

	<div class="broadcast-wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-9">
	            	<h4>Channel Management</h4>                
	            </div>
	            
				<div class="basic col-md-9">
					<button class="modal-button">채널 생성</button>
				</div>
				
				<c:set var="i" value="0"/>
				<c:forEach var="channel" items="${list}">
					<c:set var="i" value="${i+1}"/>
					<div class="col-md-9">
						<div class="broadcast-list" id="accordion" role="tablist" aria-multiselectable="true">
							<div class="broadcast-item">
								<div class="item-header" id="headingOne">
									<div class="row">
										<div class="col-md-1 col-sm-1">
				                    		<a data-toggle="collapse" data-parent="#accordion" href="#${channel.channelName}" class="arrow"><i class="fa fa-caret-down" aria-hidden="true"></i></a>
				               			</div>
				               			
				               			<div class="col-md-8 col-sm-7">
				               				<div class="item-head-body">
				               					${channel.channelName}
				               				</div>				       
				               			</div>
				               			
				               			<div class="col-md-3 col-sm-4">
					               			<div class="row">
					               				
					               					<button type="button" class="modal-button">
					               						수    정
					               						<input type="hidden" name="channelID" value="${channel.channelID}"/>
					               					</button>
					               				
					               				
					               				
					               					<button class="modal-button">
					               						삭    제
					               						<input type="hidden" name="channelID" value="${channel.channelID}"/>
					               						<input type="hidden" name="channelName" value="${channel.channelName}"/>
					               					</button>
					               				
											</div>
				               			</div>
									</div>
								</div>
								
								<!-- collaspe start-->
								<div id="${channel.channelName}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
									<div class="img-wrap">
									
										<div class="item-body">
											<div class="row">
												<div class="col-md-12">
													<h4>Channel details</h4>
													<hr/>
													
													<div class="alert alert-success">
														<div class="title">Channel ID</div>
														${channel.channelID}
													</div>
													<hr/>
													
													<div class="alert alert-success">
														<div class="title">Channel Link</div>
														${channel.channelCDN}
													</div>
													<hr/>
													
													<div class="alert alert-success">
														<div class="title">Channel Stream Info</div>
														<div><li>Stream URL : &nbsp; ${channel.streamURL}</li></div>
														<div><li>Stream Key : &nbsp; ${channel.streamKey}</li></div>
													</div>
													<hr/>
													
													<div class="alert alert-success">
														<div class="title">Video Upload Path</div>
														<div><li>bucket Name : &nbsp; ${channel.bucketName}</li></div>
														<div><li>uploadPath : &nbsp; /${channel.uploadPath}</li></div>
													</div>
													<hr/>
													
													<div class="alert alert-success">
														<div class="title">중계 경기</div>
														<div>${channel.gameInfo.homeTeam.teamNickName} VS ${channel.gameInfo.awayTeam.teamNickName}</div>
													</div>
													<hr/>
													
												</div>
											</div>
										</div>
										
									</div>
								</div>
								<!-- collaspe End-->								
							</div>
						</div>
					</div>					
				</c:forEach>
			</div>
		</div>
	</div>




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

	<script type="text/javascript"
		src="/js/library/chartist-plugin-legend.js"></script>
	<script type="text/javascript"
		src="/js/library/chartist-plugin-threshold.js"></script>
	<script type="text/javascript"
		src="/js/library/chartist-plugin-pointlabels.js"></script>

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