<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="viewport" content="width=device-width,initial-scale=1">
	<title>getGameList</title>
	<link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

    <style type="text/css">
    	body{
    		margin-bottom: 300px
    	}
    	
    	.activeCal a{
    		transition: background-color 0.5s ease ;
    	}
    
    	.activeCal a:hover{
    		background-color: coral !important;
    	}
    
		.sidebar-calendar{
			position: sticky;
		    top: 400px;
		    right: 300px;
		}
		.background {
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  margin-top: 50px;
		  margin-bottom: 50px;
		}
		.score {
		  text-align: center;
		}
		.atag {
		  display: inline-block;
		  padding: 10px 20px;
		  background-color: #b5d692 !important;
		  color: white;
		  border-radius: 5px;
		  text-decoration: none;
		  transition: background-color 0.5s ease;
		}
		.atag:hover {
		  background-color: darkgreen !important;
		}
		.cancel{
			background-color: #db5e5e !important;
		}
		.pre{
			background-color: #b5d692 !important;
			transition: background-color 0.5s ease;
		}
		.pre:hover {
		  background-color: darkgreen !important;
		}
		.stream{
			background-color: #f03a3a !important;
			transition: background-color 0.5s ease;
		}
		.addShadow{
			 box-shadow: 5px 5px 5px 3px gray;
			 
		}
		.padding{
			padding: 0px 25px 5px 25px;
		}
		
		.imgSize{
			width: 80px !important;
			height: 60px !important;
		}
		.check{
			border: 2.5px solid #f03a3a;
		}
		
		#scrollBtn {
	      position: fixed;
	      bottom: 50px;
	      right: 50px;
	      width: 50px;
	      height: 50px;
	      border-radius: 50%;
	      background-color: darkgreen;
	      color: #fff;
	      text-align: center;
	      line-height: 50px;
	      font-size: 20px;
	      cursor: pointer;
	    }
	    .teamName{
	    	font-size: 18px !important;
	    	font-weight: 700;
	    }
	    .oneGameCss{
	    	font-size: 12px;
	    }
	    
    </style>
</head>
<body>
<jsp:include page="/common/topBar.jsp"/>
<section class="image-header">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="info">
                    <div class="wrap">
                        <h1>경기 일정</h1>
                    </div>
                </div>
            </div>	
        </div>
    </div>
</section>


<c:set var="tmpSchedule" value="1111"/>
<form id="searchGameList">
<input type="hidden" name="year" value="">
<input type="hidden" name="month" value="">
<input type="hidden" name="teamCode" value="">

<div class="mathc-live-broadcasts background">
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
<c:set var="bool" value="0"/>
<c:set var="gameIndex" value="0"/>
<c:set var="tmpIndex" value="0"/>
<c:set var="teamCodeIndex" value="1"/>
<c:if test="${teamCode eq 'ALL'}">
	<c:set var="teamCodeIndex" value="5"/>
</c:if>
      <div class="container">
            <div class="row row-offcanvas row-offcanvas-left">
<section class="sidebar col-xs-6 col-sm-6 col-md-3 sidebar-offcanvas" id="sidebar">
		<div class="sidebar-calendar addShadow">
			<div class="padding">
                        <h6>Games Calendar</h6>
                        <div class="widget widget_calendar">
                        	<div class="item" style="margin-top:20px;justify-content: center;display: flex">
								<label style="margin-right: 20px;">
								<span class="background" style="margin-top: 20px !important;">연도</span>
								<select class="year basic" id="yearSelect">
								<c:forEach begin="2009" end="2023" var="year" >
									<option value="${year}" ${year eq nowYear ? 'selected' : ''}>${year}</option>
								</c:forEach>
									
								</select>
								</label>
								<label>
								<span class="background" style="margin-top: 20px !important;">월</span>
								<select class="month basic" id="monthSelect">
								<c:forEach begin="1" end="12" var="month" >
									<option value="${month}" ${month eq nowMonth ? 'selected' : ''} >${month}</option>
								</c:forEach>
									
								</select>
								</label>
							</div>
                            <div id="calendar_wrap" class="calendar_wrap">
                                <table id="wp-calendar">
                                    <caption>${nowYear}-${nowMonth}</caption>
                                    <thead>
                                        <tr>
                                            <th scope="col" title="Monday">월</th>
                                            <th scope="col" title="Tuesday">화</th>
                                            <th scope="col" title="Wednesday">수</th>
                                            <th scope="col" title="Thursday">목</th>
                                            <th scope="col" title="Friday">금</th>
                                            <th scope="col" title="Saturday">토</th>
                                            <th scope="col" title="Sunday">일</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                    	<tr>
                                           <c:forEach var="startEmptyTmp" begin="1" end="${dayOfWeekList[0]-1}">
                                           		<td></td>
                                           </c:forEach>
                                           <c:forEach var="dateTmp" begin="0" end="${daysInMonth-1}" varStatus="tmpDateIndex">
                                           		<c:set var="bool" value="0"/>
                                           		<c:if test="${gameList[gameIndex].gameDate ne currentDateList[dateTmp]}">
                                           			<td>${dateTmp+1}</td>
                                           		</c:if>
                                           		
                                           		<c:if test="${gameList[gameIndex].gameDate eq currentDateList[dateTmp]}">
                                           			<c:forEach var="hello" begin="0" end="${teamCodeIndex-1}">
                                           				<c:if test="${gameList[gameIndex+hello].gameStatusCode eq 3}">
                                           					<c:set var="bool" value="${bool+1}"/>
                                           				</c:if>
                                           			</c:forEach>
                                           			<c:if test="${bool eq teamCodeIndex}">
                                           				<td>${dateTmp+1}</td>
                                           			</c:if>
                                           			<c:if test="${bool ne teamCodeIndex}">
                                           				<td class="activeCal" style="${gameList[gameIndex].gameDate eq todayDate ? 'border: 2.5px solid #f03a3a' : ''};"><a href="#${currentDateList[dateTmp]}">${dateTmp+1}</a></td>
                                           			</c:if>
                                           			<c:set var="gameIndex" value="${gameIndex+teamCodeIndex}"/>
                                           		</c:if>
                                           		
                                           		<c:if test="${dayOfWeekList[dateTmp] eq 7}">
                                           			</tr><tr>
                                           		</c:if>
                                           		<c:if test="${tmpDateIndex.last}">
                                           			<c:set var="tmpIndex" value="${dateTmp}"/>
                                           		</c:if>
                                           		
                                           </c:forEach>
                                           
                                           <c:forEach begin="1" end="${7-dayOfWeekList[tmpIndex]}">
                                           		<td></td>
                                           </c:forEach>
                                    	</tr>
                                	</tbody>
                                </table>
                            </div>
                        </div>
                        <div> <button id="scrollBtn" onclick="scrollToTop()">↑</button></div>
                    </div>
	</div>
</section>            
   
<section class="news-single col-xs-12 col-sm-12 col-md-9" id="main">
<div class="col-md-12 col-sm-12 col-xs-12"><h6>matches</h6></div>
<c:if test="${gameSize eq 0}">
	<div class="col-md-12 col-sm-12 col-xs-12">
		<h3>조회된 경기가 없습니다.</h3>
	</div>
</c:if>
<c:if test="${gameSize ne 0}">
	<div class="col-md-12 col-sm-12 col-xs-12">
	<c:set var="tmpDate" value="1111"/>
	<div>
 	<c:forEach var="game" items="${gameList}" varStatus="gameState" >
 	<c:if test="${game.gameDate ne tmpDate}">
 		<c:if test="${gameState.index ne 0}">
 			</div>
 			<br>
 			<div class="${game.gameDate eq todayDate ? 'check' : ''}">
 		</c:if>
 	</c:if>
 	<div class="main-lates-matches">
 		<a class="item" aria-disabled="true">
 		<c:if test="${game.gameDate ne tmpDate}">
 			<div id="${game.gameDate}" class="col-md-12 col-sm-12 col-xs-12"  style="text-align: center;"><h4>${game.gameDate}<c:if test="${game.gameDate eq todayDate}">&nbsp;&nbsp;(today)</c:if></h4></div>
 			<c:set var="tmpDate" value="${game.gameDate}"/>
 		</c:if>
 		<hr style="border-top: 1px solid #a3cca3;margin-top: 0px;margin-bottom: 10px;">
 		<div class="oneGameCss">
 				 <span class="game-result" style="font-size: 12px;">${game.homeTeam.hometown}</span>
		        <span class="championship" style="font-size: 14px;">${game.gameTime}</span>
		        <span class="teams-wrap">
		                <span class="team">
		                    <span>
		                        <img class="imgSize" src="${game.awayTeam.teamEmblem}" alt="team-image">
		                    </span>
		                    <span class="teamName">${game.awayTeam.teamNickName}</span>
		                </span>
		                <span class="score">
		                    <span>${game.gameScore}</span>
		                </span>
		                <span class="team1">
		                    <span class="teamName">${game.homeTeam.teamNickName}</span>
		                    <span><img class="imgSize" src="${game.homeTeam.teamEmblem}" alt="team-image"></span>
		                </span>
		        </span>
		        
		        <span class="teams-wrap">
		        	<span class="team"><span></span><span></span></span>
			       	<span class="score">
			       		<input type="hidden" value="${game.gameCode}" id="gameCode">
	 					<c:if test="${game.gameStatusCode eq 0}">
							<%-- <a class="team" href="/game/getGamePreview?gameCode=${game.gameCode}">전력 분석</a>--%><span class="pre">전력 분석</span>
						</c:if>
						<c:if test="${game.gameStatusCode eq 1}">
							<%-- <a class="team" href="#">실시간 중계</a>--%><span class="stream">LIVE</span>
						</c:if>
						<c:if test="${game.gameStatusCode eq 2}">
							<%-- <a class="team" href="/game/getGameRecord?gameCode=${game.gameCode}">경기 기록</a>--%><span class="atag">경기 기록</span>
						</c:if>
						<c:if test="${game.gameStatusCode eq 3}">
							<span class="cancel">경기 취소</span>
						</c:if>
			        </span>
			   	</span>
			   	</div>
			</a>
		</div>
	</c:forEach>
		
			
	
		</div>	
	</div>
</c:if>
</section>
		</div>
	</div>
	</body>
<script type="text/javascript">
	$(function(){
		
		$(".score span.pre").on("click",function(){
			self.location = "/game/getGamePreview?gameCode="+$(this).parent().find("#gameCode").val();
		})
		
		$(".score span.stream").on("click",function(){
			self.location = "/channel/getStreaming?gameCode="+$(this).parent().find("#gameCode").val();
		})
		
		$(".score span.atag").on("click",function(){
			self.location = "/game/getGameRecord?gameCode="+$(this).parent().find("#gameCode").val();
		})
		    
		    window.addEventListener('load', function() {
		    	  var section1 = document.getElementById('sidebar');
		    	  var section2 = document.getElementById('main');
		    	  var section2Height = section2.offsetHeight;
		    	  section1.style.height = section2Height + 'px';
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
<script type="text/javascript">
	$(function(){
		
		function fncGetGameList(){
	    	$("input[name='year']").val($("select.year").val());
	    	$("input[name='month']").val($("select.month").val());
	    	$("input[name='teamCode']").val($("ul.nav li.active input").val());
	    	$("#searchGameList").attr("method","GET").attr("action","/game/getGameList").submit();
	    }
	    
		$("a[href='teamCodeHref']").on('click',function(){
		  	setTimeout(() => fncGetGameList(), 100);
		}) 
		    
		$("ul.options li").on("click",function(){
		   	setTimeout(() => fncGetGameList(), 100);
		})
		
		$("#scrollBtn").on("click",function(){
			document.documentElement.scrollTop = 0;
		})
		
	})
</script>

</html>