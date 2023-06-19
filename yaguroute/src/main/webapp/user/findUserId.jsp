<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">
  <link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
  <link rel="icon" href="favicon.ico" type="image/x-icon">
  <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <title>로그인 폼</title>
  <style>
    @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");

    body {
      margin: 0;
      padding-top: 90px;
      padding-bottom: 150px;
      font-family: "Nanum Gothic", arial, helvetica, sans-serif;
      background-repeat: no-repeat;
      margin: 0 auto;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
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
    .card {
      width: 800px;
      height: auto;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }

    .card-title {
      text-align: center;
      font-size: 24px;
      margin-bottom: 5px;
    }

    .form-control {
      margin-bottom: 10px;
      font-size: 15px;
    }
	.modal {
	  display: none;
	  position: fixed;
	  z-index: 9999;
	  left: 0;
	  top: 0;
	  width: 100%;
	  height: 100%;
	  overflow: auto;
	  background-color: rgba(0, 0, 0, 0.4);
	}

	.modal-content {
	  background-color: #fefefe;
	  margin: 20% auto;
	  padding: 20px;
	  border: 1px solid #888;
	  width: 400px;
	  height: 430px;
	  align-items: center;
	}
	
	.modal-content h6 {
	  margin-top: 0;
	}
	
	.modal-content input {
	  width: 100%;
	  margin-bottom: 10px;
	}
	
	.modal-content button {
	  padding: 10px 20px;
	  background-color: #4caf50;
	  color: #fff;
	  border: none;
	  cursor: pointer;
	}
	
	.modal-content button:focus {
	  outline: none;
	}

    .modal input[type="text"] {
      margin-bottom: 10px;
      font-size: 15px;
      width: 100%;
    }

    .modal button {
      font-size: 15px;
      width: 70%;
    }
    .center-button {
        margin-right: 120px;
    }
    .findUser {
    	margin-left: 63px;
    	margin-bottom: 10px;
    }
    #userPhone, #phoneCheck {
	    padding: 15px 10px;
	    border: 2px solid #ccc;
	    width: 100%;
	    background: #fff;
	    font-size: 15px;
	    color: #666;
	    line-height: normal;
	    outline: 0;
	    border-radius: 15px;
	}
	
	.buttonColor {
		width: 100%;
	    /* height: 35px; */
	    /* background-color: #4CAF50; */
	    color: #ffffff;
	    border: 1px solid #ccc;
	    /* border-radius: 5px; */
	    cursor: pointer;
	    font-size: 15px;
	}
	
	.modalButton {
		width:70%;
		font-size: 14px;
	}
	.totalCount {
		color: red;
	}
	
	table {
    margin-bottom: 30px !important; 
    width: 100%;
	}
	
	table tr {
	    cursor: pointer !important;
	}
	
	table tr th {
	    background: #4caf50 !important; 
	    background-color : #4caf50 !important;
	    font-size: 10px !important; 
	    text-transform: uppercase !important; 
	    color: #fff !important; 
	    height: 32px !important; 
	    text-align: center;
	}
	
	table tr th:first-child {
	    padding-left: 20px !important; 
	    text-align: left;
	}
	
	table tr td {
	    padding: 0 20px !important; 
	    height: 50px !important; 
	    line-height: normal !important; 
	    border-bottom: 1px solid #e6e6e6 !important; 
	    font-size: 12px !important; 
	    color: #141414 !important; 
	    text-align: center !important; 
	    white-space: nowrap;
	}
	
	table tr td>* {
	    vertical-align: middle !important; 
	}
	
	table tr td:first-child {
	    text-transform: uppercase !important; 
	    font-family: Montserrat,sans-serif !important; 
	    text-align: left !important; 
	}
	
	table tr td:last-child {
	    font-weight: 700 !important; 
	}
	
	table tr td:first-child i {
	    margin-right: 8px !important;  
	    font-size: 16px !important; 
	}
	
	table tr td:first-child span {
	    line-height: 29px !important; 
	}
  </style>

  <script type="text/javascript">
  
  $(function(){
 		
	  $('#phoneButton').on("click", function(){
 		
 		var userPhone = $("#userPhone").val(); // 휴대폰 번호
 		
 		if(userPhone.length != 11 && (!userPhone.includes("010"))){
 			alert("휴대폰 번호를 다시 확인 해 주세요.");
 			return;
 			
 		}
	  	else if(!/[a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣!@#$%^&*()]/.test(userPhone)) {
 			
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
			
	   		$.ajax({
	               url: "/users/phoneCheck/",
	               method: "POST",
	               dataType: "json",
	               data: {userPhone : userPhone,
	               		rnd : rnd}, // 수정: userId로 변경
	               // userId앞에는 클라이언트단, 뒤에는 서버단이다.
	               success: function(result){
	            	   
	               	   alert("인증번호를 발송하였습니다.");
	               },
	               error: function() {
	               	alert("서버 오류 발생");
	                   return;
	           }
	   	 });
 		}
 	  });
 	});
 	
    $(function(){
      $("#phoneCheckButton").on("click", function(){
    	  
    	console.log("폰 췍 버튼");
    	  
        var verify = $("#phoneCheck").val();
        var rnd = $("#rnd").val();

        var userPhone = $("#userPhone").val();
        console.log(userPhone);
        
        if(userPhone.length != 11){
        	alert("먼저 휴대폰을 입력 해 주세요.");
        	return;
        }
        
        if(verify == rnd){
          alert("인증이 완료되었습니다.");
          openModal();
        }
        else{
          alert("인증에 실패하였습니다.");
          return;
        }
      });
    });

    $(function(){
      $("#backback").on("click", function(){
        window.location.href = "/user/loginTest(new).jsp";
      });
    });

    function openModal() {
      document.getElementById("modal").style.display = "block";
      var userPhone = $("#userPhone").val();
      var idList = document.getElementById("idList");
	  idList.innerHTML = ""; // 기존 리스트 초기화
      
      $.ajax({
        url: "/users/findUserId/",
        method: "POST",
        dataType: "json",
        data: {userPhone: userPhone},
        success: function(userId) {
        	var output = "<table><tr><th></th><th>아이디</th></tr>";
        	var totalId = "";
        	for (var i = 0; i < userId.length; i++) {
        		output += "<tr>";
        	    output += "<td align='center'>" + (i + 1) + "</td>";
        	    output += "<td align='left' name='userId'>" + userId[i] + "</td>";
        	    output += "</tr>";
              }
        	
        	output += "</table>";
        	idList.innerHTML = output;
        	
        	totalId += "총 " + userId.length+"개의 아이디가 검색되었습니다.";
        	var totalCount = document.getElementById("totalCount");
        	totalCount.textContent = totalId;
        },
        error: function(xhr, status, error) {
            alert("오류 발생(이유) : " + error);
            return;
          }
      });
    }
	
    // 모달 닫기 버튼
    function closeModal() {
    	
    	window.close();
      	document.getElementById("modal").style.display = "none";
    }
    
    // 모달 주변 클릭 닫기
    window.onclick = function(event) {
    	  if (event.target === modal) {
    	    modal.style.display = "none";
    	 }
    };
  </script>
</head>

<body>
  <div class="card">
    <form action="login" class="login" method="POST">
      <div class="card-body">
        <h4 class="card-title"><strong>아이디 찾기</strong></h4>
        <a style="text-align: center; margin-bottom: 60px; font-size: 14px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;아이디를 찾기위해 휴대폰과 인증번호가 필요합니다.</a><br><br>
        <div class="findUser">
        <a style="font-size: 13px;">휴대폰</a>
        <input type="text" name="userPhone" id="userPhone" class="form-control" style="width: 250px; margin-right: 100px;" placeholder="휴대폰번호 입력" autofocus required>
        <input type="button" class="buttonColor" id="phoneButton" style="width: 250px; margin-right: 100px; background-color: #19376D;" value="인증번호 전송"><br>
        <div><br>
        <a style="font-size: 13px;">인증번호</a>
          <input type="text" id="phoneCheck" class="form-control" style="width: 250px; margin-right: 100px;" placeholder="인증번호 입력">
          <input type="button" class="buttonColor" id="phoneCheckButton" style="width: 250px; margin: auto; background-color: #19376D;" value="인증번호 확인">
        </div>
      </div>
      </div>
    </form>

    <!-- 모달 창 -->
    <div id="modal" class="modal">
      <div class="modal-content" id="">
      	<!--  -->
      	<h2 style="text-align: left; margin-bottom: 5px;"><b>야구ROUTE ID 찾기</b></h2>
      	<a style="font-size: 11px;">고객님의 정보와 일치하는 야구ROUTE ID 입니다.</a>
      	  
	        <div id="idListUser" style="margin-bottom: 40px; overflow: auto;">
	        <p class="totalCount" id="totalCount" style="font-size: 14px; text-align: center; width: 395px;"></p>
	        	<table id="idList" style="color: #000000">
	        	<caption>아이디 목록</caption>
		        	<thead>
			        	<tr>
			        	  <th>아이디</th>
			        	</tr>
		        	</thead>
	        	  <tbody>
	        	<!-- 아이디 리스트 동적으로 추가 -->
	        	  </tbody>
	        	</table>
	    	</div>
        <button type="button" class="modalButton" onclick="closeModal()">닫기</button>
      </div>
    </div>
  </div>

  
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