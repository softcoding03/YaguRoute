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
			var userBirth = $("#userBirth").val();
			var userEmail = "${user.userEmail}";
			var userPassword = "${user.password}";
			var userPhone = $("#userPhone").val();
			var gender = "${user.gender}";
			var userImage = "${user.userImage}";
			var userAddr = $("#userAddr").val();
			var userNickName = $("input[name='userNickName']").val();
			var teamCode = $("input[name='teamCode']").val();
			
			
			$("form").attr("method", "POST").attr("action", "/users/addKakaoUser").submit();
			
		});
	});
	
	$(function(){
   		$('#phoneButton').on("click", function(){
   		
   		var userId = $("#userId").val();
   		var userPhone = $("#userPhone").val(); // 휴대폰 번호
   		
   		var rnd = Math.floor(Math.random() * 9000) + 1000; //랜덤 수
   		alert(rnd);
   		alert(userId);
   		// rnd에 대한 HTML 요소 생성

   		var newDiv = document.createElement("div");

		// hidden 속성 추가
		var hiddenDiv = document.createElement('input');
   		hiddenDiv.type = "hidden";
		hiddenDiv.value = rnd;
		hiddenDiv.id = 'rnd';
		newDiv.appendChild(hiddenDiv);
		document.body.appendChild(newDiv);
		
   		$.ajax({
               url: "/users/phoneCheck/",
               method: "POST",
               dataType: "json",
               data: {userPhone : userPhone,
               		rnd : rnd}, // 수정: userId로 변경
               // userId앞에는 클라이언트단, 뒤에는 서버단이다.
               success: function(result) {
               	alert("인증번호를 발송하였습니다.");
               },
               error: function() {
               	alert("서버 오류 발생");
                   return;
           }
   		});
   	  });
   	});
	
	$(function(){
    	
    	$("#phoneCheckButton").on("click", function(){
    		
    		alert("인증버튼 클릭");
    		
    		var verify = $("#phoneCheck").val();
        	var rnd = $("#rnd").val();
    		
        	alert("verify:"+verify);
        	alert("rnd"+rnd);
        	
        	if(verify == rnd){
        		alert("인증이 완료되었습니다.");
        		openModal();
        	}
        	else{
        		alert("인증에 실패하였습니다.");
        	}
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
                        <h1>카카오 추가정보 입력</h1>
                        카카오 SNS 연동 계정입니다. 추가정보를 입력해 주세요.
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
			휴대폰 번호<br><input type="text" id="userPhone" name="userPhone" placeholder="휴대폰 번호를 입력하시오.( ' - '제외 휴대폰 번호만)">
			<button type="button" id="phoneButton">인증번호 전송</button>
		</div>
		<input name="userId" value="${user.userId}">
	<input name="userName" value="${user.userName}" style="display: none;">
	<input name="userEmail" value="${user.userEmail}" style="display: none;">
	<input name="userImage" value="${user.userImage}" style="display: none;">
	<input name="password" value="${user.password}" style="display: none;">
	<input name="gender" value="${user.gender}" style="display: none;">
		<div class="col-md-8">
			휴대폰 인증번호<br><input type="text" id="phoneCheck" name="phoneCheck" placeholder="인증번호를 입력하시오.">
			<button type="button" id="phoneCheckButton">인증번호 확인</button>
		</div>
		<div class="col-md-8">
			생년월일<br><input type="text" name="userBirth" id="userBirth">
			<button type="button" id="birthButton">달력 이미지</button>
		</div>
		<div class="col-md-8">
			주소<br><input type="text" name="userAddr"id="userAddr">
			<button type="button" id="addrButton">우편번호 검색</button>
			<!-- <br> <input type="text" id="userAddrPlus" placeholder="주소 추가정보 입력"> -->
		</div>
		<div class="col-md-8">
			닉네임<br>
			<input type="text" id="nicknameCheck" name="userNickName">
			<font id="nickname_use" size="2"></font>
		</div>
		<div class="col-md-8">
        <div class="item">
        		<label>
        		<span>선호 구단</span>
        			<input type="radio" name="teamCode" value="NN">선택하지 않음 
        			<input type="radio" name="teamCode" value="LG" checked="checked">LG 
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
