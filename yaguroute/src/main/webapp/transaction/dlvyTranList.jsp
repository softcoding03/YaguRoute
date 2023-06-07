<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1.0">

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


<html>
<head>
<title>배송현황</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">



</script>

</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm" action="/transaction/dlvyTranList" method="GET">



					<!-- controller에 값 넘겨주기위한 hidden 목록 form안에 작성-->
					<input type="hidden" id="prodNo" name="prodNo" value="${tranDetail.tranDetailProd.prodNo}" /> 
					<input type="hidden" id="tranNo" name="tranNo" value="${transaction.tranNo} " /> 
					<input type="hidden" name="tranStatusCode" value="${tranDetail.tranStatusCode }"/>
					<input type="hidden" id="prodTeamCode" name="prodTeamCode" value="${prodTeamCode}" /> 
					<input type="hidden" id="tranQuantity" name="tranQuantity" value="${tranDetail.tranQuantity}" />
					<input type="hidden" id="prodPrice" name="prodPrice" value="${product.prodPrice}" />
					<!-- controller에 값 넘겨주기위한 hidden 목록 form안에 작성-->

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">배송현황</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>



<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="30" >
		전체 ${resultPage.totalCount}건, 현재 ${resultPage.currentPage} 페이지</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">주문번호</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">구매방법</td>
		<td class="ct_line02"></td>	
		<td class="ct_list_b" width="150">상품가격</td>
		<td class="ct_line02"></td>		
		<td class="ct_list_b" width="150">총 가격</td>
		<td class="ct_line02"></td>	
		<td class="ct_list_b" width="150">수령인 이름</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">수령인 휴대폰 번호</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">배송상태</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">배송수정</td>
	</tr>
	<tr>
		<td colspan="30" bgcolor="808285" height="1"></td>
	</tr>



		<c:set var="i" value="0"/>
		<c:forEach var="transaction" items="${list}">
			<c:set var="i" value="${ i+1 }" />

			<c:set var="tranCode" value="${fn:trim(tranDetail.tranStatusCode)}"/>
			
			
		<tr class="ct_list_pop">
			<td align="center"> ${transaction.tranNo}	</td>
		
		<td></td>

		<td align="center">${transaction.tranPaymentOption}</td>
		<td></td>
				<td align="left">${product.prodPrice}</td>
		<td></td>
				<td align="left">${transaction.tranDate}</td>
		<td></td>
				<td align="left">${transaction.tranTotalPrice}</td>
		<td></td>
		<td align="left">${transaction.receiverName}</td>
		<td></td>
		<td align="left">${transaction.receiverPhone}</td>
		<td></td>
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


		<td></td>
		<td align="left">
		<c:if test="${tranCode eq 2}">

			<a href="/updateTranCode?tranNo=${transaction.tranNo}&tranCode=3">배송도착</a>
		</c:if>
		</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
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
					<jsp:param name="id" value="dlvyTran" />
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
		