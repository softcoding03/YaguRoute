<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>getGameList</title>
	<link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script type="text/javascript">
    function fncGetGameList(){
    	$("input[name='year']").val($("select.year").val());
    	$("input[name='month']").val($("select.month").val());
    	$("input[name='teamCode']").val($("ul.nav li.active input").val());
    	$("#searchGameList").attr("method","GET").attr("action","/game/getGameList").submit();
    }
    
    $(function(){
	    $("a[href='teamCodeHref']").on('click',function(){
	    	setTimeout(() => fncGetGameList(), 100);
	    })
	    $("#yearSelect").change(function(){
	    	setTimeout(() => fncGetGameList(), 100);
	    })
	     $("#monthSelect").on('change',function(){
	    	setTimeout(() => fncGetGameList(), 100);
	    })
    })
    </script>
    <style type="text/css">
    	aside {
		    position: sticky;
		    top: 100px;
		    right: 300px;
		}
    </style>
</head>
<body>
<aside>
        <ul>
        <c:forEach var="gameTmp" items="${gameList}" varStatus="gameState" >
        	<c:if test="${gameTmp.gameDate ne tmpSchedule}">
	 			<li><a href="#${gameTmp.gameDate}">${fn:split(gameTmp.gameDate,'-')[2]}일</a></li>
	 			<c:set var="tmpSchedule" value="${gameTmp.gameDate}"/>
	 		</c:if>
        	
        </c:forEach>
        </ul>
</aside>
<c:set var="tmpSchedule" value="1111"/>
<form id="searchGameList">
<input type="hidden" name="year" value="">
<input type="hidden" name="month" value="">
<input type="hidden" name="teamCode" value="">
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="item">
				<label>
				<select class="year" id="yearSelect">
				<c:forEach begin="2008" end="2023" var="year" >
					<option value="${year}" ${year eq nowYear ? 'selected' : ''}>${year}</option>
				</c:forEach>
					
				</select>
				</label>
			</div>
			
			<div class="item">
				<label>
				<select class="month" id="monthSelect">
				<c:forEach begin="1" end="12" var="month" >
					<option value="${month}" ${month eq nowMonth ? 'selected' : ''} >${month}</option>
				</c:forEach>
					
				</select>
				</label>
			</div>
		</div>
	</div>
</div>
<div class="background">
	<div class="broadcast-tabs-wrapper">
            <ul class="nav nav-tabs" role="tablist">
            <c:forEach var="team" items="${allTeam}">
	                <li class="${team.teamCode eq teamCode ?'active':''}" role="presentation">
	                <a href="teamCodeHref" role="tab" data-toggle="tab">
		                <img alt="img" src="${team.teamEmblem}">
		                <span class="info">
		                	<span class="title">${team.teamNickName}</span>
		                	<input type="hidden" value="${team.teamCode}"/>
		                </span> 
	                </a>
	                </li>
            </c:forEach>
            </ul>
        </div>
</div>
</form>

<section class="main-match-shedule amateurs-match-shedule">
        <div class="container">
            <div class="row">
<div class="col-md-12 col-sm-12 col-xs-12"><h6>matches</h6></div>
	<div class="col-md-12 col-sm-12 col-xs-12">
	
	<c:set var="tmpDate" value="1111"/>
		
 	<c:forEach var="game" items="${gameList}" varStatus="gameState" >
 	<div class="main-lates-matches">
 		<a href="#" class="item" aria-disabled="true">
 		
 		<c:if test="${game.gameDate ne tmpDate}">
 			<div id="${game.gameDate}" class="col-md-12 col-sm-12 col-xs-12"><h6>${game.gameDate}</h6></div>
 			<c:set var="tmpDate" value="${game.gameDate}"/>
 		</c:if>
		        <span class="championship">${game.gameTime}</span>
		        <span class="teams-wrap">
		                <span class="team">
		                    <span>
		                        <img src="${game.awayTeam.teamEmblem}" alt="team-image">
		                    </span>
		                    <span>${game.awayTeam.teamNickName}</span>
		                </span>
		                <span class="score">
		                    <span>${game.gameScore}</span>
		                </span>
		                <span class="team1">
		                    <span>${game.homeTeam.teamNickName}</span>
		                    <span><img src="${game.homeTeam.teamEmblem}" alt="team-image"></span>
		                </span>
		        </span>
		        <span class="game-result">${game.homeTeam.hometown}</span>
		        <span class="score">
		             <c:if test="${game.gameStatusCode eq 0}">
						<a class="btn small" href="/game/getGamePreview?gameCode=${game.gameCode}">전력 분석</a>
					</c:if>
					<c:if test="${game.gameStatusCode eq 1}">
						<a class="btn small" href="#">실시간 중계</a>
					</c:if>
					<c:if test="${game.gameStatusCode eq 2}">
						<a class="btn small" href="/game/getGameRecord?gameCode=${game.gameCode}">경기 기록</a>
					</c:if>
					<c:if test="${game.gameStatusCode eq 3}">
						<a class="btn small" href="#">경기 취소</a>
					</c:if>
		        </span>
		        
		        
			</a>
		</div>
		<div></div>
	</c:forEach>
		
	
			
			</div>
		</div>
	</div>
</section>

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