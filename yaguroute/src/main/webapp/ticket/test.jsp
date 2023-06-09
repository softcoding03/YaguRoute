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
    <!-- iamport.payment.js -->
   <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
		$(function(){
			var refundableDate = "${transaction.refundableDate}";
			var tranDate ="${transaction.tranDate}";
			var formattedDateTime1 = refundableDate.replace("T", " ");
			var formattedDateTime2 = tranDate.replace("T", " ");
			$("#refundableDate").text(formattedDateTime1+" 이전까지");
			$("#tranDate").text(formattedDateTime2);
			
			
		 	//환불
		 	$('.refundTransaction').on("click" , function() {
		 		var refundableDate = new Date("${transaction.refundableDate}");
		 		var currentDate = new Date();
		 		
		 		if(currentDate < refundableDate){
		 			var confirmation = confirm("정말로 구매를 취소하시겠습니까? 구매 취소 시 구매하신 모든 티켓이 취소됩니다.");
		 			var tranNo = ${transaction.tranNo};
		 			if(confirmation){
						console.log("취소ajax 시작");
						
							//환불요청 로직 (고객->admin)
							$.ajax({
								url:"/ticket/rest/refund/"+tranNo ,
								method: "GET",
								dataType : "text",
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(Data, status) {
									if(Data = "success"){
										alert("결제취소가 완료되었습니다.")
									}else{
										alert("결제취소에 실패했습니다.")
									}
								}
							})
			 		}
		 		} else {
		 			alert("결제 취소 가능 기간이 아닙니다.")
		 		}
			});
		 	//구매목록보기
		 	$('.getTicketPurchaseList').on("click" , function() {
					self.location = "/ticket/getTicketPurchaseList?userId=${user.userId}";
			});
		});
</script>
<style>

</style>
</head>

<body>
		<h1>예매 상세 내역</h1>
		<div class="row">
	  		<img src="${ticketList[0].game.homeTeam.teamEmblem}" width="50">
	  		<div class="col-md-2">VS</div>
			<img src="${ticketList[0].game.awayTeam.teamEmblem}" width="50">
		</div>
		<div class="row">
	  		<div class="col-md-5">${ticketList[0].game.homeTeam.teamFullName}</div>
	  		<div class="col-md-2"></div>
			<div class="col-md-5">${ticketList[0].game.awayTeam.teamFullName}</div>
		</div>
		<hr/>
		<h3>예매 내역</h3>
		<hr><hr>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>경기 일시</strong></div>
			<div class="col-xs-8 col-md-4">${ticketList[0].game.gameDate} / ${ticketList[0].game.gameTime}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>경기 장소</strong></div>
			<div class="col-xs-8 col-md-4">${ticketList[0].game.homeTeam.stadiumName}</div>
		</div>
		<hr/>
		<div>
	  		<table class="table table-hover table-striped" >
	  			<thead>
	  				<tr>
	  					<th align="center">티켓 번호</th>
		            <th align="left">좌석 번호</th>
		            <th align="left">가격</th>
	  				</tr>
	  			</thead>
	  			<tbody>
	  				<c:forEach var="ticket" items="${ticketList}">
	  				<tr>
	  					<td align="center">${ticket.ticketNo}</td>
		            <td align="left">${ticket.seatCode}</td>
		            <td align="left">${ticket.seatPrice}</td>
	  				</tr>
	  				</c:forEach>
	  			</tbody>
	  		</table>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>총 금액</strong></div>
			<div class="col-xs-8 col-md-4">${transaction.tranTotalPrice}</div>
		</div>
		<hr><hr>
		<c:if test="${transaction.refundStatus eq 0}">
			<h3>결제 내역</h3>
			<hr/><hr>
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>결제 시각</strong></div>
				<div class="col-xs-8 col-md-4" id="tranDate"></div>
			</div>
			<hr/>
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>결제 수단</strong></div>
				<div class="col-xs-8 col-md-4">${transaction.tranPaymentOption}</div>
			</div>
			<hr/>
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>결제 금액</strong></div>
				<div class="col-xs-8 col-md-4">${transaction.tranTotalPrice}</div>
			</div>
			<hr/>
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>결제 취소가능기간</strong></div>
				<div class="col-xs-8 col-md-4" id="refundableDate"></div>
			</div>
			<hr>
			<div>
				<button type="button" class="refundTransaction">결제 취소</button>
				<button type="button" class="getTicketPurchaseList">목록보기</button>
			</div>
		</c:if>
		<c:if test="${transaction.refundStatus eq 1}">
			<h3>취소 내역</h3>
			<hr/><hr>
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>결제 취소 시각</strong></div>
				<div class="col-xs-8 col-md-4" id="tranDate"></div>
			</div>
			<hr/>
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>결제 수단</strong></div>
				<div class="col-xs-8 col-md-4">${transaction.tranPaymentOption}</div>
			</div>
			<hr/>
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>취소 금액</strong></div>
				<div class="col-xs-8 col-md-4">${transaction.tranTotalPrice}</div>
			</div>
			<hr/>
			<div>
				<button type="button" class="getTicketPurchaseList">목록보기</button>
			</div>
		</c:if>      

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
