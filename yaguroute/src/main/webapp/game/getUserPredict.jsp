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
		border-top: 3px solid #a3cca3;
	}
	
	input[type=number]{
		border-radius: 8px;
		font-size: 18px;
	}
	
	.imgSize{
		width:130px !important;
		height:130px !important;
	}
	.middle{
		vertical-align: middle !important;
	}
	.margin-left{
		margin-left: 30px;
	}
	.margin-right{
		margin-right: 30px;
	}
	.border{
		border: 3px solid;
		border-radius: 10px;
		width: 55px;
		height: 55px;
	}
	.a-css{
		display:inline-flex !important; 
		width: 250px;
		padding-top: 40px;
		padding-bottom: 40px;
	}
	.upcoming-match-info .team>*{
		vertical-align: middle !important;
	}
	.input-wrapper {
   		position: relative;
	}
	.input-text {
	    position: absolute;
	    top: 50%;
	    right: 10px;
	    transform: translateY(-50%);
	    padding-right: 16px;
	    font-size: 18px;
	    color:black;
	    
	}
	.text{
		font-size: 18px !important;
		font-weight: 600;
	}
	.transparency{
		background-color: rgba(256,256,256,0.9);
		/* background-color: rgba(0,0,0,0.6); */
		
	}
	.background {
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  margin-top: 50px;
		  margin-bottom: 50px;
		}
	/* 
	body *{
		color:white !important;
	} */
	#back-img {
		  position: fixed;
		  width: 100%;
		  height: 100vh;
		  overflow: hidden;
		}
</style>
<script type="text/javascript">
function preventEvent(){
	
	$("#preventAll").on('mousedown',function(event){
		if(!$(event.target).hasClass('btn')){
			event.preventDefault();
		}
	})
	
	$("#preventAll").on('click',function(event){
		if(!$(event.target).hasClass('btn')){
			event.preventDefault();
		}
	})
	
	$("#preventAll").on('contextmenu',function(event){
		if(!$(event.target).hasClass('btn')){
			event.preventDefault();
		}
	})
	
}

/* function preventAtag(){
	$(".oneGame .homeGame,.oneGame .awayGame").on('click',function(event){
		event.preventDefault();
	})
} */
</script>
<body>
<jsp:include page="/common/loading.jsp"/>
<jsp:include page="/common/topBar.jsp"/>
<section id="preventAll">
<section class="image-header" style="min-height: 150px;height: 150px;">
	<div class="row">
		<div class="col-md-12" >
           	<img id="back-img" src="/images/baseball/predict_background_img.jpg" alt="img">
        </div>	
	</div>
</section>
<div class="mathc-live-broadcasts background" style="margin-top: 0px;">
	<div class="broadcast-tabs-wrapper">
		<ul class="nav nav-tabs" role="tablist">
			<li style="border-radius: 30%;background: content-box;"><h1 style="margin-left: 30px;margin-right: 30px;color:black;font-size: 50px;font-family:'Gwangyang'">경기 예측</h1></li>
		</ul>
		
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-md-12 transparency">
			<div class="text-right" style="background: content-box;"><h4>${user.userNickName}님 보유 포인트 : ${user.userPoint} Point</h4></div>
				<div class="main-award-slider" style="height: 100px !important">
		   			<div id="main-award-slider" class="carousel slide" data-ride="carousel">
					<a class="nav-arrow left-arrow" id="prevDay" href="#" role="button" data-slide="prev" style="width: 52px;height: 52px;">
			            <i class="fa fa-angle-left fa-3x" aria-hidden="true"></i>
			            <span class="sr-only">Previous</span>
		        	</a>
					<div class="text-center">
						<h1 id="nowDate">${date}</h1>
					</div>
		        </div>
			</div>
		</div>
	</div>
</div>
<c:set var="State" value="0"/>
<c:forEach items="${gameList}" var="gameStatusCode">
	<c:if test="${gameStatusCode.gameStatusCode ne 0 and gameStatusCode.gameStatusCode ne 3}">
		<c:set var="State" value="1"/>
	</c:if>
</c:forEach>

<c:if test="${gameSize eq 0}">
	<div class="text-center">
		<h4>경기가 없습니다.</h4>
	</div>
</c:if>
<c:if test="${gameSize ne 0}">
	<div class="container">
		<div class="row">
			<div class="col-md-12 transparency" style="text-align: center;"><h4 class="time-title"></h4></div>
			<div class="col-md-12 transparency">
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
<div class="container">
	<div class="row">
		<div class="col-md-12 transparency">
			<c:if test="${predSize ne 0}">
				<div class="text-center" style="margin-top: 50px; margin-bottom: 50px; border: 2px solid black;">
					<script type="text/javascript">preventEvent()</script>
						<h4>경기 예측 완료</h4>
						<h6>결과는 자정 이후 업데이트 됩니다.</h6>
				</div>
			</c:if>
			<div class="col-md-6">
				<h3>[HOME]</h3>
			</div>
			<div class="col-md-6" style="text-align: right;">
				<h3>[AWAY]</h3>
			</div>
		</div>
	</div>
</div>
<form>
<input type="hidden" value="${date}" name="date">
<c:forEach items="${gameList}" var="game" varStatus="gameStatus">
<c:if test="${predSize ne 0}">
	<c:set var="pred" value="${predList[gameStatus.index]}"/>
</c:if>
<!-- <input type="radio" value="${game.awayTeam.teamCode}" name="addPred[${gameStatus.index}].predWinningTeamCode" ${predSize ne 0 ? 'disabled' : ''} ${(predSize ne 0 and pred.predWinningTeamCode eq game.awayTeam.teamCode) ? 'checked' : ''}> -->
<input type="hidden" value="${game.gameCode}" name="addPred[${gameStatus.index}].predGameCode"/>
<input type="hidden" value="${user.userId}" name="addPred[${gameStatus.index}].predUserId"/>
<div class="oneGame">
        <div class="container">
            <div class="row">
                <div class="col-md-12 transparency">
                	<hr>
                    <div class="upcoming-match-info" style="margin-top: 50px;margin-bottom: 50px;">
                    	<input type="hidden" value="" name="addPred[${gameStatus.index}].predWinningTeamCode" class="predTeamCode"/>
                        <div class="team col-md-5 middle homeGame">
	                        	<a class="a-css">
		                            <div class="avatar"><img src="${game.homeTeam.teamEmblem}" alt="match-list-team-img" class="imgSize" id="${game.homeTeam.teamCode}"></div>
		                            <div class="text" style="padding-left: 10px;">
		                                ${game.homeTeam.teamFullName} <span>${game.homeTeam.hometown}</span>
		                                <div class="latest">
				                        	<div class="latest-title" style="padding-left: 30px;font-size: 14px;">${game.homeTeam.teamNickName} 승리</div>
				                   		</div>
		                            </div> 
		                            
	                            </a>
	                            
	                            <div class="border margin-left"><i class="fa fa-check fa-3x" aria-hidden="true" style="display: ${(predSize ne 0 and pred.predWinningTeamCode eq game.homeTeam.teamCode) ? 'flex' : 'none'};"></i></div>
                        </div>
                        
                        <div class="col-md-2" style="text-align: center;">
                            <ul>
                                <li>
                                    <div><h6>예측 포인트</h6></div>
                                </li>
                                <li>
                                	<div class="input-wrapper">
                                		<input style="padding-left: 10px;width: 150px;'" value=${predSize ne 0 ? pred.predPoint : ''} ${predList ne null ? 'disabled' : ''} type="number" width="100px" id="pred${gameCode}" name="addPred[${gameStatus.index}].predPoint" >
                                		<span class="input-text">point</span>
                                	</div>
                                </li>
                                <li>
                                	<p class="warn-message"></p>
                                </li>
                                <c:if test="${game.gameStatusCode eq 0}">
									<li style="margin-top:50px;">
	                                    <div><a class="btn small" href="/game/getGamePreview?gameCode=${game.gameCode}" style="font-size:16px;font-family: Raleway,sans-serif; font-weight: 900;">전력분석</a></div>
	                                </li>
								</c:if>
                                
                            </ul>
                        </div>
                        
                        <div class="team right col-md-5 middle awayGame">
                        	<div class="border margin-right"><i class="fa fa-check fa-3x" aria-hidden="true" style="display: ${(predSize ne 0 and pred.predWinningTeamCode eq game.awayTeam.teamCode) ? 'flex' : 'none'};"></i></div>
	                        <a class="a-css">
	                            <div class="text" style="padding-right: 10px;">
	                                ${game.awayTeam.teamFullName}<span>${game.awayTeam.hometown}</span>
	                                <div class="latest">
	                                    <div class="latest-title" style="padding-right: 30px;font-size: 14px;">${game.awayTeam.teamNickName} 승리</div>
	                                </div>
	                            </div>
	                            <div class="avatar" style="border"><img src="${game.awayTeam.teamEmblem}" alt="match-list-team-img" class="imgSize" id="${game.awayTeam.teamCode}"></div>
							</a>
							
					</div>
					
				</div>
				<c:if test="${gameStatus.last eq true}"><hr></c:if>
			</div>
		</div>
	</div>
</div>


</c:forEach>
</form>
<div class="container">
	<div class="row" style="margin-bottom: 100px;">
		<div class="col-md-12 transparency">
			<div class="text-center"  style="padding-bottom: 20px;">
				<c:if test="${State ne 1}">
					<c:if test="${predSize ne 0}">
						<button style="margin-right: 30px;" class="btn" id="deletePred">초기화</button>
					</c:if>
					<c:if test="${predSize eq 0}">
						<button style="margin-right: 30px;" class="btn" id="addPred">예측 정보 저장</button>
					</c:if>
				</c:if>	
			</div>
		</div>
	</div>
</div>
</c:if>
</section>
</body>
<script type="text/javascript">

function remaindTime() {
    var now = new Date();
    var end = new Date(now.getFullYear(),now.getMonth(),now.getDate(),${minTimeString[0]},${minTimeString[1]},${minTimeString[2]});
    var open = new Date(now.getFullYear(),now.getMonth(),now.getDate(),23,59,59);
  
    var nt = now.getTime();
    var ot = open.getTime();
    var et = end.getTime();
  
   if(nt<et){
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
	      return false;
   }else {
      $("h4.time-title").html("(예측 마감)경기 예측 결과 확인까지 남은 시간");
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
       return true;
   }
 }


function validation(){
	var radioCount = 0;
	var check = true;
	var regex = /^[1-9]\d*$/;
	
	if(!check){return false}
	$("input[type='number']").each(function(){
		var value = $(this).val();
		if(value.trim() === ''){
			alert('비어있는 예측 포인트가 있습니다.')
			$(this).focus();
			check = false;
			return false;
		}else if(!regex.test(value)){
			alert('예측 포인트는 숫자만 입력 가능합니다.')
			$(this).focus();
			check = false;
			return false;
		}
	})
	
	if(!check){return false}
	
	var sum = 0;
	$("input[type='number']").each(function(){
		var value = $(this).val();
		sum = sum + parseInt(value);
	})
	
	if(sum > parseInt(${user.userPoint})){
		alert('예측 포인트가 보유한 포인트를 초과하였습니다.');
		check = false;
		return false;
	}
	
	$(".predTeamCode").each(function(){
		if($(this).val() === ''){
			alert('모든 경기 예측에 참여해야 합니다.')
			$(this).focus();
			check = false
			return false;
		}
	})
	
	return check;
	
}
function number_validation(){
	
}
	$(function(){
		
		$('input[type="number"]').on('input', function() {
			  var value = $(this).val();
			  var regex = /^[1-9]\d*$/;
			  check = true;
			  if (!regex.test(value)) {
				  $(this).val("")
				  $(this).parent().parent().parent().find("p.warn-message").text("숫자만 입력해 주세요.(0~9)");
				  $(this).focus()
				  check = false;
				  return check;
			  }else if (regex.test(value)) {
				  $(this).parent().parent().parent().find("p.warn-message").text("");
				  $(this).focus()
				  return check;
			  }
		});
		
		if(remaindTime()){
			preventEvent();
		}
		
		if(${predSize} === 0){
			$(".oneGame").each(function(){
				var elem = $(this)
				$(this).find(".homeGame").on("click",function(){
					$(this).find("i").attr("style","display : flex;")
					$(elem).find(".awayGame i").attr("style","display : none;")
					$(elem).find("input.predTeamCode").val($(this).find("img").attr("id"))
				})
				$(this).find(".awayGame").on("click",function(){
					$(this).find("i").attr("style","display : flex;")
					$(elem).find(".homeGame i").attr("style","display : none;")
					$(elem).find("input.predTeamCode").val($(this).find("img").attr("id"))
				})
			})
		}
		
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