<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전력분석</title>
<link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
<link rel="icon" href="favicon.ico" type="image/x-icon">
<link href="/css/style.min.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<style type="text/css">
	.sidebar-calendar{
		position: sticky;
	    top: 300px;
	    right: 100px;
	}
	.sidebar{
		width: 20% !important;			
		padding-left:150px !important;
	}
	@media (max-width: 1850px){
		.sidebar{
			display: none;
		}
	} 
	.side-font-size{
		font-size: 14px;
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
	.playerImg{
		display: flex;
		flex-direction: column;
		text-align: center;
		align-items: center;
	}
	div.name{
		text-align: center;
	}

	body{
		margin-bottom: 50px !important;
	}
	.teamName{
		font-size: 15px;
		font-weight: 600;
	}
	.imgSize{
		width: 130px !important;
		height: 110px !important;
	}

	table tr{
		border-top: 2px solid #a3cca3;
	}
	table tr th{
		font-size: 13px !important;
	}
	table tr td:first-child,td:last-child{
		font-weight: 500 !important;
		text-align: center !important;
		font-family: "Open Sans",sans-serif !important;
		font-size: 14px;
	}
	.match-stat-table .item .percent-bar {
		background: ${gamePreview.gameInfo.homeTeam.teamColor} !important;
	}
	.match-stat-table .item .percent-bar .bar{
		background: ${gamePreview.gameInfo.awayTeam.teamColor} !important;
	}
	
	.image-container {
		position: absolute;
		display: inline-block;
		width: auto;
	}
	.teamTopBar {
		width: auto;
		height: auto;
	}
</style>
<script type="text/javascript">
$(function(){
	 window.addEventListener('load', function() {
  	  	var section1 = document.getElementById('sidebar');
  		var section2 = document.getElementById('gamePre');
  		var section4 = document.getElementById('startingPitcher');
  		
  	  	var section2Height = section2.offsetHeight;
  		var section4Height = section4.offsetHeight;
  	  section1.style.height = section2Height + section4Height + 'px';
  	});
	 
})
</script>
</head>
<body>
<jsp:include page="/common/loading.jsp"/>
<jsp:include page="/common/topBar.jsp"/>

<section class="image-header">
    <div class="image-container">
	  <div class="row">
	  	<div class=" col-md-6">
			<img class="teamTopBar" src="${gamePreview.gameInfo.awayTeam.teamTopBar}">
		</div>
		<div class="col-md-6" style="padding-left: 0px;">
			<img class="teamTopBar" src="${gamePreview.gameInfo.homeTeam.teamTopBar}">
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
           		<li class="left-border-wid" style="${toGame.gameCode eq gamePreview.gameInfo.gameCode ? 'border: 3px solid #f03a3a' : ''};">
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
<section id="gamePre" style="height: 1200px;" class="col-xs-9 col-sm-9 col-md-9">
<div class="container">
	<h3>경기 전력</h3>
<div class="col-md-12 col-sm-12 col-xs-12" style="padding-right: 0px;padding-left: 0px;">
	<div class="tab-content">
	    <div class="tab-pane active" id="all">
	        <div class="amateurs-main-match">
	            <div class="title">${gamePreview.gameInfo.homeTeam.stadiumName}</div>	
	            <a href="/game/getTeam?teamCode=${gamePreview.gameInfo.awayTeam.teamCode}" class="team">
	                <span class="image"><img class="imgSize" src="${gamePreview.gameInfo.awayTeam.teamEmblem}" alt="main-match"></span>
	                <span class="info">
	                    <span class="name teamName">${gamePreview.gameInfo.awayTeam.teamFullName}</span>
	                </span>
	            </a>
	            <div class="score">
	                <span>VS</span>	
	            </div>
	            <a href="/game/getTeam?teamCode=${gamePreview.gameInfo.homeTeam.teamCode}" class="team guest">
	                <span class="info">
	                    <span class="name teamName">${gamePreview.gameInfo.homeTeam.teamFullName}</span>
	                </span>	
	                <span class="image"><img class="imgSize" src="${gamePreview.gameInfo.homeTeam.teamEmblem}" alt="main-match"></span>
	            </a>
	            <div class="title">${gamePreview.gameInfo.gameDate} </div>
	            <div class="title">${gamePreview.gameInfo.gameTime}</div>
	        </div>
	    </div>
	</div>
</div>
	<div>
		<table>
			<tbody>
				<tr>
					<td>
						${gamePreview.gameInfo.awayTeam.teamRanking}위 &nbsp;/&nbsp;
						${gamePreview.gameInfo.awayTeam.winCount}승 
						${gamePreview.gameInfo.awayTeam.tieCount}무 
						${gamePreview.gameInfo.awayTeam.loseCount}패
					</td>
					<th>성적</th>
					<td>	
						${gamePreview.gameInfo.homeTeam.teamRanking}위 &nbsp;/&nbsp;
						${gamePreview.gameInfo.homeTeam.winCount}승 
						${gamePreview.gameInfo.homeTeam.tieCount}무 
						${gamePreview.gameInfo.homeTeam.loseCount}패
					</td>
				</tr>
				<tr>
					<td>${gamePreview.gameInfo.awayTeam.lastFiveGameGrade}</td>
					<th>최근 5경기</th>
					<td>${gamePreview.gameInfo.homeTeam.lastFiveGameGrade}</td>
				</tr>
				<tr>
					<td>${gamePreview.gameInfo.awayTeam.winRate}</td>
					<th>승률</th>
					<td>${gamePreview.gameInfo.homeTeam.winRate}</td>
				</tr>
				<tr>
					<td>${gamePreview.gameInfo.awayTeam.teamBattingAvg}</td>
					<th>타율</th>
					<td>${gamePreview.gameInfo.homeTeam.teamBattingAvg}</td>
				</tr>
				<tr>
					<td>${gamePreview.gameInfo.awayTeam.teamLostScoreAvg}</td>
					<th>평균자책</th>
					<td>${gamePreview.gameInfo.homeTeam.teamLostScoreAvg}</td>
				</tr>
				<tr>
					<td>${gamePreview.gameInfo.awayTeam.headToHeadRecord}</td>
					<th>상대전적</th>
					<td>${gamePreview.gameInfo.homeTeam.headToHeadRecord}</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="col-md-12 col-sm-12 col-xs-12" id="keyPlayer">
    <div class="row">
        <div class="col-md-12">
            <h4 class="player-name">Key Player</h4>
        </div>
        <div class="col-md-3 playerImg">
            <div class="player-photo">
                <img class="img-responsive" src="${gamePreview.awayKeyPlayer.hitterImage}" alt="player">
            </div>
            <div><h4 class="player-name">${gamePreview.awayKeyPlayer.hitterName}</h4></div>
        </div>
	<div class="col-md-6">
        <div class="match-stat-table">
    <div class="item">
        <div class="name">타율</div>
        <div class="percent">${gamePreview.awayKeyPlayer.battingAvg}</div>
        <div class="percent right">${gamePreview.homeKeyPlayer.battingAvg}</div>
        <div class="percent-bar">
            <div class="bar bar-6" style="width: ${gamePreview.awayKeyPlayer.battingAvg/(gamePreview.awayKeyPlayer.battingAvg+gamePreview.homeKeyPlayer.battingAvg)*100}%"></div>
        </div>
    </div>
    <div class="item">
        <div class="name">안타</div>
        <div class="percent">${gamePreview.awayKeyPlayer.hits}</div>
        <div class="percent right">${gamePreview.homeKeyPlayer.hits}</div>
        <div class="percent-bar">
            <div class="bar bar-2" style="width: ${gamePreview.awayKeyPlayer.hits/(gamePreview.awayKeyPlayer.hits+gamePreview.homeKeyPlayer.hits)*100}%"></div>
        </div>
    </div>
    <div class="item">
        <div class="name">홈런</div>
        <div class="percent">${gamePreview.awayKeyPlayer.homeRun}</div>
        <div class="percent right">${gamePreview.homeKeyPlayer.homeRun}</div>
        <div class="percent-bar">
            <div class="bar bar-3" style="width: ${gamePreview.awayKeyPlayer.homeRun/(gamePreview.awayKeyPlayer.homeRun+gamePreview.homeKeyPlayer.homeRun)*100}%"></div>
        </div>
    </div>
    <div class="item">
        <div class="name">타점</div>
        <div class="percent">${gamePreview.awayKeyPlayer.RBI}</div>
        <div class="percent right">${gamePreview.homeKeyPlayer.RBI}</div>
        <div class="percent-bar">
            <div class="bar bar-4" style="width: ${gamePreview.awayKeyPlayer.RBI/(gamePreview.homeKeyPlayer.RBI+gamePreview.awayKeyPlayer.RBI)*100}%"></div>
        </div>
    </div>
	</div>
</div> 
<div class="col-md-3 playerImg">
            <div class="player-photo">
                <img class="img-responsive" src="${gamePreview.homeKeyPlayer.hitterImage}" alt="player">
            </div>
            <div><h4 class="player-name">${gamePreview.homeKeyPlayer.hitterName}</h4></div>
</div>
    </div>
</div>
</div>
</section>

<section id="startingPitcher" class="col-xs-9 col-sm-9 col-md-9">
<c:if test="${gamePreview.homeStartingPitcher != null}">
<div class="container">
<div class="row">
	<div class="col-md-12">
    	<h4 class="player-name">Starting Pitcher</h4>
    </div>
	<div class="col-md-3 playerImg">
		<div><img alt="img" class="img-responsive" src="${gamePreview.awayStartingPitcher.pitcherImage}"></div>
		<div><h4 class="player-name">${gamePreview.awayStartingPitcher.pitcherName}</h4></div>
	</div>
    <div class="col-md-6">
    	<div class="match-stat-table">
    		<div class="item">
		        <div class="name">승패</div>
		        <div class="percent">${gamePreview.awayStartingPitcher.win}</div>
		        <div class="percent right">${gamePreview.homeStartingPitcher.win}</div>
		        <div class="percent-bar">
		        	<div class="bar bar-2" style="width: 50%"></div>
		        </div>
		    </div>
		   <div class="item">
		        <div class="name">이닝</div>
		        <div class="percent">${gamePreview.awayStartingPitcher.innings}</div>
		        <div class="percent right">${gamePreview.homeStartingPitcher.innings}</div>
		        <c:set var="inn01" value="${fn:split(gamePreview.awayStartingPitcher.innings,' ')[0]}"/>
		        <c:set var="inn02" value="${fn:split(gamePreview.homeStartingPitcher.innings,' ')[0]}"/>
		        <div class="percent-bar">
		            <div class="bar bar-2" style="width: ${fn:substring(inn01,0,fn:length(inn01))/(fn:substring(inn02,0,fn:length(inn01))+fn:substring(inn01,0,fn:length(inn01)))*100}%"></div>
		        </div>
		    </div>
		    <div class="item">
		        <div class="name">평균자책</div>
		        <div class="percent">${gamePreview.awayStartingPitcher.myLostScore}</div>
		        <div class="percent right">${gamePreview.homeStartingPitcher.myLostScore}</div>
		        <div class="percent-bar">
		            <div class="bar bar-2" style="width: ${gamePreview.awayStartingPitcher.myLostScore/(gamePreview.homeStartingPitcher.myLostScore+gamePreview.awayStartingPitcher.myLostScore)*100}%"></div>
		        </div>
		    </div>
    	</div>
    </div>
    <div class="col-md-3 playerImg">
    	<div><img alt="img" class="img-responsive" src="${gamePreview.homeStartingPitcher.pitcherImage}"></div>
    	<div><h4 class="player-name">${gamePreview.homeStartingPitcher.pitcherName}</h4></div>
    </div>
    </div>
</div>
</c:if>
</section>
</div>

</body>
<jsp:include page="/common/quickMenu.jsp"/>
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