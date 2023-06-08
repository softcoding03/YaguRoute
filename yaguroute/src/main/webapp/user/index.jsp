<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ///////////////////////////// 로그인시 Forward  /////////////////////////////////////// -->
<c:if test="${ ! empty user }">
 	<c:redirect url="/main.jsp"/>
 </c:if>
<c:if test="${ empty user }">
<script type="text/javascript">
	$(function(){
			alert("다시 로그인해주세요.");
			console.log("다시로그인혀라..");
			window.location.href = '/user/loginTest(new).jsp';
		});
	</script>
	<c:redirect url="/user/loginTest(new).jsp"/>
</c:if>
 <!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
			alert("다시 로그인해주세요.");
			console.log("다시로그인혀라..");
			window.location.href = '/user/loginTest(new).jsp';
		});
	</script>
</head>

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
		
        <div class="container">
   		---리다이렉트 창---
   		<br>
   		<br>
   		이 창이 보이면 세션이 종료된 겁니다.
   		
   		</div>
   	</div>
</body>

</html>
