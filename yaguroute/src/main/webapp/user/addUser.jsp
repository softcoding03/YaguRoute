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
    <title>야구Route 회원가입</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    
    <script type="text/javascript">
	
    $(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$( "#signup" ).on("click" , function() {
			//alert("ㅎㅇㅎㅇㅇ");
			fncAddUser();
		});
	});	
    
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
		$('#idCheck').keyup(function(){
			let id = $('#idCheck').val(); // 입력 중인 id의 val을 변수에 선언한다.
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
					} else{
						$("#id_use").html('사용할 수 있는 아이디입니다.');
						$("#id_use").attr('color','#2fb380');
					} 
				},
				error : function(){
					alert("서버요청실패");
				}
			})
		})
	})
	
	function fncAddUser() {
			
			var userId=$("input[name='userId']").val();
			var password=$("#password").val();
			var userName=$("#userName").val();
			var userPhone=$("#userPhone").val();
			var userBirth=$("#userBirth").val();
			var userAddr=$("#userAddr").val();
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
                                        <input type="text" name="userId" id="idCheck" placeholder="사용할 아이디를 입력하세요.">
                                        <font id="id_use" size="2"></font>
                                    </label>
                                </div>	
                            </div>
                            <div class="col-md-8">
                                <div class="item">
                                    <label>
                                        <span>패스워드 <i>*</i></span>
                                        <input type="password" name="password" id="password" placeholder="사용할 패스워드를 입력하세요.">
                                    </label>
                                </div>	
                            </div>
                            <div class="col-md-8">
                                <div class="item">
                                    <label>
                                        <span>패스워드 확인<i>*</i></span>
                                        <input type="text" name="passwordCheck">
                                    </label>
                                </div>	
                            </div>
                            <div class="col-md-8">
                                <div class="item">
                                    <label>
                                        <span>이름<i>*</i></span>
                                        <input type="text" name="userName" id="userName">
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="item">
                                    <label>
                                        <span>생년월일<i>*</i></span>
                                        <input type="text" name="userBirth" id="userBirth">
                                        <button type="button" name="date">달력클릭...</button>
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
                            		<label>
                            		<span>이메일</span>
		    						<input type="text" name="userEmail" id="userEmail" class="form-control"/>
		    						</label>
                            	</div>
                            </div>
                            <div class="col-md-8">
                            	<div class="item">
                            		<label>
                            		<span>휴대폰 번호</span>
		    						<input type="text" name="userPhone" id="userPhone" class="form-control"/>
		    						<button type="button" id="phoneCheck">인증&nbsp;하기</button>
		    						</label>
                            	</div>
                            </div>
                            <div class="col-md-8">
                            	<div class="item">
                            		<label>
                            		<span>주소</span>
		    						<input type="text" name="userAddr" id="userAddr" class="form-control"/>
		    						</label>
                            	</div>
                            </div>
                            <div class="col-md-8">
                            	<div class="item">
                            		<label>
                            		<span>사용자 닉네임</span>
		    						<input type="text" name="userNickName" id="nicknameCheck" class="form-control"/>
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
