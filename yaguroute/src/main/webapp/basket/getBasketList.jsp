<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
<link rel="icon" href="favicon.ico" type="image/x-icon">
<link href="/css/style.min.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<body>
<input type="hidden" id="sessionUserId" value="${user.userId}">
<section class="cart-wrap">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h4>Your shopping Cart</h4>
            </div>
                <table class="cart-table">
                    <tr>
                        <th></th>
                        <th class="product">상품</th>
                        <th>가격</th>
                        <th>수량</th>
                        <th class="total">총 가격</th>
                    </tr>
                    <c:forEach items="${basketList}" var="basket">
                   		<tr class="cart_iem" id="${basket.basketNo}">
                   			<input type="hidden" value="${basket.product.prodNo}" id="prodNo"/>
	                        <td class="delete"><a href="#"><i class="fa fa-close" aria-hidden="true"></i></a></td>
	                        <td class="name"><img class="product-image" src="/images/product/${basket.product.prodImage}" alt="cart-product">${basket.product.prodName}</td>
	                        <td class="cost"><fmt:formatNumber value="${basket.product.prodPrice}" pattern="###,###"/></td>
	                        <td class="quantity"><input type="number" value="${basket.prodQuantity}"></td>
	                        <td class="total"><input type="hidden" value="${basket.product.prodPrice*basket.prodQuantity}">
	                        <fmt:formatNumber value="${basket.product.prodPrice}" pattern="###,###"/>x ${basket.prodQuantity} = <h3><fmt:formatNumber value="${basket.product.prodPrice*basket.prodQuantity}" pattern="###,###"/>원</h3>
	                        </td>
                       </tr>
                   	 </c:forEach>
                </table>
            </div>
            <div class="col-md-4 col-sm-6">
            	<button type="button" id="deleteAllBasket">장바구니 비우기</button>
            </div>
            <div class="col-md-12">
	            <div class="item status">
	            	<div class="info">
			            <h3>총 가격 :<input type="hidden" value="${totalPrice}" id="totalPrice"><p class="name"><fmt:formatNumber value="${totalPrice}" pattern="###,###"/></p> 원<h3>
			            <div class="clear"></div>
			        </div>
			    </div>
            </div>
            <div class="col-md-4 col-sm-6">
            	<button type="button" id="getProdList">쇼핑 계속하기</button>
            </div>
            <div class="col-md-8 col-sm-6">
                <div class="update-wrap">
                    <button class="update">구매하기</button>
                </div>
            </div>
        </div>
</section>

</body>
<script type="text/javascript">

	function quantityChange(elem){
			elem.one("input",function(){
				$(this).parent().append('<button>수량확정</button>')
				$(this).parent().find("button").on("click",function(){
					var newQuantity = $(this).parent().find("input").val()
					var prodNo = $(this).parent().parent().find("#prodNo").val()
					var basketNo = $(this).parent().parent().attr("id");
					console.log(prodNo, newQuantity)
					$.ajax({
						url : "/basket/json/updateBasketProdQuantity/"+prodNo,
						method : "POST",
						data : JSON.stringify({
							userId : $("#sessionUserId").val(),
							basketNo : basketNo,
							prodQuantity : newQuantity
						}),
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData, status){
							var updateTotalPrice = JSONData.product.prodPrice*JSONData.prodQuantity
							
							var formatter = new Intl.NumberFormat('en-US',{style:'decimal'})
							console.log(JSONData.basketNo)
							$("#"+JSONData.basketNo+" .total").html("");
							$("#"+JSONData.basketNo+" .total").append('<input type="hidden" value='+updateTotalPrice+'>'
									+formatter.format(JSONData.product.prodPrice)+' x '+ JSONData.prodQuantity+' = '
									+'<h3>'+formatter.format(updateTotalPrice)+'</h3>')
							
							var sum = 0;
							$(".total input").each(function(index,elem){
								var num = $(elem).val();
								console.log(num)
								sum = sum + parseInt(num);
							})
							$("#totalPrice").attr("value",sum)
							$(".info .name").text(formatter.format(sum));
						}
						
					})
					
					quantityChange($(this).parent().find("input"))
					$(this).remove();
				})
			
		})
	}

	$(function(){
		
		quantityChange($(".quantity input"))
		
		$("#getProdList").on("click",function(){
			self.location = "/product/listProduct"
		})
		
		$("tr.cart_iem td.delete").on("click",function(){
			var newTotalPrice = $(this).parent().find(".total input").val()
			var basketNo = $(this).parent().attr("id");
			$.ajax({
				url : "/basket/json/deletebasket/"+$(this).parent().find("#prodNo").val(),
				method : "POST",
				data : JSON.stringify({
					userId : $("#sessionUserId").val()
				}),
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData, status){
					var newTotal = $("#totalPrice").val() - newTotalPrice
					$("#"+basketNo).remove();
					$("#totalPrice").val(newTotal)
					
					var formatter = new Intl.NumberFormat('en-US',{style:'decimal'})
					$(".info .name").text(formatter.format(newTotal));
				}
			})
		})
		
		$("#deleteAllBasket").on("click",function(){
			$.ajax({
				url : "/basket/json/deleteAllBasket",
				method : "POST",
				data : JSON.stringify({
					userId : $("#sessionUserId").val()
				}),
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData, status){
					$("tr.cart_iem").remove();
					$("#totalPrice").val(0)
					$(".info .name").text(0);
				}
				
			})
			
		})
		
		
		
		
	})
</script>
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