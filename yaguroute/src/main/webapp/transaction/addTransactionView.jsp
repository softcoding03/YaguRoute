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
<script type="text/javascript">


// 사용할 포인트 - 총가격  하여 결제 가격 지정하는 코드
  $(document).ready(function() {
	  
    $('#applyPointButton').click(function() {
      var tranUsePoint = $('input[name="tranUsePoint"]').val();
      
      alert(tranUsePoint);
      
      var totalPrice = ${totalPrice};
     	 totalPrice -= tranUsePoint;
     	 
      $("#totalPrice").val(totalPrice);
    });
  });
  

  // 아임포트 구매 시작 
  
	$(function() {
		 $( "td.ct_btn01:contains('구매')" ).on("click" , function() {
			 alert("클릭됨?")
			 requestPay();
		});
	
	//아임포트 변수 선언
	var UID = new Date().getTime().toString(20); // 현재시간의 타임스탬프를 20진수로 변환하여 짧게 표현한 후 유니크한 값 만들고 + 상품의 번호 => merchant_id
	console.log(UID); //콘솔에서 확인
	const IMP = window.IMP; // 변하지 않는 값, 상수를 선언한다. 브라우저의 window객체에서 IMP라는 속성을 참조하는 의미. (window=가장 상위에 있는 전역객체)
	IMP.init("imp13567041");  // 아임포트에서 할당된 가맹점식별코드
	
	// 변수를 선언 완료했고, function 시작, 
	function requestPay() { //아임포트로 전달할 결제정보 설정
		console.log("아임포트 Pay가 시작되었습니다.")			
		//Pay를 시작할 때 함께 가야할 정보 선언??
		var payName = $("#receiverName").val();
		var payPhone = $("#receiverPhone").val();
		var payAddr = $("#receiverAddr").val();
		var payAmount = ${totalPrice}
			alert(payName + "&" + payPhone + "&" + payAddr + "&" + payAmount);
		
			IMP.request_pay( //아임포트로 결제 요청 보내기 (아임포트에서 요구하는 값)
			{ //결제 정보 설정 (***아임포트에서 요구하는 변수명 사용해야한다)
				pg: "html5_inicis", //결제 수단 설정 (관리자콘솔에서 추가한 pg만 가능)
				merchant_uid: UID, //유니크하게 만들어 놓은 merchat_id값
				goodsname: "${product.prodName}", //결제창에 보이는 구매할 상품의 이름
			    amount: payAmount,	//구매할 총 가격
			    buyer_name: payName, //직접 입력한 받는사람 이름
			    buyer_tel:  payPhone, //직접 입력한 받는사람 휴대폰번호
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
		 		  
	function fncAddTransaction() { 
		$("form").attr("method" ,"POST").attr("action" , "/transaction/addTransaction").submit();
	}


</script>
</head>

<body>
		<form name="detailForm">

					<!-- controller에 값 넘겨주기위한 hidden 목록 form안에 작성-->
					<input type="hidden" name="userPoint" value="${user.userPoint} " /> 
					<input type="hidden" id="prodNo" name="prodNo" value="" /> 
					
					<input type="hidden" id="impNo" name="impNo" value="" /> 
					<input type="hidden" id="merchantNo" name="merchantNo" value="" /> 
					<input type="hidden" id="payOption" name="tranPaymentOption" value="" />
					<!-- controller에 값 넘겨주기위한 hidden 목록 form안에 작성-->


		<table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
			<tr>
					<td width="15" height="37"><img src="/images/ct_ttl_img01.gif" width="15" height="37"></td>
					<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">구매정보입력</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
				   </table>
					</td>
				<td width="12" height="37"><img src="/images/ct_ttl_img03.gif" width="12" height="37" /></td>
		 	</tr>
		</table>


		<table width="600" border="0" cellspacing="0" cellpadding="0"
			align="center" style="margin-top: 13px;">
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>

			<tr>
				<td height="40" colspan="5" bgcolor="D6E6F5"
					style="font-size: 15px;" align="center">[구매자 정보]</td>
			</tr>
			<tr>
				<td width="104" class="ct_write">구매자아이디 <img
					src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" />
				</td>
				
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${user.userId}</td>
			</tr>
			
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			
			<tr>
				<td width="104" class="ct_write">구매자 이름 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" />
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${user.userName}</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">구매자 이메일 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" />
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${user.userEmail}</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>

			<tr>
				<td height="40" colspan="5" bgcolor="D6E6F5" style="font-size: 15px;" align="center">[받는사람 정보]</td>
			</tr>

			<tr>
				<td width="104" class="ct_write">받는사람 이름</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><input type="text" id="receiverName" name="receiverName" class="ct_input_g" style="width: 100px; height: 19px" 
				maxLength="20" value="${user.userName}" /></td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">받는사람 휴대폰번호</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><input type="text" id="receiverPhone" name="receiverPhone" class="ct_input_g" style="width: 100px; height: 19px" 
				maxLength="20"  value="${user.userPhone}" /></td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">받는사람 배송주소</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><input type="text" id="receiverAddr" name="receiverAddr" class="ct_input_g" style="width: 100px; height: 19px" 
					maxLength="20" value="${user.userAddr}" />
					<button type="button" onclick="validateAddress()">주소찾기</button></td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">구매요청사항</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><input type="text" name="dlvyRequest"	class="ct_input_g" style="width: 250px; height: 19px" maxLength="20" /></td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td height="40" colspan="5" bgcolor="D6E6F5"
					style="font-size: 15px;" align="center">[구매할 상품 정보]</td>
			</tr>

			<tr>
				<td width="300" class="ct_write">상품번호 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" /></td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01" width="299">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="105">${tranDetail.tranDetailProd.prodNo}</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">상품명 <img	src="/images/ct_icon_red.gif" width="3" height="3"	 align="absmiddle" /> </td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${tranDetail.tranDetailProd.prodName}</td>
			</tr>


			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td height="40" colspan="5" bgcolor="D6E6F5" style="font-size: 15px;" align="center">[결제 정보]</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">사용포인트</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">
					<div>
						<input type="text" name="tranUsePoint" class="ct_input_g" style="width: 100px; height: 19px" maxLength="20"
							value="${transaction.tranUsePoint}" /> <span>${user.userPoint}</span>
						포인트
						<button id="applyPointButton">적용</button>
					</div>
				</td>
			</tr>

			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>

			<tr>
				<td width="104" class="ct_write">상품 총 가격(가격*구매수량) <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" /></td>
				<td bgcolor="D6D6D6" width="1" id="tranUsePointInput"></td>
				<td class="ct_write01"><input type="" id="totalPrice" value="${totalPrice}" /></td>
			</tr>

			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>

			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>

			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
		</table>

		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			style="margin-top: 10px;">
			<tr>
				<td width="53%"></td>
				<td align="center">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="17" height="23"><img src="/images/ct_btnbg01.gif" width="17" height="23" /></td>
							<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
									구매</td>
							<td width="14" height="23"><img src="/images/ct_btnbg03.gif" width="14" height="23" /></td>
							<td width="30"></td>
							<td width="17" height="23"><img src="/images/ct_btnbg01.gif" width="17" height="23" /></td>
							<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;"><a href="javascript:history.go(-1)">취소</a></td>
							<td width="14" height="23"><img src="/images/ct_btnbg03.gif"
								width="14" height="23" /></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>

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
