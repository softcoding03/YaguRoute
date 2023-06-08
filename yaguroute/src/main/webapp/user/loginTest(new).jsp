<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
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
    .password, .text{
    padding: 15px 10px;
    border: 1px solid transparent;
    width: 100%;
    background: #fff;
    font-size: 14px;
    color: #666;
    line-height: normal;
    outline: 0
    
    /* center */
    .container_1 {
    display: grid !important;
    place-items: center !important;
    } 
    </style>
    <style>
    	body {
            /* background-color: #6c9900; */
            /* background-color: #ddd; */
            background-size: cover;
            font-family: Arial, sans-serif;
        }
		footer {
			border-top: 2px solid #d3d5db;
			
		}
		.login-wrapper {
		
		/* background-color: #ddd; */
        height: 1000px; /* 여기서 전체 높이 값을 조정해주세요 */
        display: flex;
        justify-content: center;
        align-items: center;
    	}

        .login-container {
            width: 550px;
            height: 800px;
            padding: 20px;
            border-radius: 7px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            margin: 0 auto;
            background-color: #ffffff;
        }
	
        .login-container h3 {
            color: #333333;
            text-align: center;
        }
		
		.login-message {
		  display: flex;
		  justify-content: center;
		  align-items: center;
		}
		
        .login-container label {
            display: block;
            color: #333333;
            font-size: 13px;
        }

		.login-container input[type="text"], 
		.login-container input[type="password"]
		{
		    width: 100%;
        	padding: 10px;
        	border-radius: 5px;
        	border: 1px solid #ccc;

		}
		.login-container input::placeholder {
        	opacity: 0.7; /* 투명도 조정 */
    	}
		
		
        .login-container button[type="button"] {
            width: 100%;
            height: 45px;
            background-color: #4CAF50;
            color: #ffffff;
            border: 1px solid #ccc;
            border-radius: 5px;
            cursor: pointer;
            font-size : 15px;
        }

        .login-container button[type="button"]:hover {
            background-color: #45a049;
        }
        
        .comment-submit {
		  display: flex;
		  -webkit-box-align: center;
		  align-items: center;
		  -webkit-box-pack: center;
		  justify-content: center;
		}
		.separator {
		  margin: 0 5px;
		  color: #000;
		}
		.kuGZmW {
		    min-width: 1px;
		    width: 100%;
		    flex: 1 1 0%;
		    margin: 0px;
		    border-bottom: 1px solid rgb(221, 223, 226);
		}
		.behindAccount{
			justify-content: center;
		  	align-items: center;
		}
		
		.eaVHUA {
		    width: 100%;
		    display: flex;
		    text-align: center;
		    -webkit-box-pack: center;
		    justify-content: center;
		    -webkit-box-align: center;
		    align-items: center;
		    position: relative;
		    background-color: transparent;
		    padding: 0px;
		}
		.bdPxIn {
		    margin-right: 8px;
		    display: flex;
		}
		.clGFVP {
		    display: flex;
		    -webkit-box-align: center;
		    align-items: center;
		    -webkit-box-pack: center;
		    justify-content: center;
		}
		.dAxUxB {
		    font-size: 14px;
		    line-height: 20px;
		    font-weight: 500;
		}
		.cont {
            /* width: 350px; */
            padding: 16px 16px 12px 17px; 
        }
        .cont p {
            font-size: 12px;
            color: grey;
            margin-bottom: 10px;
        }

        .link-login {
            display: block;
            padding: 15px 0;
            background: #19ce60;
            color: #fff;
            font-size: 16px;
            margin-bottom: 10px;
            /* 글자를 가운대로 정렬합니다. */
            text-align: center;
        }

        .link-login img {
            display: inline-block;
            width: 60px;
            height: 12px;
            margin-right: 5px;
            /* 상하 정렬을 조정해줍니다. 오직 inline, inline-block 요소에서만 작동합니다. */
            vertical-align: -1px;
        }
        .kakao-login {
		  display: block;
		  padding: 15px 0;
		  background: #FEE500;
		  color: #000000;
		  font-size: 16px;
		  margin-bottom: 10px;
		  /* 글자를 가운데로 정렬합니다. */
		  text-align: center;
		}
		
		.kakao-login svg {
		  display: inline-block;
		  width: 24px;
		  height: 24px;
		  margin-right: 5px;
		  /* 상하 정렬을 조정해줍니다. 오직 inline, inline-block 요소에서만 작동합니다. */
		  vertical-align: middle;
		}
		.list_corp .corp_item {
		    color: #404040;
		    display: inline-block;
		    line-height: 5px;
		}

		.corp_item:not(:last-child)::after {
		    content: "|";
		    margin-left: 5px;
		    margin-right: 5px;
		    color: gray;
		    font-size: 10px;
		}
		.corp_area {
			color: #FFFF;
		    width: 1000px;
		    margin: 0 auto;
		    padding-top: 15px;
		    line-height: 10px;
		    text-align: center;
		}
		.middle {
			display: flex;
		  	justify-content: center;
		  	align-items: center;
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
    function signupFunction() {
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
    }
    
    function findUserIdFunction(){
    	$.ajax({
            url: "/user/findUserId.jsp",
            success: function(result) {
            	
                var popup = window.open("", "아이디 찾기", "width=480,height=630");

                popup.document.write(result);
                popup.document.close();

                // 팝업 창이 로드된 후 자동 크기 조정 함수 호출
                $(popup).on("load", function() {
                    autoResizePopup(popup);
                });
            }
        });
    	
    }
    
    function findPasswordFunction(){
    	$.ajax({
            url: "/user/findPassword.jsp",
            success: function(result) {
            	
                var popup = window.open("", "비밀번호 찾기", "width=500,height=730");

                popup.document.write(result);
                popup.document.close();

                // 팝업 창이 로드된 후 자동 크기 조정 함수 호출
                $(popup).on("load", function() {
                    autoResizePopup(popup);
                });
            }
        });
    }

    // 팝업 창의 내용이 모두 표시되도록 자동 크기 조정
    function autoResizePopup(popup) {
        var contentWidth = $(popup.document).width();
        var contentHeight = $(popup.document).height();
		
        // 팝업 창의 크기를 내용의 크기에 맞게 조정
        popup.resizeTo(contentWidth, contentHeight);
    }
    
    // 아이디 찾기 페이지로 이동
    function findUserId(){
    		
    		window.location.href="/user/findUserId.jsp";
    }
    	
	function findPassword(){
    		
    		window.location.href="/user/findPassword.jsp";
    }
	
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

<!--CONTACT WRAP BEGIN-->
<div class="login-wrapper">
	<div class="container">
	<footer style="margin-bottom: 40px;"></footer>
        <div class="login-container">
                <h3>야구 ROUTE</h3>
                <span class="login-message">야구 ROUTE 페이지를 방문해 주셔서 감사합니다.</span>
                <b class="middle"> 사이트를 이용하시려면 로그인이 필요합니다.</b>
                <br><br>
                <div class="leave-comment-wrap">
                        <form>
	                        <label for="userId">아이디</label>
	                        <input type="text" id="userId" name="userId" style="margin-bottom: 15px;" placeholder="아이디 입력">
	                        
	                        <label for="password">비밀번호</label>
	                        <input type="password" id="password" name="password" class="password" placeholder="비밀번호 입력">
	                        
	                        <br><br>
	                              
	                   		<button type="button" id="login" class="comment-submit" style="margin-bottom: 15px;"><b>로 그 인</b></button>
                            <a href="javascript:void(0);" onclick="signupFunction()" style="font-size: 15px;"> 회원 가입</a> 
                            <a href="javascript:void(0);" onclick="findPasswordFunction()" style="font-size: 15px; float: right;" >패스워드 찾기</a> 
                            <span style="float: right; opacity: 0.7;">&nbsp;|&nbsp;</span>
                            <a href="javascript:void(0);" onclick="findUserIdFunction()" style="font-size: 15px; float: right;" >아이디 찾기</a>
                            <br><br>
                            
                            <div class="eaVHUA">
                            <div class="kuGZmW"></div>
                            <span class="behindAccount" style="font-size: 14px; align-items: center;">혹은 아래 계정을 이용해 로그인</span>
                            <div class="kuGZmW"></div>
                            </div>
                            <br>
                            
                           	<div class="cont">
							  <!-- 네이버 로그인 버튼 -->
							  <a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=SLklwWhn8OnVgyPdEeSU&redirect_uri=http://192.168.0.116:8080/users/naverLogin" class="link-login">
							    <img src="/images/user/naverTitle.png" alt="네이버" /> 네이버로 로그인
							  </a>
							  <!-- 카카오 로그인 버튼 -->
							  <a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=de7a7191e54450e6a2c21681d9443c93&redirect_uri=http://192.168.0.116:8080/users/kakaoLogin" class="kakao-login">
							    <svg viewBox="0 0 32 32" focusable="false" role="presentation" class="withIcon_icon__2KxnX SNSButtonList_kakaoIcon__1s6gw" aria-hidden="true">
							      <path d="M16 4.64c-6.96 0-12.64 4.48-12.64 10.08 0 3.52 2.32 6.64 5.76 8.48l-.96 4.96 5.44-3.6 2.4.16c6.96 0 12.64-4.48 12.64-10.08S22.96 4.56 16 4.64z"></path>
							    </svg>
							    카카오로 로그인
							  </a>
							</div>
                                <!--
                                <a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=de7a7191e54450e6a2c21681d9443c93&redirect_uri=http://192.168.0.116:8080/users/kakaoLogin">
                                <img id="kakaoLogin" class="kakao-submit" width="183" height="45" src="/images/user/kakaoLogin.png" alt="카카오 로그인 버튼">
                                </a> -->

								<!-- <button type="button" id="signup" class="signup" >회 원 가 입</button><br>
								<button type="button" id="findUserId" class="find">아이디 찾기</button>
								<button type="button" id="findPassword" class="find">비밀번호 찾기</button> -->
 								<!-- <button type="button" id="addPlayer" class="plusPlayer">선수 추가</button>
 								<button type="button" id="listPlayer" class="listPlayer">선수 리스트</button>
 								<button type="button" id="bestPlayerList" class="bestPlayer">이주의 선수 리스트</button> -->
					  </form>
                   </div>
                </div><br>
                <div>
                <footer>
                </footer>
                </div>
	                <div class="corp_area">
	                <ul class="list_corp">
		                <li class="corp_item"><a target="_blank" href="https://www.navercorp.com/naver/proposalGuide">제휴제안 </a></li>
		                <li class="corp_item"><a target="_blank" href="https://www.naver.com/policy/service.html">이용약관</a></li>
		                <li class="corp_item"><a target="_blank" href="https://www.naver.com/policy/privacy.html">개인정보처리방침 </a></li>
		                <li class="corp_item"><a target="_blank" href="https://policy.naver.com/policy/service_group.html">네이버 정책 </a></li>
		                <li class="corp_item"><a target="_blank" href="/images/user/rockseongface.jpg"><strong>야구Route CEO 소개</strong></a></li>
	                </ul>
	                </div>
                </div>
		 </div>

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
