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
    
<style type="text/css">
    	.background {
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  margin-top: 50px;
		}    
		
		/* 팀탑바 위한 style */
		.teamTopBar {
		  width: 100%;
		  height: auto;
		}
		.image-container {
		  position: relative;
		  display: inline-block;
		  width: 100%;
		}
		h1{
		color: white;
		}
		.text-overlay {
		  position: absolute;
		  top: 50%;
		  left: 50%;
		  transform: translate(-50%, -50%);
		  
		  font-size: 18px;
		  margin-left:300px;
		}
		/* 팀탑바 위한 style 끝*/
</style>
<script type="text/javascript">
    
	$(function() {
		$("a[href='teamCodeHref']").on('click',function(){
    		teamCode = $(this).find("input[name='foreachTeamCode']").val()
    		self.location = "/ticket/getGameList2w?teamCode="+teamCode;
	   });
		$(".getStadium").on("click" , function() {
			var gameCode = $(this).closest(".channel").find("input[name='gameCode']").val();
			var url = "/ticket/getStadium?gameCode="+gameCode;
			var width = 1200;  // 창의 너비
			var height = 700;  // 창의 높이
			var left = (window.screen.width - width) / 2;  // 창의 가로 위치
			var top = (window.screen.height - height) / 2;  // 창의 세로 위치
			var options = 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top;
			window.open(url,"경기 티켓 예매",options);			
		});
	});
		
</script>
</head>

<body>

<jsp:include page="/common/topBar.jsp"/>
<div class="image-container">
  <img class="teamTopBar" src="${team.teamTopBar}">
  <div class="text-overlay"><h1>티켓 구매</h1></div>
</div>
<!-- 팀 구분 툴바 -->
<div class="mathc-live-broadcasts background">
	<div class="broadcast-tabs-wrapper">
       <ul class="nav nav-tabs" role="tablist">
       <c:forEach var="team" items="${allTeam}">
            <li class="${team.teamCode eq teamCode ?'active':''}" role="presentation">
            <a href="teamCodeHref" role="tab" data-toggle="tab">
             <img alt="img" src="${team.teamEmblem}">
             <span class="info">
             	<span class="title">${team.teamNickName}</span>
             </span>
             <input type="hidden" name="foreachTeamCode" value="${team.teamCode}"/> 
            </a>
            </li>
       </c:forEach>
       </ul>
    </div>
</div>	

<div class="broadcast-wrap">
   <div class="container">
      <div class="row">
         <div class="col-md-12">
             <h4>Upcoming matches</h4>
             <p>*현재로부터 2주 이내 경기만 예매 가능합니다.</p>                
         </div>
         <div class="col-md-12">
         <!-- List 시작 -->
         <c:forEach var="list" items="${gameList}">
         <div class="broadcast-list" id="accordion" role="tablist" aria-multiselectable="true">
			    <div class="broadcast-item">
			        <div class="item-header" id="headingOne">
			            <div class="row">
			                <div class="col-md-7 col-sm-10">
			                    <div class="item-head-body">
			                        <a><img src="${list.homeTeam.teamEmblem}" width="40" height="40" alt="team-logo1"></a>
			                        <span class="vs">vs</span>
			                        <a><img src="${list.awayTeam.teamEmblem}" width="40" height="40" alt="team-logo1"></a>
			                        <span class="info">
			                            <span class="what">KBO 정규시즌</span>
			                            <span class="then">${list.gameDate} / ${list.gameTime}</span>
			                        </span>
			                    </div>
			                </div>
			                <div class="col-md-4 col-sm-12">
			                    <div class="channel">
			                        <span class="info">
			                        <button type="button" class="getStadium">경기 예매</button>
			                        <input type="hidden" name="gameCode" value="${list.gameCode}">
			                        </span>
			                    </div>
			                </div>
			            </div>	
			        </div>
			    </div>
			</div><!-- List 끝 -->
			</c:forEach>
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
