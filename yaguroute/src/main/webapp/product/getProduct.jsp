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

	})
</script>

</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/common/topBar.jsp"/>
	<!-- ToolBar End /////////////////////////////////////-->



    <!--BREADCRUMBS BEGIN-->
<section class="image-header">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="info">
                    <div class="wrap">
                        <ul class="breadcrumbs">
                            <li><a href="index.html">Main</a>/</li>
                            <li>Category</li>
                        </ul>
                        <h1>상품상세조회</h1>
                    </div>
                </div>
            </div>	
        </div>
    </div>
</section>
<!--BREADCRUMBS END-->

    <!--PRODUCT SINGLE BEGIN-->

    <section class="product-single">
        <div class="container">
            <div class="row">
                <div class="col-md-12"><h4>${product.prodName} ${product.prodTeamCode }</h4></div>
                <div class="col-md-7">
                    <div class="product-slider">
                        <div class="connected-carousels">
                            <div class="navigation jcarousel-skin-default">
                                <a href="#" class="prev prev-navigation"><i class="fa fa-angle-up" aria-hidden="true"></i></a>
                                <a href="#" class="next next-navigation"><i class="fa fa-angle-down" aria-hidden="true"></i></a>
                                <div class="carousel carousel-navigation jcarousel-vertical" style="max-height: 500px; overflow: hidden;">
                                    <ul>
                                        <li>
                                            <img src="/images/product/${product.prodImageFirst}" alt="product-thumb">
                                        </li>
                                        <li>
                                            <img src="/images/product/${product.prodImageSecond}" alt="product-thumb">
                                        </li>
                                        <li>
                                            <img src="/images/product/${product.prodImageThird}"alt="product-thumb">
                                        </li>
                                        <li>
                                    </ul>
                                </div>
                            </div>
                            <div class="stage">
                                <div class="carousel carousel-stage"  style="width: 100%; height: 500px;">
                                    <ul>
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
                        <div class="rating-wrap">
                            <div class="rating four"></div>
                            <div class="quantity">( -----------)</div>
                        </div>
						
						<h4>${product.prodName}</h4>
                        <div class="price">${product.prodPrice}원</div>
                       
   
                        <div class="quantity-wrap">
                        <div>
                           상품수량: <input type="number" placeholder="1" value="1">
                            <a href="cart.html" class="btn small">Add to cart</a>
                             <button id="addTran" type="button" class="btn btn-warning">바로구매</button>
                        </div>
                        <div class="details">
                            <ul>
                                <li><span>team: </span>${product.prodTeamCode}</li>
                                <li><span>Categories: </span>${product.prodCategory} </li>
                                <li>
                                    <span>Tags: </span>
                                    <a href="#">이것도,</a>
                                    <a href="#">쓸수있으면,</a>
                                    <a href="#">좋은,</a>
                                    <a href="#">태그,</a>
                                    <a href="#">running,</a>
                                    <a href="#">run</a>
                                </li>
                            </ul>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="product-tab-wrap">
            <div class="tab-top">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <ul>
                                <li><a href="#description">Description</a></li>
                                <li><a href="#aditionalInformation">Aditional Information</a></li>
                                <li class="active"><a href="#reviews">Reviews (2)</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-item">
                <div class="container">
                    <div class="row">
                        <div class="col-md-7">
                            <div class="comments-wrap">
                                <h6>Reviews</h6>
                                <div class="comment-item">
                                    <div class="avatar"><img src="images/common/author-avatar.jpg" alt="author-avatar"></div>
                                    <div class="info">
                                        <div class="date">
                                            <a href="#">25 Sep 2016</a> by <a href="#">Ian Finch</a>
                                            <a href="#" class="quote">#</a>
                                        </div>
                                        <div class="rating four"></div>
                                        <p>Pabst irony tattooed, synth sriracha selvage pok pok. Wayfarers kinfolk sartorial, helvetica you probably haven't heard of them tumeric venmo deep v mixtape semiotics brunch.</p>
                                    </div>
                                </div>
                                <div class="comment-item">
                                    <div class="avatar"><img src="images/common/author-avatar.jpg" alt="author-avatar"></div>
                                    <div class="info">
                                        <div class="date">
                                            <a href="#">25 Sep 2016</a> by <a href="#">Ian Finch</a>
                                            <a href="#" class="quote">#</a>
                                        </div>
                                        <div class="rating two"></div>
                                        <p>Pabst irony tattooed, synth sriracha selvage pok pok. Wayfarers kinfolk sartorial, helvetica you probably haven't heard of them tumeric venmo deep v mixtape semiotics brunch.</p>
                                    </div>
                                </div>
                                <div class="comment-item">
                                    <div class="avatar"><img src="images/common/author-avatar.jpg" alt="author-avatar"></div>
                                    <div class="info">
                                        <div class="date">
                                            <a href="#">25 Sep 2016</a> by <a href="#">Ian Finch</a>
                                            <a href="#" class="quote">#</a>
                                        </div>
                                        <div class="rating five"></div>
                                        <p>Pabst irony tattooed, synth sriracha selvage pok pok. Wayfarers kinfolk sartorial, helvetica you probably haven't heard of them tumeric venmo deep v mixtape semiotics brunch.</p>
                                    </div>
                                </div>
                            </div>	
                        </div>
                        <div class="col-md-5">
                            <div class="leave-comment-wrap">
                                <h6>Add a review </h6>	
                                <form>								
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="item">
                                                <label>
                                                    <span>Name <i>*</i></span>
                                                    <input type="text" name="text">
                                                </label>
                                            </div>	
                                        </div>
                                        <div class="col-md-12">
                                            <div class="item">
                                                <label>
                                                    <span>Email <i>*</i></span>
                                                    <input type="email" name="email">
                                                </label>
                                            </div>	
                                        </div>
                                        <div class="col-md-12">
                                            <div class="item">
                                                <label>
                                                    <span>Your comment</span>
                                                    <textarea></textarea>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <button class="comment-submit">post a review</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
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
