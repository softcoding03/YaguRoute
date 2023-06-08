<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀 정보</title>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=s5i3dw6edg"></script>
<link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <style type="text/css">
    	.background {
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  margin-top: 50px;
		   margin-bottom: 50px;
    	}
    	.text-center{
    		text-align: center !important;
    		font-size: 15px !important;
    		font-weight: 700;
    	}
    </style>
</head>
<body>
<jsp:include page="/common/changePageEvent.jsp"/>
<jsp:include page="/common/topBar.jsp"/>
<section class="image-header">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="info">
                    <div class="wrap">
                        <h1>팀 정보</h1>
                    </div>
                </div>
            </div>	
        </div>
    </div>
</section>
	<div class="background">
		<div class="broadcast-tabs-wrapper">
	            <ul class="nav nav-tabs" role="tablist">
	            <c:forEach var="team" items="${allTeam}">
	            	<c:if test="${team.teamCode ne 'ALL'}">
		                <li class="${team.teamCode eq teamCode ?'active':''}" role="presentation">
		                <a href="teamCodeHref" role="tab" data-toggle="tab">
			                <img alt="img" src="${team.teamEmblem}">
			                <span class="info">
			                	<span class="title">${team.teamNickName}</span>
			                	<input type="hidden" value="${team.teamCode}"/>
			                </span> 
		                </a>
		                </li>
		        	</c:if>
	            </c:forEach>
	            </ul>
	        </div>
	</div>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="text-center"><h1>${teamInfo.teamFullName}</h1></div>
				<div class="col-md-4">
					<div><h4>Emblem</h4></div>
					<div><img src="${teamInfo.teamEmblem}" width="300" height="300"></div>
				</div>
				<div class="col-md-8">
					<div><h4>Introduce</h4></div>
					<div class="text"> ${teamInfo.teamIntroduce}</div>
				</div>
				<div class="col-md-8">
					<div><h4>Homepage</h4></div>
					<div><a href="${teamInfo.teamHomepage}">${teamInfo.teamNickName} 홈페이지 바로가기 : ${teamInfo.teamHomepage}</a></div>
				</div>
				<div class="col-md-8">
					<div><h4>Hometown</h4>${teamInfo.hometown}</div>
				</div>
				<div class="col-md-12 col-sm-12">
	            	<div class="cart-total">
	                    <button class="proceed text-center">티켓 예매<i class="fa fa-check" aria-hidden="true"></i></button>
	                </div>
            	</div>
				<div class="col-md-12" style="margin-top: 50px; ">
					<h4 id="nowYear"></h4>
					<table class="table-standings">
		                        <tr>
		                        	<th>현재순위</th>
		                        	<th>경기</th>
		                        	<th>승리</th>
		                        	<th>무승부</th>
		                        	<th>패배</th>
		                        	<th>승률</th>
		                        	<th>지난 10경기</th>
		                        </tr>
		                        <tr>
		                        	<td>${teamInfo.teamRanking}위</td>
		                        	<td>${teamInfo.endGameCount}</td>
		                        	<td>${teamInfo.winCount}</td>
		                        	<td>${teamInfo.tieCount}</td>
		                        	<td>${teamInfo.loseCount}</td>
		                        	<td>${teamInfo.winRate}</td>
		                        	<td>${teamInfo.lastTenMatch}</td>
		                        </tr>
		                    </table>
				
				</div>
				<div class="col-md-12">
					<div><h4>Stadium</h4></div>
					<div style="text-align: center;"><h5>${teamInfo.stadiumName}</h5></div>
					<div><img width="100%" height="800px" src="${teamInfo.stadiumImageFile}" alt="stadium-img"></div>
				</div>
		</div>
	</div>
</div>


<div class="container">
	<div class="row">
		<div class="col-md-12" style="justify-content: center;">
			<div style="text-align: center; padding-top: 50px;"><h5 class="player-name">${teamInfo.stadiumName} 위치 정보</h5></div>
			<div><p class="text">주소 : ${teamInfo.stadiumAddress}</p></div>
			<div id="wrap" class="section" style="padding-bottom: 200px;">
				<div id="map" style="width: 100%; height: 500px;" class="buttons"></div>
			</div>
		</div>
	</div>
</div>

</body>
<script type="text/javascript">
	$(function(){
		initMap();
		
		var today = new Date();
		var currentYear = today.getFullYear().toString();
		$("#nowYear").html(currentYear + '시즌');
	})
	function initMap(){
		
		$("a[href='teamCodeHref']").on('click',function(){
			self.location = "/game/getTeam?teamCode="+$(this).find(".info input").val();
	    })
		
		let map = new naver.maps.Map('map',{
			center : new naver.maps.LatLng(${teamInfo.stadiumLat},${teamInfo.stadiumLng})
		})
		
		let marker = new naver.maps.Marker({
			map: map,
			title : "${teamInfo.stadiumName}",
			position: new naver.maps.LatLng(${teamInfo.stadiumLat},${teamInfo.stadiumLng})
		})
		
		let infoWindow = new naver.maps.InfoWindow({
			content:'<div><div>${teamInfo.teamFullName} 홈구장</div>'+'<div><a href="${teamInfo.teamHomepage}">바로가기</a></div></div>'
		})
		
		infoWindow.open(map,marker);
	}
</script>
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