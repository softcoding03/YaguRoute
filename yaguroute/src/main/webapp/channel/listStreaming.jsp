<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>야구ROUTE</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
    <!-- <link rel="icon" href="favicon.ico" type="image/x-icon"> -->
    <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    
    <script type="text/javascript">
		$(function(){
				
			$("button:contains('Live')").on("click", function(){
				console.log("중계보기 클릭했다");
				var text = $(this).children("span").children("input[name='channelID']").val();
				console.log("조회 클릭 시 channelID : "+text);
				self.location="/channel/getChannel?channelID="+text;
			});
				
			$("button:contains('수정하기')").on("click", function(){
				console.log("수정하기");
				var text = $(this).children("input[name='channelID']").val();
				console.log("수정하기 클릭 시 ChanndlID : "+text);
				self.location="/channel/updateChannel?channelID="+text;
			})
				
			$("button:contains('삭제하기')").on("click", function(){
				console.log("삭제하기");
				var text = $(this).children("input[name='channelID']").val();
				console.log("삭제하기 클릭 시 ChanndlID : "+text);
				self.location="/channel/deleteChannel?channelID="+text;
			})
		});
		</script>
    
    <style>
	    .custom-button {
	    position: relative;
	    display: inline-block;
	    padding: 5px 10px;
	    font-size: 12px;
	    color: #fff;
	    background-color: #ccc;
	    border: none;
	    border-radius: 5px;
	    /* cursor: not-allowed; */
	    opacity: 0.5;
	    transition: opacity 0.3s ease-in-out;
	  	}

	  .custom-button:hover {
	    opacity: 0.7;
	  }
	  
	  .recording-button {
	  	  position: relative;
		  display: inline-block;
		  padding: 5px 10px;
		  font-size: 12px;
		  color: #fff;
		  background-color: #ff4d4d;
		  border: none;
		  border-radius: 5px;
		  cursor: pointer;
		  overflow: hidden;
		  z-index: 1;
		  transition: all 0.3s ease-in-out;
		  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	   }

	  .recording-button:before {
	    content: "";
	    position: absolute;
	    top: -50%;
    	left: -50%;
    	width: 200%;
    	height: 200%;
	    background-color: linear-gradient(45deg, #fff, transparent, #fff);
	    transform: rotate(45deg);
	    opacity: 0.15;
	    animation: pulse 1.5s infinite;
	    transition: all 0.6s ease-in-out;
	  }
	
	  @keyframes pulse {
	    0% {
	      transform: scale(1);
	      opacity: 0.8;
	    }
	    50% {
	      transform: scale(1.2);
	      opacity: 0.4;
	    }
	    100% {
	      transform: scale(1);
	      opacity: 0.8;
	    }
	  }
	
	  .recording-button:hover:before {
	    top: -10%;
    	left: -10%;
	    opacity: 0.3;
	  }
	  .recording-button span {
		position: relative;
		z-index: 2;
  		}
  		
  		.no_game{
  			background-image: url('../images/baseball/empty_ground.png');
  			background-size: cover;
  			background-repeat: no-repeat;
  			background-position: center;
  			width : 100%;
  			height : 900px;
  			display: flex;
			align-items: center;
			justify-content: center;
			color: white;
			text-align: center;
			font-size: 50px;
			font-family:"Gwangyang";
  		}
  		.text-overlay {
		  position: absolute;
		  top: 50%;
		  left: 50%;
		  transform: translate(-50%, -50%);
		  font-size: 18px;
		  margin-left:400px;
		}
		.teamTopBar {
		  width: 100%;
		  height: auto;
		}
		.image-container {
		  position: relative;
		  display: inline-block;
		  width: 100%;
		}
    </style>
</head>
<body>

<jsp:include page="/common/loading.jsp"/>
<!-- topBar start -->
<jsp:include page="/common/topBar.jsp"/>
<!-- topBar End -->
<section class="image-header">
    <div class="image-container">
	  <img class="teamTopBar" src="/images/teamTopBar/ALL.jpg">
	  <div class="text-overlay"><h1 style="color: white;">실시간 중계 목록</h1></div>
	</div>
</section>

<c:if test="${list[0].gameInfo.gameCode eq null}">
	<div class="no_game">
		오늘 경기는 없습니다.
    </div>
</c:if>

<c:if test="${!(list[0].gameInfo.gameCode eq null)}"> 
<div class="container">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
            	<h4>Today's Match</h4>                
            </div>
            <c:set var="i" value="0"/>
            <c:forEach var="channel" items="${list}">
            <c:set var="i" value="${i+1}"/>
                <c:if test="${!(channel.gameInfo.gameCode eq null)}">
	            <div class="col-md-12">
	            	<div class="broadcast-list" id="accordion" role="tablist" aria-multiselectable="true">
	            		<div class="broadcast-item">
	            			<div class="item-header" id="headingOne">
	            				<div class="row">
	            					<div class="col-md-1 col-sm-2">
					                    <a data-toggle="collapse" data-parent="#accordion" class="arrow"><i class="glyphicon glyphicon-facetime-video" aria-hidden="true"></i></a>
					                </div>
					                
					                <div class="col-md-7 col-sm-10">
					                    <div class="item-head-body">
					                        <img src="${channel.gameInfo.homeTeam.teamEmblem}" width="40" height="40" alt="team-logo1">
					                        <span class="vs">vs</span>
					                        <img src="${channel.gameInfo.awayTeam.teamEmblem}" width="40" height="40" alt="team-logo1">
					                        <span class="info">
					                            <span class="what">${channel.gameInfo.homeTeam.teamNickName} VS ${channel.gameInfo.awayTeam.teamNickName}</span>
					                            <span class="then">${channel.gameInfo.gameDate}</span>
					                        </span>
					                    
					                        <span class="marker">
					                        	<c:if test="${channel.gameInfo.gameStatusCode eq 0 }">경기 전</c:if>
					                        	<c:if test="${channel.gameInfo.gameStatusCode eq 2 }">경기 종료</c:if>
					                        	<c:if test="${channel.gameInfo.gameStatusCode eq 3 }">경기 취소</c:if>
					                        	<c:if test="${channel.gameInfo.gameStatusCode eq 1 }">경기 중</c:if>
					                        	<c:if test="${channel.gameInfo.gameStatusCode eq 4 }">경기 종료</c:if>
					                        </span>
					                    </div>
					                </div>
					                <div class="col-md-4 col-sm-12">
					                    <div class="channel">
					                        <span class="info">
					                            <span class="what"> 장소 : ${channel.gameInfo.homeTeam.stadiumName}</span>
					                            <span class="then"> start : ${channel.gameInfo.gameTime}</span>
					                            
					                            <div>
					                            <c:if test="${channel.gameInfo.gameStatusCode eq 1 || channel.gameInfo.gameStatusCode eq 0}"><!--  -->
					                            	<button class="recording-button">
					                            		<span>
					                            			Live
					                            			<input type="hidden" name="channelID" value="${channel.channelID}"/>
					                            		</span>
					                            	</button>
					                            </c:if>
					                            
					                            <c:if test="${channel.gameInfo.gameStatusCode eq 0 }">
					                            	<button class="custom-button" disabled="disabled">준비 중</button>
					                            </c:if>
					                            
					                            <c:if test="${channel.gameInfo.gameStatusCode eq 2 || channel.gameInfo.gameStatusCode eq 4}">
					                            	<button class="custom-button" disabled="disabled">결과</button>
					                            </c:if>
					                            
					                            <c:if test="${channel.gameInfo.gameStatusCode eq 3 }">
					                            	<button class="custom-button">cancel</button>
					                            </c:if>
					                            	
					                            </div>
					                        </span>
					                    </div>
					                </div>
	            				</div>
	            			</div>            			
	            		</div>
	            	</div>
	            </div>   
	            </c:if>        
            </c:forEach>            
		</div>
	</div>
</div>
</c:if>

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
</body>
</html>