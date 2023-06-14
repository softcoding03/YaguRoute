<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
<style>
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
		button[type="button"]:hover {
			background-color: #99BEFF;
		}
		
		button[type="button"] {
			width: 100%;
			height: 40px;
			background-color: #ffffff;
			color: #000000;
			border: 1px solid #ccc;
			border-radius: 5px;
			cursor: pointer;
			font-size: 14px;
			text-align: center;
		}
		
		//따라다니는 퀵메뉴
		div, ul, li {-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;padding:0;margin:0}
		a {text-decoration:none;}
		.quickmenu {position:absolute;width:50px;top:70%;margin-top:-70px;right:10px;background:#fff;}
		.quickmenu ul {position:relative;float:left;width:100%;display:inline-block;*display:inline;border:1px solid #ddd;}
		.quickmenu ul li {float:left;width:100%;border-bottom:1px solid #ddd;text-align:center;display:inline-block;*display:inline;}
		.quickmenu ul li a {position:relative;float:left;width:100%;height:50px;line-height:50px;text-align:center;color:#999;font-size:9.5pt;}
		.quickmenu ul li a:hover {color:#000;}
		.quickmenu ul li:last-child {border-bottom:0;}
		.content {position:relative;min-height:1000px;}		
		
	  tbody{
	  		font-family:"Gwangyang";
	  }
	  td{
	  	vertical-align: middle !important;
	  	font-size: 14px !important;
	  }
		
</style>    
    
<script type="text/javascript">

	function fncGetTicketPurchaseList(currentPage){
		self.location="/ticket/getTicketPurchaseList?userId=${user.userId}&currentPage="+currentPage;
	}
    
    $(function(){
		$(".getTicketPurchaseDetail").on("click" , function() {
			var tranNo = $(this).siblings("input[name='tranNo']").val();
			var url = "/ticket/getTicketPurchaseDetail?tranNo="+tranNo;
			var width = 700;  // 창의 너비
			var height = 1200;  // 창의 높이
			var left = (window.screen.width - width) / 2;  // 창의 가로 위치
			var top = (window.screen.height - height) / 2;  // 창의 세로 위치
			var options = 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top + ', toolbar=no'; // 주소 표시줄이 숨겨진 옵션 추가
			window.open(url,"경기 티켓 예매",options);	
		});
		
		$("label").on("click" , function() {
			var daysValue = $(this).siblings("input").val();
			console.log(daysValue);
			self.location="/ticket/getTicketPurchaseList?userId=${user.userId}&daysValue="+daysValue;
		});
		
    })
    
    //따라다니는 퀵메뉴
		$(document).ready(function(){
		  var currentPosition = parseInt($(".quickmenu").css("top"));
		  $(window).scroll(function() {
		    var position = $(window).scrollTop(); 
		    $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},700);
		  });
		});
    
    	$(document).ready(function() {
    	  $('.quickmenu li a[href="#team"]').click(function(e) {
    	    e.preventDefault();
    	    $(this).siblings('.submenu').slideToggle();
    	  });
    	  $('.quickmenu li a[href="#back"]').click(function(e) {
    		  history.back();
      	});
    	  $('.quickmenu li a[href="#forward"]').click(function(e) {
    		  history.forward();
      	});
    	});
    	//따라다니는 퀵메뉴 끝
    	

   
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
<a type="hidden" id="top"/>
<jsp:include page="/common/topBar.jsp"/>

<!-- <section class="image-header" style="min-height: 150px;height: 150px;">
	<div class="row">
		<div class="col-md-12" >
           	<img id="back-img" src="/images/background/background1.jpg" alt="img">
        </div>	
	</div>
</section> -->
<div class="image-container">
  <img class="teamTopBar" src="${team.teamTopBar}">
  <div class="text-overlay"><h1>티켓 예매 내역</h1></div>
</div>


<div class="container">
	<div class="sidebar col-xs-6 col-sm-6 col-md-2 sidebar-offcanvas" id="sidebar">
		<div class="filter-wrap">
			<h6>Filters</h6>
			<div class="filter-slider">
				<div class="ui-slider"></div>
			</div>
			<div class="filter-items-wrap">
				<div class="filter-title">예매기간별 조회</div>
				<div class="filter-item">
					<ul>
						<li><input type="checkbox" class="filter-check" id="test1" value="7"> <label for="test1">7일</label></li>
						<li><input type="checkbox" class="filter-check" id="test2" value="15"> <label for="test2">15일</label></li>
						<li><input type="checkbox" class="filter-check" id="test3" value="30"> <label for="test3">1개월</label></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
<br>
	<div class="container">
		<div class="row">
			<div class="col-md-10">
			<div>
				<table class="table table-hover table-striped" >
		        <thead>
		          <tr>
		            <th align="left">결제번호</th>
		            <th align="left">매치</th>
		            <th align="left">경기 일시</th>
		            <th align="left">결제시각</th>
		            <th align="left">취소가능기간</th>
		            <th align="left">상세 보기</th>
		          </tr>
		        </thead>
				  <tbody>
				  	  <c:if test="${empty transaction}">
				  	  		예매 내역이 없습니다.
				  	  </c:if>
					  <c:if test="${not empty transaction}">
					  		<input type="hidden" name="transaction" value="${transaction}">
					  		<input type="hidden" name="size" value="${transaction.size()}">
					  		<c:set var="size" value="${transaction.size()}"/>
							<c:forEach var="i" begin="0" end="${size -1}" step="1">
							<tr>
							  <td align="left" valign="middle">${transaction[i].tranNo}</td>
							  <td align="left"><img src="${game[i].homeTeam.teamEmblem}" style="width:50px;"> vs <img src="${game[i].awayTeam.teamEmblem}" style="width:50px;"></td>
							  <td align="left">${game[i].gameDate}</td>
							  <td align="left" class="tranDate${i}">${transaction[i].tranDate}</td>
							  <c:if test="${transaction[i].refundStatus ==1}">
							  		<td align="left" style="color:red;">결제 취소</td>
							  </c:if>
							  <c:if test="${transaction[i].refundStatus ==0}">
							  		<td align="left" class="refundableDate${i}">${transaction[i].refundableDate}이전까지</td>
							  </c:if>
							  <td align="left">
							  		<input type="hidden" name="tranNo" value="${transaction[i].tranNo}">
							  		<button type="button" class="getTicketPurchaseDetail" ><i class="fi fi-rr-receipt" style="font-size:20px;"></i></button>
							  </td>
							</tr>
				        	</c:forEach>
				     </c:if>
		        </tbody>
		      </table>
	      </div>
		   <!-- PageNavigation Start... -->
			<jsp:include page="../common/pageNavigator_all.jsp">
			<jsp:param name="id" value="ticket" />
			</jsp:include>
			<!-- PageNavigation End... -->
	   	</div>
	   </div>
	</div>
</div>

<!-- 퀵메뉴 -->
<div class="quickmenu">
  <ul>
    <li><a href="#top"><span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span></a></li>
    <li><a href="#bottom"><span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></a></li>
    <li><a href="#back"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span></a></li>
    <li><a href="#forward"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></a></li>
  </ul>
</div>

<a type="hidden" id="bottom"/>
      
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