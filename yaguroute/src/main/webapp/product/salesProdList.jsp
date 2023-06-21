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
	<title>야구ROUTE</title>
	<link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   
   
<script type="text/javascript">
    function fncGetSalesProdList(currentPage) {
        $("#currentPage").val(currentPage);
        $("form").attr("method", "GET").attr("action", "/product/salesProdList")
        .submit();
    }
 

    $(function() {
    	
    	$(".categoryNo").on("click",function(){
    		var cateNo = $(this).attr("id");
    		console.log(cateNo)
    		$("#category").val(cateNo);
    		fncGetSalesProdList(1);
    	})
    	
        $("a[href='teamCodeHref']").on('click', function() {
            teamCode = $(this).find("input[name='teamCode']").val();
            self.location = "/product/salesProdList?prodTeamCode=" + teamCode;    
        });
        
		$("button.btn.btn-default").on("click", function() {
			fncGetSalesProdList(1);
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
					
    
</script>
</head>

<style>

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
    .form-group {
        display: inline-block;
        margin-right: 10px;
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
  padding: 5px 20px; /* 안쪽 여백 설정 */
  color: #000000; /* 글자색 설정 */
  margin-bottom: 18px;
}

    /* body {
    background-image: url('https://png.pngtree.com/background/20211215/original/pngtree-baseball-baseball-bat-on-green-background-picture-image_1468909.jpg');
    background-repeat: no-repeat;
    background-size: 80% ; /* Adjust the size as per your requirement */
    background-color: rgba(0, 0, 0, 0.7);
    background-position: center;
    } */	
    /* 팀탑바 위한 style */
.teamTopBar {
    display:inline-block;
	width: 96%;
	margin:0 auto;
	
}

.image-container {
	position: relative;
	display: inline-block;
	width: 100%;
}

h1 {
	color: white;
	font-family: "Gwangyang" !important; 
}

.text-overlay {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 18px;
	margin-left: 300px;
}

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
    #back-img {
		  position: fixed;
		  width: 100%;
		  height: 100vh;
		  overflow: hidden;
	}
	.transparency{
		background-color: rgba(256,256,256,0.9);
		/* background-color: rgba(0,0,0,0.6); */
		
	}
	.categoryNo{
		background-color: lightgrey !important;
	}
</style>


<body>

		<!-- ToolBar Start /////////////////////////////////////-->
				<jsp:include page="/common/topBar.jsp"/>
		<!-- ToolBar End /////////////////////////////////////-->
<section class="image-header" style="min-height: 0px;height: 0px;">
	<div class="row">
		<div class="col-md-12" >
           	<img id="back-img" src="/images/baseball/prod_backImage.jpg" alt="img">
        </div>	
	</div>
</section>
<div class="mathc-live-broadcasts background" style="margin-top: 0px;">
	<div class="broadcast-tabs-wrapper">
		<ul class="nav nav-tabs" role="tablist" style="text-align: center">
			<li style="border-radius: 30%;background: content-box;width: 100%"><h1 style="margin-left: 30px;margin-right: 30px;color:white;font-size: 50px;font-family:'Gwangyang'">상품 목록</h1></li>
		</ul>
	</div>
</div>
		<form name="detailForm">
		
			<div class="mathc-live-broadcasts background" style="display: flex; justify-content: center; margin-top:30px;margin-bottom:50px; margin-left:40px;">
			    <div class="broadcast-tabs-wrapper">
			        <ul class="nav nav-tabs" role="tablist">
			            <c:forEach var="team" items="${allTeam}">
			                <li class="${team.teamCode eq prodTeamCode ?'active':''}" role="presentation">
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
			<div class="container">
		<div class="row">
			<div class="col-md-12 transparency">
			<div class="Category">
			    <div class="row">
			        <input id="category" type="hidden" name="category" value="${search.category}">
			        <button class="categoryNo" id="0">전체</button>
			        <button class="categoryNo" id="1">유니폼</button>
			        <button class="categoryNo" id="2">모자</button>
			        <button class="categoryNo" id="3">의류</button>
			        <button class="categoryNo" id="4">야구용품</button>
			        <button class="categoryNo" id="5">잡화</button>
			    </div>
			</div>
			
			<div style="width: 100%; margin-top: 20px;">		
			        <!-- Search -->
				<div class="search-container" style="display: flex; justify-content: flex-end; align-items: center;">
				    <div class="form-group" >
				    
				        <select class="form-control" name="searchCondition" disabled="disabled">
				            <option value="0" >상품명</option>
				        </select>
				    </div>
				    <div class="form-group" >
				        <input type="text" class="form-control" id="autoComplete" name="searchKeyword" placeholder="상품명으로 검색하세요" value="${!empty search.searchKeyword ? search.searchKeyword : ''}">
				    </div>
				    <button type="button" class="btn btn-default" id="searchButton">검색</button>
				</div>
				<!-- Search -->
						<input type="hidden" id="prodTeamCode" name="prodTeamCode" value="${prodTeamCode}" /> 
						<input type="hidden" id="currentPage" name="currentPage" value="" />				

    <!--STORE WRAP BEGIN-->
		    <div class="store-wrap">
		                <div class="col-md-12">
		                    <h6>${product.prodTeamCode}</h6>
		                    <div class="row">
		                           <c:forEach var="product" items="${list}">
		                        <div class="col-md-3 col-sm-8">
		                            <div class="store-list-item">         
		                                <div>
		                                        <img style="height: 250px;" src="${product.prodImageFirst}"  alt="product">
		                                    <div class="info">
		                                        <span class="name">
														  <c:choose>
														    <c:when test="${product.prodTeamCode eq 'HH'}">[한화 이글스]</c:when>
														    <c:when test="${product.prodTeamCode eq 'SS'}">[삼성 라이온스]</c:when>
														    <c:when test="${product.prodTeamCode eq 'HT'}">[기아 타이거즈]</c:when>
														    <c:when test="${product.prodTeamCode eq 'SK'}">[SSG 랜더스]</c:when>
														    <c:when test="${product.prodTeamCode eq 'LG'}">[LG 트윈스]</c:when>
														    <c:when test="${product.prodTeamCode eq 'OB'}">[두산 베어스]</c:when>
														    <c:when test="${product.prodTeamCode eq 'KT'}">[KT 위즈]</c:when>
														    <c:when test="${product.prodTeamCode eq 'LT'}">[롯데 자이언츠]</c:when>
														    <c:when test="${product.prodTeamCode eq 'WO'}">[키움 히어로즈]</c:when>
														    <c:when test="${product.prodTeamCode eq 'NC'}">[NC 다이노스]</c:when>
														    <c:otherwise>팀 정보 없음</c:otherwise>
														  </c:choose><br>
														${product.prodName }</span> 
		                                        <div class="price"><input type="hidden" value="${product.prodPrice}"><fmt:formatNumber value="${product.prodPrice}" pattern="###,###"/>원</div>   
		                                        
		                                        <div class="btn-wrap">
		                                         <a href="/product/getProduct?prodNo=${product.prodNo}" class="btn btn-detail">상세보기</a>
		                                        </div>
		            	                       	 </div>
			                                </div>
			                            </div>
			                        </div>
		                       </c:forEach>
		                </div>
		            </div>

     			<!-- PageNavigation Start... -->
				<jsp:include page="../common/pageNavigator_all.jsp">
					<jsp:param name="id" value="salesProd" />
				</jsp:include>
				<!-- PageNavigation End... -->

	</div>
</div>
</div></div></div>
    <!--STORE WRAP END-->


</form>
</div>
</div>
</div>
</body>

<jsp:include page="/common/quickMenu.jsp"/>
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

