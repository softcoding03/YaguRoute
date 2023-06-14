<%@ page language="java" contentType="text/html; charset=UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html>
<head>
<title>게시물 작성</title>
    <meta charset="UTF-8">
    
   <!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

    
   <!-- include summernote css/js-->
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">

   
<style>
    .form-horizontal {
		  position: fixed;
		  top: 30%;
		  left: 30%;
		  transform: translate(-30%, -30%);
    }
 </style>
  <script type="text/javascript">
    	$(function() {
    		//유효성 검사
 			$('input[name="channelName"]').keyup(function(){
    			var value = $(this).val();
    			var regex = /^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣\s]+$/;
    			var specialChars = /[~`!@#$%^&*()-_=+|<>?]/g;
    			
    			if(value.length < 3){
    				$("#channelName").html("3문자 미만입니다.");
					$("#channelName").attr("color", "#dc3545");
					$('button:contains("수정")').prop('disabled', true); // 버튼 비활성화
    			} else if (value.length > 20){
    				$("#channelName").html("20문자 초과입니다.");
					$("#channelName").attr("color", "#dc3545");
					$('button:contains("수정")').prop('disabled', true); // 버튼 비활성화
    			} else if (!regex.test(value) || specialChars.test(value)){
    				$("#channelName").html("특수 문자는 불가합니다.");
					$("#channelName").attr("color", "#dc3545");
					$('button:contains("수정")').prop('disabled', true); // 버튼 비활성화
    			} else {
    				$("#channelName").html("성공");
					$("#channelName").attr("color", "#4caf50");
					$('button:contains("수정")').prop('disabled', false); // 버튼 활성화
    			}
    		});   		
    		
    		
    		
    		$( "button.btn.btn-default").on("click" , function() {
    			event.preventDefault();
    			var post ={
    					postType: $("select.form-control").val(),
    					postTitle: $("input[name='postTitle']").val(),
    					postContents: $("#summernote").val()
    			}
  		      $.ajax({
	  		        type: 'POST',
	  		        url: '/post/rest/addPost',
	  		        data: post,
	  		        success: function(response) {
	  		         if(response === "success"){
	  		        		window.close();
	  		        		opener.location.reload();
	  		         }
	  		        }
  		      });
    		}); 
    		
    		
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
    		    ['height', ['height']]
    		  ];
    		
  			var setting = {
              height : 400,
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
<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-L1DH7W8BRC"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-L1DH7W8BRC');
</script>
<body>
	
		<form class="form-horizontal" >
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">게시물 종류</label>
			    <div class="col-sm-10">
			    	<select class="form-control" name="postType">
					  <option value="0">[잡담]</option>
					  <option value="1">[응원]</option>
					  <option value="2">[중고구매]</option>
					  <option value="3">[중고판매]</option>
					  <c:if test="${user.role eq 'admin'}">
					  <option value="4">[! 공지사항 !]</option>
					  </c:if>
					</select>
			    </div>
			  </div>		
			  <div class="form-group">
			    <label class="col-sm-2 control-label">게시물 제목</label>
			    <div class="col-sm-10">
			    	<p>게시물 제목은 50자 이내로만 작성 가능합니다.</p>
			      <input type="text" class="form-control" name="postTitle" placeholder="게시물 제목을 입력해주세요.">
			    	<input type="text" 
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">게시물 내용</label>
			    <div class="col-sm-10">
			    	<textarea id="summernote" name="postContents"></textarea>
			    </div>
			  </div>
			  <div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
			   	 <a> 게시물 작성 규정에 어긋나는 글은 운영자가 언제든 삭제할 수 있습니다.</a>
			      <button type="submit" class="btn btn-default">작성하기</button>
			    </div>
			  </div>
		</form>	
		    
</body>
</html>
