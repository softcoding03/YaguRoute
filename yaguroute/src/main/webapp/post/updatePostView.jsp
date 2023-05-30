<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="eu">
<head>
    <meta charset="UTF-8">
   
   <!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
 
    <script type="text/javascript">
    $(document).ready(function() {
    		$('#summernote').summernote({
            placeholder: '내용을 작성해주세요.',
            tabsize: 2,
            height: 500
          });
    	});
    </script>
    
   
</head>
<body>

    <form method="post" action="/post/updatePost" method="POST">
    <input type="hidden" name="teamCode" value="${post.teamCode}"/>
    <input type="hidden" name="postNo" value="${post.postNo}"/>
    <input type="hidden" name="user.userId" value="${post.user.userId}"/>
   	    <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">작성자 닉네임</label>
		    <div>
		     	${post.user.userNickName}
		    </div>
	    </div>
	   <br>
	   <tr>
	    <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">작성자 프로필사진</label>
		    <div>
		      	<img src="/images/${post.user.userImage}" id="button" width="50">
		    </div>
	    </div>
   	    <select class="form-control" name="postType">
		  <option value="0">[잡담]</option>
		  <option value="1">[응원]</option>
		  <option value="2">[중고구매]</option>
		  <option value="3">[중고판매]</option>
		</select>
        
   		<table border=1 width=80%>
   			<tr>
   				<td>게시물 제목</td>
   					<td>
   					<input type="text" name="postTitle" style="width:100%;" value="${post.postTitle}" placeholder="제목을 입력해주세요.">
   					</td>
   			</tr>
   			<tr>
   				<td colspan="2">
   					<textarea id="summernote" name="postContents">
   						${post.postContents}
   					</textarea>
   				</td>
   			</tr>
   		</table>
   		<input type="submit" value="수정">
	</form>
    
</body>
</html>
