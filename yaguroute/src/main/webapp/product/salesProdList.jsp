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
	<title>listProduct</title>
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
		$("button.btn-success").on("click", function() {
			$("#prodTeamCode").val($(this).val());
			fncGetSalesProdList(1);
		});

		$("button.btn.btn-default").on("click", function() {
			fncGetSalesProdList(1);
		});
		
		$("a[href='teamCodeHref']").on('click', function(){
    		teamCode = $(this).find("input[name='teamCode']").val();
    		self.location = "/product/salesProdList?prodTeamCode="+teamCode;
	   });
		
	});
	


</script>
   
 
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/common/topBar.jsp"/>
	<!-- ToolBar End /////////////////////////////////////-->

		<form name="detailForm">
			<input type="hidden" id="prodNo" name="prodNo" value="${product.ProdNo} " /> 
    <!--BREADCRUMBS BEGIN-->
<section class="image-header" >
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="info">
                    <div class="wrap">
                        <h1>YaguRoute Store</h1>
                    </div>
                </div>
            </div>	
        </div>
    </div>
</section>
<!--BREADCRUMBS END-->

<div class="mathc-live-broadcasts background" style="display: flex; justify-content: center;">
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


	
    <!--STORE WRAP BEGIN-->
    <div class="store-wrap">
        <div class="container">
            <div class="row row-offcanvas row-offcanvas-left">
                <div class="sidebar col-xs-6 col-sm-6 col-md-3 sidebar-offcanvas" id="sidebar">
                    <div class="sidebar-menu-wrap">
                        <h6>Categories</h6>
                        <ul class="categories-list">
                            <li>
                                <a href="#"><span class="count">◆</span>유니폼</a>
                            </li>
                            <li>
                                <a href="#"><span class="count">◆</span>모자</a>
                            </li>
                            <li>
                                <a href="#"><span class="count">◆</span>야구용품</a>
                            </li>
                            <li>
                                <a href="#"><span class="count">◆</span>잡화</a>
                            </li>
                        </ul>
                    </div>
                    <div class="filter-wrap">
  
                        </div>

                </div>
                <div class="col-xs-12 col-sm-12 col-md-9">
                    <p class="hidden-md hidden-lg">
                        <button type="button" class="btn sidebar-btn" data-toggle="offcanvas" title="Toggle sidebar">sidebar</button>
                    </p>
                    <h6>${product.prodTeamCode}</h6>
                    <div class="row">
                           <c:forEach var="product" items="${list}">
                        <div class="col-md-4 col-sm-6">
                            <div class="store-list-item">         
                                <div>
                                    <a href="/product/getProduct?prodNo=${product.prodNo}">
                                        <img src="/images/product/${product.prodImageFirst}"  alt="product"> </a>
                                    <div class="info">
                                        <span class="name">${product.prodName} </span>
                                        <span class="price">${product.prodPrice}</span>	
                                        
                                        <div class="btn-wrap">
                                            <button class="btn btn-detail" id="prodDetail">상세보기</button>
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



    <!--STORE WRAP END-->


</div>
</div>
</div>

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

