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
    
    <style>
    .birthday {
	    font-size: 16px;
	    font-family: Consolas, sans-serif;
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
		
    </style>
    
    <script type="text/javascript">
    // 닉네임 체크
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
					
					}else if(nickname.length <= 20){
						
						$('#nickname_use').html('사용 가능한 닉네임입니다.');
						$('#nickname_use').attr('color', '#2fb380');
						
					}
					else if(nickname.length > 20){
						$("#nickname_use").html('닉네임은 최대 20자 까지 가능합니다.');
						$("#nickname_use").attr('color', '#dc3545');
					
					}
				},
				error : function(){
					alert("서버 요청 실패");
				}
			})
		})
	});

    // 휴대폰 버튼 클릭
	$(function(){
   		$('#phoneButton').on("click", function(){
   		
   		var userPhone = $("#userPhone").val(); // 휴대폰 번호
   		
   		var rnd = Math.floor(Math.random() * 90000) + 10000; //랜덤 수
   		// rnd에 대한 HTML 요소 생성

   		var newDiv = document.createElement("div");

		// hidden 속성 추가
		var hiddenDiv = document.createElement('input');
   		hiddenDiv.type = "hidden";
		hiddenDiv.value = rnd;
		hiddenDiv.id = 'rnd';
		newDiv.appendChild(hiddenDiv);
		document.body.appendChild(newDiv);
		
		if(userPhone.length == 11){
			alert("인증번호를 발송하였습니다.");
		}
		else{
			alert("휴대폰 번호를 다시 입력해주세요.");
			return;
		}
		
   		$.ajax({
               url: "/users/phoneCheck/",
               method: "POST",
               dataType: "json",
               data: {userPhone : userPhone,
               		rnd : rnd}, // 수정: userId로 변경
               // userId앞에는 클라이언트단, 뒤에는 서버단이다.
               success: function(result) {
               },
               error: function() {
               	alert("서버 오류 발생");
                   return;
           }
   		});
   	  });
   	});
	
    // 인증번호 확인
	$(function(){
    	
    	$("#phoneCheckButton").on("click", function(){
    		
    		alert("인증버튼 클릭");
    		
    		var verify = $("#phoneCheck").val();
        	var rnd = $("#rnd").val();
        	
        	if(verify == rnd){
        		alert("인증이 완료되었습니다.");
        	}
        	else{
        		alert("인증에 실패하였습니다.");
        		return;
        	}
    	});
    });
	
	
    // 가입 버튼 클릭
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
			var phoneCheck = $("#phoneCheck").val();
			
			if(userId == null || userId.length <1){
				alert("아이디는 반드시 입력하셔야 합니다.");
				return;
			}
			if(password == null || password.length <1){
				alert("패스워드는  반드시 입력하셔야 합니다.");
				return;
			}
			if(userName == null || userName.length <1){
				alert("이름은  반드시 입력하셔야 합니다.");
				return;
			}
			if(userPhone == null || userPhone < 1){
				alert("휴대폰 번호는 반드시 입력하셔야 합니다. ");
				return;
			}
			
			$("form").attr("method", "POST").attr("action", "/users/addKakaoUser").submit();
			
		});
	});
    
	// 가입 버튼
    $(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		
		$( "#signup" ).on("click" , function() {
			fncAddUser();
		});
	});
	
	 // 가입 취소 버튼 클릭
	$(function(){
		
		$("#backback").on("click", function(){
			
			window.location.href = "/user/loginTest(new).jsp";
		});
	});
    </script>
    
</head>

<body>
	
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
                                <div class="item">
                                    <label>
                                        <span>생년월일<i>*</i></span>
                                        <input type="date" class="birthday" name="userBirth" id="userBirth">
                                    </label>
                                </div>
                            </div>
		<div class="col-md-8">
                            	<div class="item">
                            		<label>
                            		<span>휴대폰 번호</span>
		    						<input type="text" name="userPhone" id="userPhone" class="form-control" placeholder="' - ' 를 제외한 휴대폰 번호를 입력해주세요."/>
		    						<button type="button" id="phoneButton" >인증번호 발송</button>
		    						</label>
                            	</div>
                            </div>
                            <div class="col-md-8">
                            	<div class="item">
                            		<label>
		    						<input type="text" name="userPhoneCheck" id="phoneCheck" class="form-control" placeholder="인증번호를 입력해주세요."/>
		    						<button type="button" id="phoneCheckButton" >인증번호 확인</button>
		    						</label>
                            	</div>
                            </div>
                            <div class="col-md-8">
                            	<div class="item">
                            		<label>
                            		<span>주소</span>
		    						<input readonly disabled class="form-control" type="text" id="sample6_address" placeholder="주소" name="addr1">
		    						<button type="button" onclick="sample6_execDaumPostcode()">주소 선택</button>
									<input type="text" class="form-control" id="sample6_detailAddress" placeholder="상세주소" name="addr2">
									<input type ="hidden" name="userAddr" id="userAddr"> 
		    						</label>
                            	</div>
                            </div>
                            
		<div class="col-md-8">
                            	<div class="item">
                            		<label>
                            		<span>사용자 닉네임</span>
		    						<input type="text" name="userNickName" id="nicknameCheck" class="form-control" placeholder="사용할 닉네임을 입력해주세요."/>
		    						<font id="nickname_use" size="2"></font>
		    						</label>
                            	</div>
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
		
		<input name="userName" value="${user.userName}" style="display: none;">
		<input name="userEmail" value="${user.userEmail}" style="display: none;">
		<input name="userImage" value="${user.userImage}" style="display: none;">
		<input name="password" value="${user.password}" style="display: none;">
		<input name="gender" value="${user.gender}" style="display: none;">
		
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
