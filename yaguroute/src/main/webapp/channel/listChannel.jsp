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
body {
	padding-top: 50px;
}

#button{
	background-color : #f2f2f2;
	margin-top: 20%;
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
				
				$("button:contains('수정하기')").on("click", function(){
					console.log("수정하기");
					var text = $(this).children("input[name='channelID']").val();
					console.log("수정하기 클릭 시 ChanndlID : "+text);
					self.location="/channel/updateChannel?channelID="+text;
				})
				
				$("button:contains('삭제하기')").on("click", function(){
					console.log("삭제하기");
					var text = $(this).children("input[name='channelID']").val();
					console.log("삭제하기 클릭 시 ChanndlID : "+text);
					self.location="/channel/deleteChannel?channelID="+text;
				})
			});
		</script>


</head>

<body>
	<!-- Toolbar start -->
	<jsp:include page="/common/topBar.jsp" />
	<!-- Toolbar End -->

	<!-- Header start -->
	<section class="image-header">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div class="info">
						<div class="wrap">
							<ul class="breadcrumbs">
								<li><a href="index.html">Main</a>/</li>
								<li>Streaming Match</li>
							</ul>
							<h1>채널 목록</h1>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- header end -->

	<div class="broadcast-wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
	            	<h4>Channel Management</h4>                
	            </div>
	            
				<c:set var="i" value="0"/>
				<c:forEach var="channel" items="${list}">
					<c:set var="i" value="${i+1}"/>
					<div class="col-md-12">
						<div class="broadcast-list" id="accordion" role="tablist" aria-multiselectable="true">
							<div class="broadcast-item">
								<div class="item-header" id="headingOne">
									<div class="row">
										<div class="col-md-1 col-sm-1">
				                    		<a data-toggle="collapse" data-parent="#accordion" href="#${channel.channelName}" class="arrow"><i class="fa fa-caret-down" aria-hidden="true"></i></a>
				               			</div>
				               			
				               			<div class="col-md-7 col-sm-7">
				               				<div class="item-head-body">
				               					${channel.channelName}
				               				</div>				       
				               			</div>
				               			
				               			<div class="col-md-4 col-sm-4">
					               			<div class="row">
					               				<div class="col-md-6 col-sm-6">
					               					<button type="button" class="btn btn-outline-dark" id=button>수정</button>
					               				</div>
					               				
					               				<div class="col-md-6 col-sm-6">
					               					<button class="btn btn-outline-dark" id=button>삭제</button>
					               				</div>
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
	<script type="text/javascript"
		src="/js/library/jcarousel.connected-carousels.js"></script>
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