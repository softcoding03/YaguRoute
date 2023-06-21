<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>야구ROUTE</title>
</head>

<link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
<link rel="icon" href="favicon.ico" type="image/x-icon">
<link href="/css/style.min.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>
	input:invalid {
	  border: 3px solid red;
	}
	.proceed{
		width: 12% !important;
		font-size: 12px !important;
		font-weight: 600;
		font-family: Montserrat,sans-serif;
	}
	.to-right{
		float: right;
	}
	.col-md-12{
		width: 100%;
	}
	#confirmQuan{
		margin-top: 15px;
		height: 20px;
	}
	.btn{
		padding: 8px 8px 8px 8px !important;
		font-size: 12px !important;
	}
	.center-wrapper{
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}
	.product-image{
		width: 100px;
		height: 100px;
	}
</style>
<body>
<jsp:include page="/common/topBar.jsp"/>
<input type="hidden" id="sessionUserId" value="${user.userId}">

<section class="cart-wrap">
    <div class="container">
        <div class="row">
        <h4>장바구니</h4>
        <c:if test="${basketSize ne 0}">
            <div class="col-md-12">
                <input id="basketSize" type="hidden" value="${basketSize}">
            	
                <table class="cart-table">
                    <tr>
                        <th></th>
                        <th class="product">상품</th>
                        <th>가격</th>
                        <th>수량</th>
                        <th class="total">총 가격</th>
                    </tr>
                    <form>
                    <c:forEach items="${basketList}" var="basket">
                   		<tr class="cart_iem" id="${basket.basketNo}">
                   			<input type="hidden" value="${basket.product.prodNo}" id="prodNo" name="prodNo"/>
                   			<input type="hidden" value="${basket.product.prodStock}" id="prodStock" name="prodStock"/>
                   			<input type="hidden" value="${basket.prodQuantity}" id="prodQuantity" name="prodQuantity"/>
                   			<input type="hidden" value="${basket.product.prodPrice}" id="prodPrice" name="prodPrice"/>
	                        <td class="delete"><a href="#"><i class="fa fa-close" aria-hidden="true"></i></a></td>
	                        <td class="name"><img class="product-image" src="${basket.product.prodImageFirst}" alt="cart-product">${basket.product.prodName}</td>
	                        <td class="cost"><fmt:formatNumber value="${basket.product.prodPrice}" pattern="###,###"/></td>
	                        <td class="quantity center-wrapper"><input type="number" value="${basket.prodQuantity}" pattern="[0-9]+"><div id="confirmQuan"><a style="display: none;" class="btn">수량확정</a></div></td>
	                        <td class="total"><input type="hidden" value="${basket.product.prodPrice*basket.prodQuantity}">
	                        <fmt:formatNumber value="${basket.product.prodPrice}" pattern="###,###"/>x ${basket.prodQuantity} = <h3><fmt:formatNumber value="${basket.product.prodPrice*basket.prodQuantity}" pattern="###,###"/>원</h3>
	                        </td>
                       </tr>
                   	 </c:forEach>
                   	 </form>
                </table>
            </div>
            <div class="col-md-12 ">
            	<div class="cart-total">
            		<button class="proceed" type="button" id="deleteAllBasket" style="margin-top:0; margin-bottom: 30px; width: 13% !important;">장바구니 비우기</button>
            	</div>
            </div>
            <div class="col-md-12">
	            <div class="item status">
	            	<div class="cart-total-info" style="height: 150px;">
		            	<div class="title"><h3>총 가격 :<h3></div>
		            	<div class="price"><input type="hidden" value="${totalPrice}" id="totalPrice"><h3 id="name"><fmt:formatNumber value="${totalPrice}" pattern="###,###"/>원</h3></div>
				    </div>
			    </div>
            </div>
	            <div class="col-md-12 col-sm-12">
	            	<div class="cart-total">
	            		<button class="proceed getProdList">쇼핑 계속하기</button>
	                    <button class="proceed to-right" id="addTran">구매하기<i class="fa fa-check" aria-hidden="true"></i></button>
	                </div>
            	
            	</div>
            </c:if>
            <c:if test="${basketSize eq 0}">
            <div class="col-md-12 col-sm-12" style="text-align: center">
            		<h2>장바구니가 비어있어요!</h2>
	            	<div class="cart-total">
	            		<button class="proceed getProdList">쇼핑 하러가기</button>
	                </div>
            	
            </div>
            </c:if>
            </div>
        </div>
</section>

</body>
<jsp:include page="/common/quickMenu.jsp"/>
<script type="text/javascript">

	function checkProdStock(){
		var check = true;
		$("input[type='number']").each(function(){
			var stock = $(this).parent().parent().find("#prodStock").val();
			var prodQuan = $(this).val()
			if(prodQuan>stock){
				alert("선택하신 수량 만큼의 재고가 없습니다.");
				check = false;
				return false;
			}
		})
		return check;
	}

	function checkInputData(){
		var check = true;
		$("input[type='number']").each(function(){
			var value = $(this).val();
			if(value<=0 || value === ''){
				alert("상품은 1개 이상 구매 가능합니다.")
				check = false;
				$(this).val(1);
				return false;
			}else if(!checkProdStock){
				check = false;
				$(this).val(1);
				return false;
			}
		})
		
		return check;
	}
	
	function checkConfrimData(){
		var check = true;
		if($("#confirmQuan").length){
			alert("구매 수량을 확정해 주세요.")
			check = false;
			return false;
		}else if(checkInputData()){
			check = true;
		}
		return check;
	}

	function quantityChange(elem){
			elem.one("input",function(){
				$(this).parent().find("#confirmQuan a").attr("style","display : block;")
				$(this).parent().find("a").on("click",function(){
					var thisButton = $(this).parent().parent();
					if(checkInputData()){
						
						var newQuantity = $(thisButton).find("input").val()
						var prodNo = $(thisButton).parent().find("#prodNo").val()
						var basketNo = $(thisButton).parent().attr("id");
						
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
										+'<h3>'+formatter.format(updateTotalPrice)+'원</h3>')
								
								var sum = 0;
								$(".total input").each(function(index,elem){
									var num = $(elem).val();
									console.log(num)
									sum = sum + parseInt(num);
								})
								$("#totalPrice").attr("value",sum)
								$("#name").text(formatter.format(sum));
							}
							
						})
						
						quantityChange($(thisButton).find("input"))
						$(thisButton).find("a").attr("style","display : none;");
					}
				})
		})
	}

	$(function(){
		
		$("#addTran").on("click",function(){
			$("form").attr("method","GET").attr("action","/transaction/addTransaction").submit();
		})
		
		quantityChange($(".quantity input"))
		
		$(".getProdList").on("click",function(){
			self.location = "/product/salesProdList?prodTeamCode=ALL"
		})
		
		$("tr.cart_iem td.delete").on("click",function(){
			if(!confirm("선택한 상품을 삭제하시겠습니까?")){
				return false
			}
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
					$("#name").text(formatter.format(newTotal));
					var bsize = parseInt($("#basketSize").val())-1
					$("#basketSize").val(bsize)
					if(bsize === 0){
						location.reload();
					}
				}
			})
		})
		
		$("#deleteAllBasket").on("click",function(){
			if(!confirm("장바구니에 모든 상품을 삭제하시겠습니까?")){
				return false
			}
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
					$("#totalPrice").val(0);
					$("#name").text(0);
					location.reload();
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