<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--MAIN MENU WRAP BEGIN-->
<div class="main-menu-wrap sticky-menu">
    <div class="container">
        <a href="/main.jsp" class="custom-logo-link"><img src="/images/baseball/logo.png" alt="logo" class="custom-logo"></a>
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
                        <a href="/index.html"><span>홈</span></a>
                        <ul>
                            <li><a href="users/listUser"><span>회원 목록 조회</span></a></li>
                            <li><a href="users/getUser"><span>로그인 회원 조회</span></a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="/ticket/getGameList2w?teamCode=HH"><span>경기 예매</span></a>
                    </li>
                    <li>
                        <a href="/predict/getUserPredict"><span>게임 예측</span></a>
                    </li>
                    <li><a href="/game/getGameList"><span>게임 매치</span></a></li>
                    <li><a href="/post/getPostList?teamCode=OB"><span>커뮤니티 게시판</span></a></li>
                    <li><a href="/algudgodmain.jsp"><span>Store</span></a></li>
                    <li><a href="/channel/listChannel"><span>실시간 중계</span></a></li>
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
                        <a href="/basket/getBasketList">
                            <span><i class="fa fa-shopping-cart" aria-hidden="true"></i></span>
                        </a>
                        <div class="cart-drop">
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