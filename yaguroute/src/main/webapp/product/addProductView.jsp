<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="viewport" content="width=device-width,initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
		<title>상품 등록</title>
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
     <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>   
    
<script type="text/javascript">
	$(function() {
		
		//유효성 체크 시작
		$("input[name='prodName']").keyup(function(){
			
			var value = $(this).val();
			var specialChars = /[~`!@#$%^&*()\-=+|<>?]/g;  //거르고 싶은 특수문자
				
			 if(value.length < 1 || value == null){
					$("#prodName").html("최소글자(1)이상을 입력하여야합니다.");
					$("#prodName").attr("color", "#dc3545");
					$(".addProduct-submit:contains('등록')").prop('disabled', true); // 버튼 비활성화
			 } else if (value.length > 100) {
					$("#prodName").html("최대글자(100)을 초과하였습니다.");
					$("#prodName").attr("color", "#dc3545");
					$(".addProduct-submit:contains('등록')").prop('disabled', true); // 버튼 비활성화
			 } else if (specialChars.test(value)) {
					$("#prodName").html("특수문자는 입력할 수 없습니다.");
					$("#prodName").attr("color", "#dc3545");
					$(".addProduct-submit:contains('등록')").prop('disabled', true); // 버튼 비활성화		
			 } else {
					$("#prodName").html("성공");
					$("#prodName").attr("color", "#4caf50");
					$(".addProduct-submit:contains('등록')").prop('disabled', false);	 
				}
		});
		
		$("input[name='prodPrice']").keyup(function(){
			
			var value = $(this).val();
			var specialChars = /[~`!@#$%^&*()\-=+|<>?]/g;  //거르고 싶은 특수문자
			var numericRegex = /^[0-9]+$/;
			
			 if(value.length < 1 || value == null){
					$("#prodPrice").html("최소글자(1)이상을 입력하여야합니다.");
					$("#prodPrice").attr("color", "#dc3545");
					$(".addProduct-submit:contains('등록')").prop('disabled', true); // 버튼 비활성화
			 } else if (value.length > 100) {
					$("#prodPrice").html("최대글자(100)을 초과하였습니다.");
					$("#prodPrice").attr("color", "#dc3545");
					$(".addProduct-submit:contains('등록')").prop('disabled', true); // 버튼 비활성화
			 } else if (specialChars.test(value)) {
					$("#prodPrice").html("특수문자는 입력할 수 없습니다.");
					$("#prodPrice").attr("color", "#dc3545");
					$(".addProduct-submit:contains('등록')").prop('disabled', true); // 버튼 비활성화		
			 } else if (!numericRegex.test(value)) {
				 	$("#prodPrice").html("숫자만 입력할 수 있습니다.");
					$("#prodPrice").attr("color", "#dc3545");
					$(".addProduct-submit:contains('등록')").prop('disabled', true); // 버튼 비활성화	
			 }	else {
					$("#prodPrice").html("성공");
					$("#prodPrice").attr("color", "#4caf50");
					$(".addProduct-submit:contains('등록')").prop('disabled', false);	 
				}
		});

		$("input[name='prodStock']").keyup(function(){
			
			var value = $(this).val();
			var specialChars = /[~`!@#$%^&*()\-=+|<>?]/g;  //거르고 싶은 특수문자
			var numericRegex = /^[0-9]+$/; // 숫자만 입력
			
			 if(value.length < 1 || value == null){
					$("#prodStock").html("최소글자(1)이상을 입력하여야합니다.");
					$("#prodStock").attr("color", "#dc3545");
					$(".addProduct-submit:contains('등록')").prop('disabled', true); // 버튼 비활성화
			 } else if (value.length > 100) {
					$("#prodStock").html("최대글자(100)을 초과하였습니다.");
					$("#prodStock").attr("color", "#dc3545");
					$(".addProduct-submit:contains('등록')").prop('disabled', true); // 버튼 비활성화
			 } else if (specialChars.test(value)) {
					$("#prodStock").html("특수문자는 입력할 수 없습니다.");
					$("#prodStock").attr("color", "#dc3545");
					$(".addProduct-submit:contains('등록')").prop('disabled', true); // 버튼 비활성화		
			 } else if (!numericRegex.test(value)) {
				 	$("#prodStock").html("숫자만 입력할 수 있습니다.");
					$("#prodStock").attr("color", "#dc3545");
					$(".addProduct-submit:contains('등록')").prop('disabled', true); // 버튼 비활성화	
			 }else {
					$("#prodStock").html("성공");
					$("#prodStock").attr("color", "#4caf50");
					$(".addProduct-submit:contains('등록')").prop('disabled', false);	 
				}

		});
		
		function fncAddProduct() {
		
			//Form 유효성 검증  	
			var name = $("input[name='prodName']").val();
			var price = $("input[name='prodPrice']").val();
			var stock = $("input[name='prodStock']").val();
			var category = $("select[name='prodCategory']").val();
			var teamcode = $("select[name='prodTeamCode']").val();

			if (name == null || name.length < 1) {
				alert("상품명은 반드시 입력하여야 합니다.");
				return;
			}
			if (price == null || price.length < 1) {
				alert("가격은 반드시 입력하셔야 합니다.");
				return;
			}
			if (stock == null || stock.length < 1) {
				alert("재고는 반드시 입력하셔야 합니다.");
				return;
			}
			if (category == null || category.length < 1) {
				alert("상품카테고리는 반드시 입력하셔야 합니다.");
				return;
			}
			if (teamcode == null || teamcode.length < 1) {
				alert("팀 코드는 반드시 입력하셔야 합니다.");
				return;
			}
		
			// 폼 제출
			$("form").attr("method", "POST").attr("action", "/product/addProduct").submit();
		}
		
		
		$(function() {

			$(".addProduct-submit:contains('등록')").on('click', function() {
				fncAddProduct();
			});
			$(".addProduct-submit:contains('취소')").on('click', function() {
				self.location = "../product/listProduct?prodTeamCode=ALL";
			});
		});
		
		//drag&drop용
		$(function(){
			var dropZone = $('#drop-area');
			dropZone.hide();
			
			$(document).on('dragenter', function(event) {
				dropZone.addClass('active');
				dropZone.show();
			});
			
			dropZone.on('dragover', function(event) {
				event.preventDefault();
			});
			
			dropZone.on('drop', function(event){
				event.preventDefault();
		 		handleFileSelect(event.originalEvent);
		 		dropZone.hide();
		 	});
		 	
			$(document).on('dragleave', function(event) {
				if (event.originalEvent.pageX <= 0 || event.originalEvent.pageY <= 0) {
					event.preventDefault();
					dropZone.removeClass('active');
					dropZone.hide();
				}
			});
			 
			function handleFileSelect(event) {
				    event.stopPropagation();
				    event.preventDefault();
				    dropZone.removeClass('active');
				    
				    var files = event.target.files || event.dataTransfer.files;
				    // 파일 업로드 처리 로직을 여기에 구현하세요.
				    if (files.length > 0) {
				    	
				    	var formData = new FormData();
				    	
				    	for (var i = 0; i < files.length; i++) {
				    	    formData.append('images', files[i]);
				    	 }
				    	
				        $.ajax({
				            url: "http://223.130.133.54:3000/image/product",
				            type: "POST",
				            processData: false,
				            contentType: false,
				            data: formData,
				            dataType: "json",
				            success: function(data, status) {
				              console.log(data);
				              $("#image-result").empty();
				              for(var j=0; j < data.image_path.length; j++){
				            	  var thumbnail = $("<img>").attr("src", data.image_path[j]).attr("width", "400px").attr("height", "200px").attr("class", "thumbnail");
				            	  $("#image-result").append(thumbnail);
				              }
				              
				              var prodImageFirst = $("<input>").attr("type", "hidden").attr("name", "prodImageFirst").attr("value", data.image_path[0]);
				              $("form").append(prodImageFirst);  
				              if(data.image_path.length == 2){
				            	  var prodImageSecond = $("<input>").attr("type", "hidden").attr("name", "prodImageSecond").attr("value", data.image_path[1]);
				            	  $("form").append(prodImageSecond);
				              } else if (data.image_path.length == 3){
				            	  var prodImageSecond = $("<input>").attr("type", "hidden").attr("name", "prodImageSecond").attr("value", data.image_path[1]);
				            	  var prodImageThird = $("<input>").attr("type", "hidden").attr("name", "prodImageThird").attr("value", data.image_path[2]);
				            	  $("form").append(prodImageSecond).append(prodImageThird);
				              }
				            }
				          });
				    	
				    }
			}
			
		});
	});

</script>
</head>

<style>
/* 이미지 드래그 드랍 CSS 시작*/
.drop-area {
	display: none;
	width: 100%;
	height: 100%;
 	position: absolute;
 	top: 0;
	left: 0;
	background-color: rgba(0, 0, 0, 0.5);
 	z-index: 999;
}

.drop-area.active {
	display: block;
	border-radius: 10px;
}

.thumbnail-area{
	/* position: relative; */
}

.thumbnail{
	padding: 10px;
}
#image-drop{
	position: relative;
	padding : 50px;
	border: 2px dashed #ccc;
	border-radius: 10px;
	text-align: center;
}
/* 이미지 드래그 드랍 CSS 종료*/

.addProduct-submit:hover {
	background-color: #FACC2E; /* 마우스 오버 시 배경색 변경 */
}

.addProduct-submit {
  border-radius: 20px;
  background-color: #E0F7E7;
  color: white;
  font-size: 16px;
  border: none;
  padding: 10px 20px; /* 안쪽 여백 설정 */
  color: #000000; /* 글자색 설정 */
}

/* #back-img {
  position: fixed;
  width: 100%;
  height: 100vh;
  overflow: hidden;
  background-image: url("/images/productBack/gettyimages.jpg");
  background-repeat: no-repeat;
  opacity: 0.5;
} */

	.transparency{
		background-color: rgba(256,256,256,0.3);
		margin: 0 auto;
	}
		/* background-color: rgba(0,0,0,0.6); */
	.item {
    justify-content: center;
    align-items: center;
	width:100%;
	}

</style>

<body >
  <jsp:include page="/admin/getAdmin.jsp"/>

<!--     <div class="row">
      <div class="col-md-12">
        <div id="back-img"></div>
      </div>
</div> -->

<div class="container" style="display: grid;justify-items: center;">
<div class= "row">

<form name="detailForm">
				<!--CHECKOUT WRAP BEGIN-->
<br>
	<br>
	      <div class="container" style="display: flex; ">
		  <br>
			  <br>
				  <div class="row">
				  <div class="transparency" >
					 <h3 class="title" style="text-align: center; margin: 20 auto; font-weight: bold; ">상품 등록</h3>
					 <br>
							<div class="container" style="background-color: #e8ebe9;border: 3px solid rgba(0, 0, 0, 0.7); padding: 10px; width: 700px; border-radius: 10px; margin-top: 50px; margin-left: auto; margin-right: 200px;">
    

							<div class="col-md-12" > 
								<div class="customer-info">
								     <br> 
										<div class="row">
											<div class="col-md-12">
												<div class="item">
													<label> 
														<span><b>상품명</b><i>*</i></span> 
														<input type="text" placeholder="상품명을 입력하세요" name="prodName"/>
														<font id="prodName" size="2"></font>
													</label>
												</div>
											</div>
			
										<div class="col-md-12">
											<div class="item">
											<label>
											  <span><b>상품 이미지</b><i>*</i></span>
											  <!-- <input type="file" name="prodImages" multiple="multiple" style="border: 1px solid #ccc; padding: 10px; "> -->
											  	<div id="image-drop">								
													<div class="thumbnail-area" id="image-result">
														<caption><b>이미지를 드랍해 주세요</b></caption>													
													</div>									
													<div class="drop-area" id="drop-area">,</div>		
												</div>
											</label>
										</div>
									</div>
								
										<div class="col-md-12">
											<div class="item">
												<label> 
													<span><b>가격</b> <i>*</i></span> 
													<input type="text" placeholder="가격을 입력하세요" name="prodPrice"/>
													<font id="prodPrice" size="2"></font>
												</label>
											</div>
										</div>
		
										<div class="col-md-6">
											<div class="item">
												<label> <span><b>상품 카테고리</b> <i>*</i></span> <select class="basic" name="prodCategory">
														<option value="0"
															${ product.prodCategory ==0 ? "selected" : ""}>상품 카테고리를 선택하세요</option>
														<option value="1"
															${ product.prodCategory ==1 ? "selected" : ""}>유니폼</option>
														<option value="2"
															${ product.prodCategory ==2 ? "selected" : ""}>모자</option>
														<option value="3"
															${ product.prodCategory ==3 ? "selected" : ""}>의류</option>
														<option value="4"
															${ product.prodCategory ==4 ? "selected" : ""}>야구용품</option>
														<option value="5"
															${ product.prodCategory ==5 ? "selected" : ""}>잡화</option>															
												</select>
												</label>
											</div>
										</div>
		
										<div class="col-md-6">
											<div class="item">
													<label> <span><b>구단</b><i>*</i></span> <select class="basic" name="prodTeamCode">
														<option value="OB"
															${ product.prodTeamCode ==OB ? "selected" : ""}>두산베어스</option>
														<option value="LT"
															${ product.prodTeamCode ==LT ? "selected" : ""}>롯데자이언츠</option>
														<option value="LG"
															${ product.prodTeamCode ==LG ? "selected" : ""}>LG트윈스</option>
														<option value="KT"
															${ product.prodTeamCode ==KT ? "selected" : ""}>KT위즈</option>
														<option value="HT"
															${ product.prodTeamCode ==HT ? "selected" : ""}>기아타이거즈</option>
														<option value="SK"
															${ product.prodTeamCode ==SK ? "selected" : ""}>SSG랜더스</option>
														<option value="NC"
															${ product.prodTeamCode ==NC ? "selected" : ""}>NC다이노스</option>
														<option value="WO"
															${ product.prodTeamCode ==WO ? "selected" : ""}>키움히어로즈</option>
														<option value="SS"
															${ product.prodTeamCode ==SS ? "selected" : ""}>삼성라이온즈</option>
														<option value="HH"
															${ product.prodTeamCode ==HH ? "selected" : ""}>한화이글스</option>
														<option value="NN"
															${ product.prodTeamCode ==NN ? "selected" : ""}>구단을 선택하세요</option>
													</select>
													</label>
												</div>
											</div>
											<div class="col-md-9">
												<div class="item">
													<label> 
														<span><b>상품재고</b> <i>*</i></span> 
														<input type="text" placeholder="수량을 입력하세요" name="prodStock">
														<font id="prodStock" size="2"></font>
													</label>
												</div>
											</div>
										</div>
									</div>
							</div>
						</div>
			    	</div>
			    </div>
		   </div>

		<div class="col-md-12 text-center">
			<br>
		    <button class="addProduct-submit" type="button"> 등록 </button>
			<button class="addProduct-submit" type="button"> 취소 </button>
		</div>
		
		</form>
		</div>
	</div>
</body>

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


</html>