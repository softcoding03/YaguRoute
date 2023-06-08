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
	<title>updateProductView</title>
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

	$(function() {
		function fncUpdateProduct() {
	
			//Form 유효성 검증  	
			var name = $("input[name='prodName']").val();
			var price = $("input[name='prodPrice']").val();
			var stock = $("input[name='prodStock']").val();
			var category = $("select[name='prodCategory']").val();
			var teamcode = $("select[name='prodTeamCode']").val();
	
			if (name == null || name.length < 1) {
				alert("상품명은 반드시 입력하여야 합니다.");
				return;
			}
			if (price == null || price.length < 1) {
				alert("가격은 반드시 입력하셔야 합니다.");
				return;
			}
			if (stock == null || stock.length < 1) {
				alert("재고는 반드시 입력하셔야 합니다.");
				return;
			}
			if (category == null || category.length < 1) {
				alert("상품카테고리는 반드시 입력하셔야 합니다.");
				return;
			}
			if (teamcode == null || teamcode.length < 1) {
				alert("팀 코드는 반드시 입력하셔야 합니다.");
				return;
			}
			// 폼 제출
			$("form").attr("enctype", "multipart/form-data").attr("method", "GET").attr("action", "/product/updateProduct").submit();
		}
	
		$("#updateProduct").on('click', function() {
			fncUpdateProduct();
		});

	});
	

</script>

</head>
<body>
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
		        <h4 style="text-align: center;">Update Product Information</h4>
		            <div class="col-md-6">
		                <div class="background-section">
		                    <ul class="player-trophy">
		                        <li>
		                            <img src="/images/product/${product.prodImageFirst}" width="100" height="150" alt="trophy">
		                        </li>
		                        <li>
		                            <img src="/images/product/${product.prodImageSecond}" width="100" height="150" alt="trophy">
		                        </li>
		                        <li>
		                           <img src="/images/product/${product.prodImageThird}" width="100" height="150" alt="trophy">
		                        </li>
		                    </ul>
		                </div>
		            </div>
	  				<div class="col-md-6">
		                <div class="overflow-scroll">
		                    <table>

                        <tr>
                            <td>상품명: </td>
                            <td class="club">  <input type="text" name="prodName" value="${product.prodName}"></td>
                        </tr>
                        
                        <tr>
                            <td>가격: </td>
                            <td class="club"> <input type="text" name="prodName" value="${product.prodPrice}"></td>
                        </tr>
                        
						<tr>
						    <td>상품 카테고리: </td>
						    <td class="club">
						        <select name="prodCategory">
						            <option value="1" <c:if test="${product.prodCategory == 1}">selected</c:if>>유니폼</option>
						            <option value="2" <c:if test="${product.prodCategory == 2}">selected</c:if>>모자</option>
						            <option value="3" <c:if test="${product.prodCategory == 3}">selected</c:if>>야구용품</option>
						            <option value="4" <c:if test="${product.prodCategory == 4}">selected</c:if>>잡화</option>
						        </select>
						    </td>
						</tr>
						 
						<tr>
						    <td>구단: </td>
						    <td class="club">        
						        <select name="prodTeamCode">
						            <option value="HH" <c:if test="${product.prodTeamCode eq 'HH'}">selected</c:if>>한화</option>
						            <option value="OB" <c:if test="${product.prodTeamCode eq 'OB'}">selected</c:if>>두산</option>
						            <option value="SS" <c:if test="${product.prodTeamCode eq 'SS'}">selected</c:if>>삼성</option>
						            <option value="KT" <c:if test="${product.prodTeamCode eq 'KT'}">selected</c:if>>KT</option>
						            <option value="SK" <c:if test="${product.prodTeamCode eq 'SK'}">selected</c:if>>SSG</option>
						            <option value="WO" <c:if test="${product.prodTeamCode eq 'WO'}">selected</c:if>>키움</option>
						            <option value="NC" <c:if test="${product.prodTeamCode eq 'NC'}">selected</c:if>>NC</option>
						            <option value="LG" <c:if test="${product.prodTeamCode eq 'LG'}">selected</c:if>>LG</option>
						            <option value="LT" <c:if test="${product.prodTeamCode eq 'LT'}">selected</c:if>>롯데</option>
						            <option value="${product.prodTeamCode}" <c:if test="${product.prodTeamCode ne 'HH' && product.prodTeamCode ne 'OB' && product.prodTeamCode ne 'SS' && product.prodTeamCode ne 'KT' && product.prodTeamCode ne 'SK' && product.prodTeamCode ne 'WO' && product.prodTeamCode ne 'NC' && product.prodTeamCode ne 'LG' && product.prodTeamCode ne 'LT'}">selected</c:if>>${product.prodTeamCode}</option>
						        </select>                         
						    </td>                  
						</tr>
						 	
						<tr>					 
                            <td>상품 재고: </td>
                            <td class="club"> <input type="text" name="prodName" value="${product.prodStock}"></td>
                        </tr>                       
                        
                    </table>
	                    <div style="display: flex; justify-content: center; align-items: center; height: 50vh;">
							<button id="updateProduct" type="button" class="btn btn-warning">수정</button>
							&nbsp;
							<button id="updateProdCancle" type="button" class="btn btn-warning">취소</button>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section> 
 
   
                      
<!--PLAYER STATS END-->
   


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