<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>

<head>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<title>addProduct</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="icon" href="favicon.ico" type="image/x-icon">
<link href="/css/style.min.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

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
		margin: 0 auto;
		padding: 20px;
		background-color: #f4f4f4;
		border-radius: 8px;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		font-size: 16px;
	}

	h3 {
		font-size: 24px;
		color: #333;
		margin-bottom: 20px;
	}

	#productData {
		background-color: #fff;
		padding: 20px;
		border-radius: 8px;
	}

	#productData div {
		margin-bottom: 10px;
	}

	#productData span {
		font-weight: bold;
	}

	#productData div:first-child {
		margin-top: 0;
	}

	#productData div:last-child {
		margin-bottom: 0;
	}
	
	
	* {
  box-sizing: border-box;
}
body {
  margin: 0;
  background: #eaedf1;
  font-family: 'Lato', sans-serif;
}
.header {
  background: white;
  padding: 30px;
  text-align: center;
}
.header h1 {
  font-weight: 300;
  display: inline;
}
h2 {
  color: #89867e;
  text-align: center;
  font-weight: 300;
}
.color {
  width: 350px;
  margin: 0 auto;
}
.color li {
  margin: 0 15px 0 0;
  width: 30px;
  height: 30px;
  display: inline-block;
  border-radius: 100%;
}
.color .red    {background: #fa5a5a;}
.color .yellow {background: #f0d264;}
.color .green  {background: #82c8a0;}
.color .cyan   {background: #7fccde;}
.color .blue   {background: #6698cb;}
.color .purple {background: #cb99c5;}

.content, 
.content-gradient, 
.content-3d {
  margin: 40px auto;
}

.container {
  border: 5px solid transparent;
  border-radius: 50px;
  padding: 20px;
}
.content {
  width: 80%;
  max-width: 700px;
}
.content-3d {
  width: 50%;
  max-width: 300px;
}
pre {
  width: 100%;
  padding: 30px;
  background-color: rgba(0, 0, 0, 0.72);
  color: #f8f8f2;
  border-radius: 0 0 4px 4px;
  margin-top: 20px;
  white-space: pre-wrap; /* css-3 */
  white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
  white-space: -pre-wrap; /* Opera 4-6 */
  white-space: -o-pre-wrap; /* Opera 7 */
  word-wrap: break-word; /* Internet Explorer 5.5+ */
}
pre .bt  {color: #f8f8f2;} /* <> */
pre .anc {color: #f92672;} /* anchor tag */
pre .att {color: #a6a926;} /* attribute */
pre .val {color: #e6db74;} /* value */

.btn-container, .container {
  background-color: white;
  border-radius: 4px;
  text-align: center;
  margin-bottom: 40px;
}
.container h2 {
  padding-top: 30px;
  font-weight: 300;
}
.btn, .btn-two {
  margin: 9px;
}
.btn-gradient {
  margin: 5px;
}
a[class*="btn"] {text-decoration: none;}
input[class*="btn"], 
button[class*="btn"] {border: 0;}

/* Here you can change the button sizes */
.btn.large, 
.btn-two.large, 
.btn-effect.large {
  padding: 20px 40px; 
  font-size: 22px;
}
.btn.small, 
.btn-two.small, 
.btn-gradient.small, 
.btn-effect.small {
  padding: 8px 18px;  
  font-size: 14px;
}
.btn.mini, 
.btn-two.mini, 
.btn-gradient.mini, 
.btn-effect.mini {
  padding: 4px 12px;  
  font-size: 12px;
}
.btn.block, 
.btn-two.block, 
.btn-gradient.block, 
.btn-effect.block {
  display: block;
  width: 60%;
  margin-left: auto;
  margin-right: auto;
  text-align: center;
}
.btn-gradient.large {
  padding: 15px 45px; 
  font-size: 22px;
}

/* Colors for .btn and .btn-two */
.btn.blue, .btn-two.blue     {background-color: #7fb1bf;}
.btn.green, .btn-two.green   {background-color: #9abf7f;}
.btn.red, .btn-two.red       {background-color: #fa5a5a;}
.btn.purple, .btn-two.purple {background-color: #cb99c5;}
.btn.cyan, .btn-two.cyan     {background-color: #7fccde;}
.btn.yellow, .btn-two.yellow {background-color: #f0d264;}

.rounded {
  border-radius: 10px;
}

/* default button style */
.btn {
  position: relative;
  border: 0;
  padding: 15px 25px;
  display: inline-block;
  text-align: center;
  color: white;
}
.btn:active {
  top: 4px; 
}

/* color classes for .btn */
.btn.blue {box-shadow: 0px 4px #74a3b0;}
.btn.blue:active {box-shadow: 0 0 #74a3b0; background-color: #709CA8;}

.btn.green {box-shadow: 0px 4px 0px #87a86f;}
.btn.green:active {box-shadow: 0 0 #87a86f; background-color: #87a86f;}

.btn.red {box-shadow:0px 4px 0px #E04342;}
.btn.red:active {box-shadow: 0 0 #ff4c4b; background-color: #ff4c4b;}

.btn.purple {box-shadow:0px 4px 0px #AD83A8;}
.btn.purple:active {box-shadow: 0 0 #BA8CB5; background-color: #BA8CB5;}

.btn.cyan {box-shadow:0px 4px 0px #73B9C9;}
.btn.cyan:active {box-shadow: 0 0 #73B9C9; background-color: #70B4C4;}

.btn.yellow {box-shadow:0px 4px 0px #D1B757;}
.btn.yellow:active {box-shadow: 0 0 #ff4c4b; background-color: #D6BB59;}


</style>


<body>

<br><br>
<div class="container">
	<div class="col-md-12">
	
	<h3 style="font-family: 'Open Sans', sans-serif;">상품등록이 완료되었습니다</h3>


	<hr style="border: none; border-top: 1px solid #000; margin-top: 10px;">

	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;">


		<tr>
			<td width="104" class="ct_write" >상품명 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" />
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"> ${product.prodName}</td>

					</tr>
		
		<tr>
			<td width="104" class="ct_write">가격 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" />
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">${product.prodPrice}&nbsp;원</td>
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
		<img src="/images/product/${product.prodImageFirst}"  style="width: 120px;" onerror="this.style.display='none'"/>
		<img src="/images/product/${product.prodImageSecond}"  style="width: 120px;" onerror="this.style.display='none'"/>
		<img src="/images/product/${product.prodImageThird}"style="width: 120px;" onerror="this.style.display='none'"/>
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



<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
<div class="text-center" style="margin-top: 10px;">
	<div class="col-md-12 d-flex justify-content-center">
		<a href="#" class="btn cyan rounded" id="addProduct">확인</a>
		<a href="#" class="btn yellow rounded" id="addProductPlus">추가등록</a>
	</div>
</div>
</table>

</body>
</html>
