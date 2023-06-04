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
    <title>회원가입</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
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
    </style>
    
    <script type="text/javascript">
	
    $(function(){
		$('#userId').keyup(function(){
			let id = $('#userId').val(); // 입력 중인 id의 val을 변수에 선언한다.
			//console.log(id); // 현재 가져오는 id를 log로 출력해봄.
				//alert("여기까지 옴!");
			 $.ajax({
				url : "/user/userIdCheck", // 해당 url의 Controller로 진입
				type : "POST", // POST방식으로 전달
				data : {userId : id}, // data는 Key[userId], value[mb_id](위의 value)...
				dataType : 'json', // json데이터형식으로 보낸다.
				success : function(result){ // 서버에서 response(result값)가 전송된다.
					if(result == 1){ // 위 result가 1과 같으면 이미 사용중...
						$("#id_use").html('이미 사용중인 아이디입니다.');
						$("#id_use").attr('color','#dc3545');
					} 
					else if(result == 0 && id.length >= 5 && id.length <= 20){
						$("#id_use").html('사용할 수 있는 아이디입니다.');
						$("#id_use").attr('color','#2fb380');
					} 
					else if(id.length < 5){
						$("#id_use").html('최소 아이디 길이는 5자 입니다.');
						$("#id_use").attr('color','#dc3545');
					}
					else if(id.length > 20){
						$("#id_use").html('아이디는 20자를 넘길 수 없습니다.');
						$("#id_use").attr('color','#dc3545');
					}
				},
				error : function(){
					alert("서버요청실패");
				}
			})
		})
	})
    
	// 패스워드 체크
	$(function(){
		
		$("#password").keyup(function(){
			
			var password = $("#password").val();
			console.log(password);
			
			if(password.length < 10){
				$("#password_use").html('비밀번호는 10자 이상입니다.');
				$("#password_use").attr('color','#dc3545');
			} 
			else if(password.length >= 10 && password.length <= 20){
				$("#password_use").html('');
			}
			else if(password.length > 20){
				$("#password_use").html('비밀번호는 20자 이하만 가능합니다.');
				$("#password_use").attr('color','#dc3545');
			}
		});
	});
	
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
	
    // 패스워드 더블체크
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		
		$( "#passwordCheck" ).keyup(function() {
			
			var passwordCheck = $("#passwordCheck").val();
			var password = $("#password").val();
			console.log(passwordCheck);
			
			if(password == passwordCheck){
				$('#passwordCheck_use').html('비밀번호가 같아용');
				$('#passwordCheck_use').attr('color', '#2fb380');
			}
			else{
				$('#passwordCheck_use').html('입력한 비밀번호와 일치하지 않습니다.');
				$("#passwordCheck_use").attr('color', '#dc3545');
			}
		});
	});	
    
	// 이름 체크
	$(function(){
		
		$("#userName").keyup(function(){
			
			var userName = $("#userName").val();
			
			if(userName.length > 10){
				$("#userName_use").html('이름은 10자 이하만 가능합니다.');
				$("#userName_use").attr('color', '#dc3545');
			}
			else{
				$("#userName_use").html('');
			}
		});
	});	
	
	// 달력버튼 클릭
	$(function(){
		
		$("#userBirth").on("click", function(){
			
			var userBirth = $("#userBirth").val();
			console.log(userBirth);
			
		});
	});
	
	// 휴대폰 인증 클릭
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
	
	// 주소선택 버튼 클릭
	function sample6_execDaumPostcode() {
    	new daum.Postcode({
        oncomplete: function(data) {
        	
            // 주소 변수
            var addr = ''; 
            // 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { 
                addr = data.roadAddress;
            } else { 
                addr = data.jibunAddress;
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("sample6_address").value = addr;
            // 상세주소 필드로 커서 이동
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
	
	// form에 입력값 제출
	function fncAddUser() {		
		 	// 11개여야함.
			var userId=$("input[name='userId']").val();
			var password=$("#password").val();
			var userName=$("#userName").val();
			var userPhone=$("#userPhone").val();
			var userBirth=$("#userBirth").val();
			// addr1 + addr2 (주소 + 상세주소)
			var addr1 = $("input[name='addr1']").val();
			var addr2 = $("input[name='addr2']").val();
			var userAddr = addr1+addr2;
			
			var gender=$("#gender").val();
			var userEmail=$("#userEmail").val();
			var userNickName=$("input[name='userNickName']").val();
			var teamCode=$("#teamCode").val();
			var userImage=$("#userImage").val();
			
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
			}
			
			$("form").attr("method" , "POST").attr("action" , "/users/addUser").submit();
		}
		
	// 가입 버튼
    $(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		
		$( "#signup" ).on("click" , function() {
			fncAddUser();
		});
	});
	 
	// 뒤로 가기 버튼
	$(function(){
		
		$("#backback").on("click", function(){
			
			//alert("가입 취소");
			window.location.href="/user/loginTest(new).jsp";
			
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
<jsp:include page="/common/topBar.jsp"/>  
    <!--BREADCRUMBS BEGIN-->
<section class="image-header">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="info">
                    <div class="wrap">
                        <h1>회원가입</h1>
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
                <h4>회원가입</h4>	
                <div class="leave-comment-wrap">
                    <form>								
                        <div class="row">
                            <div class="col-md-8">
                                <div class="item">
                                    <label>
                                        <span>아이디 <i>*</i></span>
                                        <input type="text" name="userId" id="userId" placeholder="사용할 아이디를 입력하세요.">
                                        <font id="id_use" size="2"></font>
                                    </label>
                                </div>	
                            </div>
                            <div class="col-md-8">
                                <div class="item">
                                    <label>
                                        <span>패스워드 <i>*</i></span>
                                        <input type="password" name="password" class="password" id="password" placeholder="사용할 패스워드를 입력하세요.">
                                        <font id="password_use" size="2"></font>
                                    </label>
                                </div>	
                            </div>
                            <div class="col-md-8">
                                <div class="item">
                                    <label>
                                        <span>패스워드 확인<i>*</i></span>
                                        <input type="password" class="password" name="passwordCheck" id="passwordCheck" placeholder="입력한 패스워드와 같은 패스워드를 입력하세요.">
                                        <font id="passwordCheck_use" size="2"></font>
                                    </label>
                                </div>	
                            </div>
                            <div class="col-md-8">
                                <div class="item">
                                    <label>
                                        <span>이름<i>*</i></span>
                                        <input type="text" name="userName" id="userName" placeholder="성함을 입력해주세요.">
                                        <font id="userName_use" size="2"></font>
                                    </label>
                                </div>
                            </div>
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
                                        <span>성별<i>*</i></span>
                                        <input type="radio" name="gender" value="M" checked="checked">남
                                        <input type="radio" name="gender" value="W">여
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-8">
                            	<div class="item">
                            		<span>이메일</span>
		    						<input type="text" name="userEmail" id="userEmail" class="form-control" placeholder="id@example.com"/>
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
                            <div class="col-md-8">
                            	<div class="item">
                            		<label>
                            		<span>프로필 사진</span>
		    						<input type="file" name="userImage" id="userImage"/>
		    						</label>
                            	</div>
                            </div>
                            <div class="col-md-12">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                <button type="button" class="sign" id="signup">가입</button>&emsp;
                                <button type="button" class="back" id="backback">취소</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
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
