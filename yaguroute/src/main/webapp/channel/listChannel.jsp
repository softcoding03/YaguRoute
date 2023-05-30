<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Insert title here</title>
		
			<!-- 참조 : http://getbootstrap.com/css/   참조 -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		
		<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
		
		
		<!-- Bootstrap Dropdown Hover CSS -->
	   <link href="/css/animate.min.css" rel="stylesheet">
	   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
	    <!-- Bootstrap Dropdown Hover JS -->
	   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	   
	   
	   <!-- jQuery UI toolTip 사용 CSS-->
	    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	    <!-- jQuery UI toolTip 사용 JS-->
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		
		<!--  ///////////////////////// CSS ////////////////////////// -->
		<style>
		  body {
	            padding-top : 50px;
	        }
		</style>
		
		<script type="text/javascript">
			$(function(){
				
				$("button:contains('중계보기')").on("click", function(){
					console.log("중계보기 클릭했다");
					var text = $(this).children("input[name='channelID']").val();
					console.log("조회 클릭 시 channelID : "+text);
					self.location="/channel/getChannel?channelID="+text;
				});
				
				$("button:contains('수정하기')").on("click", function(){
					console.log("수정하기");
					var text = $(this).children("input[name='channelID']").val();
					console.log("수정하기 클릭 시 ChanndlID : "+text);
					self.location="/channel/updateChannel?channelID="+text;
				})
				
				$("button:contains('삭제하기')").on("click", function(){
					console.log("삭제하기");
					var text = $(this).children("input[name='channelID']").val();
					console.log("삭제하기 클릭 시 ChanndlID : "+text);
					self.location="/channel/deleteChannel?channelID="+text;
				})
			});
		</script>
	    
	   
	</head>
		
	<body>
		<h1>Channel List</h1>
		
		<div class="container">
			<table class="table table-hover table-striped" >
		      
		        <thead>
		          <tr>
		            <th align="center">No</th>
		            <th align="left" >채널 ID</th>
		            <th align="left">채널 이름</th>
		            <th align="left">채널 CDN</th>
		          </tr>
		        </thead>
		       
				<tbody>
				  <c:set var="i" value="0" />
				  <c:forEach var="channel" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					<tr>
					  <td align="center" height="150px">${ i }</td>
					  <td align="left" height="150">${channel.channelID}</td>
					  <td align="left" height="150">${channel.channelName}</td>
					  <td align="left" height="150">${channel.channelCDN}</td>
					  <td align="left" height="150">
					  	<button type="button" class="btn btn-info">
					  		중계보기
					  		<input type="hidden" name="channelID" value="${channel.channelID}"/>	
					  	</button>
					  </td>
					  
					  <c:if test="${sessionScope.user.role eq 'admin' }">
						  <td align="left" height="150">
						  	<button type="button" class="btn btn-info">
						  		수정하기
						  		<input type="hidden" name="channelID" value="${channel.channelID}"/>	
						  	</button>
						  </td>
						  
						  <td align="left" height="150">
						  	<button type="button" class="btn btn-info">
						  		삭제하기
						  		<input type="hidden" name="channelID" value="${channel.channelID}"/>	
						  	</button>
						  </td>
						</tr>
					</c:if>
		          </c:forEach>
		        
		        </tbody>
		      
		      </table>
		</div>
	</body>
</html>