<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="ko">

<head>

<link href="/css/left.css" rel="stylesheet" type="text/css">



</head>

<body>
	<button class="btn btn-primary"
		onclick="self.location='../product/addProductView.jsp'">상품 등록</button>
	<button class="btn btn-primary"
		onclick="self.location='../product/updateProductView.jsp'">상품 수정</button>






	<button class="btn btn-primary" onclick="self.location='/product/listProduct'">상품 목록 조회(관리자)</button>
	<button class="btn btn-primary" onclick="self.location='/product/salesProdList'">상품 목록 조회(전체)</button>	
		

	<button class="btn btn-primary" onclick="self.location='/transaction/listTransaction'">구매목록조회(사용자)</button>
	<button class="btn btn-primary" onclick="self.location='/transaction/dlvyTranList'">배송조회(관리자)</button>

</body>

</html>
