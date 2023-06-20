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
/* 팀탑바 위한 style */

.text-overlay {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 18px;
	margin-left: 300px;
}
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

.btn-info:hover {
	background-color: #FACC2E; /* 마우스 오버 시 배경색 변경 */
}

.btn-info {
  border-radius: 20px;
  background-color: #20B2AA;
  color: white;
  font-size: 16px;
  border: none;
  padding: 10px 20px; /* 안쪽 여백 설정 */
  color: #000000; /* 글자색 설정 */
}

		
    body {
        background-image: url('/images/baseball/prod_backImage.jpg');
        background-repeat: no-repeat;
        background-size: cover;
        background-color: rgba(0, 0, 0, 0.8); /* 투명도 조절을 위한 배경색 설정 */
    }		
</style>


<script type="text/javascript">

	function checkProdStock() { //재고수량 체크하는 함수
		var check = true; // 초기값으로 true를 가지며 재고 수량 체크 결과를 저장한다.
		$("input[type='number']").each(function(){	//type가 number인 필드를 선택, each()는 각가에 대해 반복 작업을 수행.
			var stock = $(this).parent().parent().find("#prodStock").val(); //상품재고를 찾아서  값 저장.
			var prodQuantity = $(this).val() //상품수량 체크
			if(prodQuan>stock){
				alert("재고 수량을 초과하였습니다.");
				check = false;
				return false;
			}
		})
		return check;
	}
	
	function checkInputData(){ //입력데이터를 체크하는 함수
		var check = true;
		$("input[type='number']").each(function(){
			var value = $(this).val();
			if(value<=0 || value === ''){ //변수에 저장된 값이 0보다 작거나 같거나 값이 비어있다면 !
				alert("상품은 1개 이상 구매 가능합니다.") // 1.경고창 띄우기
				check = false; //2.변수를 false로 변경하기
				$(this).val(1);
				return false; //메소드를 중지하고 반복문을 나온다.
			}else if(!checkProdStock){
				check = false;
				$(this).val(1);
				return false;
			}
		})
		
		return check;
	}
	

	$(function() {

		$("#addTran").on("click", function() {
					var prodQuantity = $("input[type='number']").val();
					var prodNo = "${product.prodNo}";
					var prodPrice = "${product.prodPrice}";
					if(parseInt(prodQuantity) < 1){
						alert("1개이상의 상품을 구매해야 합니다.");
						$("input[type='number']").val(1);
					}else{
						var addTranUrl = "/transaction/addTransaction?prodNo="+ prodNo + "&prodQuantity=" + prodQuantity
						+ "&prodPrice=" + prodPrice;
						self.location = addTranUrl;
					}
					
				});
		
		$("#addBasket").on("click", function() {
			let productNo = $("#prodNo").val();
			let userId = $("#userId").val();
			if(parseInt($("input[type='number']").val())<1){
				alert("1개이상의 상품을 담아야 합니다.");
				$("input[type='number']").val(1);
			}else{
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
			}//end of else
			
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
		
 <section class="product-single"style="background-color: rgba(256, 256, 256, 0.5); width:1400px; height:1000px; display: inline-block;"> 
		 <div class="container">
		    <div class="row">
				<div class="col-md-12">
				    <h1>PRODUCT DETAIL</h1>
				</div>
				<div class="col-md-7">
				    <div class="product-slider">
				        <div class="connected-carousels">
				            <div class="navigation jcarousel-skin-default">
				                <div class="carousel carousel-navigation jcarousel-vertical" style="max-height: 500px; overflow: hidden;">
				                    <ul>
				                        <li style="height: auto;">
				                            <img src="${product.prodImageFirst}" alt="product-thumb" onclick="changeStageImage(this)"onerror="this.style.display='none'">
				                        </li>
				                        <li style="height: auto;">
				                            <img src="${product.prodImageSecond}" alt="product-thumb" onclick="changeStageImage(this)"onerror="this.style.display='none'">
				                        </li>
				                        <li style="height: auto;">
				                            <img src="${product.prodImageThird}" alt="product-thumb" onclick="changeStageImage(this)"onerror="this.style.display='none'">
				                        </li>
				                    </ul>
				                </div>
				            </div>
				            <div class="stage" style="overflow: hidden;">
				                <div class="carousel carousel-stage" style="width: 100%; height: 500px; display: flex; align-items: center; justify-content: center;">
				                    <ul id="stageImages">
				                        <li class="stage-item">
				                            <img src="${product.prodImageFirst}" onerror="this.style.display='none'">
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
									<input id="prodStock" type="hidden" value="${product.prodStock}" id="prodStock" name="prodStock"/>
									<input id="prodQuantity" type="hidden" value="1">
		                           상품수량: <input type="number" placeholder="1" value="1">
		                            <button id="addBasket" type="button" class="btn btn-info">장바구니 담기</button>
		                            <button id="addTran" type="button" class="btn btn-info">바로구매</button>
		                        </div>
								<br> 
								 <div class="details" >
								    <ul>
								        <li style="color: blanchedalmond"><span style="color: black;">배송비: </span>무료</li>
											<li style="color: blanchedalmond">
											    <span style="color: black;">적립: </span>
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
