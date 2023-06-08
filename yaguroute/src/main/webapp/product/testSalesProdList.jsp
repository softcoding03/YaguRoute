
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>

	<meta charset="UTF-8">
	<meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="viewport" content="width=device-width,initial-scale=1">
	<title>salesProdList</title>
	<link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>



<style>
.form-group {
	display: inline-block;
	margin-right: 10px;
}

.btn {
	display: inline-block;
}

	  body {
            padding-top : 50px;
        }
        
        .thumbnail {
        
        width:260px;
        height:260px;

        }


</style>




<script type="text/javascript">
	function fncGetSalesProdList(currentPage) {
		$("#currentPage").val(currentPage);
		$("form").attr("method", "GET").attr("action", "/product/salesProdList")
				.submit();
	}

	$(function() {
		$("button.btn-success").on("click", function() {
			$("#prodTeamCode").val($(this).val());
			fncGetSalesProdList(1);
		});

		$("button.btn.btn-default").on("click", function() {
			fncGetSalesProdList(1);
		});

		$(".ct_list_pop td:nth-child(2)").on("click", function() {
			var prodNo = $(this).children('input:hidden').val();
			self.location = "/product/getProduct?prodNo=" + prodNo;
		});

	});


</script>

</head>



<body bgcolor="#ffffff" text="#000000">

	<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/common/topBar.jsp"/>
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		<div class="page-header text-info">
			<div class="row">

				<div style="width: 98%; margin-left: 10px;">



					<form name="detailForm">

						<input type="hidden" id="prodTeamCode" name="prodTeamCode" value="${prodTeamCode}" /> <input type="hidden" id="currentPage"
							name="currentPage" value="" />

						<table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="15" height="37">
								<img src="/images/product/baseball.png" width="40" height="37" /></td>
								<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 20px;">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="93%" class="ct_ttl01">판매상품관리(관리자)</td>
										</tr>
									</table>

								</td>
								<td width="12" height="37"><img
									src="/images/ct_ttl_img03.gif" width="12" height="37" /></td>
							</tr>
						</table>

						<table height="50">
							<tr>
								<td>
									<button type="button" class="btn btn-success" value="NN">전체</button>
									<button type="button" class="btn btn-success" value="NC">NC</button>
									<button type="button" class="btn btn-success" value="OB">두산</button>
									<button type="button" class="btn btn-success" value="HH">한화</button>
									<button type="button" class="btn btn-success" value="HT">KIA</button>
									<button type="button" class="btn btn-success" value="KT">KT</button>
									<button type="button" class="btn btn-success" value="LG">LG</button>
									<button type="button" class="btn btn-success" value="LT">롯데</button>
									<button type="button" class="btn btn-success" value="SK">SSG</button>
									<button type="button" class="btn btn-success" value="SS">삼성</button>
									<button type="button" class="btn btn-success" value="WO">키움</button>
								</td>
							</tr>
						</table>



						<div class="form-group" style="width: 100px;">
							<select class="form-control" name="searchCondition">
								<option value="0"
									${!empty search.searchCondition && search.searchCondition == 0 ? "selected" : ""}>상품명</option>
							</select>
						</div>

						<div class="form-group" style="width: 230px;">

							<input type="text" class="form-control" id="autoComplete" 	name="searchKeyword" placeholder="상품명으로 검색하세요"
								value="${!empty search.searchKeyword ? search.searchKeyword : ''}"> </div>

						<button type="button" class="btn btn-default">검색</button>

						<p class="text-primary">전체 ${resultPage.totalCount} 건, 현재
							${resultPage.currentPage} 페이지</p>


					</form>
				</div>
				
				
<div class="row text-center">
  <c:forEach var="product" items="${list}">
    <div class="col-md-3">
      <div class="thumbnail">
        <img src="/images/uploadFiles/${product.prodImage }"/>
        <div class="caption">
          <h3>${product.prodName}</h3>
          <p>${product.prodPrice}</p>
        </div>
      </div>
    </div>
  </c:forEach>
</div>

				<!-- PageNavigation Start... -->
				<jsp:include page="../common/pageNavigator_all.jsp">
					<jsp:param name="id" value="salesProd" />
				</jsp:include>
				<!-- PageNavigation End... -->
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
