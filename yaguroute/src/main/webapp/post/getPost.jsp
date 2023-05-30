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

var postNo;
$(document).ready(function() {
	postNo = $('#postNo').val();
	teamCode = $('#teamCode').val();
});
	
	$(function(){
		//addLike or addDislike 시작
	 	$(".thumbs-btn").on("click" , function() {
	 		var type = $(this).closest('.row').find("input[name='type']").val().trim();
	 		var isLiked = false;
	 		var isDisliked = false;
	 		var likes = parseInt($('#likes').text().trim());
	 		var disLikes = parseInt($('#disLikes').text().trim());
	 		console.log("check용"+likes,disLikes);
	 		
	 		if($(this).hasClass("liked")){
	 			isLiked = true;
	 		} else if ($(this).hasClass("disliked")){
	 			isDisliked = true;
	 		}
			
	 		$.ajax({
	 			url:"/post/rest/addLike/"+postNo+"/"+type,
				method : "GET",
				dataType : "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData, status) {
					console.log(JSONData.likes);
					console.log(JSONData.disLikes);
		            if (isLiked) {
		            	$('#likes').html(JSONData.likes);
		            	$('#disLikes').html(JSONData.disLikes);
		            	if(likes < JSONData.likes){
		            		$('.check1').html("<span class=\"glyphicon glyphicon-heart\""
		            							+"aria-hidden=\"true\" style=\"color: red; font-size: 40px;\"/>");
		            		$('.check2').html("<span class=\"glyphicon glyphicon-thumbs-down\""
		            							+"aria-hidden=\"true\"></span>");
		            	} else {
		            		$('.check1').html("<span class=\"glyphicon glyphicon-thumbs-up\""
		            							+"aria-hidden=\"true\"></span>");
		            	}
		            } else if (isDisliked) {
		            	$('#likes').html(JSONData.likes);
		            	$('#disLikes').html(JSONData.disLikes);
		                if(disLikes < JSONData.disLikes){
		                	$('.check2').html("<span class=\"glyphicon glyphicon-heart\"" 
		                						+"aria-hidden=\"true\" style=\"color: red; font-size: 40px;\"/>");
		            		$('.check1').html("<span class=\"glyphicon glyphicon-thumbs-up\""
		            							+"aria-hidden=\"true\"></span>");
		                } else {
		                	$('.check2').html("<span class=\"glyphicon glyphicon-thumbs-down\""
		                						+"aria-hidden=\"true\"></span>");
		            	}
		            }
				}
	 		});
	 	});
		//addLike or addDislike 끝
		
	 	//수정 및 삭제
	 	$('.updatePost').on("click" , function() {
			self.location = "/post/updatePost?postNo="+postNo;
		});
	 	$('.deletePost').on("click" , function() {
	 		var confirmation = confirm("정말로 삭제하시겠습니까?");
	 		if(confirmation){
				self.location = "/post/deletePost?postNo="+postNo;
	 		}
		});
	 	//목록보기
	 	$('.getPostList').on("click" , function() {
			self.location = "/post/getPostList?teamCode="+teamCode;
		});
	});
</script>
	
</head>

<body>
<input type="hidden" id="teamCode" value="${post.teamCode}"/>
<input type="hidden" id="postNo" value="${post.postNo}"/>
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
			<div class="col-xs-8 col-md-4 postNo">${post.postNo}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>글종류</strong></div>
			<div class="col-xs-8 col-md-4 postNo">
				<c:choose>
					<c:when test="${post.postType == '0'}">[잡담]</c:when>
					<c:when test="${post.postType == '1'}">[응원]</c:when>
					<c:when test="${post.postType == '2'}">[중고구매]</c:when>
					<c:when test="${post.postType == '3'}">[중고판매]</c:when>
					<c:when test="${post.postType == '4'}">[공지사항]</c:when>
				</c:choose>
			</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>게시물 제목</strong></div>
			<div class="col-xs-8 col-md-4">${post.postTitle}</div>
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
	  		<input type="hidden" name="type" value="Like"/>
	  		<div class="col-xs-4 col-md-2"><strong>좋아요</strong></div>
	  		<button type="button" class="btn btn-default btn-lg thumbs-btn liked">
		  		<div class="col-xs-4 col-md-1 check1">
						<c:choose>
					        <c:when test="${emote.like == 1}">
					            <span class="glyphicon glyphicon-heart" aria-hidden="true" style="color: red; font-size: 40px;"></span>
					        </c:when>
					        <c:otherwise>
					            <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
					        </c:otherwise>
					    </c:choose>
				</div>
			</button>
			<div class="col-xs-8 col-md-4" id="likes">${post.postLikes}</div>
		</div>
		<hr/>
		<div class="row">
	  		<input type="hidden" name="type" value="DisLike"/>
	  		<div class="col-xs-4 col-md-2"><strong>싫어요</strong></div>
	  		<button type="button" class="btn btn-default btn-lg thumbs-btn disliked">
			  	<div class="col-xs-4 col-md-1 check2">
						<c:choose>
					        <c:when test="${emote.disLike == 1}">
					            <span class="glyphicon glyphicon-heart" aria-hidden="true" style="color: red; font-size: 40px;"></span>
					        </c:when>
					        <c:otherwise>
					            <span class="glyphicon glyphicon-thumbs-down" aria-hidden="true"></span>
					        </c:otherwise>
					    </c:choose>
				</div>
			</button>
			<div class="col-xs-8 col-md-4" id="disLikes">${post.postDislikes}</div>
		</div>
		<hr>
		<div>
			<c:if test="${post.user.userId eq user.userId}">
				<button type="button" class="updatePost">게시물 수정</button><br>
				<button type="button" class="deletePost">게시물 삭제</button>
			</c:if>
			<button type="button" class="getPostList">목록보기</button>
		</div>
</body>
</html>
