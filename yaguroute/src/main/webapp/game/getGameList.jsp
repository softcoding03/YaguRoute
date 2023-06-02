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
    	.activeCal a{
    		transition: background-color 0.5s ease ;
    	}
    
    	.activeCal a:hover{
    		background-color: coral !important;
    	}
    
		.sidebar-calendar{
			position: sticky;
		    top: 100px;
		    right: 300px;
		}
		.background {
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  margin-top: 100px;
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
    </style>
</head>
<body>
<jsp:include page="/common/changePageEvent.jsp"/>
<jsp:include page="/common/topBar.jsp"/>


<c:set var="tmpSchedule" value="1111"/>
<form id="searchGameList">
<input type="hidden" name="year" value="">
<input type="hidden" name="month" value="">
<input type="hidden" name="teamCode" value="">

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
<c:set var="bool" value="0"/>
<c:set var="gameIndex" value="0"/>
<c:set var="tmpIndex" value="0"/>
<c:set var="teamCodeIndex" value="1"/>
<c:if test="${teamCode eq 'NN'}">
	<c:set var="teamCodeIndex" value="5"/>
</c:if>
      <div class="container">
            <div class="row row-offcanvas row-offcanvas-left">
<section class="sidebar col-xs-6 col-sm-6 col-md-3 sidebar-offcanvas" id="sidebar">
	<div class="sidebar-calendar">
	
                        <h6>Games Calendar</h6>
                        <div class="widget widget_calendar">
                        	<div class="item" style="margin-top:20px;justify-content: center;display: flex">
								<label style="margin-right: 20px;">
								<select class="year" id="yearSelect">
								<c:forEach begin="2009" end="2023" var="year" >
									<option value="${year}" ${year eq nowYear ? 'selected' : ''}>${year}</option>
								</c:forEach>
									
								</select>
								</label>
								<label>
								<select class="month" id="monthSelect">
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
                                            <th scope="col" title="Monday">M</th>
                                            <th scope="col" title="Tuesday">T</th>
                                            <th scope="col" title="Wednesday">W</th>
                                            <th scope="col" title="Thursday">T</th>
                                            <th scope="col" title="Friday">F</th>
                                            <th scope="col" title="Saturday">S</th>
                                            <th scope="col" title="Sunday">S</th>
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
                                           				<td class="activeCal"><a href="#${currentDateList[dateTmp]}">${dateTmp+1}</a></td>
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
                    </div>
</section>            
   
<section class="news-single col-xs-12 col-sm-12 col-md-9" id="main">
<div class="col-md-12 col-sm-12 col-xs-12"><h6>matches</h6></div>
	<div class="col-md-12 col-sm-12 col-xs-12">
	
	<c:set var="tmpDate" value="1111"/>
	
 	<c:forEach var="game" items="${gameList}" varStatus="gameState" >
 	<div class="main-lates-matches">
 		<a class="item" aria-disabled="true">
 		
 		<c:if test="${game.gameDate ne tmpDate}">
 			<c:if test="${gameState.index ne 0}">
 				<hr style="border-top: 2px solid #a3cca3;">
 			</c:if>
 			
 			<div id="${game.gameDate}" class="col-md-12 col-sm-12 col-xs-12"><h6>${game.gameDate}</h6></div>
 			<c:set var="tmpDate" value="${game.gameDate}"/>
 		</c:if>
 				 <span class="game-result">${game.homeTeam.hometown}</span>
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
			</a>
		</div>
	</c:forEach>
		
			
	
			
	</div>
</section>
		</div>
	</div>
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
		
		function fncGetGameList(){
	    	$("input[name='year']").val($("select.year").val());
	    	$("input[name='month']").val($("select.month").val());
	    	$("input[name='teamCode']").val($("ul.nav li.active input").val());
	    	$("#searchGameList").attr("method","GET").attr("action","/game/getGameList").submit();
	    }
	    
		    $("a[href='teamCodeHref']").on('click',function(){
		    	setTimeout(() => fncGetGameList(), 100);
		    })
		    $("#yearSelect").change(function(){
		    	setTimeout(() => fncGetGameList(), 100);
		    })
		     $("#monthSelect").on('change',function(){
		    	setTimeout(() => fncGetGameList(), 100);
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
</body>

</html>