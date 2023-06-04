<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	 <meta charset="UTF-8">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script type="text/javascript">
    
	$(function() {
		$(".teamButton:nth-child(n+1)").on("click" , function() {
			var teamCode = $(this).val().trim();
			self.location = "/ticket/getGameList2w?teamCode="+teamCode;
		});
		$(".marker.salesDetail").on("click" , function() {
			var gameCode = $(this).siblings("input[name='gameCode']").val();
			alert(gameCode);
			self.location = "/ticket/getSalesDetail?gameCode="gameCode;
		});
	});
		
    </script>
</head>

<body>

<div class="preloader-wrapper" id="preloader">
<div class="motion-line dark-big"></div>
<div class="motion-line yellow-big"></div>
<div class="motion-line dark-small"></div>
<div class="motion-line yellow-normal"></div>
<div class="motion-line yellow-small1"></div>
<div class="motion-line yellow-small2"></div>
</div>


    <!--BREADCRUMBS BEGIN-->
<section class="image-header">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="info">
                    <div class="wrap">
                        <ul class="breadcrumbs">
                            <li><a href="index.html">Main</a>/</li>
                            <li>Category</li>
                        </ul>
                        <h1>Game Tickets</h1>
                    </div>
                </div>
            </div>	
        </div>
    </div>
</section>
<!--BREADCRUMBS END-->
<table>
   <tr>
   <td>
    <button type="button" class="btn btn-warning teamButton" value="HH">한화</button>
    <button type="button" class="btn btn-warning teamButton" value="HT">KIA</button>
    <button type="button" class="btn btn-warning teamButton" value="KT">KT</button>
    <button type="button" class="btn btn-warning teamButton" value="LG">LG</button>
    <button type="button" class="btn btn-warning teamButton" value="LT">롯데</button>
    <button type="button" class="btn btn-warning teamButton" value="NC">NC</button>
    <button type="button" class="btn btn-warning teamButton" value="OB">두산</button>
    <button type="button" class="btn btn-warning teamButton" value="SK">SSG</button>
    <button type="button" class="btn btn-warning teamButton" value="SS">삼성</button>
    <button type="button" class="btn btn-warning teamButton" value="WO">키움</button>
   </td>
</table>

<div class="broadcast-wrap">
   <div class="container">
      <div class="row">
         <div class="col-md-12">
             <h4>Upcoming matches</h4>
             <p>Pabst irony tattooed, synth sriracha selvage pok pok. Wayfarers kinfolk sartorial, helvetica you probably haven't heard of them tumeric venmo deep v mixtape semiotics brunch.</p>                
         </div>
         <div class="col-md-12">
         <!-- List 시작 -->
         <c:set var="size" value="${gameList.size()}"/>
			<c:forEach var="i" begin="0" end="${size -1}" step="1">
         <div class="broadcast-list" id="accordion" role="tablist" aria-multiselectable="true">
			    <div class="broadcast-item">
			        <div class="item-header" id="headingOne">
			            <div class="row">
			            	 <div class="col-md-1 col-sm-2">
		                    	  <a data-toggle="collapse" data-parent="#accordion" href="#${gameList[i].gameCode}" class="arrow"><i class="fa fa-caret-down" aria-hidden="true"></i></a>
		                	 </div>
			                <div class="col-md-7 col-sm-10">
			                    <div class="item-head-body">
			                        <a><img src="${gameList[i].homeTeam.teamEmblem}" width="40" height="40" alt="team-logo1"></a>
			                        <span class="vs">vs</span>
			                        <a><img src="${gameList[i].awayTeam.teamEmblem}" width="40" height="40" alt="team-logo1"></a>
			                        <span class="info">
			                            <span class="what">KBO 정규시즌</span>
			                            <span class="then">${gameList[i].gameDate} / ${gameList[i].gameTime}</span>
			                        </span>
			                        <span class="marker">live</span>
			                    </div>
			                </div>
			                <div class="col-md-4 col-sm-12">
			                    <div class="channel">
			                        <span class="info">
				                        <span class="then">티켓판매수: ${gameList[i].salesTicket}</span>
			                        </span>
			                    </div>
			                    <input type="hidden" name="gameCode" value="${gameList[i].gameCode}">
			                    <button class="marker salesDetail">상세보기</button>
			                </div>
			            </div>	
			        </div>
			        
			        <div id="${gameList[i].gameCode}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
			            <div class="img-wrap"><img src="images/baseball/broad-img.jpg" alt="broad-img"></div>
			            <div class="item-body">
			                <div class="row">
			                    <div class="col-md-5">
			                        <div class="title">Match details</div>
			                        <p>Selvage mixtape coloring book, street art swag sriracha activated charcoal vegan hammock selfies distillery wayfarers dreamcatcher lyft beard. </p>
			                        <div class="title">Match Time</div>
			                        <p>7:30 PM, Saturday<br>29 Sep 2016</p>
			                        <div class="title">Stadium</div>
			                        <p>Fulham Rd, Fulham, London SW6 1HS, <br>Stamford Bridge</p>
			                        <div class="title">weather forecast</div>
			                        <div class="live-match-weather">
			                            <div class="icon"><img src="images/common/wether-sun.png" alt="wether-sun"></div>	
			                            <div class="info">
			                                <div class="degree">7 °C</div>
			                                <div class="text">Partly cloudy night</div>
			                            </div>
			                        </div>
			                        <a href="upcoming-match.html" class="btn">View match page</a>
			                    </div>
			                    <div class="col-md-7">
			                        <div class="title">구매자 정보</div>
			                        <div class="lineup-list">
			                        	<c:set var="gameCode" value="${gameList[i].gameCode}" />
			                            <c:forEach var="transaction" items="${map[gameCode]}">
			                            <div class="item">
			                                <div class="left">
			                                    <div class="number"><span>구매자</span></div>
			                                    <div class="name">${transaction.buyer.userId}</div>
			                                </div>
			                                <div class="right">
			                                    <div class="name">구매 가격</div>
			                                    <div class="number"><span>${transaction.tranTotalPrice}</span></div>
			                                </div>
			                                <div class="right">
			                                    <div class="name">구매 수량</div>
			                                    <div class="number"><span>${transaction.ticketCount} 장</span></div>
			                                </div>
			                            </div>
			                            </c:forEach>
			                        </div>
			                    </div>
			                </div>
			            </div>
			        </div>
			        
			    </div>
			</div>
			</c:forEach><!-- List 끝 -->
        </div>
     </div>
  </div>
</div>


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
