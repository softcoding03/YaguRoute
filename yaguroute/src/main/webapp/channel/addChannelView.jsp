<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta name="viewport" content="width=device-width,initial-scale=1">
	
	<link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
	<!-- <link rel="icon" href="favicon.ico" type="image/x-icon"> -->
	<link href="/css/style.min.css" rel="stylesheet" type="text/css" />
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    
    <script type="text/javascript">
    	$(function() {
    		$('button:contains("추가")').on('click', function(){
    			console.log("추가 버튼 클릭 성공");
    			$('form[name="detailForm"]').attr("method", "post").attr("action", "/channel/addChannel").submit();
    		})
    	});
    </script>

<style>
input{
	padding: 15px 10px;
	border: 1px solid transparent;
	width: 100%;
	background: #fff;
	font-size: 14px;
	color: #666;
	line-height: normal;
	outline: 0
}

body{
	background-color:#f2f2f2;
}

.basic{
	border: #fff;
    border-radius: 4px;
    cursor: pointer;
    padding: 13px 24px 11px 9px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    position: relative;
    background: #fff;
    color: #141414;
    width: 80%;
    font-size: 12px;
    text-transform: uppercase;
    transition: all 240ms ease-out;
    -webkit-transition: all 240ms ease-out; 
}
</style>


</head>
<body>
	<section class="checkout-wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="text-center">
						<h4>channel 생성</h4>
					</div>
					
					<div class="customer-info">					
						<form name="detailForm" class="form-horizontal">
							<div class="row">
								
								<div class="form-group col-md-6 col-md-offset-3">
									<div class="item">
										<lable>
											<span>
												채널 이름 <i>*</i>
											</span>
											<input type="text" name="channelName" class="form-control" style="width:400px;"/>
										</lable>
									</div>
									
									<div class="item">
										<lable>
											<span>
												버켓 이름 <i>*</i>									
											</span>
											<input type="text" name="bucketName" class="form-control" style="width:400px;"/>
										</lable>
									</div>
									
									<div class="item">
										<lable>
											<span>저장 경로</span>
											<input type="text" name="uploadPath" class="form-control" style="width:400px;"/>
										</lable>
									</div>
									
									<div class="item">
										<label>
											<span>채널 타입</span>
											<select class="basic" name="envType">
												<option value="REAL">REAL</option>
												<option value="DEV">DEV</option>
												<option value="STAGE">STAGE</option>
											</select>
										</label>
									</div>
									
									<div class="item">
										<label>
											<span>오늘의 게임 리스트</span>
											<select class="basic" name="gameCode">
												<c:set var="i" value="0" />
												<c:forEach var="game" items="${gamelist}">
													<lable class="item">
													<option value="${game.gameCode}">${game.homeTeam.teamNickName} VS ${game.awayTeam.teamNickName}</input>
													</lable>
												</c:forEach>
											</select>
										</label>
									</div>
									
									<div class="item">
										<label>
											<span>thumbnail</span>
										</label>
									</div>
								</div>
							</div>
						</form>
						<button type="button" id="submit">추가</button>
					</div>
				</div>
			</div>
		</div>
	</section>		
		



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