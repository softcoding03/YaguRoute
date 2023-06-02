<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- ///////////////////////////// 로그인시 Forward  /////////////////////////////////////// -->

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
    
    <script type="text/javascript">
	$(function(){
			
			$('#nicknameCheck').keyup(function(){
				
				var nickname = $('#nicknameCheck').val();
				console.log(nickname);
				$.ajax({
					url : "/user/userNickNameCheck",
					method : "POST",
					data : {userNickName : nickname},
					dataType : 'json',
					success : function(result){
						if(result == 1){
							$("#nickname_use").html('이미 사용중인 닉네임입니다.');
							$("#nickname_use").attr('color', '#dc3545');
						
						}else{
							$('#nickname_use').html('사용 가능한 닉네임입니다.');
							$('#nickname_use').attr('color', '#2fb380');
						}
					},
					error : function(){
						alert("서버 요청 실패");
					}
				})
			})
		});
	
	$(function(){
		
		$("#signup").on("click", function(){
			
			var userId = "${user.userId}";
			var userName = "${user.userName}";
			var userBirth = "${user.userBirth}";
			var userEmail = "${user.userEmail}";
			var userPassword = "${user.password}";
			var userPhone = "${user.userPhone}";
			var gender = "${user.gender}";
			var userImage = "${user.userImage}"
			var teamCode = "${user.teamCode}";
			var userAddr = $("#userAddr").val();
			var userNickName = $("input[name='userNickName']").val();
			var teamCode = $("input[name='teamCode']").val();
			
			
			$("form").attr("method", "POST").attr("action", "/users/addNaverUser").submit();
			
		});
	});
	
	$(function(){
		
		$("#backback").on("click", function(){
			
			alert("가입 취소");
			window.location.href = "/user/loginTest(new).jsp";
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
                        <h1>네이버 추가정보 입력</h1>
                        네이버 SNS 연동 계정입니다. 추가정보를 입력해 주세요.
                    </div>
                </div>
            </div>	
        </div>
    </div>
</section>
<!--BREADCRUMBS END-->

    <!--CONTACT WRAP BEGIN-->
<form>
	<div class="container">
		<div class="row">
		<div class="col-md-8">
			주소<br><input type="text" id="userAddr" name="userAddr">
			<!-- <button type="button" id="addrButton">우편번호 검색</button> -->
			<!-- <br> <input type="text" id="userAddrPlus" placeholder="추가정보 입력"> -->
		</div>
		<input name="userId" value="${user.userId}" />
		<input name="userName" value="${user.userName}" />
		<input name="userBirth" value="${user.userBirth}" />
		<input name="userEmail" value="${user.userEmail}" />
		<input name="password" value="${user.password}" />
		<input name="userPhone" value="${user.userPhone}" />
		<input name="gender" value="${user.gender}" />
		<input name="userImage" value="${user.userImage}"/>
		<input name="teamCode" value="${user.teamCode}" />
		<div> 
		<div class="col-md-8">
			닉네임<br>
			<input type="text" id="nicknameCheck" name="userNickName">
			<font id="nickname_use" size="2"></font>
		</div>
		<div class="col-md-8">
                      <div class="item">
                      		<label>
                      		<span>선호 구단</span>
                      			<input type="radio" name="teamCode" value="NN" checked="checked">선택하지 않음 
                      			<input type="radio" name="teamCode" value="LG">LG 
                              	<input type="radio" name="teamCode" value="SS">SS 
                              	<input type="radio" name="teamCode" value="LT">LT 
                              	<input type="radio" name="teamCode" value="OB">OB 
                              	<input type="radio" name="teamCode" value="NC">NC 
                              	<input type="radio" name="teamCode" value="HT">HT 
                              	<input type="radio" name="teamCode" value="SS">SS 
                              	<input type="radio" name="teamCode" value="WO">WO 
                              	<input type="radio" name="teamCode" value="HH">HH 
                              	<input type="radio" name="teamCode" value="KT">KT 
						</label>
                      </div>
		</div>
		<br><br> 
		</div>
		
		<div class="col-md-8">
			<button type="button" id="signup">가입</button>
			<button type="button" id="backback">취소</button>
		</div>
	</div>
	</div>
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
