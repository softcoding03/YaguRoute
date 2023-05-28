<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="eu">
<head>
    <meta charset="UTF-8">
   
   <!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
   
	
</head>
<body>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>작성자 닉네임</strong></div>
			<div class="col-xs-8 col-md-4">${post.user.userNickName}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>작성자 프로필 사진</strong></div>
			<div class="col-xs-8 col-md-4">${post.user.userImage}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>작성일</strong></div>
			<div class="col-xs-8 col-md-4">${post.postDate}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>글번호</strong></div>
			<div class="col-xs-8 col-md-4">${post.postNo}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>게시물 제목</strong></div>
			<div class="col-xs-8 col-md-4">
				<c:choose>
					<c:when test="${post.postType == '0'}">[잡담]</c:when>
					<c:when test="${post.postType == '1'}">[응원]</c:when>
					<c:when test="${post.postType == '2'}">[중고구매]</c:when>
					<c:when test="${post.postType == '3'}">[중고판매]</c:when>
				</c:choose>
				${post.postTitle}
			</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>조회수</strong></div>
			<div class="col-xs-8 col-md-4">${post.postViews}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>게시물 내용</strong></div>
			<div class="col-xs-8 col-md-4">${post.postContents}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>좋아요</strong></div>
			<div class="col-xs-8 col-md-4">${post.postLikes}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>싫어요</strong></div>
			<div class="col-xs-8 col-md-4">${post.postDislikes}</div>
		</div>
</body>
</html>
