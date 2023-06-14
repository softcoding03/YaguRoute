<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>

	<meta charset="UTF-8">
	<meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="viewport" content="width=device-width,initial-scale=1">
	<title>getProduct</title>
	<link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<style>
.product-slider img {
    max-width: 100%;
    max-height: 100%;
}

.product-main-img {
    max-width: 100%;
    max-height: 100%;
        object-fit: contain;
}

body {
  text-align: center;
  color: #fff;
  font-family: arial;
}
.content {
  width: 800px;
  margin: 0 auto;
}
h1 {
  font-size: 34px;
  margin-bottom: 20px;
}
p {
  font-size: 16px;
  line-height: 20px;
  margin-top: 20px;
}
hr {
  width: 70px;
  height: @center-border-size;
  margin: 0 auto;
  background: @center-border-color;
  border: none;
  position: relative;
  overflow: visible;
  &:before,
  &:after {
    position: absolute;
    display: block;
    content: "";
    height: 1px;
    width: 55px;
    border-bottom: 1px solid @side-border-color;
    top: @center-border-size/2 - @side-border-size - (@side-border-size/2);
  }
  &:before {
    left: -60px;
  }
    &:after {
    right: -60px;
  }
}
</style>


<script type="text/javascript">
	$(function() {

		$("#addTran").on("click", function() {
					var prodQuantity = $("input[type='number']").val();
					var prodNo = "${product.prodNo}";
					var prodPrice = "${product.prodPrice}";
					var addTranUrl = "/transaction/addTransaction?prodNo="+ prodNo + "&prodQuantity=" + prodQuantity
							+ "&prodPrice=" + prodPrice;
					self.location = addTranUrl;
				});
		
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

	})
	
	    function changeStageImage(image) {
        var stageImages = document.getElementById("stageImages");
        stageImages.innerHTML = '<li class="stage-item"><span class="store-badge new">new</span><img src="' + image.src + '" alt="product-main-img"></li>';
    }
</script>

</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/common/topBar.jsp"/>
	<!-- ToolBar End /////////////////////////////////////-->



    <!--PRODUCT SINGLE BEGIN-->

		    <section class="product-single">
		        <div class="container">
		            <div class="row">
		<div class="col-md-12">
		    <h3>PRODUCT DETAIL</h3>
		</div>
		<div class="col-md-7">
		    <div class="product-slider">
		        <div class="connected-carousels">
		            <div class="navigation jcarousel-skin-default">
		                <div class="carousel carousel-navigation jcarousel-vertical" style="max-height: 500px; overflow: hidden;">
		                    <ul>
		                        <li>
		                            <img src="/images/product/${product.prodImageFirst}" alt="product-thumb" onclick="changeStageImage(this)"onerror="this.style.display='none'">
		                        </li>
		                        <li>
		                            <img src="/images/product/${product.prodImageSecond}" alt="product-thumb" onclick="changeStageImage(this)"onerror="this.style.display='none'">
		                        </li>
		                        <li>
		                            <img src="/images/product/${product.prodImageThird}" alt="product-thumb" onclick="changeStageImage(this)"onerror="this.style.display='none'">
		                        </li>
		                    </ul>
		                </div>
		            </div>
		            <div class="stage" style="overflow: hidden;">
		                <div class="carousel carousel-stage" style="width: 100%; height: 500px; display: flex; align-items: center; justify-content: center;">
		                    <ul id="stageImages">
		                        <li class="stage-item">
		                            <span class="store-badge new">new</span>
		                            <img src="/images/product/${product.prodImageFirst}" alt="product-main-img">
		                        </li>
		                    </ul>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
                                
                <div class="col-md-5">
                    <div class="product-right-info">
                        <div class="details">
                        <h4> 엠블럼 </h4>
                            <div class="content"><hr /></div> 
                        </div>						
						<h4>[${product.prodTeamCode}] ${product.prodName}</h4>
                        <div class="price"><input type="hidden" value="${product.prodPrice}"><fmt:formatNumber value="${product.prodPrice}" pattern="###,###"/>원</div>   
                        <br>                    
                        <div class="quantity-wrap">
                        <div>
                        	<input id="prodNo" type="hidden" value="${product.prodNo}">
							<input id="userId" type="hidden" value="${user.userId}">
							<input id="prodQuantity" type="hidden" value="1">
                           상품수량: <input type="number" placeholder="1" value="1">
                            <button id="addBasket" type="button" class="btn btn-info">장바구니 담기</button>
                            <button id="addTran" type="button" class="btn btn-warning">바로구매</button>
                        </div>
						<br> 
						 <div class="details">
						    <ul>
						        <li><span>배송비: </span>무료</li>
									<li>
									    <span>적립: </span>
									    <c:set var="accumulation" value="${product.prodPrice * 0.01}" />
										<fmt:formatNumber value="${accumulation % 1 eq 0 ? accumulation.intValue() : accumulation}" pattern="###,###"/> 포인트 </li> 
									    <li style="font-size: 12px;"><span style="font-size: 12px;">구매금액의 1%가 포인트로 적립됩니다. </span></li>

						    </ul>
						</div>
					</div>
			</div>
   </div>
   
   </div>
   </div>
   
   </section>
   
   <br>
      <br>


        <div class="product-tab-wrap">
            <div class="tab-top">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <ul>
                                <li><a href="#description"></a></li>
                                <li ><a href="#reviews"></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!--STORE BANNER BEGIN-->
   

   
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
