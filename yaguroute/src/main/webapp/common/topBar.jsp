<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--MAIN MENU WRAP BEGIN-->
<style>
.custom-logo-link{
	right: 150px;
}
.main-menu-wrap{
		position: sticky;
		top:0;
		z-index: 9999;
}
img.logo{
	height: 100px;
	float:left;
}
@font-face{
	font-family:"Gwangyang";
	src:url("/fonts/Gwangyang.ttf") format("TrueType");
}

.navbar a,span.topbar{
	font-family:"Gwangyang";
	font-size: 16px;
	color:white;
}

.topbar-right {
    position: absolute;
    top: 30px;
    right: 5%;
    display: flex;
    align-items: center;
    flex-direction: column;
}



/* 로그아웃 추가를 위한 너비 확장 
.container {
    width: 1370px;
}
*/
</style>

<div class="main-menu-wrap">
    <div class="container">
        <a href="javascript:;" class="custom-logo-link getMain">
        	<img src="/images/baseball/yaguRoute.png" class="logo"/>
        </a>
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#team-menu" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <nav class="navbar">
            <div class="collapse navbar-collapse" id="team-menu">
                <ul class="main-menu nav">
                    <li>
                        <a href="javascript:;" class="getMain"><span class="topbar">홈</span></a>
                    </li>
                    <li>
	                    	<a href="/game/getGameList"><span class="topbar">경기 스케줄</span></a>
	                    	<ul>
                    		<li><a href="/game/getGameList"><span class="topbar">경기 일정</span></a></li>
                    		<li><a href="/game/getTeam?teamCode=${user.teamCode}"><span class="topbar">팀 정보</span></a></li>
                    		<li><a href="/predict/getUserPredict"><span class="topbar">게임 예측</span></a></li>
                    		</ul>
                    </li>
                    <li><a href="/channel/listStreaming"><span class="topbar">실시간 중계</span></a></li>
                    <li>  <a href="/player/listPlayer?teamCode=ALL"><span class="topbar">선수 조회</span></a>
                        <ul>
                        	 <li><a href="/player/listPlayer?teamCode=ALL"><span class="topbar">선수 리스트</span></a></li>
                            <li><a href="/player/listBestPlayer"><span class="topbar">이 주의 선수</span></a></li>
                        </ul>
                    </li>
                    <li><a href="/ticket/getGameList2w?teamCode=${user.teamCode}"><span class="topbar">티켓 예매</span></a>
                        <ul>
                        	<li><a href="/ticket/getGameList2w?teamCode=${user.teamCode}"><span class="topbar">티켓 예매</span></a></li>
                        	<li><a href="/ticket/getTicketPurchaseList?userId=${user.userId}"><span class="topbar">티켓 예매내역 조회</span></a></li>
                        </ul>
                    </li>
                    <li><a href="/product/salesProdList?prodTeamCode=ALL"><span class="topbar">상점</span></a></li>
                    <li><a href="/post/getPostList?teamCode=${user.teamCode}"><span class="topbar">커뮤니티 게시판</span></a>
                    		<ul>
                        	<li><a href="/post/getPostList?teamCode=${user.teamCode}"><span class="topbar">내 팀 게시판</span></a></li>
                        	<li><a href="/post/getMyPostList"><span class="topbar">내가 작성한 게시물</span></a></li>
                        	<li><a href="/post/getNoticeList"><span class="topbar">공지사항</span></a></li>
                        </ul>
                    </li>
                    <c:if test="${user.role eq 'admin'}">
	                    <li><a href="/users/listUser"><span class="topbar">관리자페이지</span></a>
	                        <!-- <ul>
	                        	<li><a href="/users/listUser"><span class="topbar">회원 목록 조회</span></a></li>
	                            <li><a href="/product/listProduct?prodTeamCode=ALL"><span class="topbar">판매상품관리</span></a></li>
	                            <li><a href="/transaction/dlvyTranList"><span class="topbar">상품배송관리</span></a></li>                                
	                            <li><a href="/product/addProductView.jsp"><span class="topbar">상품등록</span></a></li>
	                            <li><a href="javascript:;" class="getSalesList"><span class="topbar">티켓판매내역조회</span></a></li>
	                            <li><a href="/channel/listChannel"><span class="topbar">채널 관리</span></a></li>                        
	                        </ul> -->
	                    </li>
                    </c:if>
               	  <li><a href="/users/getUser"><span class="topbar">마이페이지</span></a>
                        <ul>
                        	<li><a href="/users/getUser"><span class="topbar">내 정보</span></a></li>
                            <li><a href="/transaction/listTransaction"><span class="topbar">구매 목록</span></a></li>
                        </ul>
                    </li>
                    <li class="cart">
                        <a href="/basket/getBasketList">
                            <span><i class="fa fa-shopping-cart" aria-hidden="true"></i></span>
                        </a>
                    </li>
                </ul>
            </div> 
        </nav>
        <!-- 유저이미지 & 로그인,로그아웃 버튼-->
			<div class="topbar-right">
				<a href="/users/getUser">
					<img src="${user.userImage}" onerror="this.src=&#39;/images/user/defaultProfile.png&#39;" alt="유저 이미지" style="width: 30px; border-radius: 100%; height: 30px;">
				</a>
				<c:if test="${empty sessionScope.user}">
					<a href="/users/login">
						<span class="topbar">로그인</span><br>
					</a>
				</c:if>
				<c:if test="${not empty sessionScope.user}">
					<a href="/users/logout">
						<span class="topbar">로그아웃</span>
					</a>
				</c:if>
			</div>
	</div>
</div>



<script type="text/javascript">
	
	//Main에 데이터 뿌려주기 위한 req
	$("a.getMain").on("click", function() {
		self.location = "/main/getMain";
	});
</script>





