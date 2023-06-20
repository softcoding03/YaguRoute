<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			var refundPrice = $(".refundPrice").text();
			var purchasePrice = $(".purchasePrice").text();
			console.log(refundPrice+"&"+purchasePrice);
			refundPrice = Number(refundPrice).toLocaleString();
			purchasePrice = Number(purchasePrice).toLocaleString();
			$(".refundPrice").text(refundPrice+"원");
			$(".purchasePrice").text(purchasePrice+"원");
			
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
										location.reload();
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
		 	$('.closeWindow').on("click" , function() {
					window.close();
					window.opener.location.reload();
			});
		});
</script>
<style>
		button[type="button"]:hover {
			background-color: #99BEFF;
		}
		
		button[type="button"] {
			width: 20%;
			height: 45px;
			background-color: #ffffff;
			color: #000000;
			border: 1px solid #ccc;
			border-radius: 5px;
			cursor: pointer;
			font-size: 15px;
			text-align: center;
		}
		.rowTitle {
			text-align: center;
		}
		img {
			width:250px;
		}
		div.vs {
			display: flex;
			align-items: center;
			justify-content: center;
			height: 100%;
		}
		div.vs img {
			margin: 50px;
			height: 100px;
		}
		div.player-info.h3 {
			font-family:"Gwangyang" !important;
		}
		
</style>
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


	<!--PLAYER SINGLE WRAP BEGIN-->
	<div class="container">
		<div clas="row">
			<div class="col-xs-5 col-sm-5 col-md-5"><img src="${ticketList[0].game.homeTeam.teamEmblem}"></div>
			<div class="col-xs-2 col-sm-2 col-md-2 vs"><img src="/images/ticket/vs.png"></div>
			<div class="col-xs-5 col-sm-5 col-md-5"><img src="${ticketList[0].game.awayTeam.teamEmblem}"></div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="rowTitle">
				<div class="col-xs-6 col-sm-6 col-md-6">
						
				</div>
				<div class="col-xs-6 col-sm-6 col-md-6">
						
				</div>
			</div>
				<div class="col-md-12">
					<div class="player-info">
						<h3>예매 내역</h3>
							<div class="row">
						  		<div class="col-xs-4 col-md-4"><strong>매치업</strong></div>
								<div class="col-xs-8 col-md-8">${ticketList[0].game.homeTeam.teamFullName}&nbsp;&nbsp; vs &nbsp;&nbsp;${ticketList[0].game.awayTeam.teamFullName}</div>
							</div>
							<hr>
							<div class="row">
						  		<div class="col-xs-4 col-md-4"><strong>경기 일시</strong></div>
								<div class="col-xs-8 col-md-8" id="tranDate">${ticketList[0].game.gameDate}</div>
							</div>
							<hr/>
							<div class="row">
						  		<div class="col-xs-4 col-md-4"><strong>경기 장소</strong></div>
								<div class="col-xs-8 col-md-8">${ticketList[0].game.homeTeam.stadiumName}</div>
							</div>
						<hr>
						<h3>티켓 정보</h3>
						<div class="overflow-scroll">
							<table>
								<tr>
									<th></th>
									<th>티켓번호</th>
									<th>좌석번호</th>
									<th>가격</th>
									
								</tr>
				  				<c:forEach var="ticket" items="${ticketList}" varStatus="status">
				  				<tr>
				  					<td align="left">${status.index + 1}</td>
				  					<td align="center">${ticket.ticketNo}</td>
					            <td align="left">${ticket.seatCode}</td>
					            <td align="left" >${ticket.seatPrice}</td>
				  				</tr>
				  				</c:forEach>
							</table>
						</div>
						<c:if test="${transaction.refundStatus eq 0}">
							<h3>결제 내역</h3>
							<div class="row">
								<fmt:parseDate value="${transaction.tranDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
					 		 	<fmt:formatDate value="${parsedDateTime}" pattern="yyyy년 MM월 dd일 hh시 mm분" var="DateTime"/>
						  		<div class="col-xs-4 col-md-2"><strong>결제 시각</strong></div>
								<div class="col-xs-8 col-md-4 tranDate">${DateTime}</div>
							</div>
							<hr/>
							<div class="row">
						  		<div class="col-xs-4 col-md-2"><strong>결제 수단</strong></div>
								<div class="col-xs-8 col-md-4">${transaction.tranPaymentOption}</div>
							</div>
							<hr/>
							<div class="row">
						  		<div class="col-xs-4 col-md-2"><strong>결제 금액</strong></div>
								<div class="col-xs-8 col-md-4 purchasePrice">${transaction.tranTotalPrice}</div>
							</div>
							<hr/>
							<div class="row">
								<fmt:parseDate value="${transaction.refundableDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
					 		 	<fmt:formatDate value="${parsedDateTime}" pattern="yyyy년 MM월 dd일 hh시 mm분" var="DateTime"/>
						  		<div class="col-xs-4 col-md-2"><strong>결제 취소가능기간</strong></div>
								<div class="col-xs-8 col-md-4 refundableDate">${DateTime}</div>
							</div>
							<hr>
							
						</c:if>
						<c:if test="${transaction.refundStatus eq 1}">
							<h3>취소 내역</h3>
							<div class="row">
								<fmt:parseDate value="${transaction.tranDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
					 		 	<fmt:formatDate value="${parsedDateTime}" pattern="yyyy년 MM월 dd일 hh시 mm분" var="DateTime"/>
						  		<div class="col-xs-4 col-md-2"><strong>결제 취소 시각</strong></div>
								<div class="col-xs-8 col-md-4 tranDate">${DateTime}</div>
							</div>
							<hr>
							<div class="row">
						  		<div class="col-xs-4 col-md-2"><strong>결제 수단</strong></div>
								<div class="col-xs-8 col-md-4">${transaction.tranPaymentOption}</div>
							</div>
							<hr>
							<div class="row">
						  		<div class="col-xs-4 col-md-2"><strong>취소 금액</strong></div>
								<div class="col-xs-8 col-md-4 refundPrice">${transaction.tranTotalPrice}</div>
							</div>
						</c:if>      
					</div>
				</div>
				<hr>
				<div class="col-md-12">
					<p style="color:red;">*티켓 취소는 경기 시작 하루 전 23:00까지 가능합니다.<br> ex) 5월12일 14:00 경기 -> 5월11일 23:00까지 취소 가능</p>
				</div>
				<hr>
				<div style="text-align: center;margin-bottom:30px;" class="col-md-6">
					<button type="button" class="closeWindow" style=" display: inline-block;">확인</button>
					<c:if test="${transaction.refundStatus eq 0}">
					<button type="button" class="refundTransaction" style=" display: inline-block;">결제취소</button>
					</c:if>
				</div>
			</div>
		</div>
	<!--PLAYER SINGLE WRAP END-->      

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
