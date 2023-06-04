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
    .modal {
      display: none;
      position: fixed;
      z-index: 1;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      overflow: auto;
      background-color: rgba(0, 0, 0, 0.4);
    }
    
    .modal-content {
      background-color: #fefefe;
      margin: 15% auto;
      padding: 20px;
      border: 1px solid #888;
      width: 300px;
    }
  </style>
    
    <script type="text/javascript">
    
    $(function(){
    	
		$("#idButton").on("click", function(){
			
			var userId = $("#userId").val();
			
			alert(userId);
			
			$.ajax({
	               url: "/user/userIdCheck/",
	               method: "POST",
	               dataType: "json",
	               data: {userId : userId}, // 수정: userId로 변경
	               // userId앞에는 클라이언트단, 뒤에는 서버단이다.
	               success: function(result) {
	            	   if(result == 1){
	            	   alert("아이디가 확인 완료.");
	            	   }
	            	   else{
	            		   alert("아이디가 존재하지 않습니다.");
	            	   }
	               },
	               		error: function() {
	               		alert("서버 오류 발생...");
	                   	return;
	           }
	   		});
			
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
	    	
	    	window.location.href = "/user/loginTest(new).jsp";
	      });
	   });	
	   
		// 모달 창
	    function openModal() {
	        document.getElementById("modal").style.display = "block";
	        
	        var userId = $("#userId").val();
	        var userPhone = $("#userPhone").val();
	        
	        alert("userId : "+userId);
	        
	        var phoneNumberInput = $('#phoneNumber');
	        phoneNumberInput.val('');
	        
	        $.ajax({
	            url: "/users/findPassword/",
	            method: "POST",
	            dataType: "json",
	            data: {userPhone : userPhone, userId : userId}, // 수정: userId로 변경
	            
	            // userId앞에는 클라이언트단, 뒤에는 서버단이다.
	            success: function(passwords) {
	            	
	            	for (var i = 0; i < passwords.length; i++){
	            		 phoneNumberInput.val(function(index, currentValue){
	            			if(currentValue === '') {
	            				return passwords[i];
	            			} else{
	            				return currentValue + ',' + passwords[i];
	            			}
	            		 })
	            	}
	            },
	            error: function() {
	            	alert("서버 오류 발생");
	                return;
	            }
			});
	        
	    }
	      
	    function closeModal() {
	        document.getElementById("modal").style.display = "none";
	    }
		
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
                        <h1>비밀번호 찾기</h1>
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
			아이디<br><input type="text" id="userId" name="userId" placeholder="아이디를 입력하시오.">
			<button type="button" id="idButton">아이디 확인</button>
		</div>
		<div class="col-md-8">
			휴대폰 번호<br><input type="text" name="userPhone" id="userPhone" placeholder="휴대폰 번호를 입력하시오.( ' - '제외 휴대폰 번호만)">
			<button type="button" id="phoneButton">인증번호 발송</button>
		</div>
		<div class="col-md-8">
			휴대폰 인증번호<br><input type="text" id="phoneCheck" placeholder="인증번호를 입력하시오.">
		</div>
		
		</div>
		<br><br> 
		<div class="col-md-8">
			<button type="button" id="phoneCheckButton">인증번호 확인</button>
			<button type="button" id="backback">뒤로</button>
		</div>
	</div>

	<!-- 모달창 -->
  <div id="modal" class="modal">
    <div class="modal-content">
      <h6>패스워드 조회결과</h6>
      	<input type="text" id="phoneNumber" value="" readonly>
      
      <!-- <button onclick="findId()">확인</button> -->
      <button onclick="closeModal()">닫기</button>
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
