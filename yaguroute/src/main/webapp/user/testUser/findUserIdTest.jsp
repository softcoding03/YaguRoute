<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>로그인 폼</title>
    <style>
        @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
	
	html {
		height: 100%;
	}
	
	body {
	    width:100%;
	    height:100%;
	    margin: 0;
  		padding-top: 200px;
  		padding-bottom: 40px;
  		font-family: "Nanum Gothic", arial, helvetica, sans-serif;
  		background-repeat: no-repeat;
	}
	
    .card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
	}

    #btn-Yes{
        background-color: #e4932b;
        border: none;
    }
	
	.login .form-control {
  		position: relative;
  		height: auto;
  		-webkit-box-sizing: border-box;
     	-moz-box-sizing: border-box;
        	 box-sizing: border-box;
  		padding: 10px;
  		font-size: 16px;
	}
    .checkbox{
        margin-right: 20px;
        text-align: right;
    }
    .card-title{
       	text-align: center;
        
    }

    .links{
        text-align: center;
        margin-bottom: 10px;
    }
    a{ 
    	color: #f58b34; text-decoration: none; 
    }
    .check{
    	color : red;
    } 
    </style>
    
    <script type="text/javascript">
    
    $(function(){
    	
    	$('#phoneButton').on("click", function(){
    		
    		var userPhone = $("#userPhone").val(); // 휴대폰 번호
    		
    		var rnd = Math.floor(Math.random() * 9000) + 1000; //랜덤 수
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
        
        var userPhone = $("#userPhone").val();
		
        var phoneNumberInput = $('#phoneNumber');
        phoneNumberInput.val('');
        
        $.ajax({
            url: "/users/findUserId/",
            method: "POST",
            dataType: "json",
            data: {userPhone : userPhone}, // 수정: userId로 변경
            // userId앞에는 클라이언트단, 뒤에는 서버단이다.
            success: function(userId) {
            	
            	for (var i = 0; i < userId.length; i++){
            		 phoneNumberInput.val(function(index, currentValue){
            			if(currentValue === '') {
            				return userId[i];
            			} else{
            				return currentValue + ',' + userId[i];
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

  <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">

	<div class="card align-middle" style="width:25rem;">
		<div class="card-title" style="margin-top:30px;">
            
			<h2 class="card-title" style="color:#000000;">아이디 찾기</h2>
		</div>
      <form action="login" class="login" method="POST">
        <div class="checkbox">
          </div>
          
		<div class="card-body">
		<input type="text" name="userPhone" id="userPhone" class="form-control" style="margin-bottom: 10px; font-size: 15px;" placeholder="휴대폰번호 입력" autofocus required>
		<%-- <p id="check" class="check">${login_msg}</p><br/> --%>
		<input type="button" id="phoneButton" class="btn btn-lg btn-primary btn-block" style="font-size: 15px;" value="인증번호 전송"><br>
        <%-- <input type="text" name="LoginId" id="Id" class="form-control" placeholder="아이디" autofocus required><BR>
         <p id="check" class="check">${login_msg}</p><br/> --%>
        <input type="text" id="phoneCheck" class="form-control" style="margin-bottom: 10px; font-size: 15px;" placeholder="인증번호 입력">
        <input type="button" id="phoneCheckButton" class="btn btn-lg btn-primary btn-block" style="font-size: 15px;" value="인증번호 확인"><br><br>
        <input type="button" id="backback" class="btn btn-lg btn-primary btn-block" style="font-size: 15px; background-color: #000000;" value="이전 화면으로 이동"><br>
      </form>
    		
		</div>
	</div>
   
  </body>
</html>