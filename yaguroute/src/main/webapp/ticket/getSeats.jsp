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
    	
    	var tdCount=0; //선택 좌석 수
    	var priceTag=0; //총 가격
    	
	    	$(document).on("click", "label:nth-child(n+1)", function(event) {
		    		var seatPrice = Number($(this).siblings("input[name='seatPrice']").val());
					var price = seatPrice.toLocaleString(); //숫자 1,000 형식으로 변경
					var seatCode = $(this).siblings("input[name='seatCode']").val();
					var value = seatCode+"//"+price;
					console.log("클릭"+price+"//"+seatCode);
					var insertPosition = $('#insertPosition')
		    		var insertBody = 	"<div id="+seatCode+">"
											+	"<tr>"
										   +  "<td>"
										   +  "<input type=\"text\" value="+value+"></input>"
									    	+	"</td>"
									    	+"</div>";
									    	
		    		if(insertPosition.find("div#"+seatCode).length>0) {//해당 div가 존재한다면
							insertPosition.find("div#"+seatCode).remove();
			  				tdCount--;
			  				priceTag -= seatPrice;
		    		} else if(tdCount > 3){ 
			    			alert("좌석은 최대 4개까지 선택가능합니다.");
			    			event.preventDefault(); //클릭 이벤트 취소
		    		} else {
							insertPosition.append(insertBody);
							tdCount++;
							priceTag += seatPrice;
					}//end of if
		    		
		    		$("#priceTag").text(priceTag); //총 가격
					console.log(tdCount)
			});
	 });
    
    </script>
    <style>
	   .col-md-2 {
		  width: 10%; /* 가로줄에 10개를 띄우기 위해 10%로 설정 */
		  float: left; /* 가로 정렬을 위해 float 속성 사용 */
		  transform: scale(2.0); /* 크기 조정 */
		}
    </style>
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
		 
    <!--CLUB STAFF TOP BEGIN-->

	<div>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h4>Tickets</h4>
					<hr>
				</div>
				<div class="col-md-8">
					<c:forEach var="ticket" items="${ticketList}" varStatus="status">
						<div class="col-md-2">
							<a href="javascript:seat;" class="item">
								<c:choose>
									<c:when test="${ticket.ticketStatus eq 0}">
										<input type="hidden" name="seatPrice" value="${ticket.seatPrice}">
										<input type="hidden" name="seatCode" value="${ticket.seatCode}">
										<input type="checkbox" name="checkbox" class="filter-check" id="test${status.count}" value="${status.count}">
										<label for="test${status.count}" />
										<hr>
									</c:when>
									<c:when test="${ticket.ticketStatus eq 1}">
										<input checked type="checkbox" name="checkedbox" class="filter-check checked" id="test${status.count}">
										<label for="test${status.count}" />
									</c:when>
								</c:choose>
							</a>
						</div>
					</c:forEach>
				</div>
				<div class="col-md-4">
					<table id="insertPosition">
						<div>
							<tr>
							<td>좌석 번호 // 가격</td>
						</div>
						
					</table>
				</div>
				<div>
					총가격 :
					<a id="priceTag"></a>
				</div>
				<div class="col-md-12">
					<p>1인 최대 4매까지 구매 가능합니다.</p>
				</div>
			</div>
		</div>
	</div>

	<!--CLUB STAFF TOP END-->
      

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
