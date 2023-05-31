<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>야구Route 회원가입</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    
    <script type="text/javascript">
		$(function(){
			$('#updateUser').on("click", function(){
				alert("우연히~~~");
				window.location.href="/users/updateUser";
			});
		});	

		$(function(){
		$('.custom-btn').on('click', function() {
		    // 개별 이벤트 처리
		    alert("ㅎㅇ");
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
                        <h1>사용자 정보</h1>
                    </div>
                </div>
            </div>	
        </div>
    </div>
</section>
<!--BREADCRUMBS END-->

    <!--CONTACT WRAP BEGIN-->
<section class="contacts-wrap">
    <div class="container">
        <div class="row">
            <div class="col-md-7">
                <h4>내 정보 보기</h4>	
                <div class="leave-comment-wrap">
                    <form>								
                        <div class="row">
                            <div class="col-md-8">
                                <div class="item">
                                    <label>
                                        <span>아이디 <i>*</i></span>
                                        ${user.userId}
                                    </label>
                                </div>	
                            </div>
                            <div class="col-md-8">
                                <div class="item">
                                    <label>
                                        <span>이름<i>*</i></span>
                                        ${user.userName}
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="item">
                                    <label>
                                        <span>생년월일<i>*</i></span>
                                        ${user.userBirth}
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="item">
                                    <label>
                                        <span>성별</span>
                                        ${user.gender}
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-8">
                            	<div class="item">
                            		<label>
                            		<span>휴대폰 번호</span>
                            		${user.userPhone} 
		    						</label>
                            	</div>
                            </div>
                            <div class="col-md-8">
                            	<div class="item">
                            		<label>
                            		<span>이메일</span>
                            		${user.userEmail} 
		    						</label>
                            	</div>
                            </div>
                            <div class="col-md-8">
                            	<div class="item">
                            		<label>
                            		<span>닉네임</span>
                            		${user.userNickName} 
		    						</label>
                            	</div>
                            </div>
                            <div class="col-md-8">
                            	<div class="item">
                            		<label>
                            		<span>선호 구단</span>
                                    ${user.teamCode} 
		    						</label>
                            	</div>
                            </div>
                            <div class="col-md-8">
                            	<div class="item">
                            		<label>
                            		<span>프로필 사진</span>
		    						<img id="profile">이미지
		    						${user.userImage} 
		    						</label>
                            	</div>
                            </div>
                            <button class="custom-btn" data-action="custom-event">개별 이벤트</button>
                            <div class="col-md-8">
                            	<div class="item">
                            		<label>
                            		<span>포인트</span>
                                    ${user.userPoint}
		    						</label>
                            	</div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <div class="col-md-12">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                <button class="update" id="updateUser">정보 수정</button>&emsp;
                                <button class="back" id="back">뒤로</button>
                            </div>
                            <div class="col-md-12">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
								<button class="bye" id="withDraw">탈퇴</button>
                            </div>
    <div class="contacts-map">
        <img class="img-responsive" src="/images/baseball/contacts-map.jpg" alt="contacts-map">
    </div>
</section>
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
