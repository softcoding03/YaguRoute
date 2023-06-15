<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<title>updateProduct</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="icon" href="favicon.ico" type="image/x-icon">
<link href="/css/style.min.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">

	$(function() {
		$("#commit").on('click', function() {
			self.location = "../product/listProduct?prodTeamCode=ALL";
		})
	})

</script>
<input type="hidden" id="prodTeamCode" name="prodTeamCode" value="${product.prodTeamCode}" />
		

</head>

<style>
	.container {
		max-width: 600px;
		margin: 0 auto;
		padding: 20px;
		border-radius: 8px;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
		font-size: 20px;
		background-color: rgba(244, 244, 244, 0.9);
	}

#back-img {
  position: fixed;
  width: 100%;
  height: 100vh;
  overflow: hidden;
  background-image: url('/images/product/baseaballStradium.png');
  background-size: 800px;
  background-repeat: no-repeat;
  background-position: center center;
  opacity: 0.4;
}

	.transparency{
		background-color: rgba(256,256,256,0.3);
		width:100%;
		height: 100%;
		margin: 0 auto;
	}
		.item {
    justify-content: center;
    align-items: center;
	width:100%;
	}
	
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
</style>


<body>



<form name="detailForm">	    
	<section class="hockey-stats"style="margin-top: 50px;">
			<div class="container">
				<div class="transparency col-md-12"  >
					<h3 style="font-family: 'Open Sans', sans-serif;">상품수정이 완료되었습니다</h3>

	<hr style="border: none; border-top: 1px solid #000; margin-top: 10px;">

	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;">


		<tr>
				<td width="104" class="ct_write" style="font-size: 16px;">
				  상품명 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" />
				</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"style="font-size: 16px;"> ${product.prodName}</td>

					</tr>
		
<tr>
  <td width="104" class="ct_write"style="font-size: 16px;">가격 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" /></td>
  <td bgcolor="D6D6D6" width="1"></td>
  <td class="ct_write01"style="font-size: 16px;"><fmt:formatNumber value="${product.prodPrice}" pattern="###,###"/> 원</td>
</tr>

<tr>
	<td width="104" class="ct_write"style="font-size: 16px;">상품 이미지 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" />
	<td bgcolor="D6D6D6" width="1"></td>
	<td class="ct_write01"style="font-size: 16px;">
		<img src="${product.prodImageFirst}"  style="width: 100px;" onerror="this.style.display='none'"/>
		<img src="${product.prodImageSecond}"  style="width: 100px;" onerror="this.style.display='none'"/>
		<img src="${product.prodImageThird}"style="width: 100px;" onerror="this.style.display='none'"/>
	</td>
</tr>

		<tr>
			<td width="104" class="ct_write"style="font-size: 16px;">상품재고<img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" /> </td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"style="font-size: 16px;">${product.prodStock} 개</td>
		</tr>

<tr>
	<td width="104" class="ct_write"style="font-size: 16px;">상품 카테고리<img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" /></td>
	<td bgcolor="D6D6D6" width="1"></td>
	<td class="ct_write01"style="font-size: 16px;">
		<c:choose>
			<c:when test="${product.prodCategory eq '1'}">
				유니폼
			</c:when>
			<c:when test="${product.prodCategory eq '2'}">
				모자
			</c:when>
			<c:when test="${product.prodCategory eq '3'}">
				야구용품
			</c:when>
			<c:when test="${product.prodCategory eq '4'}">
				잡화
			</c:when>
			<c:otherwise>
				${product.prodCategory}
			</c:otherwise>
		</c:choose>
	</td>
</tr>
<tr>
	<td width="104" class="ct_write" style="font-size: 16px;">구단<img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" /></td>
	<td bgcolor="D6D6D6" width="1"></td>
	<td class="ct_write01" style="font-size: 16px;" >
		<c:choose>
			<c:when test="${product.prodTeamCode == 'HH'}">한화</c:when>
			<c:when test="${product.prodTeamCode == 'SS'}">삼성</c:when>
			<c:when test="${product.prodTeamCode == 'KT'}">KT</c:when>
			<c:when test="${product.prodTeamCode == 'OB'}">두산</c:when>
			<c:when test="${product.prodTeamCode == 'SK'}">SSG</c:when>
			<c:when test="${product.prodTeamCode == 'LG'}">LG</c:when>
			<c:when test="${product.prodTeamCode == 'WO'}">키움</c:when>
			<c:when test="${product.prodTeamCode == 'HT'}">기아</c:when>
			<c:when test="${product.prodTeamCode == 'NC'}">NC</c:when>
			<c:when test="${product.prodTeamCode == 'LT'}">롯데</c:when>
			<c:otherwise>${product.prodTeamCode}</c:otherwise>
		</c:choose>
	</td>
</tr>

</table>
</div>
</div>

	<div class="col-md-12 text-center">
		<br>
	    <button class="addProduct-submit" type="button" id="commit"> 확인 </button>
	</div>



</section>
   </form>
</body>
</html>
