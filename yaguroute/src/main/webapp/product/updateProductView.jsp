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
	<title>상품 수정</title>
	<link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<style>

.player-trophy li img {
  width: 50%;
  height: 50%;
  object-fit: contain;
}

.background-section {
  display: inline-block;
  text-align: center;
  
}
.addProduct-submit {
	background-color: #77af9c; /* 배경색 설정 */
	color: white; /* 글자색 설정 */
	border: none; /* 테두리 제거 */
	padding: 10px 20px; /* 안쪽 여백 설정 */
	font-size: 16px; /* 글자 크기 설정 */
	cursor: pointer; /* 마우스 커서를 손가락 모양으로 변경 */
}

.addProduct-submit:hover {
	background-color: #4CAF50; /* 마우스 오버 시 배경색 변경 */
}

</style>

<style>
.custom-file-input {
  display: inline-block;
  position: relative;
  overflow: hidden;
  border: 2px solid #4CAF50;
  border-radius: 4px;
  padding: 8px 12px;
  background-color: #4CAF50;
  color: white;
  cursor: pointer;
  transition: background-color 0.3s;
}

.custom-file-input:hover {
  background-color: #f0d264;
}

.custom-file-input span {
  font-weight: bold;
}

.custom-file-input input[type="file"] {
  position: absolute;
  top: 0;
  left: 0;
  opacity: 0;
  width: 100%;
  height: 100%;
  cursor: pointer;
}

.addProduct-submit {
  border-radius: 20px;
   background-color: #7fccde;
  color: white;
  font-size: 16px;
  border: none;
}


</style>


<script type="text/javascript">

$(function() {
	
	//유효성 체크 시작
	$("input[name='prodName']").keyup(function(){
		
		var value = $(this).val();
		var specialChars = /[~`!@#$%^&*()\-=+|<>?]/g;  //거르고 싶은 특수문자
			
		 if(value.length < 1 || value == null){
				$("#prodName").html("최소글자(1)이상을 입력하여야합니다.");
				//alert("최소글자(1)이상을 입력하여야합니다.");
				$("#prodName").attr("color", "#dc3545");
				$(".addProduct-submit:contains('수정')").prop('disabled', true); // 버튼 비활성화
		 } else if (value.length > 100) {
				$("#prodName").html("최대글자(100)을 초과하였습니다.");
				$("#prodName").attr("color", "#dc3545");
				$(".addProduct-submit:contains('수정')").prop('disabled', true); // 버튼 비활성화
		 } else if (specialChars.test(value)) {
				$("#prodName").html("특수문자는 입력할 수 없습니다.");
				$("#prodName").attr("color", "#dc3545");
				$(".addProduct-submit:contains('수정')").prop('disabled', true); // 버튼 비활성화		
		 } else {
				$("#prodName").html("성공");
				$("#prodName").attr("color", "#4caf50");
				$(".addProduct-submit:contains('수정')").prop('disabled', false);  
			 
			}
	});
	
	$("input[name='prodPrice']").keyup(function(){
		
		var value = $(this).val();
		var specialChars = /[~`!@#$%^&*()-_=+|<>?]/g;	  //거르고 싶은 특수문자
			
		 if(value.length < 1 || value == null){
				$("#prodPrice").html("최소글자(1)이상을 입력하여야합니다.");
				alert("최소글자(1)이상을 입력하여야합니다.");
				$("#prodPrice").attr("color", "#dc3545");
				$(".addProduct-submit:contains('수정')").prop('disabled', true); // 버튼 비활성화
		 } else if (value.length > 11) {
				$("#prodPrice").html("최대글자(11)을 초과하였습니다.");
				$("#prodPrice").attr("color", "#dc3545");
				$(".addProduct-submit:contains('수정')").prop('disabled', true); // 버튼 비활성화
		 } else if (specialChars.test(value)) {
				$("#prodPrice").html("특수문자는 입력할 수 없습니다.");
				$("#prodPrice").attr("color", "#dc3545");
				$(".addProduct-submit:contains('수정')").prop('disabled', true); // 버튼 비활성화		
		 } else {
				$("#prodPrice").html("성공");
				$("#prodPrice").attr("color", "#4caf50");
				$(".addProduct-submit:contains('수정')").prop('disabled', false);  

			}
	});

	$("input[name='prodStock']").keyup(function(){
		
		var value = $(this).val();
		var specialChars = /[~`!@#$%^&*()-_=+|<>?]/g;	  //거르고 싶은 특수문자
			
		 if(value.length < 1 || value == null){
				$("#prodStock").html("최소글자(1)이상을 입력하여야합니다.");
				alert("최소글자(1)이상을 입력하여야합니다.");
				$("#prodStock").attr("color", "#dc3545");
				$(".addProduct-submit:contains('수정')").prop('disabled', true); // 버튼 비활성화
		 } else if (value.length > 11) {
				$("#prodStock").html("최대글자(11)을 초과하였습니다.");
				$("#prodStock").attr("color", "#dc3545");
				$(".addProduct-submit:contains('수정')").prop('disabled', true); // 버튼 비활성화
		 } else if (specialChars.test(value)) {
				$("#prodStock").html("특수문자는 입력할 수 없습니다.");
				$("#prodStock").attr("color", "#dc3545");
				$(".addProduct-submit:contains('수정')").prop('disabled', true); // 버튼 비활성화		
		 } else {
				$("#prodStock").html("성공");
				$("#prodStock").attr("color", "#4caf50");
				$(".addProduct-submit:contains('수정')").prop('disabled', false);  
			 
			}

	});
	
	function fncUpdateProduct(prodNo) {

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


 		$("form").attr("enctype", "multipart/form-data").attr("method" , "POST").attr("action" , "/product/updateProduct").submit();

	}
		
	$(function() {
		  // 수정 버튼 클릭 이벤트 처리
		  $("#updateProduct").on("click", function() {
			  var prodNo = $("#prodNo").val();
		    fncUpdateProduct(prodNo);
		  });
		  
		});

});

</script>

</head>
<body bgcolor="#ffffff" text="#000000">
	 <!-- ToolBar Start /////////////////////////////////////-->
	 <jsp:include page="/common/topBar.jsp"/>
	 <!-- ToolBar End /////////////////////////////////////-->
				
				<!--상단 이미지 바-->
							

				<!--상단 이미지 바-->

				<!--CHECKOUT WRAP BEGIN-->
<section class="hockey-stats">
		   <div class="container">
		   <br>
		      <div class="row">
			        <h3 style="text-align: center;"> Update Product Information</h3>
			    <div class="container" style="border: 2px solid #000; padding: 10px; width: 600px; border-radius: 10px;">
				<div class="col-md-12" >

					<div class="customer-info">
						<form>
						<input type="hidden" id="prodNo" name="prodNo" value="${product.prodNo }" />			
					    <br>
							<div class="row">

								<div class="col-md-9">
									<div class="item">
										<label> <span>상품명<i>*</i></span> 
										<input type="text" placeholder="상품명을 입력하세요" name="prodName" value="${product.prodName }">
										</label>
									</div>
								</div>

								<div class="col-md-12">
									<div class="item">
								<label>
								  <span>상품 이미지</span>
								  <input type="file" name="prodImages" multiple="multiple" style="border: 1px solid #ccc; padding: 10px; background-color: #f0f0f0;">
								</label>
							
								</div>
						</div>
							

								<div class="col-md-9">
									<div class="item">
										<label> <span>가격 <i>*</i></span> <input type="text" placeholder="가격을 입력하세요" name="prodPrice"value="${product.prodPrice }">
										</label>
									</div>
								</div>

								<div class="col-md-5">
									<div class="item">
										<label> <span>상품카테고리 <i>*</i></span> <select class="basic" name="prodCategory">
												<option value="0"
													${ product.prodCategory ==0 ? "selected" : ""}>상품 카테고리를 선택하세요</option>
												<option value="1"
													${ product.prodCategory ==1 ? "selected" : ""}>유니폼</option>
												<option value="2"
													${ product.prodCategory ==2 ? "selected" : ""}>모자</option>
												<option value="3"
													${ product.prodCategory ==3 ? "selected" : ""}>야구용품</option>
												<option value="4"
													${ product.prodCategory ==4 ? "selected" : ""}>잡화</option>
										</select>
										</label>
									</div>
								</div>

								<div class="col-md-4">
									<div class="item">
										<label> <span>구단<i>*</i></span> <select class="basic" name="prodTeamCode">
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
										<label> <span>상품재고 <i>*</i></span> <input type="text" placeholder="수량을 입력하세요" name="prodStock" value="${product.prodStock }">
										</label>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
		</div>
	</div>
</div>
<br>
</section> 

	<div class="col-md-12 text-center">
		<br>
	    <button class="addProduct-submit" type="button" id="updateProduct"> 수정 </button>
		<button class="addProduct-submit" type="button"> 취소 </button>
	</div>
	<br>
	
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