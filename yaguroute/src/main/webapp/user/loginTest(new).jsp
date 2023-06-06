<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- ///////////////////////////// 로그인시 Forward  /////////////////////////////////////// -->
 <c:if test="${ ! empty user }">
 	<c:redirect url="/main.jsp"/>
 </c:if>
 <!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->

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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    
    <style> 
    .password {
    padding: 15px 10px;
    border: 1px solid transparent;
    width: 100%;
    background: #fff;
    font-size: 14px;
    color: #666;
    line-height: normal;
    outline: 0
    } 
    </style>
    
    <script type="text/javascript">
 
    // 아이디 비밀번호 일치하는지 확인
    $( function() {
		
		$("#userId").focus();
		
		$("#login").on("click" , function() {
			var id=$('#userId').val();
			var password=$('#password').val();
			
			
			if(id == null || id.length <1) {
				alert("id를 입력해 주세요.");
				return;
			}
			
			else if(password == null || password.length <1) {
				alert("password를 입력해 주세요.");
				return;
			}
			$("form").attr("method","POST").attr("action","/users/login").attr("target","_parent").submit();
		});
	});	
    
    // 회원가입 페이지 이동
    /* $(function(){
    	
    	$("#signup").on("click", function(){
    		
    		window.location.href = "/user/addUser.jsp";
    	});
    }); */
    
    // 회원가입 페이지로 이동 -팝업-
    $(function() {
    $("#signup").on("click", function() {
        $.ajax({
            url: "/user/addUser.jsp",
            success: function(result) {
            	
                var popup = window.open("", "회원가입", "width=600,height=1300");

                popup.document.write(result);
                popup.document.close();

                // 팝업 창이 로드된 후 자동 크기 조정 함수 호출
                $(popup).on("load", function() {
                    autoResizePopup(popup);
                });
            }
        });
    });

    // 팝업 창의 내용이 모두 표시되도록 자동 크기 조정
    function autoResizePopup(popup) {
        var contentWidth = $(popup.document).width();
        var contentHeight = $(popup.document).height();
		
        // 팝업 창의 크기를 내용의 크기에 맞게 조정
        popup.resizeTo(contentWidth, contentHeight);
    }
});
    
    // 아이디 찾기 페이지로 이동
    $(function(){
    	
    	$("#findUserId").on("click", function(){
    		
    		window.location.href="/user/findUserId.jsp";
    	});
    });
    
	$(function(){
    	
    	$("#findPassword").on("click", function(){
    		
    		window.location.href="/user/findPassword.jsp";
    	});
    });
	
	// 
	$(function(){
		$("#거정말거").on("click", function(){
			
			window.location.href="/users/listUser";
		});
	});
	
	$(function(){
		
		$("#addPlayer").on("click", function(){
			
			alert("선수 더하기 클릭");
			
			window.location.href = "/player/addPlayer";
		});
	});
	
	// 선수 리스트
	$(function(){
		
		$("#listPlayer").on("click", function(){
			alert("선수 리스트 클릭");
			
			window.location.href = "/player/listPlayer";
		});
	});
	
	// 이주의 선수 리스트
	$(function(){
		
		$("#bestPlayerList").on("click", function(){
			alert("최고의 선수 리스트");
			window.location.href="/player/listBestPlayer";
		});
	});
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

    <!--BREADCRUMBS BEGIN-->
<section class="image-header">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="info">
                    <div class="wrap">
                        <ul class="breadcrumbs">
                            <!--<li><a href="index.html">Main</a>/</li>
                            <li>Category</li>-->
                        </ul>
                        <h1>로그인 테스트 화면</h1>
                    </div>
                </div>
            </div>	
        </div>
    </div>
</section>
<!--BREADCRUMBS END-->

    <!--CONTACT WRAP BEGIN-->
<form>
<section class="contacts-wrap">
    <div class="container">
        <div class="row">
            <div class="col-md-7">
                <h4>로그인</h4>
                <div class="leave-comment-wrap">						
                        <div class="row">
                            <div class="col-md-6">
                                <div class="item">
                                    <label>
                                        <span>ID <i>*</i></span>
                                        <input type="text" id="userId" name="userId" placeholder="아이디">
                                    </label>
                                </div>	
                            </div>
                            <div class="col-md-6">
                                <div class="item">
                                    <label>
                                        <span>비밀번호 <i>*</i></span> 
                                        <input type="password" id="password" name="password" class="password" placeholder="패스워드">                     
                                    </label>
                                </div>	
                            </div>
                            <div class="col-md-12">
                                <div class="item">
                                <button type="button" id="login" class="comment-submit">로 그 인</button>&nbsp;
                                
                                <a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=SLklwWhn8OnVgyPdEeSU&redirect_uri=http://192.168.0.116:8080/users/naverLogin" class="Naver-login-btn">
                                <img id="naverLogin" class="naver-submit" width="183" height="45" src="/images/user/naverLogin.png" alt="네이버 로그인 버튼">
                                </a>
                                
                                <a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=de7a7191e54450e6a2c21681d9443c93&redirect_uri=http://192.168.0.116:8080/users/kakaoLogin">
                                <img id="kakaoLogin" class="kakao-submit" width="183" height="45" src="/images/user/kakaoLogin.png" alt="카카오 로그인 버튼">
                                </a>
                                <div class="route"><br><br><br><br>
								<button type="button" id="signup" class="signup" >회 원 가 입</button><br>
								<button type="button" id="findUserId" class="find">아이디 찾기</button>
								<button type="button" id="findPassword" class="find">비밀번호 찾기</button>
								
								<h5>힌트</h5>아이디 - admin<br>비밀번호 - 1234
 								</div>
 								<button type="button" id="addPlayer" class="plusPlayer">선수 추가</button>
 								<button type="button" id="listPlayer" class="listPlayer">선수 리스트</button>
 								<button type="button" id="bestPlayerList" class="bestPlayer">이주의 선수 리스트</button>
                            </div>
                       </div>
					 </div>
                   </div>
                </div>
            </div>
        </div>
</section>
</form>

<!--CONTACT WRAP END-->

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
