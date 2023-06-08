<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1.0">
<title>상품상세조회</title>
<link
	href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900"
	rel="stylesheet" />
<link rel="icon" href="favicon.ico" type="image/x-icon">
<link href="/css/style.min.css" rel="stylesheet" type="text/css" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<!-- jQuery UI toolTip 사용 CSS-->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip 사용 JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
</head>
<body bgcolor="#ffffff" text="#000000">
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		<div class="page-header text-info">
			<div class="row">

				<div style="width: 98%; margin-left: 10px;">


					<form name="detailForm">


						<p class="bg-danger">상품상세조회</p>



						<div class="background">
							<div class="broadcast-tabs-wrapper">
								<ul class="nav nav-tabs" role="tablist">
									<c:forEach var="team" items="${allTeam}">
										<li class="${team.teamCode eq teamCode ?'active':''}"
											role="presentation"><a href="teamCodeHref" role="tab"
											data-toggle="tab"> <img
												src="/images/product/baseball.png" alt="안나오는군요"> <span
												class="info"> <span class="title">${team.teamNickName}</span>
													<input type="hidden" value="${team.teamCode}" />
											</span>
										</a></li>
									</c:forEach>
								</ul>
							</div>
						</div>
						<div class="container">
							<div class="row">
								<div class="col-md-12">
									<span>
										<div class="col-md-4">
											<div>
												<img src="${teamInfo.teamEmblem}" width="300" height="300">
											</div>
											<div>${teamInfo.teamFullName}</div>
										</div>
									</span> <span>
										<div class="col-md-8">
											<input id="prodNo" type="hidden" value="${product.prodNo}">
											<input id="userId" type="hidden" value="${user.userId}">
											<input id="prodQuantity" type="hidden" value="1">

											<p></p>
											<div>상품명: ${product.prodTeamCode}${product.prodName}</div>
											<div>상품평균평점: ★★★★☆(4.3) 상품평수: 20개</div>
											<div>가격 : ${product.prodPrice}</div>
											<div>
												상품 수량 : <input type="number" name="prodQuantity" value="1">
											</div>
											<div></div>

											<button id="addBasket" type="button" class="btn btn-info">장바구니
												담기</button>
											<button id="addTran" type="button" class="btn btn-warning">바로구매</button>

										</div>
									</span>
								</div>
							</div>
						</div>
						<p class="bg-danger">아래가 진짜 상세조회다</p>

						<td width="15" height="37" align="center"><img src=""
							width="400" height="370"></td>

						<p class="bg-danger">구매후기 include</p>

						<jsp:include page="../comment/listComment.jsp" />


					</form>
				</div>
</body>
<script type="text/javascript">
	$(function() {

		$("#addBasket").on("click", function() {
			let productNo = $("#prodNo").val();
			let userId = $("#userId").val();
			$.ajax({
				url : "/basket/json/addBasket/" + productNo,
				method : "POST",
				dataType : "text",
				data : JSON.stringify({
					userId : userId,
					prodQuantity : $("input[type='number']").val()
				}),
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(data, status) {
					alert(data)
				}
			})

		})

		$("#addTran").on("click", function() {
					var prodQuantity = $("input[type='number']").val();
					var prodNo = "${product.prodNo}";
					var prodPrice = "${product.prodPrice}";
					var addTranUrl = "/transaction/addTransaction?prodNo="+ prodNo + "&prodQuantity=" + prodQuantity
							+ "&prodPrice=" + prodPrice;
					self.location = addTranUrl;
				});

	})
</script>

<script type="text/javascript" src="/js/library/jquery.js"></script>
<script type="text/javascript" src="/js/library/jquery-ui.js"></script>
<script type="text/javascript" src="/js/library/bootstrap.js"></script>
<script type="text/javascript" src="/js/library/jquery.sticky.js"></script>
<script type="text/javascript" src="/js/library/jquery.jcarousel.js"></script>
<script type="text/javascript"
	src="/js/library/jcarousel.connected-carousels.js"></script>
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

<script type="text/javascript"
	src="/js/library/chartist-plugin-legend.js"></script>
<script type="text/javascript"
	src="/js/library/chartist-plugin-threshold.js"></script>
<script type="text/javascript"
	src="/js/library/chartist-plugin-pointlabels.js"></script>

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