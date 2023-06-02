<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Team HTML</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
    
    <script type="text/javascript">
    		
    //  <a class="bestPlayerList" href="#" onclick="playerGroup()">링크
    	 /* function playerGroup(index) {
    		// playerDate를 가져오는 코드...	
    		var bestDate = $(".bestDate").eq(index - 1).text();
    		alert(bestDate);
    		
    		self.location.href="/player/bestListPlayerGroup?bestDate="+bestDate;
		};	 */
		
    </script>
</head>

<body>

	<div class="preloader-wrapper" id="preloader">
    <div class="motion-line dark-big"></div>
    <div class="motion-line yellow-big"></div>
    <div class="motion-line dark-small"></div>
    <div class="motion-line yellow-normal"></div>
    <div class="motion-line yellow-small1"></div>
    <div class="motion-line yellow-small2"></div>
</div>

    

    
<div class="top-bar">
    <div class="container">
        <div class="row">
            <div class="col-md-7 hidden-sm hidden-xs">
                <div class="top-contacts">
                    <ul class="socials">
                        <li><a href="#"><i class="fa fa-facebook-square" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-google" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                    </ul>
                    <ul class="contacts">
                        <li class="phone"><i class="fa fa-phone-square" aria-hidden="true"></i>+61 3 8376 6284</li>
                        <li class="skype"><a href="callto:team.skype"><i class="fa fa-skype" aria-hidden="true"></i>team.skype</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-5">
                <div class="top-language">
                    <ul class="list">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="/images/common/en-flag.png" alt="selected language">EN</a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="#"><img src="/images/common/fr-flag.png" alt="language">FR</a>
                                </li>
                                <li>
                                    <a href="#"><img src="/images/common/en-flag.png" alt="language">EN</a>
                                </li>
                                <li>
                                    <a href="#"><img src="/images/common/ru-flag.png" alt="language">RU</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
                    <div class="top-search">
                            <form>
                                    <input type="text" name="text">
                                    <button><i class="fa fa-search" aria-hidden="true"></i></button>
                            </form>
                    </div>

                    <div class="clear"></div>
            </div>
        </div>
    </div>
</div>

    <!--MAIN MENU WRAP BEGIN-->
<div class="main-menu-wrap sticky-menu">
    <div class="container">
        <a href="index.html" class="custom-logo-link"><img src="/images/baseball/logo.png" alt="logo" class="custom-logo"></a>
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#team-menu" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <nav class="navbar">
            <div class="collapse navbar-collapse" id="team-menu">
                <ul class="main-menu nav">
                    <li class="active">
                        <a href="index.html"><span>Home</span></a>
                        <ul>
                            <li><a href="amateurs.html"><span>Amateures Home</span></a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="matches.html"><span>Matches</span></a>
                        <ul>
                            <li>
                                <a href="standing-cup.html"><span>Standings<i class="fa fa-long-arrow-right" aria-hidden="true"></i></span></a>
                                <ul>
                                    <li><a href="standings.html"><span>championship</span></a></li>
                                </ul>
                            </li>
                            <li><a href="club-stats.html"><span>club stats</span></a></li>
                            <li><a href="match-live.html"><span>match live</span></a></li>
                            <li><a href="broadcasts.html"><span>broadcasts</span></a></li>
                            <li><a href="upcoming-match.html"><span>upcoming match</span></a></li>
                            <li>
                                <a href="championships-archive.html"><span>championships archive<i class="fa fa-long-arrow-right" aria-hidden="true"></i></span></a>
                                <ul>
                                    <li><a href="championship.html"><span>championship information</span></a></li>
                                </ul>	
                            </li>
                            <li><a href="live-text-stream.html"><span>Text stream</span></a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="staff.html"><span>Team</span></a>
                        <ul>
                            <li><a href="player.html"><span>player first page</span></a></li>
                            <li><a href="player-second-page.html"><span>player second page</span></a></li>
                        </ul>
                    </li>
                    <li><a href="news.html"><span>News</span></a></li>
                    <li><a href="news-single.html"><span>News Single</span></a></li>
                    <li><a href="store.html"><span>Store</span></a></li>
                    <li><a href="contacts.html"><span>Contact</span></a></li>
                    <li>
                        <a href="#other"><span>other</span></a>
                        <ul>
                            <li><a href="404.html"><span>404</span></a></li>
                            <li><a href="offline.html"><span>offline</span></a></li>
                            <li><a href="coming-soon.html"><span>comming soon</span></a></li>
                            <li><a href="search.html"><span>search</span></a></li>
                            <li><a href="donations.html"><span>donations</span></a></li>
                            <li><a href="trophies.html"><span>trophies</span></a></li>
                            <li><a href="about-club.html"><span>about club</span></a></li>
                            <li><a href="checkout.html"><span>checkout</span></a></li>
                        </ul>
                    </li>
                    <li class="cart full">
                        <a href="#cart">
                            <span><i class="fa fa-shopping-cart" aria-hidden="true"></i></span>
                        </a>
                        <div class="cart-drop">
                            <table class="ct">
                                <tr>
                                    <td class="delete"><a href="#"><i class="fa fa-close" aria-hidden="true"></i></a></td>
                                    <td class="info">
                                        <img class="product-image" src="/images/common/cart-product.jpg" alt="product-image">
                                        <em>Men's T-Shirt<br><em class="price">1 x Â£ 60</em></em>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="delete"><a href="#"><i class="fa fa-close" aria-hidden="true"></i></a></td>
                                    <td class="info">
                                        <img class="product-image" src="/images/common/cart-product.jpg" alt="product-image">
                                        <em>Men's T-Shirt<br><em class="price">1 x Â£ 60</em></em>
                                    </td>
                                </tr>
                            </table>
                            <div class="wrap">
                                <div class="total-text">Subtotal: </div>
                                <div class="total-digit">Â£ 120</div>
                            </div>
                            <div class="wrap btn-wrap">
                                <a href="cart.html" class="btn view">View cart</a>
                                <a href="checkout.html" class="btn check">checkout cart</a>
                            </div>
                        </div>
                    </li>	
                </ul>
            </div>       
        </nav>
    </div>
</div>
<!--MAIN MENU WRAP END-->


    <!--BREADCRUMBS BEGIN-->
<section class="image-header">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="info">
                    <div class="wrap">
                        <ul class="breadcrumbs">
                            <li>BestPlayer</li>
                        </ul>
                        <h1>BESTPLAYER</h1>
                    </div>
                </div>
            </div>	
        </div>
    </div>
</section>
<!--BREADCRUMBS END-->

    <!--STORE WRAP BEGIN-->

    <div class="store-wrap">
    <div class="container">
        <div class="row row-offcanvas row-offcanvas-left">
            <div class="col-xs-12 col-sm-12 col-md-9">
                <h6>이주의 선수</h6>
                <c:set var="i" value="0"/>
                <c:forEach var="bestplayer" items="${list}">
                    <c:set var="i" value="${i+1}"/>
                    <div class="col-md-4 col-sm-4">
                        <div class="store-list-item">
                            <div>
                                <a class="bestPlayerList" href="#" onclick="playerGroup(${i})">링크
                                    <table>
                                        <tr>
                                            <td align="left" class="bestDate">${bestplayer.playerId}</td>
                                        </tr>
                                    </table>
                                    <img src="/images/common/store-item-img.jpg" id="bestPlayerGroup${i}" alt="bestPlayerGroup_DATE" width="50" height="200">
                                </a>
                                <div class="info"></div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
        
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

	
</body>

</html>
