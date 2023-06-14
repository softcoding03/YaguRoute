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
		font-family:"Gwangyang";
		}
		.text-overlay {
		  position: absolute;
		  top: 50%;
		  left: 50%;
		  transform: translate(-50%, -50%);
		  font-size: 18px;
		  margin-left:300px;
		}
		span{
			font-family:"Gwangyang";
			font-size:15px;
		}
		button[type="button"]:hover {
			background-color: #99BEFF;
		}
		
		button[type="button"] {
			width: 50%;
			height: 45px;
			background-color: #c3eaff;
			color: #000000;
			border: 2px solid #000000;
			border-radius: 9px;
			cursor: pointer;
			font-size: 15px;
			font-family:"Gwangyang";
			text-align: center;
			font-color: white;
		}
		.channel{
			display:flex;
			justify-content:center;
		}
		/* 팀탑바 위한 style 끝*/
		
/*  		#back-img {
		  position: fixed;
		  width: 100%;
		  height: 100vh;
		  overflow: hidden;
		}		
		.row.info{
	    background-color: rgba(255, 255, 255, 0.5); /* 흰색 배경과 투명도 조절 */
	  }  */
	  
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
<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-L1DH7W8BRC"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-L1DH7W8BRC');
</script>

<body>

<jsp:include page="/common/topBar.jsp"/>


<!-- <section class="image-header" style="min-height: 0px;height: 0px;">
	<div class="row">
		<div class="col-md-12" >
           	<img id="back-img" src="/images/background/background6_2.png" alt="img">
        </div>	
	</div>
</section> -->

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

<div class="content">
   <div class="container">
      <div class="row">
         <div class="col-md-12">
         <!-- List 시작 -->
         <c:forEach var="list" items="${gameList}">
         <div class="broadcast-list" id="accordion" role="tablist" aria-multiselectable="true">
			    <div class="broadcast-item">
			        <div class="item-header" id="headingOne">
			            <div class="row">
			                <div class="col-md-8 col-sm-10">
			                    <div class="item-head-body">
			                        <a><img src="${list.homeTeam.teamEmblem}" style="height:40px;" alt="team-logo1"></a>
			                        <span class="vs">vs</span>
			                        <a><img src="${list.awayTeam.teamEmblem}" style="height:40px;" alt="team-logo1"></a>
			                        <span class="info">
			                            <span class="what">KBO 정규시즌</span>
			                            <span class="then">${list.gameDate} / ${list.gameTime}</span>
			                        </span>
			                        <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;구장 : ${list.homeTeam.stadiumName}</span>
			                    </div>
			                </div>
			                <div class="col-md-4 col-sm-12">
			                    <div class="channel">
			                        <button type="button" class="getStadium">경기 예매</button>
			                        <input type="hidden" name="gameCode" value="${list.gameCode}">
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
  
  <div class="container">
  		<div class="row info">
	  		<div class="col-md-12">
	  			<h2>예매 안내</h2>
	  		</div>
	  		<div class="col-md-12">
				<p>1. 예매 가능시간 : 경기당일 경기시작시까지</p>
				<p>2. 예매티켓 취소 가능시간 : 경기시간 1일 전까지 (ex 04.12.14:00 경기인 경우 -> 04.11.24:00까지 취소 가능)</p>
				<p>3. 현장 매표소 운영시간 : 평일 경기 시작 1시간 30분 전 / 주말,공휴일 경기 시작 2시간 전 시작 (변경 시 별도 공지)</p>
				<p>4. 예매정책</p> 
				<p>*매수제한 : 1회 4매</p> 
				<p>*취소수수료 : 장당 1,000원</p> 
				
				<h3>티켓수령 및 입장</h3>
				<p>1. 경기당일 매표소가 혼잡하오니, 가급적 모바일티켓을 활용하여 편안한 입장을 권장드립니다.</p>
				<p>*모바일 티켓은 바로 출입구에서 입장이 가능합니다.</p>
				<p>2. 본인확인이 힘들 경우, 입장권 교환이 불가할 수 있습니다.</p>
				<p>3. 경기 당일 주차장이 협소하여 사용이 불가할 수 있으니, 가능하면 대중교통 이용 바랍니다.
				  (주차장 이용 불가로 인한 경기 티켓 교환,환불은 불가합니다)</p>
				<p>4. 예매하신 티켓의 전매, 위조 등의 위법행위를 엄격히 금지합니다.</p>
				<p>* 티켓 예매 후 타인에게 재판매하거나 양도/양수 과정에서 예매자의 신상정보를 타인에게 임의로 전달시에는 판매자와 구매자 모두 피해를 입을 수 있습니다. 이로 인한 피해에 대해서는 구단과 구단과 계약된 티켓판매 업체는 일절 책임지지 않습니다.</p>
				<p>* 예매한 티켓을 순수한 관람 목적이 아닌 재판매의 의도로 예매를 하거나, 티켓의 위조나 변조 등을 통하여 티켓을 판매하는 등의 경우 주최측의 권한으로 사전 통보없이 구매취소 및 강제폐기(압류)할 수 있음을 알려드립니다. </p>
	  		</div>
	  	</div>
	  	<br><br>
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
