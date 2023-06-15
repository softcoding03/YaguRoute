<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
<link rel="icon" href="favicon.ico" type="image/x-icon">
<link href="/css/style.min.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script type="text/javascript">

	function fncAddTransaction() { 
		console.log("AddTransaction 시작")
		$("form").attr("method" ,"POST").attr("action" , "/transaction/addTransaction").submit();
	}
	
	// 아임포트 구매 시작 
	$(function() {
	//$("#productTransaction").on("click" , function() {
		$("#goAddTran").on("click" , function() {
		
		  requestPay(tranTotalPrice);
		});
		 
		//수령인 이름 검증
		$("#receiverName").keyup(function(){
			var value = $(this).val();
			var caption = $(this).parent().find("p");
			var stringREG = /^[a-zA-Z가-힣]+$/;
			
			if(value.length < 1 || value == null){
				caption.html("최소글자(1)이상을 입력하여야합니다.");
				caption.attr("color", "#dc3545");
				$("#goAddTran").prop('disabled', true); // 버튼 비활성화
		 } else if (value.length > 20) {
			 	caption.html("최대글자(20)을 초과하였습니다.");
				caption.attr("color", "#dc3545");
				$("#goAddTran").prop('disabled', true); // 버튼 비활성화
		 } else if (!stringREG.test(value)) {
			 caption.html("한글과 영어만 입력 가능합니다.");
			 caption.attr("color", "#dc3545");
			 $("#goAddTran").prop('disabled', true); // 버튼 비활성화		
		 } else {
			 caption.html("");
			 $("#goAddTran").prop('disabled', false);  
			}
		})
		
		//휴대폰번호 검증
		$("#receiverPhone").keyup(function(){
			var value = $(this).val();
			var caption = $(this).parent().find("p");
			var stringREG = /^01[016789]\d{7,8}$/;
			
			if(!stringREG.test(value)){
				caption.html("유효하지 않은 핸드폰 번호입니다.");
				caption.attr("color", "#dc3545");
				$("#goAddTran").prop('disabled', true); // 버튼 비활성화
		 	} else {
				 caption.html("");
				 $("#goAddTran").prop('disabled', false);  
			}
		})
		
		//이메일주소 검증
		$("#receiverEmail").keyup(function(){
			var value = $(this).val();
			var caption = $(this).parent().find("p");
			var stringREG = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
			
			if(!stringREG.test(value)){
				caption.html("유효하지 않은 이메일주소 입니다.");
				caption.attr("color", "#dc3545");
				$("#goAddTran").prop('disabled', true); // 버튼 비활성화
		 	} else {
				 caption.html("");
				 $("#goAddTran").prop('disabled', false);  
			}
		})
		
		//주소 빈칸 검증
		$("#receiverAddr").keyup(function(){
			var value = $(this).val();
			var caption = $(this).parent().find("p");
			
			if(value.length < 1 || value === null){
				caption.html("주소를 반드시 입력해 주세요");
				caption.attr("color", "#dc3545");
				$("#goAddTran").prop('disabled', true); // 버튼 비활성화
		 	} else {
				 caption.html("");
				 $("#goAddTran").prop('disabled', false);  
			}
		})
		
		//요청메시지 검증
		$("#dlvyRequest").keyup(function(){
			var value = $(this).val();
			var caption = $(this).parent().find("p");
			
			if(value.length > 100){
				caption.html("요청사항이 100자를 초과하였습니다.");
				caption.attr("color", "#dc3545");
				$("#goAddTran").prop('disabled', true); // 버튼 비활성화
		 	} else {
				 caption.html("");
				 $("#goAddTran").prop('disabled', false);  
			}
		})
	});
 
	//아임포트 변수 선언
		var UID = new Date().getTime().toString(20); // 현재시간의 타임스탬프를 20진수로 변환하여 짧게 표현한 후 유니크한 값 만들기 => merchant_id
		console.log(UID); //콘솔에서 확인
		const IMP = window.IMP; // 변하지 않는 값, 상수를 선언한다. 브라우저의 window객체에서 IMP라는 속성을 참조하는 의미. (window=가장 상위에 있는 전역객체)
		IMP.init("imp13567041");  // 아임포트에서 할당된 가맹점식별코드
		
	// 변수를 선언 완료했고, function 시작, 
function requestPay(tranTotalPrice) { //아임포트로 전달할 결제정보 설정
	console.log("아임포트 Pay가 시작되었습니다.")	
	console.log($("#tranTotalPrice").val());
	//Pay를 시작할 때 함께 가야할 정보 선언??
	var payName = $("#receiverName").val();
	var payPhone = $("#receiverPhone").val();
	var payEmail = $("#receiverEmail").val();
	var payAddr = $("#receiverAddr").val();
	var payAmount = $("#tranTotalPrice").val(); // 변경된 tranTotalPrice 값 사용
	var name = "${prodCount}개 상품 결제";
	
		IMP.request_pay( //아임포트로 결제 요청 보내기 (아임포트에서 요구하는 값)
		{ //결제 정보 설정 (***아임포트에서 요구하는 변수명 사용해야한다)
			pg: "html5_inicis", //결제 수단 설정 (관리자콘솔에서 추가한 pg만 가능)
			merchant_uid: UID, //유니크하게 만들어 놓은 merchat_id값
			name: name, //결제창에 보이는 구매할 상품의 이름
		    amount: payAmount,	//구매할 총 가격
		    buyer_name: payName, //직접 입력한 받는사람 이름
		    buyer_tel:  payPhone, //직접 입력한 받는사람 휴대폰번호
		    buyer_email: payEmail, //직접 입력한 받는사람 이메일주소
		    buyer_addr: payAddr //직접 입력한 받는사람 배송주소
		},	//결제완료
			function (rsp) { // 결제 완료시 response !  
			/*  
			콜백함수에서 전달할 수 있는 정보: 
			 1.rsp.success: 결제 성공여부 불리언값
			 2.rsp.merchant_uid: 결제 요청 시 전달한 'merchant_uid'의 값
			 3.rsp.imp_uid: 아임포트에서 부여한 고유 결제 거래 ID
			 4.rsp.paid_amount: 실제 결제가 이루어진 금액 
			 5.rsp.paid_method: 실제 결제에 사용된 결제수단  등등.... */
			 
					if(rsp.success) { //결제 성공
								console.log(rsp);
				 		    	console.log(rsp.imp_uid);  
				 		    	console.log(rsp.merchant_uid);
				 		    	 //controller의 transaction, tranDetail 객체에 값을 전달할 것이며 값 사용을 위해  input 태크 작성필요.
				 		    	 $('#impNo').val(rsp.imp_uid);		 // 아임포트에서 부여한 고유 결제 거래 ID
				 		    	 $('#merchantNo').val(rsp.merchant_uid); // 결제 요청시 만들어 전달한 merchant_uid 값
				 		    	 $('#payOption').val(rsp.pay_method); // 결제방법, 수단 (tranPayOption)

				 		    	 console.log($("#prodNo").val());
				 		    	 console.log($("#userId").val());
				 		    	 console.log($("#impNo").val());
				 		    	 console.log($("#merchantNo").val());
				 		    	 console.log($("#payOption").val());
				 		    	 console.log($("#tranUsePoint").val());

				 		    	 if (rsp.paid_amount == payAmount) { 				 		        
				 		      			 // sendSMS 발송 ajax 시작
				 		       		  $.ajax({				
				 				    	url: "/transaction/rest/sendSMS",
				 			            method: "GET",
				 			            dataType : "text",
				 			            headers : {
				 							"Accept" : "application/json",
				 							"Content-Type" : "application/json"
				 						},
				 						success : function(Data, status) {
				 				 		}
				 				  });// sendSMS 발송 ajax 끝
				 		       	   fncAddTransaction(); 
				 		          } else {
				 		        	  alert("결제에 실패하였습니다.");
				 		          }	    	 
			           } else {
		 		        	  alert("결제에 실패하였습니다. :"+rsp.error_msg);
		 		          }	 
	   		   })
 		}; 
 //아임포트 End


	function validPoint(tranUsePoint,userPoint,tranTotalPrice){
		console.log(tranUsePoint)
		console.log(userPoint)
		console.log(tranTotalPrice)
	if(parseInt(userPoint)<parseInt(tranUsePoint)){
	  	  alert("보유한 포인트를 넘어섰습니다.")
	  	  return false
	    }else if(parseInt(tranTotalPrice)<parseInt(tranUsePoint)){
	    	alert("상품가격보다 많은 포인트를 사용 하셨습니다.")
	    	return false
	    }
		return true;
	}
// 사용할 포인트 - 총가격  하여 결제 가격 지정하는 코드
  $(document).ready(function() {
    $('#applyPointButton').click(function() {
      var tranUsePoint = $('input[name="tranUsePoint"]').val();  
      var userPoint = $('.userPoint').val();
      var tranTotalPrice = $("#tranTotalPrice").val();
      var formatter = new Intl.NumberFormat('en-US',{style:'decimal'})
      
      if(validPoint(tranUsePoint,userPoint,tranTotalPrice)){
          //alert("2번쨰알림 "+tranTotalPrice)
          $(".userPoint").val(userPoint-tranUsePoint);
          $(".userPointText").text(formatter.format(userPoint-tranUsePoint)+' Point');
          $("#tranTotalPrice").val(tranTotalPrice-tranUsePoint);
          $(".totalSpan").text(formatter.format(tranTotalPrice-tranUsePoint)+'원');
      }
    });
  });



function removeBlock(elem){
	elem.one("click",function(){
		$(this).find(".prodDetailBack").removeClass("element")
		$(this).find(".glyphicon").removeClass("glyphicon-chevron-down");
		$(this).find(".glyphicon").addClass("glyphicon-chevron-up");
		
		addBlock($(this))
	})
}

function addBlock(elem){
	elem.one("click",function(){
		$(this).find(".prodDetailBack").addClass("element")
		$(this).find(".glyphicon").removeClass("glyphicon-chevron-up");
		$(this).find(".glyphicon").addClass("glyphicon-chevron-down");
		removeBlock($(this))
	})
}

$(function(){
	removeBlock($("div.delivery-list"));
})

</script>
</head>
<style>
	.delivery-list{
		border-top: solid 2px;
	}
	.delivery-list .item{
		background-color: white !important;
		padding-top: 20px;
		border-top: solid 1px lightgrey;
	}
	.prodDetailBack{
		display: block;
		
	}
	.item.img{
		background-color: white !important;
		display: inline-flex;
		align-items: center;
		width: 100%;
		border-top: solid lightgrey 1px !important;
		text-align: center;
		padding-top: 10px;
		padding-bottom: 10px
	}
	
	.span-left{
		width: 40% !important;
	}
	
	.span-right{
		width: 60% !important;
	}

	.element {
      opacity: 0;
      display: none;
      transform: translateY(-20px);
      transition: opacity 1s ease, transform 1s ease;
    }
    .input-wrapper {
   		position: relative;
	}
	.input-text {
	    position: absolute;
	    top: 50%;
	    right: 110px;
	    transform: translateY(-50%);
	    padding-right: 16px;
	    font-size: 18px;
	    color:black;
	    
	}
</style>
<body>

	 <!-- ToolBar Start /////////////////////////////////////-->
	 <jsp:include page="/common/topBar.jsp"/>
	 <!-- ToolBar End /////////////////////////////////////-->
	 


    <!--BREADCRUMBS BEGIN-->

<!--BREADCRUMBS END-->


    <!--CHECKOUT WRAP BEGIN-->
<section class="checkout-wrap">
    <div class="container">
        <div class="row">
			<h4>주문/결제</h4>
               			<div class="col-md-7 customer-info">
               				<div class="col-md-12">
                            	<h6>구매자 정보</h6>
                            	<hr style="border: solid 1px;">
                            </div>
                            <div class="col-md-4">
                                <div class="item">
                                    <label>
                                        <span>구매자 아이디 <i>*</i></span>
                                        <input disabled="disabled" type="text"  value="${user.userId}" >
                                    </label>
                                </div>
                            </div>
                            
                            <div class="col-md-4">
                                <div class="item">
                                    <label>
                                        <span>구매자 이름 <i>*</i></span>
                                        <input disabled="disabled" type="text" value="${user.userName}" >
                                    </label>
                                </div>
                            </div>
                            
                            <div class="col-md-8">
                                <div class="item">
                                    <label>
                                        <span>구매자 이메일</span>
                                        <input disabled="disabled" type="text" value="${user.userEmail}" >
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-12">
                            	<h6>배송 정보 입력</h6>
                            	<hr style="border: solid 1px;">
                            </div>
                            
                            <div class="col-md-6">
                                <div class="item">
                                    <label>
                                        <span>받는사람 이름 <i>*</i></span>
                                        <div>
	                                        <input type="text" id="receiverName" name="receiverName" value="${user.userName}"  >
	                                    	<p></p>
                                    	</div>
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="item">
                                    <label>
                                        <span>받는사람 휴대폰번호 <i>*</i></span>
                                        <div>
	                                        <input type="text" id="receiverPhone" name="receiverPhone" value="${user.userPhone}"  >
	                                   		<p></p>
                                   		</div>
                                    </label>
                                </div>
                            </div>
                              <div class="col-md-12">
                                <div class="item">
                                    <label>
                                        <span>받는사람 이메일주소 <i>*</i></span>
	                                     <div>
	                                        <input type="text" id="receiverEmail" name="receiverEmail" value="${user.userEmail}"  >
	                                    	<p></p>
                                    	</div>
                                    </label>
                                </div>
                            </div>
                           <div class="col-md-12">
                                <div class="item">
                                    <label>
                                        <span>받는사람 주소 (정확한 정보를 기재해 주세요)<i> * </i></span>
                                        <div>
	                                        <input type="text" id="receiverAddr" name="receiverAddr" value="${user.userAddr}" > 
	                                    	<p></p>
                                    	</div>
                                    </label>
                                </div>
                            </div>
                           <div class="col-md-12">
                                <div class="item">
                                    <label>
                                        <span>배송 요청 사항 (100자 이내)<i> *</i></span>
                                        <div>
	                                        <input type="text" id="dlvyRequest" name="dlvyRequest"  > 
	                                        <p></p>
                                        </div>
                                    </label>
                                </div>
                            </div>                
                        </div>
            <div class="col-md-5">
	            <div class="col-md-12">
	                <h6>상품 정보</h6>
	            </div>
	            <div class="col-md-12">
		              	<table class="cart-table">
			              	<tr>
		                    	<th style="text-align: center;font-size: 14px;">상품 정보</th>
	                    	</tr>
	              	  	</table>
	              	 	
						<form name="detailForm">
						<!-- controller에 값 넘겨주기위한 hidden 목록 form안에 작성-->
						<input type="hidden" id="userId" name="userId" value="${user.userId}" /> 
						<input type="hidden" id="impNo" name="impNo" value="" /> 
						<input type="hidden" id="merchantNo" name="merchantNo" value=""/> 
						<input type="hidden" id="payOption" name="tranPaymentOption" value="" />
						<input type="hidden" id="prodQuantity" name="prodQuantity" value="${prodQuantity[0]}" />
						
						<div class="cart-total">
	                	<c:forEach var="tranDetail" items="${tranDetailList}"  varStatus="tranStatus">
	                    <input type="hidden" id="prodNo" name="prodNo" value="${tranDetail.tranDetailProd.prodNo}" />   
	                	    <%-- <tr>
	                            <td>상품번호</td>
	                            <td class="prodNo" style="text-align: right;">${tranDetail.tranDetailProd.prodNo}</td>
	                            <td></td>
	                            <td></td>
	                        </tr>     --%>
	                        <div class="delivery-list" id="${tranDetail.tranDetailProd.prodNo}">
	                        	<label class="item" style="text-align: center;">
				                	<span class="name" >${tranDetail.tranDetailProd.prodName}</span><span><i role="button" class="glyphicon glyphicon-chevron-down" aria-hidden="true" style="margin-left: 10px;size: 15px;text-align: left"></i></span>	
				                </label>
				                <div class="prodDetailBack element">
				               			 <label class="item img">
				               			 	<span class="span-left">이미지</span><span class="span-right"><img style="width: 100px;height: auto;" src="${tranDetail.tranDetailProd.prodImageFirst}" alt="card"></span>	
				               			 </label>
				                        <label class="item img">
				                            <span class="span-left">가격</span><span class="span-right"><fmt:formatNumber value="${tranDetail.tranDetailProd.prodPrice}" pattern="###,###"/>원</span>	
				                        </label>
				                        <label class="item img">
				                            <span class="span-left">상품 수량</span><span class="span-right">${prodQuantity[tranStatus.index]}</span>	
				                        </label>
				                 </div>
	                        </div>  
	                           
	               </c:forEach>
	               </div>
	          </form>
			</div>
			<div class="col-md-12">
	                <h6>결제 정보</h6>
	            </div>
			<div class="col-md-12">
				<table class="cart-table">
			              	<tr>
		                    	<th style="text-align: center;font-size: 14px;">결제 정보</th>
	                    	</tr>
	            </table>
	                <div class="cart-total">
	                	<div class="delivery-list">
	               			<label class="item" style="text-align: center;">
	               				<div style="margin-bottom: 30px;"><span>보유 포인트 : </span><span class="userPointText"><fmt:formatNumber value="${user.userPoint}" pattern="###,###"/> Point</span><input class="userPoint" type="hidden" value="${user.userPoint}" /></div>
								<div class="input-wrapper"><input type="text" id="tranUsePoint" name="tranUsePoint" value="${transaction.tranUsePoint}" class="ct_input_g" style="width: 60%;margin-right:20px;text-align: center;border:solid 1px;background-color: #D4D8DA;"><span class="input-text">point</span><a id="applyPointButton" class="btn small">적용</a>  </div> 
				            </label>
				            <label class="item" style="text-align: center;">
				            	<span class="span-left" style="margin-right:10px;">결제 금액 : </span><span class="span-right totalSpan"><fmt:formatNumber value="${totalPrice}" pattern="###,###"/>원</span>
				            </label>
				            <input style="text-align: center;border: 0px;" type="hidden" id="tranTotalPrice" name="tranTotalPrice" value="${totalPrice}"/>
	               		</div>
	                	<button class="proceed" id="goAddTran"> 결제 <i class="fa fa-check" aria-hidden="true"></i></button>   
	                </div>
	         </div>
	            </div>
           	</div>
           	</div>
        </div>
</section>
     
<!--CHECKOUT WRAP END-->

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