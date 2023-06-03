<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getUserPredict</title>
</head>
<link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>
	hr{
		border:none;
		border-top: 3px solid black;
	}
	
	.imgSize{
		width:100px !important;
		height:100px !important;
	}
</style>
<script type="text/javascript">
function preventEvent(){
	
	$(document).on('mousedown',function(event){
		event.preventDefault();
	})
	
	$(document).on('click',function(event){
		event.preventDefault();
	})
	
	$(document).on('contextmenu',function(event){
		event.preventDefault();
	})
	
}
</script>
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
		<div class="main-award-slider" style="height: 100px !important">
   			<div id="main-award-slider" class="carousel slide" data-ride="carousel">
			<a class="nav-arrow left-arrow" id="prevDay" href="#" role="button" data-slide="prev">
	            <i class="fa fa-angle-left" aria-hidden="true"></i>
	            <span class="sr-only">Previous</span>
        	</a>
			<div class="text-center">
				<h1 id="nowDate">${date}</h1>
			</div>
        </div>
	</div>
</div>
<c:set var="State" value="0"/>
<c:forEach items="${gameList}" var="gameStatusCode">
	<c:if test="${gameStatusCode.gameStatusCode ne 0 and gameStatusCode.gameStatusCode ne 3}">
		<c:set var="State" value="1"/>
		<script type="text/javascript">
			preventEvent();
		</script>
	</c:if>
</c:forEach>

<c:if test="${gameSize eq 0}">
	<div class="text-center">
		<h4>경기가 없습니다.</h4>
	</div>
</c:if>
<c:if test="${gameSize ne 0}">
<div class="match-page-top" style="height: 150px !important">
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="upcoming-match-info">
				<div class="team">
                    <div class="avatar"></div>
                	<div class="text"></div> 
                </div>
				<div class="counter">
		            <ul>
		                <li>
		               		<div class="digit hours">00</div>
		                </li>
		                <li>
		                  	<div class="digit minutes">00</div>
		                </li>
						<li>
		             			<div class="digit seconds">00</div>
		            	</li>
		             </ul>
				</div>
				<div class="team right">
                	<div class="text"></div> 
                	<div class="avatar"></div>
                </div>
			</div>
		</div>
	</div>
</div>
</div>
	<c:if test="${predSize ne 0}">
		<div class="text-center">
			<h4>경기 예측 완료</h4>
			<h6>결과는 자정 이후 업데이트 됩니다.</h6>
		</div>
	</c:if>
	<c:if test="${predSize eq 0}">
	<div class="text-center">
		<h4 class="time-title"></h4>
	</div>
	</c:if>
<form>
<input type="hidden" value="${date}" name="date">
<c:forEach items="${gameList}" var="game" varStatus="gameStatus">
<c:if test="${predSize ne 0}">
	<c:set var="pred" value="${predList[gameStatus.index]}"/>
</c:if>

<input type="hidden" value="${game.gameCode}" name="addPred[${gameStatus.index}].predGameCode">
<input type="hidden" value="${user.userId}" name="addPred[${gameStatus.index}].predUserId">
<div class="match-page-top">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                	<hr>
                    <div class="upcoming-match-info">
                    
                        <div class="team col-md-4">
                        	<div>[home]</div>
                            <div class="avatar"><img src="${game.homeTeam.teamEmblem}" alt="match-list-team-img" class="imgSize"></div>
                            <div class="text">
                                ${game.homeTeam.teamNickName} <span>${game.homeTeam.hometown}</span>
                                <div class="latest">
                                    <div class="latest-title">${game.homeTeam.teamFullName} 승리</div>
                                    <input type="radio" value="${game.homeTeam.teamCode}" name="addPred[${gameStatus.index}].predWinningTeamCode"  ${predSize ne 0 ? 'disabled' : ''}  ${(predSize ne 0 and pred.predWinningTeamCode eq game.homeTeam.teamCode) ? 'checked' : ''}>
                                </div>
                            </div> 
                        </div>
                        <div>
                            <ul>
                                <li>
                                    <div><a class="btn small" href="/game/getGamePreview?gameCode=${game.gameCode}">전력분석</a></div>
                                </li>
                                <li>
                                    <div><p class="name">예측 포인트</p></div>
                                </li>
                                <li>
                                	<div><input value=${predSize ne 0 ? pred.predPoint : ''} ${predList ne null ? 'disabled' : ''} type="number" width="100px" id="pred${gameCode}" name="addPred[${gameStatus.index}].predPoint" ></div>
                                </li>
                            </ul>
                        </div>
                        <div class="team right col-md-4">
                            <div class="text">
                                ${game.awayTeam.teamNickName}<span>${game.awayTeam.hometown}</span>
                                <div class="latest">
                                    <div class="latest-title">${game.awayTeam.teamFullName} 승리</div>
                                    <button><input type="radio" value="${game.awayTeam.teamCode}" name="addPred[${gameStatus.index}].predWinningTeamCode" ${predSize ne 0 ? 'disabled' : ''} ${(predSize ne 0 and pred.predWinningTeamCode eq game.awayTeam.teamCode) ? 'checked' : ''}></button>
                                </div>
                            </div>
                            <div class="avatar"><img src="${game.awayTeam.teamEmblem}" alt="match-list-team-img" class="imgSize"></div>
					</div>
					
				</div>
			</div>
			
		</div>
	</div>
</div>
<c:if test="${gameStatus.last eq true}"><hr></c:if>

</c:forEach>
</form>
<div class="container">
	<div class="text-center">
		<h3>
		<c:if test="${State ne 1}">
			<c:if test="${predSize ne 0}">
				<button id="deletePred">초기화</button>
			</c:if>
			<c:if test="${predSize eq 0}">
				<button id="addPred">예측 정보 저장</button>
			</c:if>
		</c:if>	
		</h3>
	</div>
	
</div>
</c:if>
</body>
<script type="text/javascript">

function remaindTime() {
    var now = new Date();
    var end = new Date(now.getFullYear(),now.getMonth(),now.getDate(),${minTimeString[0]},${minTimeString[1]},${minTimeString[2]});
    var open = new Date(now.getFullYear(),now.getMonth(),now.getDate(),23,59,59);
  
    var nt = now.getTime();
    var ot = open.getTime();
    var et = end.getTime();
  
   if(nt<ot){
     $("h4.time-title").html("경기 예측 결과 확인까지 남은 시간");
     sec = parseInt(ot - nt) / 1000;
     day = parseInt(sec/60/60/24);
     sec = (sec - (day * 60 * 60 * 24));
     hour = parseInt(sec/60/60);
     sec = (sec - (hour*60*60));
     min = parseInt(sec/60);
     sec = parseInt(sec-(min*60));
     if(hour<10){hour="0"+hour;}
     if(min<10){min="0"+min;}
     if(sec<10){sec="0"+sec;}
      $(".hours").html(hour);
      $(".minutes").html(min);
      $(".seconds").html(sec);
   }else {
     $("h4.time-title").html("경기 예측 마감까지 남은 시간");
     sec =parseInt(et - nt) / 1000;
     day  = parseInt(sec/60/60/24);
     sec = (sec - (day * 60 * 60 * 24));
     hour = parseInt(sec/60/60);
     sec = (sec - (hour*60*60));
     min = parseInt(sec/60);
     sec = parseInt(sec-(min*60));
     if(hour<10){hour="0"+hour;}
     if(min<10){min="0"+min;}
     if(sec<10){sec="0"+sec;}
      $(".hours").html(hour);
      $(".minutes").html(min);
      $(".seconds").html(sec);
   }
 }
 

function validation(){
	var radioCount = 0;
	var check = true;
	
	$('input[type="number"]').on('input', function() {
		  var value = $(this).val();
		  var regex = /^[1-9]\d*$/;
		  
		  if (!regex.test(value)) {
			  alert('숫자만 입력해 주세요.')
			  $(this).val("")
			  check = false;
			  return false;
		  }
	});
	
	$("input[type='number']").each(function(){
		var value = $(this).val();
		if(value.trim() === ''){
			alert('비어있는 포인트가 있습니다.')
			check = false;
			return false;
		}
	})
	
	var sum = 0;
	$("input[type='number']").each(function(){
		var value = $(this).val();
		sum = sum + parseInt(value);
	})
	
	if(sum > parseInt(${user.userPoint})){
		alert('예측 포인트가 보유한 포인트를 초과하였습니다.');
		check = false;
	}
	
	$("input[type='radio']").each(function(){
		if($(this).is(':checked')){
			radioCount = radioCount+1;
		}
	})
	
	if(radioCount != 5){
		alert('라디오 버튼을 선택해주세요')
		check = false;
	}
	
	return check;
}

	$(function(){
		
		remaindTime()
		
		$("#addPred").on("click",function(){
			if(validation()){
				$("form").attr("method","GET").attr("action","/predict/addUserPredict").submit();
			}
		})
		
		$("#deletePred").on("click",function(){
			$("form").attr("method","GET").attr("action","/predict/deleteUserPredict").submit();
		})
		
		$("#prevDay").on("click",function(){
			self.location = "/predict/getUserPredict?date=${otherDay}";
		})
		
		setInterval(remaindTime,1000);
		
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