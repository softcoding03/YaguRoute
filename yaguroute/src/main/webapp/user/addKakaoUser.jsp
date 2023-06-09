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
    <title>네이버 회원 추가항목 작성</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://rawgit.com/enyo/dropzone/master/dist/dropzone.js"></script>    
	<link rel="stylesheet" href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css">
	
    <style>
    .grid-container {
 	 display: grid;
  	 grid-template-columns: repeat(2, 1fr);
 	 gap: 10px;
	}
	/* element.style {
    background-color: khaki;
	} */
    </style>
    
    <style>
    button, input, select, textarea {
    background-color: rgb(68, 199, 103);
	    border-radius: 28px;
	    border: 1px solid rgb(120, 255, 134);
	    display: inline-block;
	    cursor: pointer;
	    color: lightslategrey;
	    font-family: Arial;
	    font-size: 17px;
	    padding: 9px 15px;
	    text-decoration: none;
	    text-shadow: rgb(47, 102, 39) 0px 1px 0px;
	}
    
    .kakao-login {
		  display: block;
		  padding: 15px 0;
		  background: #FEE500;
		  color: #000000;
		  font-size: 20px;
		  margin-bottom: 10px;
		  /* 글자를 가운데로 정렬합니다. */
		  text-align: center;
		  border-radius: 5px;
		}
		
		.kakao-login svg {
		  display: inline-block;
		  width: 24px;
		  height: 24px;
		  margin-right: 5px;
		  /* 상하 정렬을 조정해줍니다. 오직 inline, inline-block 요소에서만 작동합니다. */
		  vertical-align: middle;
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
        border-radius: 5%;
    }

     .link-login img {
         display: inline-block;
         width: 77px;
         height: 15px;
         margin-right: 5px;
         /* 상하 정렬을 조정해줍니다. 오직 inline, inline-block 요소에서만 작동합니다. */
         vertical-align: -1px;
     }
        
    .birthday {
	    font-size: 16px;
	    
	    font-family: Consolas, sans-serif;
	   	padding: 15px 10px;
	    border: 1px solid transparent;
	    width: 100%;
	    background: #fff;
	    font-size: 14px;
	    color: lightslategrey;
	    line-height: normal;
	    outline: 0
      }
    </style>
    
    <style> 
    #password {
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
    #passwordCheck {
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
    .dropdown {
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
    
    <!-- 옆(좌,우)으로 이동시키기 위함. -->
    <style>
    .my-column {
    width: 50%;
    float: left;
    /* 추가적인 스타일 설정 */
	}
    </style>
    
    <!-- input항목 중앙으로 출력 위해 설정 -->
   	<style>
  	.container_1 {
    display: grid !important;
    place-items: center !important;
  	}
	</style>
    
    <style>
    .form-group {
  	display: flex;
  	justify-content: center;
  	align-items: center;
	}
	#id_use #password_use #passwordCheck_use{
    display: block;
    margin-top: 5px;
	}
    </style>
    
    <style>
    .btn-upload-file {
    position: relative;
    border: none;
    min-width: 200px;
    min-height: 50px;
    background: linear-gradient(
        90deg,
        rgba(129, 230, 217, 1) 0%,
        rgba(79, 209, 197, 1) 100%
    );
    border-radius: 1000px;
    color: darkslategray;
    cursor: pointer;
    box-shadow: 12px 12px 24px rgba(79, 209, 197, 0.64);
    font-weight: 700;
    transition: 0.3s;
	}
	
	.btn-upload-file:hover {
	    transform: scale(1.2);
	}
	
	.btn-upload-file:hover::after {
	    content: "";
	    width: 30px;
	    height: 30px;
	    border-radius: 100%;
	    border: 6px solid #00ffcb;
	    position: absolute;
	    z-index: -1;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    animation: ring 1.5s infinite;
	    
	}
	
	#id_use, #password_use, #passwordCheck_use, #userName_use, #nickname_use{
    display: block;
    margin-top: 5px;
	}
    </style>
    <!-- 구단코드 이미지 적용 -->
    
    <script type="text/javascript">
	
	$(function(){
		 window.onbeforeunload = function() {
		        // 새로고침 시 특정 동작 수행
		        alert("다시 로그인 해 주세요.");
		        window.location.href = "/user/loginTest(new).jsp";
		    };
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
	
	// 애드 유저
		function fncAddUser() {

			alert("ㅎㅇ");
			
			var userId = "${user.userId}";
			var userName = "${user.userName}";
			var userBirth = "${user.userBirth}";
			var userEmail = "${user.userEmail}";
			var userPassword = "${user.password}";
			var userPhone = "${user.userPhone}";
			var gender = "${user.gender}";
			var userImage = "${user.userImage}"
			var teamCode = $("select[name='teamCode']").val();
			var userNickName = $("input[name='userNickName']").val();
			var teamCode = $("input[name='teamCode']").val();
			
			alert(teamCode);
			
			// userAddr logic...
			var addr1 = $("input[name='addr1']").val();
	 		var addr2 = $("input[name='addr2']").val();
			var userAddr = addr1+addr2;
			$("#userAddr").val(userAddr);
			
			$("form").attr("method", "POST").attr("action", "/users/addNaverUser").submit();

		};
	 
	// 가입 버튼
    $(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$( "#signup" ).on("click" , function() {
			fncAddUser();
		});
	});
	
/* 	// 뒤로 가기 버튼
	$(function(){
		
		$("#backback").on("click", function(){
			
			//alert("가입 취소");
			window.location.href="/user/loginTest(new).jsp";
			
		});
	}); */
	
	</script>
</head>

<body>
<div class="container_1">
        <div class="row">
            <div class="col-md-6" style="width: 100%; margin-bottom: 20px;" >
                <div class="info">
                    <div class="wrap">
                    <br><br><br>
                        <h2 class="kakao-login"> 
                        <svg viewBox="0 0 32 32" focusable="false" role="presentation" class="withIcon_icon__2KxnX SNSButtonList_kakaoIcon__1s6gw" aria-hidden="true">
                        <path d="M16 4.64c-6.96 0-12.64 4.48-12.64 10.08 0 3.52 2.32 6.64 5.76 8.48l-.96 4.96 5.44-3.6 2.4.16c6.96 0 12.64-4.48 12.64-10.08S22.96 4.56 16 4.64z"></path>
						</svg>카카오 추가정보</h2>
                        <br><strong style="text-align: center !important;">&nbsp;&nbsp;&nbsp;카카오 SNS 연동 계정입니다. <br>&nbsp;&nbsp;&nbsp;추가정보 입력이 필요합니다.</strong>
                    </div><br>
                </div>
            </div>	
        </div>
</div>
<!--CONTACT WRAP BEGIN-->
    	<div class="container_1">
        	<div class="row">
                    	<form>
	                    	<input type="hidden" name="userId" value="${user.userId}" readonly="readonly"/>
							<input type="hidden" name="userName" value="${user.userName}" readonly="readonly"/>
							<input type="hidden" name="userBirth" value="${user.userBirth}" readonly="readonly"/>
							<input type="hidden" name="userEmail" value="${user.userEmail}" readonly="readonly"/>
							<input type="hidden" name="password" value="${user.password}" readonly="readonly"/>
							<input type="hidden" name="userPhone" value="${user.userPhone}" readonly="readonly"/>
							<input type="hidden" name="gender" value="${user.gender}" readonly="readonly"/>
							<input type="hidden" name="userImage" value="${user.userImage}" readonly="readonly"/>
							
								<div class="form-inline">
                                    <label for="userNickName">
                                        <input type="text" id="nicknameCheck" name="userNickName" style="width: 400px; height: 50px; margin-bottom: 20px;"  placeholder="닉네임"/>
                                    </label>
                                    	<font id="nickname_use" size="2"></font>
                            	</div>
                            	
                            	<a style="font-size: 17px; font-weight: bold;">생년월일</a>
                            	<div class="form-inline">
                                    <label for="userBirth">
                                        <input type="date" class="birthday" name="userBirth" id="userBirth" style="width: 400px; height: 50px; margin-bottom: 20px;"  placeholder="닉네임"/>
                                    </label>
                                    	<font id="nickname_use" size="2"></font>
                            	</div>
                            	
                            	<div class="form-inline">
                                    <label for="userPhone">
                                        <input type="text" name="userPhone" id="userPhone" style="width: 300px; height: 42px; margin-bottom: 10px;"  placeholder="' - ' 를 제외한 휴대폰 번호를 입력해주세요."/>
                                    </label>
                                    	<font id="nickname_use" size="2"></font>
                            	</div>
                            	
                            	
                            	<div class="form-inline">
                            		<label>
		    						<input readonly disabled type="text" id="sample6_address" name="addr1" style="width: 300px; height: 40px; margin-bottom: 10px;"  placeholder="주소">&nbsp;&nbsp;
		    						<a class="ok_button">
		    						<button type="button" onclick="sample6_execDaumPostcode()">주소&nbsp;선택</button>
		    						</a>
									<input type ="hidden" id="userAddr" name="userAddr"> 
		    						</label>
                            	</div>
                            	</a>
                            	<div class="form-inline">
                            		<label>
		    						<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="addr2" style="width: 400px; height: 50px; margin-bottom: 20px;">
		    						</label>
                            	</div>
                            	<b>선호구단</b>
                            	<div class="form-inline">
                            	<label>
                            		<select class="dropdown" id="teamCode" name="teamCode" style="width: 400px; height: 50px; margin-bottom: 20px;">
                            			<option value="NN" selected>선택하지 않음</option>
      									<option value="LG">LG 트윈스</option>
      									<option value="SS">삼성 라이온즈</option>
      									<option value="LT">롯데 자이언츠</option> 
                                    	<option value="OB">두산 베어스</option>
                                    	<option value="NC">NC 다이노스</option>
                                    	<option value="HT">KIA 타이거즈</option> 
                                    	<option value="SK">SSG 랜더스</option> 
                                    	<option value="WO">키움 히어로즈</option> 
                                    	<option value="HH">한화 이글스</option> 
                                    	<option value="KT">KT Wiz</option> 
                                    </select>
                                    </label>
                                    </div>
                            	<div class="form-group">
                            	<label>
                                <button type="button" class="btn-upload-file" id="signup" >가입 완료</button>
                                </label>
                                </div>
                    			
			<!--옆에 빈 곳 채우기 용도 사진
            <div class="column">
            <div class="col-md-6">
            	<img src="https://cdn0.agoda.net/images/agodavip/signupcage.svg" width="361px" height="303px" alt="Agoda...">
            </div>
            </div> -->
            </form>
        </div>
    </div>
    
<!--     <div class="contacts-map">
        <img class="img-responsive" src="/images/baseball/contacts-map.jpg" alt="contacts-map">
    </div> -->
<!--CONTACT WRAP END-->
</body>

</html>
