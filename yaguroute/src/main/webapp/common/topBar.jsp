<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--MAIN MENU WRAP BEGIN-->
<div class="main-menu-wrap">
    <div class="container">
        <a href="/main.jsp" class="custom-logo-link"><img src="/images/baseball/yaguRoute.png" alt="logo" class="custom-logo" width="120" height="100"></a>
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
                    <li class="cart full">
                        <a href="/basket/getBasketList">
                            <span><i class="fa fa-shopping-cart" aria-hidden="true"></i></span>
                        </a>
                    </li>	
                </ul>
            </div>       
        </nav>
    </div>
</div>