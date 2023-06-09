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
	<title>updateProduct</title>
	<link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<style>

.player-trophy li img {
  width: 50%;
  height: 50%;
  object-fit: contain;
}

.background-section {
  display: inline-block;
  text-align: center;
  
}

</style>


<script type="text/javascript">

function fncGetProductList(currentPage) {
	$("#currentPage").val(currentPage);
	$("form").attr("method", "GET").attr("action", "/product/listProduct?prodTeamCode='ALL'")
			.submit();
}	

$(function() {
	  // 수정 버튼 클릭 이벤트 처리
	  $("#commit").on("click", function() {
		  fncGetProductList();
	  });
	});

</script>

</head>
<body>
	<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/common/topBar.jsp"/>
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
		<form name="detailForm">
				<!--BREADCRUMBS BEGIN-->
					<section class="image-header" style="height: 200px;">
					  <div class="container">
					    <div class="row">
					      <div class="col-md-8">
					        <div class="info">
					          <div class="wrap">
					            <h1>업데이트 수정</h1>
					          </div>
					        </div>
					      </div>
					    </div>
					  </div>
					</section>
				<!--BREADCRUMBS END-->

        <!--PLAYER STATS BEGIN-->
        
<section class="hockey-stats">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h6>Update Product imformation</h6>
                <div class="overflow-scroll">
                    <table>

                        <tr>
                            <td>상품명: </td>
                            <td class="club"> ${product.prodName } </td>
                        </tr>
                        
                        <tr>
                            <td>가격: </td>
                            <td class="club"> ${product.prodPrice} 원</td>
                        </tr>
                        
						 <tr>
                            <td>상품 카테고리: </td>
                           <td class="club">
	                            <c:choose>
							            <c:when test="${product.prodCategory == 1}">
							                유니폼
							            </c:when>
							            <c:when test="${product.prodCategory == 2}">
							                모자
							            </c:when>
							            <c:when test="${product.prodCategory == 3}">
							                야구용품
							            </c:when>
							            <c:when test="${product.prodCategory == 4}">
							                잡화
							            </c:when>
							            <c:otherwise>
							                ${product.prodCategory}
							            </c:otherwise>
							        </c:choose>
							 </td>                           
                        </tr>
 
 						 <tr>
                            <td>구단: </td>
                            <td class="club">        
						        <c:choose>
						            <c:when test="${product.prodTeamCode eq 'HH'}">한화</c:when>
						            <c:when test="${product.prodTeamCode eq 'OB'}">두산</c:when>
						            <c:when test="${product.prodTeamCode eq 'SS'}">삼성</c:when>
						            <c:when test="${product.prodTeamCode eq 'KT'}">KT</c:when>
						            <c:when test="${product.prodTeamCode eq 'SK'}">SSG</c:when>
						            <c:when test="${product.prodTeamCode eq 'HT'}">기아</c:when>						            
						            <c:when test="${product.prodTeamCode eq 'WO'}">키움</c:when>
						            <c:when test="${product.prodTeamCode eq 'NC'}">NC</c:when>
						            <c:when test="${product.prodTeamCode eq 'LG'}">LG</c:when>
						            <c:when test="${product.prodTeamCode eq 'LT'}">롯데</c:when>
						            <c:otherwise>${product.prodTeamCode}</c:otherwise>
						        </c:choose>                             
     						 </td>                  
 						 <tr>
 						 
                            <td>상품 재고: </td>
                            <td class="club"> ${product.prodStock} 개</td>
                        </tr>                       
                        
                    </table>
                    
                    		<button id="commit" type="button" class="btn btn-warning">확인(목록으로)</button>
                </div>
            </div>
            <div class="col-md-6">
                <div class="background-section">
                    <ul class="player-trophy">
                        <li>
                            <img src="/images/product/${product.prodImageFirst}" width="100" height="150" alt="이미지가 나오질 않어">
                        </li>
                        <li>
                            <img src="/images/product/${product.prodImageSecond}" width="100" height="150" alt="이미지가 나오질 않어">
                        </li>
                        <li>
                           <img src="/images/product/${product.prodImageThird}" width="100" height="150" alt="이미지가 나오질 않어">
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
        
        
        
        
                      
<!--PLAYER STATS END-->
   
   </form>


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