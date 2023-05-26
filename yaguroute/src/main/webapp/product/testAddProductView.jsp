<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<title>상품등록</title>

<meta charset="UTF-8">

  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
 
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">



$(function(){
	function fncAddProduct(){

	
	//Form 유효성 검증
	
	    var name = $("input[name='prodName']").val();
	    var price = $("input[name='prodPrice']").val();
	    var stock = $("input[name='prodStock']").val();
	    var category = $("input[name='prodCategory']").val();
	    var teamcode = $("input[name='prodTeamCode']").val();
	    
	    if(name == null || name.length<1){
	      alert("상품명은 반드시 입력하여야 합니다.");
	      return;
	    }
	    if(price == null || price.length<1){
	      alert("가격은 반드시 입력하셔야 합니다.");
	      return;
	    }
	    if(stock == null || stock.length<1){
	      alert("재고는 반드시 입력하셔야 합니다.");
	      return;
	    }
	    if(category == null || category.length<1){
	      alert("상품카테고리는 반드시 입력하셔야 합니다.");
	      return;
	    }  
	    if(teamcode == null || teamcode.length<1){
		      alert("팀 코드는 반드시 입력하셔야 합니다.");
		      return;
		    } 
	    // 폼 제출
	    $("form").attr("enctype","multipart/form-data").attr("method","POST").attr("action","/product/addProduct").submit();
	}
	
	  $(".ct_btn01:contains('등록')").on('click', function(){
		    fncAddProduct();
		  });
		});

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<form name="detailForm" >

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">상품등록</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif"	width="12" height="37"/>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			상품명 <imgsrc="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle">
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">
						<input type="text" name="prodName" class="ct_input_g" 
									style="width: 100px; height: 19px" maxLength="20">
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			가 격 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="prodPrice" class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="10" minLength="6"/>&nbsp;원
		</td>
	</tr>
	
	
		<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">상품 이미지</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input	type="file" name="files" class="ct_input_g" multiple="multiple"
							style="width: 200px; height: 25px" maxLength="13"/>
		</td>
	</tr>
	
		
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			상품 재고 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
				
			<input type="text"  name="prodStock" class="ct_input_g"
				style="width: 100px; height: 19px" maxLength="10" minLength="6"/>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			상품 카테고리 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="prodCategory" class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="10">
		</td>
	</tr>
		<tr>
		<td width="104" class="ct_write">
			팀 구분 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="prodTeamCode" class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="10">
		</td>
	</tr>

	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">
		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01"  style="padding-top: 3px;">
				등록
				</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
				</td>
				<td width="30"></td>
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01"	 style="padding-top: 3px;">
					<a href="javascript:resetData();">취소</a>
				</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

</form>
</body>
</html>