<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<title>상품등록</title>


<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<meta charset="UTF-8">
<script type="text/javascript">
	$(function() {
		$(".ct_btn01:contains('확인')").on('click', function() {
			self.location = "../product/listProduct.jsp";
		})

		$(".ct_btn01:contains('추가등록')").on('click', function() {
			self.location = "../product/addProductView.jsp";
		})

	})
</script>

</head>


<body bgcolor="#ffffff" text="#000000">

	<table width="100%" height="37" border="0" cellpadding="0"
		cellspacing="0">
		<tr>
			<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
				width="15" height="37" /></td>
			<td background="/images/ct_ttl_img02.gif" width="100%"
				style="padding-left: 10px;">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="93%" class="ct_ttl01">상품등록</td>
						<td width="20%" align="right">&nbsp;</td>
					</tr>
				</table>
			</td>
			<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
				width="12" height="37" /></td>
		</tr>
	</table>

	<table width="100%" border="0" cellspacing="0" cellpadding="0"
		style="margin-top: 13px;">
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>



		<tr>
			<td width="104" class="ct_write">상품명 <img
				src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" />
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="105">${product.prodName}</td>
						<td></td>
					</tr>
				</table>
			</td>
		</tr>



		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>

		<tr>
			<td width="104" class="ct_write">가격 <img
				src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" />
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">${product.prodPrice}&nbsp;원</td>
		</tr>



		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>

		<tr>
			<td width="104" class="ct_write">상품이미지</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<%
				String[] fileNames = (String[]) request.getAttribute("fileNames");
				%>
				<%
				for (String fileName : fileNames) {
				%> <img
				src="/images/product/<%=fileName%>" width="200" height="200" /> <%
 }
 %>
			</td>
		</tr>


		<!--  단일 상품 업로드 
	<tr>
		<td width="104" class="ct_write">상품이미지</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
		<img  src="/images/product/${product.prodImage}"/> </td>
	</tr> -->


		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>

		<tr>
			<td width="104" class="ct_write">상품재고<img
				src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" />
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">${product.prodStock}</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">상품 카테고리<img
				src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" />
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">${product.prodCategory}</td>
		</tr>
		<tr>
			<td width="104" class="ct_write">팀 구분<img
				src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" />
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">${product.prodTeamCode}</td>
		</tr>
		<tr>
   <td width="104" class="ct_write">상품 상태</td>
   <td bgcolor="D6D6D6" width="1"></td>
   <td class="ct_write01">판매중</td>
   <input type="hidden" name="prodTranCode" value="판매중" />
</tr>

	</table>
	</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	</table>

	<table width="100%" border="0" cellspacing="0" cellpadding="0"
		style="margin-top: 10px;">
		<tr>
			<td width="53%"></td>
			<td align="right">
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="17" height="23"><img src="/images/ct_btnbg01.gif" width="17" height="23" /></td>
						<td background="/images/ct_btnbg02.gif" class="ct_btn01"
							style="padding-top: 3px;">확인 <%-- <a href="/product/listProduct?menu=manage">확인</a> --%>
						</td>
						<td width="14" height="23"><img src="/images/ct_btnbg03.gif" width="14" height="23" /></td>
						<td width="17" height="23"><img src="/images/ct_btnbg01.gif" 	width="17" height="23" /></td>
						<td background="/images/ct_btnbg02.gif" class="ct_btn01" 	style="padding-top: 3px;">추가등록 <%-- <a href="../product/addProductView.jsp;">추가등록</a> --%>
						</td>
						<td width="14" height="23"><img src="/images/ct_btnbg03.gif" width="14" height="23" /></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

</body>
</html>
