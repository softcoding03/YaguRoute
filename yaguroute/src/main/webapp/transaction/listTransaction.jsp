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
	<title>listTransaction</title>
	<link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!--  ///////////////////////// CSS ////////////////////////// -->

<head>

<style>


a.refund-link {
  color: blue;
}


</style>


<title>구매목록조회</title>
<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">

function fncGetTranDetailList() {

	$("form").attr("method", "GET").attr("action", "/transaction/listTransaction")
			.submit();
}


</script>

</head>

<body bgcolor="#ffffff" text="#000000">
	<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/common/topBar.jsp"/>
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->

				<!--BREADCRUMBS BEGIN-->
						<section class="image-header" style="height: 200px;">
						  <div class="container">
						    <div class="row">
						      <div class="col-md-8">
						        <div class="info">
						          <div class="wrap">
						            <h1>구매목록조회</h1>
						            <p style="margin-bottom: 10px;"> ★ [ ${user.userNickName} ] 님의 구매내역입니다.</p>
						          </div>
						        </div>
						      </div>
						    </div>
						  </div>
						</section>

				<!--BREADCRUMBS END-->


<div style="width:98%; margin-left:10px;">

<form name="detailForm" action="/transaction/listTransaction" method="GET">
   <input type="hidden" id="tranDetailNo" name="tranDetailNo" value="${tranDetail.tranDetailNo} "/>
   <input type="hidden" id="prodTeamCode" name="prodTeamCode" value="${product.prodTeamCode} "/>

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
		<td class="ct_list_b" >상품가격</td>
		<td class="ct_list_b" >구매수량</td>
		<td class="ct_list_b" >사용포인트</td>	
		<td class="ct_list_b">총 결제금액</td>
		<td class="ct_list_b">구매상태</td>
		<td class="ct_list_b">배송</td>
		<td class="ct_list_b">결제수단</td>
		<td class="ct_list_b">환불상태</td>	
		<td class="ct_list_b">후기등록(x)</td>			
	</tr>

	<c:set var="i" value="0"/>
		<c:forEach var="tranDetail" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<c:set var= "tranCode" value="${tranDetail.tranStatusCode}"/>
		
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
			<td align="left">${tranDetail.tranDetailProd.prodPrice}</td>
			<td align="left">${tranDetail.tranQuantity}</td>
			<td align="left">${tranDetail.tranDetailTran.tranUsePoint}</td>
			<td align="left">${tranDetail.tranDetailTran.tranTotalPrice}</td>
			<td align="left"> 현재	
					<c:if test="${tranCode eq 1}">
						구매완료
					</c:if>
					<c:if test="${tranCode eq 2}">
						배송중
					</c:if>
					<c:if test="${tranCode eq 3}">
						배송완료
					</c:if>
						상태 입니다.</td>
		<td align="left"> <c:if test="${tranCode eq 2}">
			<a href="updateTranStatusCode?tranDetailNo=${tranDetail.tranDetailNo}&tranStatusCode=3">배송도착</a>
		</c:if>
		</td>
		<td align="left">${tranDetail.tranDetailTran.tranPaymentOption}</td>
		<td align="left" >
			  <c:choose>
			    <c:when test="${tranDetail.refundStatusCode eq 1 and tranDetail.tranStatusCode eq 1}">
			      <a href="updateRefundStatusCode?tranDetailNo=${tranDetail.tranDetailNo}&refundStatusCode=2" >환불요청</a>
			    </c:when>
			  </c:choose>
		</td>		
		<td align="left">
					  <c:choose>
			    <c:when test="${tranDetail.tranStatusCode eq 3}">
			      <a href="addComment?prodNo="${tranDetail.tranDetailProd.prodNo}  class="refund-link">등록</a>
			    </c:when>
			  </c:choose>
		</td>
	</tr>
	</c:forEach>
</table>

<!-- PageNavigation Start... -->
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
	   
	
			  <input type="hidden" id="currentPage" name="currentPage" value=""/>
			
					<!-- PageNavigation Start... -->
				<jsp:include page="../common/pageNavigator_all.jsp">
					<jsp:param name="id" value="transaction" />
				</jsp:include>
				<!-- PageNavigation End... -->
						
	
    	</td>
	</tr>
</table>
<!--  페이지 Navigator 끝 -->

</form>

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
		