<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>getGameRecord</title>
	<link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>

<style type="text/css">
	.image-container {
		position: absolute;
		display: inline-block;
		width: auto;
	}
	.teamTopBar {
		width: auto !important;
		height: auto;
	}
	
	.imgSize{
		width: 130px !important;
		height: 110px !important;
	}
	.teamName{
		font-size: 15px;
		font-weight: 600;
	}
	ul{
		list-style:none;
	}
	
	.li{
		float:left;
		margin-right:60px;
	}
	
	table tr td:last-child{
		font-weight:normal !important;
	}
	.player-trophey {
	  display: flex;
	  justify-content: center;
	}
	.border-wid{
		border-width: 2px;
		border-color: #5e8208;
		border-radius: 10px;
		border-style: solid;
		margin-right: 20px;
		padding-bottom: 2px;
		padding-left: 2px
	}
	.left-border-wid{
		border-radius: 10px;
		margin-top: 20px;
		background-color: rgba(25, 55, 109,0.5);
		width: 50%;
		padding-bottom: 5px;
		padding-left: 5px;
		box-shadow: 3px 3px 3px 1px gray;
	}
	.left-border-wid span{
		color: white;
		padding-right: 15px;
	}
	.player-single-wrap{
	    padding-top: 20px !important;
	    padding-bottom: 20px !important;
	}
	.sidebar-calendar{
		position: sticky;
	    top: 300px;
	    right: 100px;
	}
	/* @media (max-width: 767px){ */
		.sidebar{
			width: 20% !important;
			padding-left:150px !important;
		}
	/* } */
	@media (max-width: 1850px){
		.sidebar{
			display: none;
		}
	} 
	.side-font-size{
		font-size: 14px;
	}
	div.text{
		font-size: 12px; 
		text-align: center;
		font-weight: 600;
	}
	
	
</style>

<body>
<jsp:include page="/common/loading.jsp"/>
<jsp:include page="/common/topBar.jsp"/>
<section class="image-header">
    <div class="image-container">
	  <div class="row">
	  	<div class=" col-md-6">
			<img class="teamTopBar" src="${gameRecord.gameInfo.awayTeam.teamTopBar}">
		</div>
		<div class=" col-md-6" style="padding-left: 0px;">
			<img class="teamTopBar" src="${gameRecord.gameInfo.homeTeam.teamTopBar}">
		</div>
	  </div>
	</div>
</section>
<section class="sidebar col-xs-3 sidebar-offcanvas" id="sidebar">
	<div class="sidebar-calendar addShadow">
		<div class="padding">
           	<h6 style="padding-left: 25px;width: 50%;text-align: center;">다른 경기</h6>
           	<ul>
           	<c:forEach var="toGame" items="${todayGame}">
           		<li class="left-border-wid .li" style="${toGame.gameCode eq gameRecord.gameInfo.gameCode ? 'border: 3px solid #f03a3a' : ''};">
           			<div>
	           		<c:if test="${toGame.gameStatusCode eq 2 or toGame.gameStatusCode eq 4}">
	           			<div class="text">경기종료</div>
	           			<a href="/game/getGameRecord?gameCode=${toGame.gameCode}">
			           		<div>
			           			<span class="side-font-size"><img width="22px" height="22px" alt="awayImg" src="${toGame.awayTeam.teamEmblem}">${toGame.awayTeam.teamNickName}</span><span style="float:right; font-size: 15px;">${fn:split(toGame.gameScore,':')[0]}</span>
			           		</div>
			           		<div>
			           			<span class="side-font-size"><img width="22px" height="22px"  alt="homeImg" src="${toGame.homeTeam.teamEmblem}">${toGame.homeTeam.teamNickName}</span><span style="float:right; font-size: 15px;">${fn:split(toGame.gameScore,':')[1]}</span>
			           		</div>
	           			</a>
	           		</c:if>
	           		<c:if test="${toGame.gameStatusCode eq 3}">
	           				<div class="text" style="font-size: 12px; text-align: center; color: #f03a3a">경기취소</div>
			           		<div>
			           			<span class="side-font-size"><img width="22px" height="22px" alt="awayImg" src="${toGame.awayTeam.teamEmblem}">${toGame.awayTeam.teamNickName}</span>
			           		</div>
			           		<div>
			           			<span class="side-font-size"><img width="22px" height="22px"  alt="homeImg" src="${toGame.homeTeam.teamEmblem}">${toGame.homeTeam.teamNickName}</span>
			           		</div>
	           		</c:if>
	           		<c:if test="${toGame.gameStatusCode eq 0}">
	           				<div class="text" style="font-size: 12px; text-align: center;">${toGame.gameTime} 예정</div>
	           				<a href="/game/getGamePreview?gameCode=${toGame.gameCode}">
				           		<div>
				           			<span class="side-font-size"><img width="22px" height="22px" alt="awayImg" src="${toGame.awayTeam.teamEmblem}" >${toGame.awayTeam.teamNickName}</span>
				           		</div>
				           		<div>
				           			<span class="side-font-size"><img width="22px" height="22px"  alt="homeImg" src="${toGame.homeTeam.teamEmblem}">${toGame.homeTeam.teamNickName}</span>
				           		</div>
			           		</a>
	           		</c:if>
	           		<c:if test="${toGame.gameStatusCode eq 1}">
	           				<div class="text" style="font-size: 12px; text-align: center;">중계중</div>
	           				<a href="/channel/getStreaming?gameCode=${toGame.gameCode}">
				           		<div>
				           			<span class="side-font-size"><img width="22px" height="22px" alt="awayImg" src="${toGame.awayTeam.teamEmblem}">${toGame.awayTeam.teamNickName}</span>
				           		</div>
				           		<div>
				           			<span class="side-font-size"><img width="22px" height="22px"  alt="homeImg" src="${toGame.homeTeam.teamEmblem}">${toGame.homeTeam.teamNickName}</span>
				           		</div>
			           		</a>
	           		</c:if>
	           		</div>
           		</li>
           	</c:forEach>
           	</ul>
        </div>
	</div>
</section>
<div class="container">
<section id="gameInfo" class="col-xs-9 col-sm-9 col-md-9">
<div class="container">
	<div class="row">
	<h3>경기 기록</h3>
<div class="col-md-12 col-sm-12 col-xs-12">
	<div class="tab-content">
	    <div class="tab-pane active" id="all">
	        <div class="amateurs-main-match">
	            <div class="title">${gameRecord.gameInfo.homeTeam.stadiumName}</div>	
	            <a href="/game/getTeam?teamCode=${gameRecord.gameInfo.awayTeam.teamCode}" class="team">
	                <span class="image"><img class="imgSize" src="${gameRecord.gameInfo.awayTeam.teamEmblem}" alt="main-match"></span>
	                <span class="info">
	                    <span class="name teamName">${gameRecord.gameInfo.awayTeam.teamFullName}</span>
	                </span>
	            </a>
	            <div class="score">
	                <span>${gameRecord.gameInfo.gameScore}</span>	
	            </div>
	            <a href="/game/getTeam?teamCode=${gameRecord.gameInfo.homeTeam.teamCode}" class="team guest">
	                <span class="info">
	                    <span class="name teamName">${gameRecord.gameInfo.homeTeam.teamFullName}</span>
	                </span>	
	                <span class="image"><img class="imgSize" src="${gameRecord.gameInfo.homeTeam.teamEmblem}" alt="main-match"></span>
	            </a>
	            <div class="title">${gameRecord.gameInfo.gameDate}</div>
	            <div class="title">${gameRecord.gameInfo.gameTime}</div>
	        </div>
	    </div>
	</div>
</div>
<div class="container">
	<div class="row">
<div class="col-md-12 col-sm-12 col-xs-12">
<table class="table-standings">
                        <tr>
                        	<th>팀명</th>
                            <c:forEach items="${gameRecord.innings}" var="inning">
                            	<th>${inning}</th>
                            </c:forEach>
                            <th></th>
                            <th>R</th>
                            <th>H</th>
                            <th>E</th>
                            <th>B</th>
                        </tr>
                        <tr>
                            <td>
                                ${gameRecord.gameInfo.awayTeam.teamNickName}<span class="team"><img src="${gameRecord.gameInfo.awayTeam.teamEmblem}" width="30" height="30" alt="team-logo"></span></td>
                           <c:forEach items="${gameRecord.awayScoreList}" var="awayScore">
                            	<td>${awayScore}</td>
                            </c:forEach>
                            <td></td>
                            <c:forEach items="${gameRecord.awayRecord}" var="awayRecord">
                            	<td>${awayRecord}</td>
                            </c:forEach>
                        </tr>
                        <tr>
                            <td>
                               ${gameRecord.gameInfo.homeTeam.teamNickName}<span class="team"><img src="${gameRecord.gameInfo.homeTeam.teamEmblem}" width="30" height="30" alt="team-logo"></span></td>
                            <c:forEach items="${gameRecord.homeScoreList}" var="homeScore">
                            	<td>${homeScore}</td>
                            </c:forEach>
                            <td></td>
                            <c:forEach items="${gameRecord.homeRecord}" var="homeRecord">
                            	<td>${homeRecord}</td>
                            </c:forEach>
                        </tr>
                    </table>
		</div>
	</div>
</div>
</div>
</div>
</section>                
<section id="titlePlayer" class="player-single-wrap col-xs-9 col-sm-9 col-md-9">
<div class="container">
            <div class="row">
<div class="player-info">
	<div>
		<div class="col-md-12 col-sm-12 col-xs-12">
                            <ul class="player-trophey">
                            <c:forEach var="pitcher" items="${gameRecord.titlePitcher}">
                            	<div class="border-wid">
	                                <li>
	                                   	<img src="${pitcher.pitcherImage}" width="85" height="110" alt="trophy">
	                                    <div class="year" style="background-color: ${pitcher.title eq '패전' ? '#db5e5e' : '#203d81'};">${fn:substring(pitcher.title,0,1)}</div>
	                                 </li>
	                                 <li>
	                                 	<br>
		                             	<div style="font-size: 15px;font-weight: 600;">${pitcher.pitcherName}</div>
		                             	<div style="font-size: 12px;">이닝 ${pitcher.innings}<br> 피안타 ${pitcher.getHit} | 자책 ${pitcher.myLostScore}</div>
	                                 </li>
                                 </div>
                            </c:forEach>
                           	</ul>
  		</div>
	</div>
</div>
</div>
</div>
</section>
<section id="rest" class="col-xs-9 col-sm-9 col-md-9">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <h3>경기 다시보기</h3>
                
<div class="mathc-live-broadcasts">
    <div class="background">
        <div class="tab-content">
        	<c:if test="${gameRecord.gameInfo.videoLink eq null}">
        		경기영상을 준비중입니다.
        	</c:if>
        	<c:if test="${gameRecord.gameInfo.videoLink ne null}">
            <div class="tab-pane fade in active" role="tabpanel" id="title1">
	                <iframe class="video" src="${gameRecord.gameInfo.videoLink}" allowfullscreen><p>지원하지 않는 브라우져 입니다.</p></iframe>
	            </div>
	            <jsp:include page="/comment/listComment.jsp"/>
            </c:if>
        </div>
    </div>
</div>
            

<div>
<h3>선수 기록</h3>
<h6>${gameRecord.gameInfo.homeTeam.teamNickName}<img src="${gameRecord.gameInfo.homeTeam.teamEmblem}" width="50" height="50"/></h6>
타자
</div>
<table class="table-standings">
                        <tr>
                        	<th>타자명</th>
                        	<th></th>
                            <th>타수</th>
                            <th>득점</th>
                            <th>안타</th>
                            <th>타점</th>
                            <th>홈런</th>
                            <th>볼넷</th>
                            <th>삼진</th>
                            <th>타율</th>
                        </tr>
                        <c:forEach items="${gameRecord.homeHitterList}" var="homeHitter">
                        <tr>
                            <td>${homeHitter.hitterName}</td>
                            <td></td>
                            <td>${homeHitter.atBat}</td>
                            <td>${homeHitter.getScore}</td>
                            <td>${homeHitter.hits}</td>
                            <td>${homeHitter.RBI}</td>
                            <td>${homeHitter.homeRun}</td>
                            <td>${homeHitter.walk}</td>
                            <td>${homeHitter.strikeOut}</td>
                            <td>${homeHitter.battingAvg}</td>
                        </tr>
	</c:forEach>
</table>
<br>
투수
<table class="table-standings">
                        <tr>
                        	<th>투수명</th>
                        	<th></th>
                            <th>이닝</th>
                            <th>피안타</th>
                            <th>실점</th>
                            <th>자책</th>
                            <th>사사구</th>
                            <th>삼진</th>
                            <th>피홈런</th>
                            <th>타자</th>
                            <th>타수</th>
                            <th>투구수</th>
                        </tr>
            <c:forEach items="${gameRecord.homePitcherList}" var="homePitcher">
                        <tr>
                            <td>${homePitcher.pitcherName}</td>
                            <td></td>
                            <td>${homePitcher.innings}</td>
                            <td>${homePitcher.getHit}</td>
                            <td>${homePitcher.totalLostScore}</td>
                            <td>${homePitcher.myLostScore}</td>
                            <td>${homePitcher.walk}</td>
                            <td>${homePitcher.strikeOut}</td>
                            <td>${homePitcher.getHomerun}</td>
                            <td>${homePitcher.againstHitter}</td>
                            <td>${homePitcher.atBat}</td>
                            <td>${homePitcher.pitchingCount}</td>
                        </tr>
			</c:forEach>
</table>
<br>
<hr style="border-top: 2px solid #a3cca3;">
<h6>${gameRecord.gameInfo.awayTeam.teamNickName}<img src="${gameRecord.gameInfo.awayTeam.teamEmblem}" width="50" height="50"/></h6>
<br>
타자
<table class="table-standings">
                        <tr>
                        	<th>타자명</th>
                        	<th></th>
                            <th>타수</th>
                            <th>득점</th>
                            <th>안타</th>
                            <th>타점</th>
                            <th>홈런</th>
                            <th>볼넷</th>
                            <th>삼진</th>
                            <th>타율</th>
                        </tr>
            <c:forEach items="${gameRecord.awayHitterList}" var="awayHitter">
                        <tr>
                            <td>${awayHitter.hitterName}</td>
                            <td></td>
                            <td>${awayHitter.atBat}</td>
                            <td>${awayHitter.getScore}</td>
                            <td>${awayHitter.hits}</td>
                            <td>${awayHitter.RBI}</td>
                            <td>${awayHitter.homeRun}</td>
                            <td>${awayHitter.walk}</td>
                            <td>${awayHitter.strikeOut}</td>
                            <td>${awayHitter.battingAvg}</td>
                        </tr>
			</c:forEach>
</table>
<br>
투수
<table class="table-standings">
                        <tr>
                        	<th>투수명</th>
                        	<th></th>
                            <th>이닝</th>
                            <th>피안타</th>
                            <th>실점</th>
                            <th>자책</th>
                            <th>사사구</th>
                            <th>삼진</th>
                            <th>피홈런</th>
                            <th>타자</th>
                            <th>타수</th>
                            <th>투구수</th>
                        </tr>
            <c:forEach items="${gameRecord.awayPitcherList}" var="awayPitcher">
                        <tr>
                            <td>${awayPitcher.pitcherName}</td>
                            <td></td>
                            <td>${awayPitcher.innings}</td>
                            <td>${awayPitcher.getHit}</td>
                            <td>${awayPitcher.totalLostScore}</td>
                            <td>${awayPitcher.myLostScore}</td>
                            <td>${awayPitcher.walk}</td>
                            <td>${awayPitcher.strikeOut}</td>
                            <td>${awayPitcher.getHomerun}</td>
                            <td>${awayPitcher.againstHitter}</td>
                            <td>${awayPitcher.atBat}</td>
                            <td>${awayPitcher.pitchingCount}</td>
                        </tr>
			</c:forEach>
</table>


</div>
</div>
</div>
</section>
</div>
</body>
<%-- 
이닝 ${pitcher.innings}
피안타 ${pitcher.getHit} | 자책 ${pitcher.myLostScore}
--%>       
<script type="text/javascript">
$(function(){
	 window.addEventListener('load', function() {
   	  	var section1 = document.getElementById('sidebar');
   		var section2 = document.getElementById('gameInfo');
   		var section3 = document.getElementById('titlePlayer');
   		var section4 = document.getElementById('rest');
   	
   	  	var section2Height = section2.offsetHeight;
   		var section3Height = section3.offsetHeight;
   		var section4Height = section4.offsetHeight;
   	  section1.style.height = section2Height + section3Height + section4Height + 'px';
   	});
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