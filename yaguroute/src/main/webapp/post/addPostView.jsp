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

    <script type="text/javascript">
    	$(document).ready(function() {
    		var toolbar = [
    		    // 글꼴 설정
    		    ['fontname', ['fontname']],
    		    // 글자 크기 설정
    		    ['fontsize', ['fontsize']],
    		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
    		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
    		    // 글자색
    		    ['color', ['forecolor','color']],
    		    // 표만들기
    		    ['table', ['table']],
    		    // 글머리 기호, 번호매기기, 문단정렬
    		    ['para', ['ul', 'ol', 'paragraph']],
    		    // 줄간격
    		    ['height', ['height']],
    		    // 그림첨부, 링크만들기, 동영상첨부
    		    ['insert',['picture','link','video']],
    		    // 코드보기, 확대해서보기, 도움말
    		    ['view', ['codeview','fullscreen', 'help']]
    		  ];
    		
  			var setting = {
              height : 300,
              minHeight : null,
              maxHeight : null,
              focus : true,
              lang : 'ko-KR',
              toolbar : toolbar,
              //콜백 함수
              callbacks : { 
              	onImageUpload : function(files, editor, welEditable) {
              // 파일 업로드(다중업로드를 위해 반복문 사용)
              for (var i = files.length - 1; i >= 0; i--) {
              uploadSummernoteImageFile(files[i],this);
              		}
              	}
              }
           };
    	
           $('#summernote').summernote(setting);
    	});
          
    	function uploadSummernoteImageFile(file, el) {
  			data = new FormData();
  			data.append("file", file);
  			$.ajax({
  				data : data,
  				type : "POST",
  				url : "/post/rest/uploadSummernoteImageFile",
  				contentType : false,
  				enctype : 'multipart/form-data',
  				processData : false,
  				success : function(data) {
  					$(el).summernote('editor.insertImage', data.url);
  				}
  			});
		}
    </script>
    
   
</head>
<body>

  <form method="post" action="/post/addPost" method="POST">
    <input type="hidden" name="teamCode" value="${teamCode}"/>
    <input type="hidden" name="user.userId" value="${user.userId}"/>
   	<select class="form-control" name="postType">
		  <option value="0">[잡담]</option>
		  <option value="1">[응원]</option>
		  <option value="2">[중고구매]</option>
		  <option value="3">[중고판매]</option>
		  <c:if test="${user.role eq 'admin'}">
		  	<option value="4">[! 공지사항 !]</option>
		  </c:if>
		</select>
        
   		<table border=1 width=80%>
   			<tr>
   				<td>게시물 제목</td>
   					<td><input type="text" name="postTitle" style="width:100%;" placeholder="제목을 입력해주세요."></td>
   			</tr>
   			<tr>
   				<td colspan="2">
   					<textarea id="summernote" name="postContents"></textarea>
   				</td>
   			</tr>
   		</table>
   		<input type="submit" value="전송">
	</form>
    
</body>
</html>
