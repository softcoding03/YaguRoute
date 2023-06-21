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
<title>야구ROUTE</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="icon" href="favicon.ico" type="image/x-icon">
<link href="/css/style.min.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
	$(function() {
		$("#addProduct").on('click', function() {
			self.location = "/product/listProduct?prodTeamCode="+$("#prodTeamCode").val();
		})

		$("#addProductPlus").on('click', function() {
			self.location = "../product/addProductView.jsp";
		})

	})
</script>

<input type="hidden" id="prodTeamCode" name="prodTeamCode" value="${product.prodTeamCode}" />
		

</head>

<style>
	.container {
		max-width: 600px;
		margin-top: 100px;
	    padding: 20px;
	    background-color: rgba(256, 256, 256, 0.5);
	    border-radius: 8px;
	    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	    font-size: 20px;
		
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

    body {
        background-image: url('/images/baseball/predict_background_img.jpg');
        background-repeat: no-repeat;
        background-size: cover;
        background-color: rgba(0, 0, 0, 0.5); /* 투명도 조절을 위한 배경색 설정 */
    }	
</style>


<body>


	<section class="hockey-stats">	    
			<div class="container">
				<div class="transparency col-md-12"  >
					<h3 style="font-family: ''gwangyang'';">상품등록이 완료되었습니다</h3>

	<hr style="border: none; border-top: 1px solid #000; margin-top: 10px;">

	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;">


		<tr>
			<td width="104" class="ct_write" >상품명 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" />
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"> ${product.prodName}</td>

					</tr>
		
<tr>
  <td width="104" class="ct_write">가격 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" /></td>
  <td bgcolor="D6D6D6" width="1"></td>
  <td class="ct_write01"><fmt:formatNumber value="${product.prodPrice}" pattern="###,###"/> 원</td>
</tr>

<%-- 
		<tr>
			<td width="104" class="ct_write">상품이미지</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<%
				String[] fileNames = (String[]) request.getAttribute("fileNames");
				%>
				<% 	for (String fileName : fileNames) {  %> 
				<img src="/images/product/<%=fileName%>" width="200" height="200" /> <%
 }
 %>
			</td>
		</tr>--%>	
<tr>
	<td width="104" class="ct_write">상품 이미지 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" />
	<td bgcolor="D6D6D6" width="1"></td>
	<td class="ct_write01">
		<img src="${product.prodImageFirst}"  style="width: 120px;" onerror="this.style.display='none'"/>
		<c:if test="${!product.prodImageSecond eq null}">
			<img src="${product.prodImageSecond}"  style="width: 120px;" onerror="this.style.display='none'"/>
		</c:if>
		<c:if test="${!product.prodImageThird eq null}">
			<img src="${product.prodImageThird}"  style="width: 120px;" onerror="this.style.display='none'"/>
		</c:if>
	</td>
</tr>
		<%--  단일 상품 업로드 
	<tr>
		<td width="104" class="ct_write">상품이미지</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
		<img  src="/images/product/${product.prodImage}"/> </td>
	</tr> --%>

		<tr>
			<td width="104" class="ct_write">상품재고<img
				src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" />
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">${product.prodStock} 개</td>
		</tr>

<tr>
	<td width="104" class="ct_write">상품 카테고리<img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" /></td>
	<td bgcolor="D6D6D6" width="1"></td>
	<td class="ct_write01">
		<c:choose>
			<c:when test="${product.prodCategory eq '1'}">
				유니폼
			</c:when>
			<c:when test="${product.prodCategory eq '2'}">
				모자
			</c:when>
			<c:when test="${product.prodCategory eq '3'}">
				의류
			</c:when>
			<c:when test="${product.prodCategory eq '4'}">
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
	<td width="104" class="ct_write">구단<img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" /></td>
	<td bgcolor="D6D6D6" width="1"></td>
	<td class="ct_write01">
		<c:choose>
			<c:when test="${product.prodTeamCode eq 'HH'}">
				한화
			</c:when>
			<c:when test="${product.prodTeamCode eq 'SS'}">
				삼성
			</c:when>
			<c:when test="${product.prodTeamCode eq 'KT'}">
				KT
			</c:when>
			<c:when test="${product.prodTeamCode eq 'OB'}">
				두산
			</c:when>
			<c:when test="${product.prodTeamCode eq 'SK'}">
				SSG
			</c:when>
			<c:when test="${product.prodTeamCode eq 'LG'}">
				LG
			</c:when>
			<c:when test="${product.prodTeamCode eq 'WO'}">
				키움
			</c:when>
			<c:when test="${product.prodTeamCode eq 'HT'}">
				기아
			</c:when>
			<c:when test="${product.prodTeamCode eq 'NC'}">
				NC
			</c:when>
			<c:when test="${product.prodTeamCode eq 'LT'}">
				롯데
			</c:when>
			<c:otherwise>
				${product.prodTeamCode}
			</c:otherwise>
		</c:choose>
	</td>
</tr>

</table>
</div>
</div>

	<div class="col-md-12 text-center">
		<br>
	    <button class="addProduct-submit" type="button" id="addProduct"> 확인 </button>
		<button class="addProduct-submit" type="button" id="addProductPlus"> 추가등록 </button>
	</div>



</section>

</body>
</html>
