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
    <script src="https://rawgit.com/enyo/dropzone/master/dist/dropzone.js"></script>    
	<link rel="stylesheet" href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css">
	
    <style>
    .grid-container {
 	 display: grid;
  	 grid-template-columns: repeat(2, 1fr);
 	 gap: 10px;
	}
	
	button, input, select, textarea {
    	background-color: rgb(68, 199, 103);
	    border-radius: 28px;
	    border: 1px solid rgb(120, 255, 134);
	    display: inline-block;
	    cursor: pointer;
	    color: ghostwhite;
	    font-family: Arial;
	    font-size: 17px;
	    padding: 9px 15px;
	    text-decoration: none;
	    text-shadow: rgb(47, 102, 39) 0px 1px 0px;
	}
    </style>
    
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
			document.getElementById('phoneCheckId').style.display = 'block';
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
	
	 
/* 	// 가입 버튼
    $(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$( "#signup" ).on("click" , function() {
			fncAddUser();
		});
	}); */
	
	
	//fileDropzone dropzone 설정할 태그의 id로 지정
    Dropzone.options.fileDropzone = {
			
        url: '/users/userImage', //업로드할 url (ex)컨트롤러)
        autoProcessQueue: false, // 자동업로드 여부 (true일 경우, 바로 업로드 되어지며, false일 경우, 서버에는 올라가지 않은 상태임 processQueue() 호출시 올라간다.)
        clickable: true, // 클릭가능여부
        thumbnailHeight: 90, // Upload icon size
        thumbnailWidth: 90, // Upload icon size
        maxFiles: 1, // 업로드 파일수
        maxFilesize: 1, // 최대업로드용량 : 1MB
        parallelUploads: 1, // 동시파일업로드 수(이걸 지정한 수 만큼 여러파일을 한번에 컨트롤러에 넘긴다.)
        addRemoveLinks: true, // 삭제버튼 표시 여부
        dictRemoveFile: '삭제', // 삭제버튼 표시 텍스트
        uploadMultiple: false, // 다중업로드 기능
        dictDefaultMessage: "사진 업로드 (최대1MB)", // 메시지 변경
        init: function() {
            
        	var myDropzone = this;
			var maxFiles = this.options.maxFiles;
			
            // 파일 업로드 제한에 도달했을 때 알림 표시
            this.on("maxfilesexceeded", function(file) {
                // 알림을 표시하는 로직을 추가
                
                if(myDropzone.files.length > maxFiles){
                    myDropzone.removeFile(file);
                    alert("최대 1개의 파일만 업로드할 수 있습니다.");
                }
                
            });

            // 서버로 파일 업로드를 진행하는 함수
            document.querySelector("#signup").addEventListener("click", function() {
            	alert("ㅎㅇㅎㅇ");
                myDropzone.processQueue();
                fncAddUser();
            });
        }
        
    };

 	// function fncAddUser() {		
	// 	 	// 11개여야함.
	// 		var userId=$("input[name='userId']").val();
	// 		var password=$("#password").val();
	// 		var userName=$("#userName").val();
	// 		var userPhone=$("#userPhone").val();
	// 		var phoneCheck=$("#phoneCheck").val();
	// 		var userBirth=$("#birthday").val();
			
	// 		// userBirth logic
	// 		var value = userBirth.replace(/-/g, "");
	// 		$("#userBirth").val(value);
			
	// 		// addr1 + addr2 (주소 + 상세주소)
	// 		var addr1 = $("input[name='addr1']").val();
	// 		var addr2 = $("input[name='addr2']").val();
	// 		var userAddr = addr1+addr2;
			
	// 		var gender=$("#gender").val();
	// 		var userEmail=$("#userEmail").val();
	// 		var userNickName=$("input[name='userNickName']").val();
	// 		var teamCode=$("#teamCode").val();
			
	// 		alert($("#userBirth").val());
			
	// 		if(userId == null || userId.length <1){
	// 			alert("아이디는 반드시 입력하셔야 합니다.");
	// 			return;
	// 		}
	// 		if(password == null || password.length <1){
	// 			alert("패스워드는  반드시 입력하셔야 합니다.");
	// 			return;
	// 		}
	// 		if(userName == null || userName.length <1){
	// 			alert("이름은  반드시 입력하셔야 합니다.");
	// 			return;
	// 		}
	// 		if(userPhone == null || userPhone < 1){
	// 			alert("휴대폰 번호는 반드시 입력하셔야 합니다. ");
	// 			return;
	// 		} 
			
	// 		$("form").attr("method", "POST").attr("action" , "/users/addUser").submit();
	// 		alert("가입이 완료되었습니다. 로그인 해 주시기 바랍니다.");
	// 		window.close();
	// 	} 

		function fncAddUser() {

			alert("ㅎㅇ");
			
			// userBirth logic...
			var userBirth=$("#birthday").val();
			var value = userBirth.replace(/-/g, "");
			$("#userBirth").val(value);

			// userAddr logic...
			var addr1 = $("input[name='addr1']").val();
	 		var addr2 = $("input[name='addr2']").val();
			var addr = addr1+addr2;
			$("#userAddr").val(addr);

			// ajax(User) -> Controller
			var user = {
				userId : $("#userId").val(),
				password : $("#password").val(),
				userName : $("#userName").val(),
				userPhone : $("#userPhone").val(),
				phoneCheck : $("#phoneCheck").val(),
				userBirth : $("#userBirth").val(),
				userAddr : $("#userAddr").val(),
				gender : $("input[name='gender']:checked").val(),
				userEmail : $("#userEmail").val(),
				userNickName : $("input[name='userNickName']").val(),
				teamCode : $("#teamCode").val()
			};

			$.ajax({
				url:"/users/addUser",
				method:"POST",
				data: JSON.stringify(user),
				contentType: "application/json",
  				success: function(response) {
    				alert("컨트롤러 전송 완료!");
    				window.close();
    				window.opener.location.reload();
  				},
  				error: function(xhr, status, error) {
    			// 요청 처리 중 에러가 발생한 경우 실행할 로직
    			console.log("서버 오류 발생:", error);
  				}
			});
		};

	
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
            <div class="col-md-6">
                <div class="info">
                    <div class="wrap">
                        <h6>회원가입</h6>
                    </div>
                </div>
            </div>	
        </div>
</div>
<!--CONTACT WRAP BEGIN-->
    	<div class="container_1">
        	<div class="row">
                    	<form>
                                <div class="form-inline">
                                    <label for="userId">
                                        <input type="text" name="userId" id="userId" style="width: 405px; height: 35px;"  placeholder="아이디">
                                    </label>
                                    	<font id="id_use" size="2"></font>
                                </div>
                                <div class="form-inline">
								<label for="password">
									<input type="password" name="password" id="password" style="width: 405px; height: 35px;" placeholder="패스워드">
								</label>
									<font id="password_use" size="2"></font>
								</div>
								<div class="form-inline">
                                    <label for="passwordCheck">
                                        <input type="password" name="passwordCheck" id="passwordCheck" style="width: 405px; height: 35px;" placeholder="패스워드 확인">
                                    </label>
                                    	<font id="passwordCheck_use" size="2"></font>
                                </div>
                            	<div class="form-inline">
                                    <label for="userName">
                                        <input type="text" id="userName" name="userName" style="width: 405px; height: 35px;" placeholder="이름">
                                    </label>
                                    	<font id="userName_use" size="2"></font>
                            	</div>
								
								<div class="form-inline">
                                    <label for="userNickName">
                                        <input type="text" id="nicknameCheck" name="userNickName" style="width: 405px; height: 35px;" placeholder="닉네임"/>
                                    </label>
                                    	<font id="nickname_use" size="2"></font>
                            	</div>	
                                <div class="form-inline">
                                    <label>
                                    	생년월일&nbsp;
                                        <input type="date" name="birthday" id="birthday" style="width: 200px; height: 35px;" placeholder="생년월일">
                                        <input type="hidden" name="userBirth" id="userBirth">
                                        &nbsp;&nbsp;
                                        <label class="byul">남성
                                        <input type="radio" name="gender" value="M" checked="checked">
                                        </label>
                                        <label class="byul">여성
                                        <input type="radio" name="gender" value="W">
                                        </label>
                                    </label>
                                </div>
                                <div class="form-inline">
                            		<label>
		    						<input type="text" name="userPhone" id="userPhone" style="width: 270px; height: 35px; margin-bottom: 10px;" placeholder="휴대폰 번호"/>&nbsp;&nbsp;
		    						<button type="button" id="phoneButton" >인증번호 발송</button>
		    						</label>
                            	</div>
                            	<div class="form-inline">
                            		<label>
                            		<a id="phoneCheckId" style="display: none;">
		    						<input type="text" id="phoneCheck" name="userPhoneCheck" style="width: 270px; height: 35px; margin-bottom: 10px;" placeholder="인증번호를 입력해주세요."/>&nbsp;&nbsp;
		    						<button type="button" id="phoneCheckButton" >인증번호 확인</button>
		    						</a>
		    						</label>
                            	</div>
                            	<div class="form-inline">
                            		<label>
		    						<input type="text" name="userEmail" id="userEmail" style="width: 405px; height: 35px; margin-bottom: 10px;" placeholder="이메일"/>
		    						</label>
                            	</div> 
                            	<div class="form-inline">
                            		<label>
		    						<input readonly disabled type="text" id="sample6_address" name="addr1" style="width: 270px; height: 35px; margin-bottom: 10px;"  placeholder="주소">&nbsp;&nbsp;
		    						<button type="button" onclick="sample6_execDaumPostcode()">주소&nbsp;선택</button>
									<input type ="hidden" id="userAddr" name="userAddr"> 
		    						</label>
                            	</div>
                            	<div class="form-inline">
                            		<label>
		    						<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="addr2" style="width: 405px; height: 35px;">
		    						</label>
                            	</div>
                            	<b>선호구단</b>
                            	<div class="form-inline">
                            	<label>
                            		<select class="dropdown" id="teamCode" name="teamCode" style="width: 400px;">
                            			<option value="NN">선택하지 않음</option>
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
                                    
                                    <b>프로필 사진</b>  
                            	<div class="form-inline">
     								<div class="dropzone" id="fileDropzone" style="margin-bottom: 10px;"></div> 
     								<!-- <button id="btn-upload-file">서버전송</button> -->
 								</div>
                            	<div class="form-group">
                            	<label>
                                <button type="button" class="btn-upload-file" id="signup" >가입</button>
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
