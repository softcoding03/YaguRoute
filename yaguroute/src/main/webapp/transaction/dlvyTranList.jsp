<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="viewport" content="width=device-width,initial-scale=1">
	<title>dlvyTranList</title>
	   <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!--  ///////////////////////// CSS ////////////////////////// -->

<head>

<style>


</style>


<title>배송현황조회</title>
<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
function fncGetDlvyTranList(currentPage) {
	$("#currentPage").val(currentPage);
	$("form").attr("method", "GET").attr("action", "/transaction/dlvyTranList")
	.submit();
}
	


</script>

</head>

<body bgcolor="#ffffff" text="#000000">
	<!-- ToolBar Start /////////////////////////////////////-->
  <jsp:include page="/admin/getAdmin.jsp"/>
	<!-- ToolBar End /////////////////////////////////////-->

				<!--BREADCRUMBS BEGIN-->

						      <div class="col-md-8" style="margin-top: 60px; margin-left:30px;">
						        <div class="info">
						          <div class="wrap">
						            <h1>상품배송관리</h1>
						          </div>
						        </div>
						      </div>


				<!--BREADCRUMBS END-->


<div style="width:98%; margin-left:10px;">

<form name="detailForm">

		<div class="container">
		<div class="page-header text-info">
			<div class="row">
<table width="100%" border="0" cellspacing="0" cellpadding="0" >
	<tr>
		<td colspan="30" >
		전체 ${resultPage.totalCount}건, 현재 ${resultPage.currentPage} 페이지</td>
	</tr>
	<tr>
		<td class="ct_list_b" >주문번호</td>
		<td class="ct_list_b" >구단</td>
		<td class="ct_list_b" >상품명</td>
		<td class="ct_list_b">총 결제금액</td>
		<td class="ct_list_b">구매상태</td>
		<td class="ct_list_b">배송</td>
		<td class="ct_list_b">결제수단</td>
		<td class="ct_list_b">환불상태</td>			
	</tr>

	<c:set var="i" value="0"/>
		<c:forEach var="tranDetail" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<c:set var= "tranCode" value="${tranDetail.tranStatusCode}"/> <!--  c:set => 페이지스코프 -->
			<c:set var= "refundStatusCode" value="${tranDetail.refundStatusCode}"/>	
	
		<tr class="ct_list_pop">
		<td align="center">${tranDetail.tranDetailNo}</td>
			<td align="center">
			  <c:choose>
			    <c:when test="${tranDetail.tranDetailProd.prodTeamCode eq 'HH'}">한화</c:when>
			    <c:when test="${tranDetail.tranDetailProd.prodTeamCode eq 'SS'}">삼성</c:when>
			    <c:when test="${tranDetail.tranDetailProd.prodTeamCode eq 'OB'}">두산</c:when>
			    <c:when test="${tranDetail.tranDetailProd.prodTeamCode eq 'KT'}">KT</c:when>
			    <c:when test="${tranDetail.tranDetailProd.prodTeamCode eq 'WO'}">키움</c:when>
			    <c:when test="${tranDetail.tranDetailProd.prodTeamCode eq 'LG'}">LG</c:when>
			    <c:when test="${tranDetail.tranDetailProd.prodTeamCode eq 'SK'}">SSG</c:when>
			    <c:when test="${tranDetail.tranDetailProd.prodTeamCode eq 'LT'}">롯데</c:when>
			    <c:when test="${tranDetail.tranDetailProd.prodTeamCode eq 'HT'}">기아</c:when>
			    <c:when test="${tranDetail.tranDetailProd.prodTeamCode eq 'NC'}">NC</c:when>
			    <c:otherwise>${tranDetail.tranDetailProd.prodTeamCode}</c:otherwise>
			  </c:choose>
			</td>
			<td align="center">${tranDetail.tranDetailProd.prodName}</td>
			<td align="left">${tranDetail.tranDetailTran.tranTotalPrice}</td>
			<td align="left"> 현재	
					<c:if test="${tranCode eq 1 && refundStatusCode eq 1 }">
						구매완료
					</c:if>
					<c:if test="${tranCode eq 2}">
						배송완료
					</c:if>
					<c:if test="${refundStatusCode eq 2}">
						환불 완료
					</c:if>													
						상태 입니다.</td>
				<td align="left">
				  <c:if test="${tranCode eq 1 and tranDetail.refundStatusCode eq 1}">
			    <a href="/transaction/updateTranStatusCode?tranDetailNo=${tranDetail.tranDetailNo}&tranStatusCode=2">배송시작</a> 
				  </c:if>
				</td>
		<td align="left">${tranDetail.tranDetailTran.tranPaymentOption}</td>	
				<td align="left">
				  <c:choose>
				    <c:when test="${refundStatusCode eq 2}">
				      환불 완료
				    </c:when>
				  </c:choose>
				</td>
	</tr>
	</c:forEach>
</table>
</div>
		</div>
	</div>

  <input type="hidden" id="currentPage" name="currentPage" value=""/>
<!-- PageNavigation Start... -->

	</form>
			
			
					<!-- PageNavigation Start... -->
				<jsp:include page="../common/pageNavigator_all.jsp">
					<jsp:param name="id" value="dlvyTran" />
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