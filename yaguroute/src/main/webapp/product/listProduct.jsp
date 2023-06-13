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
	<title>listProduct</title>
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

    .search-container {
        text-align: right;
    }
</style>


<script type="text/javascript">
	function fncGetProductList(currentPage) {
		$("#currentPage").val(currentPage);
		$("form").attr("method", "GET").attr("action", "/product/listProduct")
		.submit();
	}

	$(function() {
		$("button.btn-success").on("click", function() {
			$("#prodTeamCode").val($(this).val());
			fncGetProductList(1);
		});

		$("button.btn.btn-default").on("click", function() {
			fncGetProductList(1);
		});

		$(".ct_list_pop td:nth-child(2)").on("click", function() {
			var prodNo = $(this).children('input:hidden').val();
			self.location = "/product/updateProduct?prodNo=" + prodNo;
		});
		

		$("a[href='teamCodeHref']").on('click',function(){
    		teamCode = $(this).find("input[name='teamCode']").val()
    		self.location = "/product/listProduct?prodTeamCode="+teamCode;
	   });

	});
	 $( function() {
		 
		 $.ajax(
	 				{
	 					url: "/product/json/autoComplete",
	 					method: "GET",
	 					dataType: "json",
	 					headers: {
	 						"Accept" : "application/json",
							"Content-Type" : "application/json"						
	 					},
	 					success: function(JSONData, status) {
	
	 						
	 					console.log(JSONData);
	 					
	 				    $( "#autoComplete" ).autocomplete({
	 					      source: JSONData
	 					    });
	 				
	 					}
	 					
	 				});
			 });
					
</script>

</head>



<body bgcolor="#ffffff" text="#000000">
	<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/common/topBar.jsp"/>
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
				
	<form name="detailForm">
			
			<div class="mathc-live-broadcasts background" style="display: flex; justify-content: center;">
			    <div class="broadcast-tabs-wrapper">
			        <ul class="nav nav-tabs" role="tablist">
			            <c:forEach var="team" items="${allTeam}">
			                <li class="${team.teamCode eq teamCode ?'active':''}" role="presentation">
			                    <a href="teamCodeHref" role="tab" data-toggle="tab">
			                        <img alt="img" src="${team.teamEmblem}">
			                        <span class="info">
			                            <span class="title">${team.teamNickName}</span>
			                            <input type="hidden" name="teamCode" value="${team.teamCode}"/>
			                        </span> 
			                    </a>
			                </li>
			            </c:forEach>
			        </ul>
			    </div>
			</div>
		<div class="container">
		<div class="page-header text-info">
			<div class="row">
			<div style="width: 98%; margin-left: 10px; margin-top: 20px;">

						<input type="hidden" id="prodTeamCode" name="prodTeamCode" value="${prodTeamCode}" /> 
						<input type="hidden" id="currentPage" name="currentPage" value="" />

					<div class="search-container">
						<div class="form-group" style="width: 100px;">
							<select class="form-control" name="searchCondition">
								<option value="0" ${!empty search.searchCondition && search.searchCondition == 0 ? "selected" : ""}>상품명</option>
							</select>
						</div>
						<div class="form-group" style="width: 230px;">
							<input type="text" class="form-control"  id="autoComplete" 	name="searchKeyword" placeholder="상품명으로 검색하세요"
								value="${!empty search.searchKeyword ? search.searchKeyword : ''}"> </div>

						<button type="button" class="btn btn-default">검색</button>
						<p class="text" style="font-family: 'Montserrat', sans-serif; ">전체 ${resultPage.totalCount} 건, 현재 ${resultPage.currentPage} 페이지</p>
					</div>
					

						<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">

							<thead>
								<tr>
									<th align="center" style="font-size: 14px;">번호</th>
									<th align="center" style="font-size: 14px;">제품명</th>
									<th align="center" style="font-size: 14px;">가격</th>
									<th align="center" style="font-size: 14px;">등록일</th>
									<th align="center" style="font-size: 14px;">재고</th>
									<th align="center" style="font-size: 14px;">카테고리</th>
									<th align="center" style="font-size: 14px;">팀 코드</th>
									<th align="center" style="font-size: 14px;">상품상태</th>
								</tr>
							</thead>

							<tbody>
								<c:set var="i" value="0" />
								<c:forEach var="product" items="${list}">
									<c:set var="i" value="${ i+1 }" />
									<tr class="ct_list_pop">
										<td align="center">${ i }</td>
										<td align="left" height="30"><input type="hidden" value="${product.prodNo}" /> ${product.prodName}</td>
										<td align="left">${product.prodPrice}</td>
										<td align="left">${product.prodRegDate}</td>
										<td align="left">${product.prodStock}</td>
										<td align="left">${product.prodCategory}</td>
										<td align="left">${product.prodTeamCode}</td>
										<td>${product.prodTranCode eq 'hidden' ? '숨김' : '판매중'}</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
				      </div>
			    	</div>
				</div>
		</div>
	</form>

				<!-- PageNavigation Start... -->
				<jsp:include page="../common/pageNavigator_all.jsp">
					<jsp:param name="id" value="product" />
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
