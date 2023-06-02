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
    <title>선수 조회</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
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
                            <li><a href="/main.jsp">Main</a>/</li>
                            <li>선수 조회</li>
                        </ul>
                        <h1>선수 조회</h1>
                    </div>
                </div>
            </div>	
        </div>
    </div>
</section>
<!--BREADCRUMBS END-->



    <!--PLAYER SINGLE WRAP BEGIN-->

    <section class="player-single-wrap">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="captain-bage">선수입니다.</div>
                    <h4 class="player-name">${player.playerPosition}</h4>
                </div>
                <div class="col-md-6">
				<div class="player-photo">
				    <div class="number">${player.playerNumber}</div>
				    <img class="img-responsive" src="/images/baseball/single-player-photo.png" alt="player">
				</div>
                </div>
                <div class="col-md-6">
                    <div class="player-info">
                        <h6 class="player-info-title">summary</h6>	
                        <div class="summary">
                            <div class="row">
                                <div class="col-md-3 col-sm-3 col-xs-3">
                                    <div class="item">선수 등번호:</div>
                                </div>
                                <div class="col-md-9 col-sm-9 col-xs-9"><img src="/images/common/fr-flag.png" alt="flag">${player.playerNumber}번</div>
                                <div class="col-md-3 col-sm-3 col-xs-3">
                                    <div class="item">포지션:</div>
                                </div>
                                <div class="col-md-9 col-sm-9 col-xs-9">${player.playerPosition}입니다.</div>
                                <div class="col-md-3 col-sm-3 col-xs-3">
                                    <div class="item">생일</div>
                                </div>
                                <div class="col-md-9 col-sm-9 col-xs-9">${player.playerBirth}축하행</div>
                            </div>
                        </div>
                        <h6>club history</h6>
                        <div class="overflow-scroll">
                            <table>
                                <tr>
                                    <th>Season</th>
                                    <th class="club">Club</th>
                                    <th>Games</th>
                                    <th>Goals</th>
                                </tr>
                                <tr>
                                    <td>2016/2017</td>
                                    <td class="club"><img src="/images/baseball/team-logo1.png" width="30" height="30" alt="trophy"> Internacional</td>
                                    <td>27</td>
                                    <td><span>10</span></td>
                                </tr>
                                <tr>
                                    <td>2016/2017</td>
                                    <td class="club"><img src="/images/baseball/team-logo2.png" width="30" height="30" alt="trophy"> Internacional</td>
                                    <td>27</td>
                                    <td><span>10</span></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!--PLAYER SINGLE WRAP END-->

    <!--MAIN CLUB STAFF BEGIN-->

    <!--MAIN CLUB STAFF BEGIN-->
<section class="main-club-stuff">              
    <div class="tab-content">
        <div class="tab-pane active" id="managers" role="tabpanel">
            <div id="managers_carousel" class="carousel slide main-stuff-slider" data-ride="carousel" >
                <div class="carousel-inner" role="listbox" >
                    <div class="item active">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="staff-item">
                                        <a href="staff.html">
                                            <span class="info">
                                                <span class="name">Lucas<br>Marshman</span>
                                                <span class="position">Left Forward</span>
                                                <span class="number">14</span>
                                            </span>
                                            <img src="/images/baseball/stuff-person.jpg"  alt="person-slider">
                                        </a>	
                                    </div>
                                </div>                    
                                <div class="col-md-4">
                                    <div class="staff-item">
                                        <a href="staff.html">
                                            <span class="info">
                                                <span class="name">Lucas<br>Marshman</span>
                                                <span class="position">Left Midfielder</span>
                                                <span class="number">8</span>
                                            </span>
                                            <img src="/images/baseball/player-2.jpg"  alt="person-slider">
                                        </a>	
                                    </div>
                                </div>
                                <div class="col-md-4 ">
                                    <div class="staff-item">
                                        <a href="staff.html">
                                            <span class="info">
                                                <span class="name">Lucas<br>Marshman</span>
                                                <span class="position">Central Attacking Midfielder</span>
                                                <span class="number">7</span>
                                            </span>
                                            <img src="/images/baseball/player-3.jpg"  alt="person-slider">
                                        </a>	
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="staff-item">
                                        <a href="staff.html">
                                            <span class="info">
                                                <span class="name">Lucas<br>Marshman</span>
                                                <span class="position">Left Forward</span>
                                                <span class="number">14</span>
                                            </span>
                                            <img src="/images/baseball/player-3.jpg"  alt="person-slider">
                                        </a>	
                                    </div>
                                </div>                    
                                <div class="col-md-4">
                                    <div class="staff-item">
                                        <a href="staff.html">
                                            <span class="info">
                                                <span class="name">Lucas<br>Marshman</span>
                                                <span class="position">Left Midfielder</span>
                                                <span class="number">8</span>
                                            </span>
                                            <img src="/images/baseball/player-2.jpg"  alt="person-slider">
                                        </a>	
                                    </div>
                                </div>
                                <div class="col-md-4 ">
                                    <div class="staff-item">
                                        <a href="staff.html">
                                            <span class="info">
                                                <span class="name">Lucas<br>Marshman</span>
                                                <span class="position">Central Attacking Midfielder</span>
                                                <span class="number">7</span>
                                            </span>
                                            <img src="/images/baseball/stuff-person.jpg"  alt="person-slider">
                                        </a>	
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- Controls -->
                    <a class="nav-arrow left-arrow" href="#managers_carousel" role="button" data-slide="prev">
                        <i class="fa fa-angle-left" aria-hidden="true"></i>
                        <span class="sr-only"></span>
                    </a>
                    <a class="nav-arrow right-arrow" href="#managers_carousel" role="button" data-slide="next">
                        <i class="fa fa-angle-right" aria-hidden="true"></i>
                        <span class="sr-only"></span>
                    </a>
                </div>
            </div>
        </div>

        <div class="tab-pane" id="academy" role="tabpanel">
            <div id="academy_carousel" class="carousel slide main-stuff-slider" data-ride="carousel" >
                <div class="carousel-inner" role="listbox" >
                    <div class="item active">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="staff-item">
                                        <a href="staff.html">
                                            <span class="info">
                                                <span class="name">Vito<br>Palet</span>
                                                <span class="position">Left Forward</span>
                                                <span class="number">14</span>
                                            </span>
                                            <img src="/images/baseball/player-2.jpg"  alt="person-slider">
                                        </a>	
                                    </div>
                                </div>                    
                                <div class="col-md-4">
                                    <div class="staff-item">
                                        <a href="staff.html">
                                            <span class="info">
                                                <span class="name">Lucas<br>Melet</span>
                                                <span class="position">Left Midfielder</span>
                                                <span class="number">8</span>
                                            </span>
                                            <img src="/images/baseball/stuff-person.jpg"  alt="person-slider">
                                        </a>	
                                    </div>
                                </div>
                                <div class="col-md-4 ">
                                    <div class="staff-item">
                                        <a href="staff.html">
                                            <span class="info">
                                                <span class="name">Lucas<br>Marse</span>
                                                <span class="position">Central Attacking Midfielder</span>
                                                <span class="number">7</span>
                                            </span>
                                            <img src="/images/baseball/player-3.jpg"  alt="person-slider">
                                        </a>	
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="staff-item">
                                        <a href="staff.html">
                                            <span class="info">
                                                <span class="name">Lucas<br>Marsan</span>
                                                <span class="position">Left Forward</span>
                                                <span class="number">14</span>
                                            </span>
                                            <img src="/images/baseball/player-3.jpg"  alt="person-slider">
                                        </a>	
                                    </div>
                                </div>                    
                                <div class="col-md-4">
                                    <div class="staff-item">
                                        <a href="staff.html">
                                            <span class="info">
                                                <span class="name">Luscas<br>Mars</span>
                                                <span class="position">Left Midfielder</span>
                                                <span class="number">8</span>
                                            </span>
                                            <img src="/images/baseball/player-2.jpg"  alt="person-slider">
                                        </a>	
                                    </div>
                                </div>
                                <div class="col-md-4 ">
                                    <div class="staff-item">
                                        <a href="staff.html">
                                            <span class="info">
                                                <span class="name">Lucas<br>Mafo</span>
                                                <span class="position">Central Attacking Midfielder</span>
                                                <span class="number">7</span>
                                            </span>
                                            <img src="/images/baseball/stuff-person.jpg"  alt="person-slider">
                                        </a>	
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- Controls -->
                    <a class="nav-arrow left-arrow" href="#academy_carousel" role="button" data-slide="prev">
                        <i class="fa fa-angle-left" aria-hidden="true"></i>
                        <span class="sr-only"></span>
                    </a>
                    <a class="nav-arrow right-arrow" href="#academy_carousel" role="button" data-slide="next">
                        <i class="fa fa-angle-right" aria-hidden="true"></i>
                        <span class="sr-only"></span>
                    </a>
                </div>
            </div>
        </div>

        <div class="tab-pane" id="firstteam" role="tabpanel">
            <div id="firstteam_carousel" class="carousel slide main-stuff-slider" data-ride="carousel" >
                <div class="carousel-inner" role="listbox" >
                    <div class="item active">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="staff-item">
                                        <a href="staff.html">
                                            <span class="info">
                                                <span class="name">James<br>Deshon</span>
                                                <span class="position">Left Forward</span>
                                                <span class="number">14</span>
                                            </span>
                                            <img src="/images/baseball/stuff-person.jpg"  alt="person-slider">
                                        </a>	
                                    </div>
                                </div>                    
                                <div class="col-md-4">
                                    <div class="staff-item">
                                        <a href="staff.html">
                                            <span class="info">
                                                <span class="name">Deshon<br>James</span>
                                                <span class="position">Left Midfielder</span>
                                                <span class="number">8</span>
                                            </span>
                                            <img src="/images/baseball/stuff-person.jpg"  alt="person-slider">
                                        </a>	
                                    </div>
                                </div>
                                <div class="col-md-4 ">
                                    <div class="staff-item">
                                        <a href="staff.html">
                                            <span class="info">
                                                <span class="name">James<br>Deshon</span>
                                                <span class="position">Central Attacking Midfielder</span>
                                                <span class="number">7</span>
                                            </span>
                                            <img src="/images/baseball/player-3.jpg"  alt="person-slider">
                                        </a>	
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="staff-item">
                                        <a href="staff.html">
                                            <span class="info">
                                                <span class="name">Lucas<br>Marsh</span>
                                                <span class="position">Left Forward</span>
                                                <span class="number">14</span>
                                            </span>
                                            <img src="/images/baseball/player-3.jpg"  alt="person-slider">
                                        </a>	
                                    </div>
                                </div>                    
                                <div class="col-md-4">
                                    <div class="staff-item">
                                        <a href="staff.html">
                                            <span class="info">
                                                <span class="name">Luca<br>Mas</span>
                                                <span class="position">Left Midfielder</span>
                                                <span class="number">8</span>
                                            </span>
                                            <img src="/images/baseball/player-2.jpg"  alt="person-slider">
                                        </a>	
                                    </div>
                                </div>
                                <div class="col-md-4 ">
                                    <div class="staff-item">
                                        <a href="staff.html">
                                            <span class="info">
                                                <span class="name">Lucasoto<br>Marsh</span>
                                                <span class="position">Central Attacking Midfielder</span>
                                                <span class="number">7</span>
                                            </span>
                                            <img src="/images/baseball/stuff-person.jpg"  alt="person-slider">
                                        </a>	
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- Controls -->
                    <a class="nav-arrow left-arrow" href="#firstteam_carousel" role="button" data-slide="prev">
                        <i class="fa fa-angle-left" aria-hidden="true"></i>
                        <span class="sr-only"></span>
                    </a>
                    <a class="nav-arrow right-arrow" href="#firstteam_carousel" role="button" data-slide="next">
                        <i class="fa fa-angle-right" aria-hidden="true"></i>
                        <span class="sr-only"></span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>
<!--MAIN CLUB STAFF END-->

    <!--MAIN CLUB STAFF END-->

    <!--STANDING CUP END-->



    <!--FOOTER BEGIN-->
<footer class="footer">
    <div class="wrapper-overfllow">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-12">
                    <div class="footer-left">
                        <div class="wrap">
                            <a href="index.html" class="foot-logo"><img src="/images/baseball/footer-logo.png" alt="footer-logo"></a>
                            <p>Activated charcoal trust fund ugh prism af, beard marfa air plant stumptown gastropub farm-to-table jianbing.</p>
                            <ul class="foot-left-menu">
                                <li><a href="staff.html">First team</a></li>
                                <li><a href="staff.html">Second team</a></li>
                                <li><a href="amateurs.html">Amateurs</a></li>
                                <li><a href="donations.html">Donation</a></li>
                                <li><a href="trophies.html">trophies</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12 col-lg-offset-1">
                    <div class="foot-news">
                        <h4>Recent news</h4>
                        <div class="item">
                            <a href="news.html" class="image"><img class="img-responsive" src="/images/baseball/foot-news-img.jpg" alt="news-image"></a>
                            <a href="news.html" class="name">When somersaulting Sanchez shouldered Mexicoâs hopes</a>
                            <a href="news.html" class="date">25 Sep 2016</a>
                            <span class="separator">in</span>
                            <a href="news.html" class="category">Highlights</a>
                        </div>
                    </div>
                </div>
                <div class=" col-lg-3 col-md-4 col-sm-12">
                    <div class="foot-contact">
                        <h4>Contact us</h4>
                        <ul class="contact-list">
                            <li><i class="fa fa-flag" aria-hidden="true"></i><span>276 Upper Parliament Street, Liverpool L8, Great Britain</span></li>
                            <li><i class="fa fa-envelope" aria-hidden="true"></i><a href="mailto:team@email.com">team@email.com</a></li>
                            <li class="phone"><i class="fa fa-phone" aria-hidden="true"></i><span>+61 3 8376 6284</span></li>
                        </ul>
                        <ul class="socials">
                            <li><a href="#"><i class="fa fa-facebook-square" aria-hidden="true"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                            <li><a href="#"><i class="fa fa-google" aria-hidden="true"></i></a></li>
                            <li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
                            <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-menu-wrap">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <ul class="footer-menu">
                        <li class="active"><a href="index.html"><span>Home</span></a></li>
                        <li><a href="matches.html"><span>Matches</span></a></li>
                        <li><a href="staff.html"><span>Team</span></a></li>
                        <li><a href="news.html"><span>News</span></a></li>
                        <li><a href="store.html"><span>Store</span></a></li>
                        <li><a href="contacts.html"><span>Contact</span></a></li>
                    </ul>	
                    <a href="#top" class="foot-up"><span>up <i class="fa fa-caret-up" aria-hidden="true"></i></span></a>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="container">
            <div class="row">
                <div class="col-xs-6">
                    <div class="copyrights">
                        Â© 2017 Team - Sport club psd template
                    </div>
                </div>
                <div class="col-xs-6">
                    <div class="created">
                        <a href="#">Created by <img src="/images/common/created-icon.png" alt="create-by-image"> torbara</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!--FOOTER END-->



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
