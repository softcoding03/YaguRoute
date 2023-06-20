<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta name="viewport" content="width=device-width,initial-scale=1">
	
	<link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
	<!-- <link rel="icon" href="favicon.ico" type="image/x-icon"> -->
	<link href="/css/style.min.css" rel="stylesheet" type="text/css" />
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    
    <script type="text/javascript">
    	$(function() {
    		
    		$('input[name="channelName"]').keyup(function(){
    			var value = $(this).val();
    			var regex = /^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣\s]+$/;
    			var specialChars = /[~`!@#$%^&*()-_=+|<>?]/g;
    			
    			if(value.length < 3){
    				$("#channelName").html("3문자 미만입니다.");
					$("#channelName").attr("color", "#dc3545");
					$('button:contains("추가")').prop('disabled', true); // 버튼 비활성화
    			} else if (value.length > 20){
    				$("#channelName").html("20문자 초과입니다.");
					$("#channelName").attr("color", "#dc3545");
					$('button:contains("추가")').prop('disabled', true); // 버튼 비활성화
    			} else if (!regex.test(value) || specialChars.test(value)){
    				$("#channelName").html("특수 문자는 불가합니다.");
					$("#channelName").attr("color", "#dc3545");
					$('button:contains("추가")').prop('disabled', true); // 버튼 비활성화
    			} else {
    				$("#channelName").html("성공");
					$("#channelName").attr("color", "#4caf50");
					$('button:contains("추가")').prop('disabled', false); // 버튼 활성화
    			}
    		});
    		
    		$('input[name="uploadPath"]').keyup(function(){
    			var value = $(this).val();
    			var regex = /^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣\s]+$/;
    			var specialChars = /[~`!@#$%^&*()-_=+|<>?]/g;
    			
    			if(value.length < 3){
    				$("#uploadPath").html("3문자 미만입니다.");
					$("#uploadPath").attr("color", "#dc3545");
					$('button:contains("추가")').prop('disabled', true); // 버튼 비활성화
    			} else if (value.length > 20){
    				$("#uploadPath").html("20문자 초과입니다.");
					$("#uploadPath").attr("color", "#dc3545");
					$('button:contains("추가")').prop('disabled', true); // 버튼 비활성화
    			} else if (!regex.test(value) || specialChars.test(value)){
    				$("#uploadPath").html("특수 문자나 대문자는 불가합니다.");
					$("#uploadPath").attr("color", "#dc3545");
					$('button:contains("추가")').prop('disabled', true); // 버튼 비활성화
    			} else {
    				$("#uploadPath").html("성공");
					$("#uploadPath").attr("color", "#4caf50");
					$('button:contains("추가")').prop('disabled', false); // 버튼 활성화
    			}
    		});
    		
    		
    		
    		
    		$('button:contains("추가")').on('click', function(){
    			console.log("추가 버튼 클릭 성공");
    			
    			var channelName = $('input[name="channelName"]').val();
    	        var bucketName = $('input[name="bucketName"]').val();
    	        var uploadPath = $('input[name="uploadPath"]').val();
    	        
    	        if(!channelName || !bucketName || !uploadPath){
    	        	console.log("내용을 입력해 주세요");
    	        	
    	        	if(!channelName){
    	        		$("#channelName").html("채널 이름을 입력바랍니다.");
						$("#channelName").attr("color", "#dc3545");
    	        	}
    	        	
    	        	if(!uploadPath){
    	        		$("#uploadPath").html("저장될 경로의 이름을 입력바랍니다.");
						$("#uploadPath").attr("color", "#dc3545");
    	        	}
    	        	return; //submit 중지
    	        }
    			$('form[name="detailForm"]').attr("method", "post").attr("action", "/channel/addChannel").submit();
    		});
    		
    		
    		//drag & drop
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
				        formData.append('image', files[0]);
				        $.ajax({
				            url: "http://223.130.133.54:3000/image/channel",
				            type: "POST",
				            processData: false,
				            contentType: false,
				            data: formData,
				            dataType: "json",
				            success: function(data, status) {
				              console.log(data);
				              var thumbnail = $("<img>").attr("src", data.image_path).attr("width", "400px").attr("height", "200px");
				              var input = $("<input>").attr("type", "hidden").attr("name", "thumbNail").attr("value", data.image_path);
				              $("#image-result").empty();
				              $("#image-result").append(thumbnail);
				              $("form").append(input);
				              
				            }
				          });
				    	
				    }
			}
    	});
    </script>

<style>
input{
	padding: 15px 10px;
	border: 1px solid transparent;
	width: 100%;
	background: #fff;
	font-size: 14px;
	color: #666;
	line-height: normal;
	outline: 0
}

body{
	background-color:#f2f2f2;
}

.basic{
	border: #fff;
    border-radius: 4px;
    cursor: pointer;
    padding: 13px 24px 11px 9px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    position: relative;
    background: #fff;
    color: #141414;
    width: 80%;
    font-size: 12px;
    text-transform: uppercase;
    transition: all 240ms ease-out;
    -webkit-transition: all 240ms ease-out; 
}

.modal-button{
   	background-color:#19376D !important;
   	color: white !important;
   	padding:10px 50px !important;
   	border-radius: 10px !important;
   	text-align: center !important;
}

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

#image-drop{
	position: relative;
	padding : 50px;
	border: 2px dashed #ccc;
	border-radius: 10px;
	text-align: center;
}
</style>


</head>
<body>
	<section class="checkout-wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="text-center">
						<h4>channel 생성</h4>
					</div>
					
					<div class="customer-info">					
						<form name="detailForm" class="form-horizontal">
							<div class="row">
								
								<div class="form-group col-md-6 col-md-offset-3">
									<div class="item">
										<lable>
											<span>
												채널 이름 <i>*</i>
											</span>
											<input type="text" name="channelName" class="form-control" style="width:400px;"/>
											<font id="channelName" size="2" color="black">채널명은 최소 3글자이상 최대 20문자까지 허용, 특수문자는 불가합니다.</font>
										</lable>
									</div>
									
									<div class="item">
										<lable>
											<span>
												버켓 이름 <i>*</i>									
											</span>
											<input type="text" name="bucketName" class="form-control" value="mainpjt" style="width:400px;" readonly/>
											<font id="bucketName" size="2" color="#4caf50">버켓 이름은 고정입니다.</font>
										</lable>
									</div>
									
									<div class="item">
										<lable>
											<span>저장 경로</span>
											<input type="text" name="uploadPath" class="form-control" style="width:400px;"/>
											<font id="uploadPath" size="2"></font>
										</lable>
									</div>
									
									<div class="item">
										<label>
											<span>채널 타입</span>
											<select class="basic" name="envType">
												<option value="REAL">REAL</option>
												<option value="DEV">DEV</option>
												<option value="STAGE">STAGE</option>
											</select>
										</label>
									</div>
									
									<div class="item">
										<label>
											<span>오늘의 게임 리스트</span>
											<select class="basic" name="gameCode">
												<c:set var="i" value="0" />
												<c:forEach var="game" items="${gamelist}">
													<lable class="item">
													<option value="${game.gameCode}">${game.homeTeam.teamNickName} VS ${game.awayTeam.teamNickName}</input>
													</lable>
												</c:forEach>
											</select>
										</label>
									</div>
									
									<div class="item">
										<label>
											<span>thumbnail</span>
											<div id="image-drop">
																					
												<div class="thumbnail-area" id="image-result">
													<caption>이미지를 드랍해 주세요</caption>													
												</div>	
																				
												<div class="drop-area" id="drop-area">,</div>		
											</div>
										</label>
									</div>
								</div>
							</div>
						</form>
						<div class="text-center">
							<button class="modal-button">추가</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>		
	


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