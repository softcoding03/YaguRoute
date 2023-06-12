<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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
	$("form").attr("method" ,"POST").attr("action" , "/transaction/addTransaction").submit();
}

// 사용할 포인트 - 총가격  하여 결제 가격 지정하는 코드
  $(document).ready(function() {
    $('#applyPointButton').click(function() {
      var tranUsePoint = $('input[name="tranUsePoint"]').val();      
      //alert(tranUsePoint);
      
      var tranTotalPrice = ${totalPrice};
      tranTotalPrice -= tranUsePoint;    	 
      //alert("2번쨰알림 "+tranTotalPrice)
      $("#tranTotalPrice").val(tranTotalPrice);
      
    });
  });

  // 아임포트 구매 시작 
	    $(function() {
	    //$("#productTransaction").on("click" , function() {
  	  $("#goAddTran").on("click" , function() {
  	    alert("결제를 시작한다.");
  	    requestPay(tranTotalPrice);
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
			alert(payName + "&" + payPhone + "&" + payAddr + "&" + payAmount);
		
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
				 		            alert("결제가 완료되었습니다. 결제 승인: "+rsp.paid_at);
				 		            	fncAddTransaction();
				 		          } else {
				 		        	  alert("결제에 실패하였습니다. : 가격이 검증되지 않았습니다...!");
				 		          }	    	 
				           } else {
			 		        	  alert("결제에 실패하였습니다. :"+rsp.error_msg);
			 		          }	 
		 		      })
			 }; 
	});	 //아임포트 End
		 		  


</script>
</head>
<style>


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

            <div class="col-md-7">
                <h4>주문/결제</h4>
                <div class="customer-info">
           
                        <div class="row">
                        
                            <div class="col-md-6">
                                <div class="item">
                                    <label>
                                        <span>구매자 아이디 <i>*</i></span>
                                        <input type="text"  value="${user.userId}" >
                                    </label>
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                                <div class="item">
                                    <label>
                                        <span>구매자 이름 <i>*</i></span>
                                        <input type="text" value="${user.userName}" >
                                    </label>
                                </div>
                            </div>
                            
                            <div class="col-md-12">
                                <div class="item">
                                    <label>
                                        <span>구매자 이메일</span>
                                        <input type="text" value="${user.userEmail}" >
                                    </label>
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                                <div class="item">
                                    <label>
                                        <span>받는사람 이름 <i>*</i></span>
                                        <input type="text" id="receiverName" name="receiverName" value="${user.userName}"  >
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="item">
                                    <label>
                                        <span>받는사람 휴대폰번호 <i>*</i></span>
                                        <input type="text" id="receiverPhone" name="receiverPhone" value="${user.userPhone}"  >
                                    </label>
                                </div>
                            </div>
                              <div class="col-md-12">
                                <div class="item">
                                    <label>
                                        <span>받는사람 이메일주소 <i>*</i></span>
                                        <input type="text" id="receiverEmail" name="receiverEmail" value="${user.userEmail}"  >
                                    </label>
                                </div>
                            </div>
                           <div class="col-md-12">
                                <div class="item">
                                    <label>
                                        <span>받는사람 주소 <i>*</i></span>
                                        <input type="text" id="receiverAddr" name="receiverAddr" value="${user.userAddr}"  > 
                                    </label>
                                </div>
                            </div>
                           <div class="col-md-12">
                                <div class="item">
                                    <label>
                                        <span>배송 요청 사항 <i>*</i></span>
                                        <input type="text" id="dlvyRequest" name="dlvyRequest"  > 
                                    </label>
                                </div>
                            </div>                
                        </div>
                  </div>
            </div>
            <div class="col-md-5">
                <h4>결제 정보</h4>
              	  <table class="cart-table">
                	<c:forEach var="tranDetail" items="${tranDetailList}"  varStatus="tranStatus">
                      <tbody><tr>
                            <th class="product">구매할 상품 정보</th>
                            <th class="total"></th>
                        </tr>
                	    <tr>
                            <td>상품명</td>
                            <td class="prodName" style="text-align: right;">${tranDetail.tranDetailProd.prodName}</td>
                        </tr>
                        <tr>
                            <td>상품 수량</td>
                            <td class="prodQuantity" style="text-align: right;">${prodQuantity[tranStatus.index]}개</td>
                        </tr>
                         <tr>
                            <td>상품 가격</td>
                            <td class="prodQuantity" style="text-align: right;">${tranDetail.tranDetailProd.prodPrice}원</td>
                        </tr>    
							<tr>
							  <td>할인</td>
							  <td class="ct_write01">
							    <div>
							      <input type="text" id="tranUsePoint" name="tranUsePoint" value="${transaction.tranUsePoint}" class="ct_input_g" style="width: 100px;">
							     <span style="display: inline-block; width: 150px; background-color: #F0F0F0; padding: 5px; border-radius: 3px; font-weight: bold;">${user.userPoint}포인트</span>
							      <a id="applyPointButton" class="btn small">적용</a>
							    </div>
							  </td>
							</tr>                                         
                        <tr>
                            <td><strong>Total</strong></td>
                            <td class="total"></td>
                        </tr>
               </c:forEach>
            </tbody>
          </table>
             
                    
                <div class="cart-total">
                <button class="proceed"> 결제 <i class="fa fa-check" aria-hidden="true"></i></button>   
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
