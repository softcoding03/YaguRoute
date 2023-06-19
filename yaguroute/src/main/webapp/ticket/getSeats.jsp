<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	var priceTag = 0; //총 가격
	var ticketNoList = "";

	$(function() {
		var tdCount = 0; //선택 좌석 수
		//좌석 클릭 시 동적으로 작동 로직
		$(document)
				.on(
						"click",
						"label:nth-child(n+1)",
						function(event) {
							if ($(this).siblings("input").is(
									"input[name='checkedbox']")) {
								alert("이미 판매된 좌석입니다.")
								event.preventDefault();
							} else {
								var seatPrice = Number($(this).siblings(
										"input[name='seatPrice']").val());
								var price = seatPrice.toLocaleString(); //숫자 1,000 형식으로 변경
								var seatCode = $(this).siblings(
										"input[name='seatCode']").val();
								var ticketNo = $(this).siblings(
										"input[name='ticketNo']").val();
								var value = seatCode
										+ "&nbsp;&nbsp;-&nbsp;&nbsp;" + price
										+ "원";
								console.log("클릭" + price + "//" + seatCode);
								var insertPosition = $('#insertPosition')
								var insertBody = "<div class=\"seat\" id="+seatCode+">"
										+ "<tr>"
										+ "<td>"
										+ "<input type=\"text\" value="+value+"></input>"
										+ "<input type=\"hidden\" name=\"ticketNo\" value="+ticketNo+"></input>"
										+ "</td>" + "</div>";

								if (insertPosition.find("div#" + seatCode).length > 0) {//해당 div가 존재한다면
									insertPosition.find("div#" + seatCode)
											.remove();
									tdCount--;
									priceTag -= seatPrice;
									ticketNoList = ticketNoList.replace(
											ticketNo, "");
								} else if (tdCount > 3) {
									alert("좌석은 최대 4개까지 선택가능합니다.");
									event.preventDefault(); //클릭 이벤트 취소
								} else {
									insertPosition.append(insertBody);
									tdCount++;
									priceTag += seatPrice;
									ticketNoList += ticketNo;
								}//end of if

								var text = priceTag.toLocaleString() + "원";
								$("#priceTag").text(text); //총 가격
								$("#tranTotalPrice").val(priceTag);
								console.log(tdCount);
								console.log(ticketNoList);
							}
						});
	});//end of 좌석 클릭 로직

	//아임포트 + NAVER SENS
	$(function() {
		$("button.back").on('click', function() {
			history.back();
		});
		$("button.reload").on('click', function() {
			location.reload();
		});

		//결제버튼 클릭
		$(document).on("click","button.addPurchase",function() {
			if (priceTag != 0) { //0원이 아닐때(좌석선택필수)
				$.ajax({ //좌석 상태 check ajax
						url : "/ticket/rest/checkStatus/"+ ticketNoList,
						method : "GET",
						dataType : "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(Data, status) {
							console.log("ajax 결과는?" + Data);
							if (Data.length == 0) {
								$.ajax({ //update 1 ajax
											url : "/ticket/rest/updateTicketStatus1/"+ ticketNoList,
											method : "GET",
											dataType : "json",
											headers : {
												"Accept" : "application/json",
												"Content-Type" : "application/json"
											},
											success : function(Data,status) {
												console.log(Data);
											}
								}); //update 1 ajax 끝
								requestPay(); //결제 시작
							} else if (Data.length > 0) {
								alert("이미 판매된 좌석입니다. 다른좌석을 선택해주세요. \n판매된 좌석 => "+ Data);
								location.reload();
							}
						}
					});//check ajax 끝
			} else {
				alert("좌석을 선택하지 않으셨습니다.")
			}
		});

		//아임포트 변수
		var UID = new Date().getTime().toString(20); //유니크한 값 + 제품 번호
		console.log(UID);
		const IMP = window.IMP;
		IMP.init("imp13567041");

		function requestPay() {
			console.log("pay시작");
			IMP.request_pay(
							{ // 요청객체
								pg : "html5_inicis",
								merchant_uid : UID, // 주문번호
								name : "야구루트사이트 티켓구매", //상품 이름
								amount : priceTag, //총 가격
								buyer_email : "${user.userEmail}",
								buyer_name : "${user.userName}", //고객이 입력한 이름
								buyer_tel : "${user.userPhone}", //고객이 입력한 번호
							},
							function(rsp) { // callback객체
								if (rsp.success) { // 결제 성공 시 로직
									console.log(rsp);
									console.log(rsp.imp_uid);
									console.log(rsp.merchant_uid);
									console.log(rsp.pay_method);
									$('#impNo').val(rsp.imp_uid); //controller의 purchase객체에 imp,mer의 uid값,결제수단 넘겨주기위함.
									$('#merchantNo').val(rsp.merchant_uid);
									$('#payMethod').val(rsp.pay_method);

									if (rsp.paid_amount == priceTag) { // 결제 후 검증 로직
										console.log("가격검증 및 결제성공.");
										fncAddPurchase(); //db 저장할 때 결제번호라든지 결제 정보도 추가 저장해주기 (컬럼만들고)
										//SMS 발송 ajax
										$.ajax({
												url : "/ticket/rest/sendSMS/${ticketList[0].game.gameCode}",
												method : "GET",
												dataType : "text",
												headers : {
													"Accept" : "application/json",
													"Content-Type" : "application/json"
												},
												success : function(Data,status) {
												}
										});//SMS 발송 끝
									} else {
										$.ajax({ //update 0 ajax
												url : "/ticket/rest/updateTicketStatus0/"+ ticketNoList,
												method : "GET",
												dataType : "text",
												headers : {
													"Accept" : "application/json",
													"Content-Type" : "application/json"
												},
												success : function(Data,status) {
													console.log(Data);
													if(Data=="success"){
														location.reload();
													}
												}
										}); //update 0 ajax 끝
										alert("결제 실패 : 가격이 위조 되었습니다.");
									}
								} else {
									$.ajax({ //update 0 ajax
										url : "/ticket/rest/updateTicketStatus0/"+ ticketNoList,
										method : "GET",
										dataType : "text",
										headers : {
											"Accept" : "application/json",
											"Content-Type" : "application/json"
										},
										success : function(Data, status) {
											console.log(Data);
											if(Data=="success"){
												location.reload();
											}
										}
									}); //update 0 ajax 끝
									alert("결제에 실패하였습니다. 에러 내용: "+ rsp.error_msg);
								}
							});
		}
		; //function requestPay() 끝
	});
	//아임포트 + NAVER SENS 끝

	function fncAddPurchase() {
		var post = {
			tranTotalPrice : $("#tranTotalPrice").val(),
			tranPaymentOption : $("#payMethod").val(),
			impNo : $("#impNo").val(),
			merchantNo : $("#merchantNo").val(),
			ticket : ticketNoList
		}
		console.log("ticket ? " + ticketNoList);

		$
				.ajax({
					type : 'POST',
					url : '/ticket/rest/addTicketPurchase',
					data : post,
					dataType : "text",
					success : function(Data, status) {
						if (Data == "success") {
							window.close();
							window.opener.location.href = "/ticket/getTicketPurchaseList";
						} else {
							alert("로그인 세션이 만료되었습니다.")
						}
					}
				});
	}
</script>
<style>
.col-md-2 {
	width: 10%; /* 가로줄에 10개를 띄우기 위해 10%로 설정 */
	float: left; /* 가로 정렬을 위해 float 속성 사용 */
	transform: scale(2.0); /* 크기 조정 */
}

h1, h4 {
	color: white;
}

.text-overlay {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 18px;
	margin-left: 300px;
	/* 기타 스타일 속성 설정 */
}

.ground {
	width: 95%;
}

.back {
	
}

#insertPosition {
	transform: scale(1.2); /* 크기 조정 */
}

button[type="button"]:hover {
	background-color: #99BEFF;
}

button[type="button"] {
	width: 30%;
	height: 45px;
	background-color: #ffffff;
	color: #000000;
	border: 1px solid #ccc;
	border-radius: 5px;
	cursor: pointer;
	font-size: 15px;
}

button.back {
	width: 40%;
	height: 30px;
}

button.reload {
	width: 50%;
	height: 30px;
}
</style>
</head>
<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-L1DH7W8BRC"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());

	gtag('config', 'G-L1DH7W8BRC');
</script>

<body>
	<!--CLUB STAFF TOP BEGIN-->
	<div>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<img class="teamTopBar" src="${game.homeTeam.teamTopBar}">
					<div class="text-overlay">
						<h1>${game.homeTeam.teamNickName} &nbsp;vs&nbsp; ${game.awayTeam.teamNickName}</h1>
						<h4>${game.gameDate}/ ${game.gameTime}</h4>
						<button type="button" class="back">이전단계</button>
						&nbsp;&nbsp;
						<button type="button" class="reload">좌석새로고침</button>
					</div>
				</div>
			</div>
			<br>
			<br>
			<div class="row">
				<div class="col-md-8">
					<div>
						<img class="ground" src="/images/ticket/ground.png">
					</div>
					<br>
					<br>
					<c:forEach var="ticket" items="${ticketList}" varStatus="status">
						<div class="col-md-2">
							<a href="javascript:seat;" class="item">
								<c:choose>
									<c:when test="${ticket.ticketStatus eq 0}">
										<input type="hidden" name="seatPrice" value="${ticket.seatPrice}">
										<input type="hidden" name="seatCode" value="${ticket.seatCode}">
										<input type="hidden" name="ticketNo" value="${ticket.ticketNo}">
										<input type="checkbox" name="checkbox" class="filter-check" id="test${status.count}" value="${status.count}">
										<label for="test${status.count}" />
										<hr>
									</c:when>
									<c:when test="${ticket.ticketStatus eq 1}">
										<input checked type="checkbox" name="checkedbox" class="filter-check green" id="test${status.count}">
										<label for="test${status.count}" />
										<hr>
									</c:when>
								</c:choose>
							</a>
						</div>
					</c:forEach>
				</div>
				<form>
					<div class="col-md-4">
						<table id="insertPosition">
							<div>
								<tr>
									<td>좌석 번호 // 가격</td>
							</div>
						</table>
						<div class="col-md-6">
							<h5>총가격 :</h5>
						</div>
						<div class="col-md-6">
							<h5>
								<a id="priceTag" value=""></a>
							</h5>
						</div>
					</div>
					<div class="col-md-12">
						<p style="color:red;">*1인 최대 4매까지 구매 가능합니다.</p>
						<p style="color:red;">*구매한 티켓은 경기시작 하루 전 23시까지 취소 가능합니다.</p>
					</div>
					<input type="hidden" id="tranTotalPrice" name="tranTotalPrice" value="" />
					<input type="hidden" id="payMethod" name="tranPaymentOption" value="" />
					<input type="hidden" id="impNo" name="impNo" value="" />
					<input type="hidden" id="merchantNo" name="merchantNo" value="" />
					<button type="button" class="addPurchase">결제하기</button>
				</form>
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
