<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    
    #searchButton:hover {
	background-color: #FACC2E; /* 마우스 오버 시 배경색 변경 */
}

	#searchButton {
	  border-radius: 20px;
	  background-color: #E0F7E7;
	  color: white;
	  font-size: 16px;
	  border: none;
	  padding: 7px 18px; /* 안쪽 여백 설정 */
	  color: #000000; /* 글자색 설정 */
	}
	
 #deleteButton:hover {
	background-color: #E0F7E7; /* 마우스 오버 시 배경색 변경 */
}

	#deleteButton {
	  border-radius: 20px;
	  background-color: #FACC2E;
	  color: white;
	  font-size: 16px;
	  border: none;
	  padding: 10px 20px; /* 안쪽 여백 설정 */
	  color: #000000; /* 글자색 설정 */
	}
  .ui-autocomplete {
    position: absolute;
    z-index: 1000;
    cursor: default;
    padding: 0;
    margin-top: 2px;
    list-style: none;
    background-color: #ffffff;
    border: 1px solid #ccc;
    -webkit-border-radius: 5px;
       -moz-border-radius: 5px;
            border-radius: 5px;
    -webkit-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
       -moz-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
	}
	.ui-autocomplete > li {
	  padding: 3px 20px;
	}
	.ui-autocomplete > li.ui-state-focus {
	  background-color: #DDD;
	}
	.ui-helper-hidden-accessible {
	  display: none;
	}


	.product-status {
	  color: black;
	}
	
	.out-of-stock {
	  color: red;
	}
	
    /* 팀탑바 위한 style */	
	.teamTopBar {
	width: 1300px;
	height:380px;
	margin-top:25px;
	margin-left: 15px;	
}
	
	.image-container {
	position: relative;
	display: inline-block;
	width: 100%;
}
h1 {
	color: white;
	font-family: "Gwangyang";
}
.text-overlay {
	position: absolute;
	top: 50%;
	left: 40%;
	transform: translate(-50%, -50%);
	font-size: 18px;
	margin-left: 300px;
}
    /* 팀탑바 위한 style */	
        .Category .row {
        display: flex;
        justify-content: center;
        margin-top: 10px;
    }

    .Category button {
        margin: 0 5px;
        padding: 8px 12px;
        width:150px;
        height:50px;
        border: none;
        border-radius: 4px;
        background-color: #f0f0f0;
        color: #333;
        font-size: 20px;
        font-family: "Gwangyang";
        cursor: pointer;
    }

    .Category button:hover {
        background-color: #e0e0e0;
    }
</style>


<script type="text/javascript">
	function fncGetProductList(currentPage) {
		$("#currentPage").val(currentPage);
		$("form").attr("method", "GET").attr("action", "/product/listProduct")
		.submit();
	}

	

	$(function() {
	
	$(".categoryNo").on("click",function(){
		   		var cateNo = $(this).attr("id");
		    	console.log(cateNo)
		   		$("#category").val(cateNo);
		   		fncGetProductList(1);
		   	})
		   	
		   	$(".stockNo").on("click", function(){
		   		var stockNo = $(this)	.attr("id");
		   		console.log(stockNo);
		   		$("#stock").val(stockNo); //input의 Id
		   		fncGetProductList(1);
		   		
		   	})
		   	
		$("button.btn-success").on("click", function() {
			$("#prodTeamCode").val($(this).val());
			fncGetProductList(1);
		});

		$("button.btn.btn-default").on("click", function() {
			fncGetProductList(1);
		});

		$(".ct_list_pop td:nth-child(5)").on("click", function() {
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
	 
/* 	 function fncDeleteProduct() {
			$("form").attr("method", "GET").attr("action", "/product/deleteProduct")
			.submit();
		} */

			$(function() {
				
				$("a:contains('삭제')").on("click", function() {
					console.log("button Click");
					//$("#prodNo").val($(this).val());
					var prodNo = $(this).children().val();
					alert(prodNo);
					//$("form").attr("method", "GET").attr("action", "/product/deleteProduct?prodNo="+prodNo).submit();
					self.location = "/product/deleteProduct?prodNo="+prodNo;
				});
				
			});	
				
</script>

</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
  <jsp:include page="/admin/getAdmin.jsp"/>
	<!-- ToolBar End /////////////////////////////////////-->
<div class="image-container">
  <img class="teamTopBar" src="${team.teamTopBar}">
  <div class="text-overlay"><h1>판매상품리스트</h1></div>
</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
				
	<form name="detailForm">
			
			<div class="mathc-live-broadcasts background" style="margin-top:20px; margin-left:10px;">
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
			
			<div class="Category">
			    <div class="row">
			        <input id="category" type="hidden" name="category" value="${search.category}">
			        <button class="categoryNo" id="1">유니폼</button>
			        <button class="categoryNo" id="2">모자</button>
			        <button class="categoryNo" id="3">의류</button>
			        <button class="categoryNo" id="4">야구용품</button>
			        <button class="categoryNo" id="5">잡화</button>
			    </div>
			</div>
			
		<div class="container">
		<div class="page-header text-info">
			<div class="row">
				<div style="width: 98%; margin-left: 50px; margin-top: 20px;">    

						<input type="hidden" id="prodTeamCode" name="prodTeamCode" value="${prodTeamCode}" /> 
						<input type="hidden" id="currentPage" name="currentPage" value="" />

					<div class="search-container">
						<div class="form-group" style="width: 100px;">
							<select class="form-control" name="searchCondition">
								<option value="0"  selected>상품명</option>
							</select>
						</div>
						<div class="form-group" style="width: 230px;">
							<input type="text" class="form-control"  id="autoComplete" 	name="searchKeyword" placeholder="상품명으로 검색하세요"
								value="${!empty search.searchKeyword ? search.searchKeyword : ''}"> </div>

						<button type="button" class="btn btn-default" id="searchButton">검색</button>
						<p class="text" style="font-family: 'Montserrat', sans-serif; ">전체 ${resultPage.totalCount} 건, 현재 ${resultPage.currentPage} 페이지</p>
					</div>
				<div class="Stock">
			    <div class="row">
			        <input id="stock" type="hidden" name="standard" value="${search.standard }"> <%-- 디폴트 null --%>
			        <button class="stockNo" id="1">전체</button>
			        <button class="stockNo" id="2">판매중</button>
			        <button class="stockNo" id="3">품절</button>
			    </div>
			</div>				

						<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">

							<thead>
								<tr>
									<th align="center" style="font-size: 14px;"></th>
									<th align="center" style="font-size: 14px;">상품번호</th>		
									<th align="center" style="font-size: 14px;">상품이미지</th>		
									<th align="center" style="font-size: 14px;">구단</th>													
									<th align="center" style="font-size: 14px;">제품명</th>
									<th align="center" style="font-size: 14px;">가격</th>
									<th align="center" style="font-size: 14px;">등록일</th>
									<th align="center" style="font-size: 14px;">재고</th>
									<th align="center" style="font-size: 14px;">카테고리</th>
									<th align="center" style="font-size: 14px; width: 100px;">상품상태</th>
									<th align="center" style="font-size: 14px; width: 100px;">삭제</th>									
								</tr>
							</thead>

							<tbody>
								<c:set var="i" value="0" />
								<c:forEach var="product" items="${list}">
									<c:set var="i" value="${ i+1 }" />
									<tr class="ct_list_pop">
										<td align="center">${ i }</td>
										<td align="left" height="30"> ${product.prodNo}</td>	
										<td align="left">
											  <img src="${product.prodImageFirst}" alt="Product Image" width="100" height="100">
											</td>												
										<td align="left">${product.prodTeamCode}</td>											
										<td align="left"><input type="hidden" id="prodNo" value="${product.prodNo}" />${product.prodName}</td>															
										<td align="left"><fmt:formatNumber value="${product.prodPrice}" pattern="###,###"/></td>
										<td align="left">${product.prodRegDate}</td>
										<td align="left"><fmt:formatNumber value="${product.prodStock}" pattern="###,###"/>
										<td align="left">		  
														<c:choose>
															    <c:when test="${product.prodCategory eq 1}">유니폼</c:when>
															    <c:when test="${product.prodCategory eq 2}">모자</c:when>
															    <c:when test="${product.prodCategory eq 3}">의류</c:when>
															    <c:when test="${product.prodCategory eq 4}">야구용품</c:when>
															    <c:when test="${product.prodCategory eq 4}">잡화</c:when>															    
															  </c:choose>
															</td>
											<td>
											  <span class="product-status ${product.prodStock < 1 ? 'out-of-stock' : ''}">
											    ${product.prodTranCode eq 'hidden' ? '숨김' : (product.prodStock < 1 ? '품절' : '판매중')}
											  </span>
											</td>
										<td align="left">
											  	<a role="button"  class="btn btn-delete"  id="deleteButton">
											  		삭제
											  		<input type="hidden" id="prodNo" value="${product.prodNo}" />
											  	</a>
											</td>												
									</tr>
									</c:forEach>
								</tbody>
							</table>
				      </div>
			    	</div>
				</div>
			</div>
						<!-- PageNavigation Start... -->
				<jsp:include page="../common/pageNavigator_all.jsp">
					<jsp:param name="id" value="product" />
				</jsp:include>
				<!-- PageNavigation End... -->
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
