<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		border-top: 2px solid #a3cca3;
	}
	.imgSize{
		width:130px !important;
		height:110px !important;
	}
	.middle{
		vertical-align: middle !important;
	}
	.margin-left{
		margin-left: 30px;
	}
	.margin-right{
		margin-right: 30px;
	}
	.border{
		border: 3px solid;
		border-radius: 10px;
		width: 55px;
		height: 55px;
	}
	.a-css{
		display:inline-flex !important; 
		width: 250px;
		padding-top: 40px;
		padding-bottom: 40px;
	}
	.upcoming-match-info .team>*{
		vertical-align: middle !important;
	}
	.text{
		font-size: 15px;
	}
</style>
<body>
<jsp:include page="/common/topBar.jsp"/>
<section class="image-header">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="info">
                    <div class="wrap">
                        <h1>경기 예측</h1>
                    </div>
                </div>
            </div>	
        </div>
    </div>
</section>
<div class="container">
	<div class="text-right"><h4>${user.userName}님 보유 포인트 : ${user.userPoint} Point</h4></div>
		<div class="main-award-slider" style="padding-bottom: 10px;">
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
		<h4>경기가 없습니다.</h4>
	</div>
</c:if>
<c:if test="${gameSize ne 0}">
	<c:if test="${predSize eq 0}">
		<div class="text-center">
			<h4>예측한 경기가 없습니다.</h4>
		</div>
	</c:if>
<c:if test="${predSize ne 0}">
<div class="container">
	<div class="text-center">
		<h2>경기 예측 결과</h2>
		<div>
			<div class="text">획득 포인트 결과</div>
			<div class="text" id ="result"></div>
		</div>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="col-md-6">
				<h3>[HOME]</h3>
			</div>
			<div class="col-md-6" style="text-align: right;">
				<h3>[AWAY]</h3>
			</div>
		</div>
	</div>
</div>
<form>
<input type="hidden" value="${date}" name="date">
<c:forEach items="${gameList}" var="game" varStatus="gameStatus">
<c:set var="pred" value="${predList[gameStatus.index]}"/>
<input type="hidden" value="${game.gameCode}" name="addPred[${gameStatus.index}].predGameCode">
<input type="hidden" value="${user.userId}" name="addPred[${gameStatus.index}].predUserId">

<div class="oneGame">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                	<hr>
                    <div class="upcoming-match-info" style="margin-top: 50px;margin-bottom: 50px;">
                    
                        <div class="team col-md-4">
                        	<c:if test="${game.gameStatusCode eq 2}">
                        		<div class="text">
                        			<div class="latest">
                        				<span class="${game.homeTeam.teamCode eq game.winningTeamCode ? 'win' : 'lose' }">${game.homeTeam.teamCode eq game.winningTeamCode ? '승' : '패' }</span>
                        			</div>
                        		</div>
                            </c:if>
                            <c:if test="${game.gameStatusCode eq 4}">
                            	<div class="text">
                        			<div class="latest">
                        				<span class="drawn">무</span>
                        			</div>
                        		</div>
                            </c:if>
                            <a class="a-css">
	                            <div class="avatar"><img src="${game.homeTeam.teamEmblem}" alt="match-list-team-img" class="imgSize" id="${game.homeTeam.teamCode}"></div>
	                            <div class="text">
	                                ${game.homeTeam.teamFullName} <span>${game.homeTeam.hometown}</span>
	                                <div class="latest">
	                                    <div class="latest-title">${game.homeTeam.teamNickName} 승리</div>
	                                </div>
                            </div> 
                            </a>
                              <div class="border margin-left"><i class="fa fa-check fa-3x" aria-hidden="true" style="display: ${(predSize ne 0 and pred.predWinningTeamCode eq game.homeTeam.teamCode) ? 'flex' : 'none'};"></i></div>
                        </div>
                        <div class="col-md-2" style="text-align: center;">
                            <c:if test="${game.gameStatusCode eq 3}">
                            	<h5>취소된 경기입니다.</h5>
                            </c:if>
                            <c:if test="${game.gameStatusCode eq 2}">
                               
                               		<div>
	                                 
	                                <h6>승리팀 배당 <br><fmt:formatNumber value="${game.winningTeamAllocation}" pattern="#,##0.0" />배</h6>
	                               	
                                    <h6>예측 포인트<br><fmt:formatNumber value="${pred.predPoint}" pattern="###,###" /> P</h6>
                                    <input type="hidden" value="${pred.predPoint}" class="predPoint">
                                    
                                    <h6>획득 포인트<br><fmt:formatNumber value="${pred.afterGamePredPoint}" pattern="###,###" /> P</h6>
                                    <input type="hidden" value="${pred.afterGamePredPoint}" class="afterPredPoint">
                                    </div>
                               
                            </c:if>
                            <c:if test="${game.gameStatusCode eq 4  or game.gameStatusCode eq 2}">
	                            <div class="info">
	                                    <div class="btn-wrap">
	                                    	<a class="btn small" href="/game/getGameRecord?gameCode=${game.gameCode}" style="font-size:16px;font-family: Raleway,sans-serif; font-weight: 900;">경기기록</a>
	                                    </div>
	                            </div>
                            </c:if>
                        </div>
                        
                        <div class="team right col-md-4">
                        	<div class="border margin-right"><i class="fa fa-check fa-3x" aria-hidden="true" style="display: ${(predSize ne 0 and pred.predWinningTeamCode eq game.awayTeam.teamCode) ? 'flex' : 'none'};"></i></div>
                            <a class="a-css">
	                            <div class="text">
	                                ${game.awayTeam.teamFullName}<span>${game.awayTeam.hometown}</span>
	                                <div class="latest">
	                                    <div class="latest-title">${game.awayTeam.teamNickName} 승리</div>
	                                </div>
	                            </div>
	                            <div class="avatar"><img src="${game.awayTeam.teamEmblem}" alt="match-list-team-img" class="imgSize"></div>
	                        </a>    
	                            <c:if test="${game.gameStatusCode eq 2}">
	                        		 <div class="text">
	                        			<div class="latest">
	                        				<span class="${game.awayTeam.teamCode eq game.winningTeamCode ? 'win' : 'lose' }">${game.awayTeam.teamCode eq game.winningTeamCode ? '승' : '패' }</span>
	                        			</div>
	                        		</div>
	                            </c:if>
	                            <c:if test="${game.gameStatusCode eq 4}">
	                            	<div class="text">
	                        			<div class="latest">
	                        				<span class="drawn">무</span>
	                        			</div>
	                        		</div>
	                            </c:if>
                           
					</div>
					
				</div>
			</div>
		</div>
		<c:if test="${gameStatus.last eq true}"><hr></c:if>
	</div>
</div>

</c:forEach>
</form>
</c:if>
</c:if>
</body>
<script type="text/javascript">
	$(function(){
		
		$("#nextDay").on("click",function(){
			self.location = "/predict/getUserPredict?date=${otherDay}";
		})
		
		var sum = 0;
		var afterSum = 0;
		var predSum = 0;
		$(".afterPredPoint").each(function(){
			afterSum = afterSum + parseInt($(this).val());
		})
		
		$(".predPoint").each(function(){
			predSum =  predSum + parseInt($(this).val());
		})
		
		var formatter = new Intl.NumberFormat('en-US',{style:'decimal'})
		sum = formatter.format(afterSum - predSum);
		if(afterSum - predSum>=0){
			sum = "+"+sum
		}
		$("#result").text(sum+" Point")
		
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