<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="eu">
<head>
    <meta charset="UTF-8">
   
   <!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<script type="text/javascript">

	$(function(){
		var refundableDate = "${transaction.refundableDate}";
		var formattedDateTime = refundableDate.replace("T", " ");
		$("#refundableDate").text(formattedDateTime+" 이전까지");
		
	 	//환불
	 	$('.refundTransaction').on("click" , function() {
	 		var refundableDate = new Date("${transaction.refundableDate}");
	 		var currentDate = new Date();
	 		
	 		if(currentDate < refundableDate){
	 			var confirmation = confirm("정말로 구매를 취소하시겠습니까? 구매 취소 시 구매하신 모든 티켓이 취소됩니다.");
	 			var tranNo = ${transaction.tranNo};
	 			if(confirmation){
					console.log("취소ajax 시작");
					
						//환불요청 로직 (고객->admin)
						$.ajax({
							url:"/ticket/rest/refund/"+tranNo ,
							method: "GET",
							dataType : "text",
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(Data, status) {
								if(Data = "success"){
									alert("결제취소가 완료되었습니다.")
								}else{
									alert("결제취소에 실패했습니다.")
								}
							}
						})
		 		}
	 		} else {
	 			alert("결제 취소 가능 기간이 아닙니다.")
	 		}
		});
	 	//구매목록보기
	 	$('.getTicketPurchaseList').on("click" , function() {
				self.location = "/ticket/getTicketPurchaseList";
		});
	});
</script>
	
</head>

<body>
		<h1>예매 상세 내역</h1>
		<div class="row">
	  		<img src="${ticketList[0].game.homeTeam.teamEmblem}" width="50">
	  		<div class="col-md-2">VS</div>
			<img src="${ticketList[0].game.awayTeam.teamEmblem}" width="50">
		</div>
		<div class="row">
	  		<div class="col-md-5">${ticketList[0].game.homeTeam.teamFullName}</div>
	  		<div class="col-md-2"></div>
			<div class="col-md-5">${ticketList[0].game.awayTeam.teamFullName}</div>
		</div>
		<hr/>
		<h3>예매 내역</h3>
		<hr><hr>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>경기 일시</strong></div>
			<div class="col-xs-8 col-md-4">${ticketList[0].game.gameDate} / ${ticketList[0].game.gameTime}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>경기 장소</strong></div>
			<div class="col-xs-8 col-md-4">${ticketList[0].game.homeTeam.stadiumName}</div>
		</div>
		<hr/>
		<div>
	  		<table class="table table-hover table-striped" >
	  			<thead>
	  				<tr>
	  					<th align="center">티켓 번호</th>
		            <th align="left">좌석 번호</th>
		            <th align="left">가격</th>
	  				</tr>
	  			</thead>
	  			<tbody>
	  				<c:forEach var="ticket" items="${ticketList}">
	  				<tr>
	  					<td align="center">${ticket.ticketNo}</td>
		            <td align="left">${ticket.seatCode}</td>
		            <td align="left">${ticket.seatPrice}</td>
	  				</tr>
	  				</c:forEach>
	  			</tbody>
	  		</table>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>총 금액</strong></div>
			<div class="col-xs-8 col-md-4">${transaction.tranTotalPrice}</div>
		</div>
		<hr><hr>
		<c:if test="${transaction.refundStatus eq 0}">
			<h3>결제 내역</h3>
			<hr/><hr>
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>결제 시각</strong></div>
				<div class="col-xs-8 col-md-4">${transaction.tranDate}</div>
			</div>
			<hr/>
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>결제 수단</strong></div>
				<div class="col-xs-8 col-md-4">${transaction.tranPaymentOption}</div>
			</div>
			<hr/>
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>결제 금액</strong></div>
				<div class="col-xs-8 col-md-4">${transaction.tranTotalPrice}</div>
			</div>
			<hr/>
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>결제 취소가능기간</strong></div>
				<div class="col-xs-8 col-md-4" id="refundableDate"></div>
			</div>
			<hr>
			<div>
				<button type="button" class="refundTransaction">결제 취소</button>
				<button type="button" class="getTicketPurchaseList">목록보기</button>
			</div>
		</c:if>
		<c:if test="${transaction.refundStatus eq 1}">
			<h3>취소 내역</h3>
			<hr/><hr>
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>결제 취소 시각</strong></div>
				<div class="col-xs-8 col-md-4">${transaction.tranDate}</div>
			</div>
			<hr/>
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>결제 수단</strong></div>
				<div class="col-xs-8 col-md-4">${transaction.tranPaymentOption}</div>
			</div>
			<hr/>
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>취소 금액</strong></div>
				<div class="col-xs-8 col-md-4">${transaction.tranTotalPrice}</div>
			</div>
			<hr/>
			<div>
				<button type="button" class="getTicketPurchaseList">목록보기</button>
			</div>
		</c:if>
</body>
</html>
