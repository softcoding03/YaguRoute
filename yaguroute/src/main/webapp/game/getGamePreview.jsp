<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>s
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
<link rel="icon" href="favicon.ico" type="image/x-icon">
<link href="/css/style.min.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<body>
<div class="container">
	<div class="row">
<div class="col-md-12 col-sm-12 col-xs-12">
	<div class="tab-content">
	    <div class="tab-pane active" id="all">
	        <div class="amateurs-main-match">
	            <div class="title">${gamePreview.gameInfo.homeTeam.stadiumName}</div>	
	            <a href="/game/getTeam?teamCode=${gameRecord.gameInfo.awayTeam.teamCode}" class="team">
	                <span class="image"><img src="${gamePreview.gameInfo.awayTeam.teamEmblem}" alt="main-match"></span>
	                <span class="info">
	                    <span class="name">${gamePreview.gameInfo.awayTeam.teamFullName}</span>
	                </span>
	            </a>
	            <div class="score">
	                <span>VS</span>	
	            </div>
	            <a href="/game/getTeam?teamCode=${gameRecord.gameInfo.homeTeam.teamCode}" class="team guest">
	                <span class="info">
	                    <span class="name">${gamePreview.gameInfo.homeTeam.teamFullName}</span>
	                </span>	
	                <span class="image"><img src="${gamePreview.gameInfo.homeTeam.teamEmblem}" alt="main-match"></span>
	            </a>
	            <div class="title">${gamePreview.gameInfo.gameDate} / ${gamePreview.gameInfo.gameTime}</div>
	        </div>
	    </div>
	</div>
</div>
<div>
		<span>
			<div><h5 class="player-name">${gamePreview.gameInfo.awayTeam.teamNickName}</h5></div>
			<div>
				<span>
					${gamePreview.gameInfo.awayTeam.teamRanking}위 .
				</span>
				<span>
					<span>${gamePreview.gameInfo.awayTeam.winCount}승 </span>
					<span>${gamePreview.gameInfo.awayTeam.tieCount}무 </span>
					<span>${gamePreview.gameInfo.awayTeam.loseCount}패</span>
				</span>
			</div>
		</span>
		<span>VS</span>
		<span>
			<div><h5 class="player-name">${gamePreview.gameInfo.homeTeam.teamNickName}</h5></div>
			<div>
				<span>
					${gamePreview.gameInfo.homeTeam.teamRanking}위 .
				</span>
				<span>
					<span>${gamePreview.gameInfo.homeTeam.winCount}승 </span>
					<span>${gamePreview.gameInfo.homeTeam.tieCount}무 </span>
					<span>${gamePreview.gameInfo.homeTeam.loseCount}패 </span>
				</span>
			</div>
		</span>
	</div>
	<div>
		<table>
			<tbody>
				<tr>
					<td>${gamePreview.gameInfo.awayTeam.lastFiveGameGrade}</td>
					<th>최근경기</th>
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
</div>
</div>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h4 class="player-name">Key Player</h4>
        </div>
        <div class="col-md-2">
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
            <div class="bar bar-6" ></div>
        </div>
    </div>
    <div class="item">
        <div class="name">안타</div>
        <div class="percent">${gamePreview.awayKeyPlayer.hits}</div>
        <div class="percent right">${gamePreview.homeKeyPlayer.hits}</div>
        <div class="percent-bar">
            <div class="bar bar-2" ></div>
        </div>
    </div>
    <div class="item">
        <div class="name">홈런</div>
        <div class="percent">${gamePreview.awayKeyPlayer.homeRun}</div>
        <div class="percent right">${gamePreview.homeKeyPlayer.homeRun}</div>
        <div class="percent-bar">
            <div class="bar bar-3" ></div>
        </div>
    </div>
    <div class="item">
        <div class="name">타점</div>
        <div class="percent">${gamePreview.awayKeyPlayer.RBI}</div>
        <div class="percent right">${gamePreview.homeKeyPlayer.RBI}</div>
        <div class="percent-bar">
            <div class="bar bar-4" ></div>
        </div>
    </div>
	</div>
</div> 
<div class="col-md-2">
            <div class="player-photo">
                <img class="img-responsive" src="${gamePreview.homeKeyPlayer.hitterImage}" alt="player">
            </div>
            <div><h4 class="player-name">${gamePreview.homeKeyPlayer.hitterName}</h4></div>
</div>
    </div>
</div>
<c:if test="${gamePreview.homeStartingPitcher != null}">
<div class="container">
<div class="row">
	<div class="col-md-12">
    	<h4 class="player-name">Starting Pitcher</h4>
    </div>
	<div class="col-md-12">
	<div class="col-md-2">
		<div><img alt="img" src="${gamePreview.awayStartingPitcher.pitcherImage}" width="100" height="150"></div>
		<div>${gamePreview.awayStartingPitcher.pitcherName}</div>
	</div>
    <div class="col-md-8">
    	<table>
    		<tr>
    			<td>
    				<div>
    					${gamePreview.awayStartingPitcher.win}<br>
    				</div>
    			</td>
    			<th> 승패 </th>
    			<td>
    				<div>
    					${gamePreview.homeStartingPitcher.win}
    				</div>
    			</td>
    		</tr>
    		<tr>
    			<td>
    				<div>
    					${gamePreview.awayStartingPitcher.innings}
    				</div>
    			</td>
    			<th> 이닝 </th>
    			<td>
    				<div>
    					${gamePreview.homeStartingPitcher.innings}
    				</div>
    			</td>
    		</tr>
    		<tr>
    			<td>
    				<div>
    					${gamePreview.awayStartingPitcher.myLostScore}
    				</div>
    			</td>
    			<th> 평균자책 </th>
    			<td>
    				<div>
    					${gamePreview.homeStartingPitcher.myLostScore}
    				</div>
    			</td>
    		</tr>
    	</table>
    </div>
    <div class="col-md-2">
    	<div><img alt="img" src="${gamePreview.homeStartingPitcher.pitcherImage}" width="100" height="150"></div>
    	<div>${gamePreview.homeStartingPitcher.pitcherName}</div>
    </div>
    </div>
    </div>
</div>
</c:if>




</body>
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