<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getPrevUserPredict</title>
</head>
<link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>
	hr{
		border:none;
		border-top: 3px solid black;
	}
</style>
<body>
<div class="container">
	<div class="text-right"><h4>${user.userName}님 보유 포인트 : ${user.userPoint}</h4></div>
		<div class="main-award-slider">
   			<div id="main-award-slider" class="carousel slide" data-ride="carousel">
			<div class="text-center">
				<h1 id="nowDate">${date}</h1>
			</div>
			<a class="nav-arrow right-arrow" id="nextDay" href="#" role="button" data-slide="next">
	            <i class="fa fa-angle-right" aria-hidden="true"></i>
	            <span class="sr-only"></span>
	        </a>
        </div>
	</div>
	
</div>

<c:if test="${gameSize eq 0}">
	<div class="text-center">
		<h2>경기가 없습니다.</h2>
	</div>
</c:if>
<c:if test="${gameSize ne 0}">
	<c:if test="${predSize eq 0}">
		<div class="text-center">
			<h1>예측한 경기가 없습니다.</h1>
		</div>
	</c:if>
<%-- <c:if test="${predSize ne 0}">--%>
<form>
<input type="hidden" value="${date}" name="date">
<c:forEach items="${gameList}" var="game" varStatus="gameStatus">
<c:set var="pred" value="${predList[gameStatus.index]}"/>
<hr>
<input type="hidden" value="${game.gameCode}" name="addPred[${gameStatus.index}].predGameCode">
<input type="hidden" value="${user.userId}" name="addPred[${gameStatus.index}].predUserId">
<div class="match-page-top">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="upcoming-match-info">
                    
                        <div class="team col-md-4">
                        	<div>[home]</div>
                        	<c:if test="${game.gameStatusCode eq 2}">
                        		<div class="text">${game.homeTeam.teamCode eq game.winningTeamCode ? '승리' : '패배' }</div>
                            </c:if>
                            <c:if test="${game.gameStatusCode eq 4}">
                            	<div class="text">무승부</div>
                            </c:if>
                            <div class="avatar"><img src="${game.homeTeam.teamEmblem}" alt="match-list-team-img"></div>
                            <div class="text">
                                ${game.homeTeam.teamNickName} <span>${game.homeTeam.hometown}</span>
                                <div class="latest">
                                    <div class="latest-title">${game.homeTeam.teamFullName} 승리</div>
                                    <input type="radio" value="${game.homeTeam.teamCode}" name="addPred[${gameStatus.index}].predWinningTeamCode" disabled="disabled" ${ pred.predWinningTeamCode eq game.homeTeam.teamCode ? 'checked' : ''}>
                                </div>
                            </div> 
                        </div>
                        <div>
                            <ul>
                            <c:if test="${game.gameStatusCode eq 3}">
                            	<li><h2>취소된 경기입니다.</h2></li>
                            </c:if>
                            <c:if test="${game.gameStatusCode eq 4  or game.gameStatusCode eq 2}">
                                <li>
                                    <div><a class="btn small" href="/game/getGameRecord?gameCode=${game.gameCode}">경기기록</a></div>
                                </li>
                            </c:if>
                            <c:if test="${game.gameStatusCode eq 2}">
                                <li>
                                    <div>승리팀 배당 : ${game.winningTeamAllocation}</div>
                                </li>
                                <li>
                                    <div>예측 포인트 : ${pred.predPoint}</div>
                                </li>
                                <li>
                                    <div>배당 적용 예측 포인트 : ${pred.afterGamePredPoint}</div>
                                </li>
                            </c:if>
                            </ul>
                        </div>
                        <div class="team right col-md-4">
                            <div class="text">
                                ${game.awayTeam.teamNickName}<span>${game.awayTeam.hometown}</span>
                                <div class="latest">
                                    <div class="latest-title">${game.awayTeam.teamFullName} 승리</div>
                                    <input type="radio" value="${game.awayTeam.teamCode}" name="addPred[${gameStatus.index}].predWinningTeamCode" disabled="disabled" ${pred.predWinningTeamCode eq game.awayTeam.teamCode ? 'checked' : ''}>
                                </div>
                            </div>
                            <div class="avatar"><img src="${game.awayTeam.teamEmblem}" alt="match-list-team-img"></div>
                            <c:if test="${game.gameStatusCode eq 2}">
                        		 <div class="text">${game.awayTeam.teamCode eq game.winningTeamCode ? '승리' : '패배' }</div>
                            </c:if>
                            <c:if test="${game.gameStatusCode eq 4}">
                            	<div class="text">무승부</div>
                            </c:if>
                           
					</div>
					
				</div>
			</div>
			
		</div>
	</div>
</div>
<c:if test="${gameStatus.last eq true}"><hr></c:if>

</c:forEach>
</form>
</c:if>
<%--</c:if> --%>
</body>
<script type="text/javascript">
	$(function(){
		
		$("#nextDay").on("click",function(){
			self.location = "/predict/getUserPredict?date=${otherDay}";
		})
		
		
	})
	
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