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

.disabled-button {
	opacity: 0.5; /* 비활성화 효과를 주기 위한 투명도 설정 */
	cursor: not-allowed; /* 마우스 커서 모양 변경 */
	pointer-events: none; /* 클릭 이벤트를 무시하도록 설정 */
}
</style>
  <script type="text/javascript">
    	$(function() {
	    	//유효성 검사
	    	var title=false;
	    	var contents=false;
	 			$('input[name="postTitle"]').keyup(function(){
	    			var value = $(this).val();
	    			var regex = /^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣\s]+$/;
	    			var specialChars = /[~`!@#$%^&*()-_=+|<>?]/g;
	    			
	    			if(value.length < 3){
	    				$("#postTitle").html("제목은 최소 3자 이상 입력해야합니다.");
						$("#postTitle").attr("color", "#dc3545");
						$('button:contains("수정하기")').prop('disabled', true); // 버튼 비활성화
						title = false;
	    			} else if (value.length > 20){
	    				$("#postTitle").html("제목은 최대 20자까지 입력 가능합니다.");
						$("#postTitle").attr("color", "#dc3545");
						$('button:contains("수정하기")').prop('disabled', true); // 버튼 비활성화
						title = false;
	    			} else {
	    				$("#postTitle").html("작성 가능합니다.");
						$("#postTitle").attr("color", "#4caf50");
						title = true;
	    			}
	    			if(title && contents){
	        			$('button:contains("수정하기")').prop('disabled', false); // 버튼 활성화	
	        		}
	    		});
	 			
	 			$('#summernote').on('summernote.change', function() {
	 				var text = $(this).summernote('code');
	    			console.log(text);
	    			var regex = /^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣\s]+$/;
	    			
	    			if(text.length < 10){
	    				$("#postContents").html("내용은 최소 10자 이상 입력해야합니다.");
						$("#postContents").attr("color", "#dc3545");
						$('button:contains("수정하기")').prop('disabled', true); // 버튼 비활성화
						contents=false;
	    			} else if (text.length > 5000){
	    				$("#postContents").html("내용은 최대 500자까지 입력 가능합니다.");
						$("#postContents").attr("color", "#dc3545");
						$('button:contains("수정하기")').prop('disabled', true); // 버튼 비활성화
						contents=false;
	    			} else {
	    				$("#postContents").html("작성 가능합니다.");
						$("#postContents").attr("color", "#4caf50");
						contents = true;
	    			}
	    			if(title && contents){
	        			$('button:contains("수정하기")').prop('disabled', false); // 버튼 활성화	
	        		}
	    		});
 			//유효성 검사 끝
 			
 			
    		$( "button.btn.btn-default").on("click" , function() {
    			event.preventDefault();
    			var post ={
    					teamCode: "${post.teamCode}",
    					postNo: "${post.postNo}",
    					//user.userId:"${post.user.userId}",
    					postType: $("select.form-control").val(),
    					postTitle: $("input[name='postTitle']").val(),
    					postContents: $("#summernote").val()
    			}
    			// Ajax를 사용하여 form을 비동기적으로 제출
  		      $.ajax({
	  		        type: 'POST',
	  		        url: '/post/rest/updatePost',
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
    		    ['height', ['height']],
    		    // 그림첨부, 링크만들기, 동영상첨부
    		    ['insert',['picture','link','video']],
    		    // 코드보기, 확대해서보기, 도움말
    		    ['view', ['codeview','fullscreen', 'help']]
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
		    <input type="hidden" name="teamCode" value="${post.teamCode}"/>
		    <input type="hidden" name="postNo" value="${post.postNo}"/>
		    <input type="hidden" name="user.userId" value="${post.user.userId}"/>
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">게시물 종류</label>
			    <div class="col-sm-10">
			    	<select class="form-control" name="postType">
					  <option value="0" ${post.postType eq 0 ? 'selected':''}>[잡담]</option>
					  <option value="1" ${post.postType eq 1 ? 'selected':''}>[응원]</option>
					  <option value="2" ${post.postType eq 2 ? 'selected':''}>[중고구매]</option>
					  <option value="3" ${post.postType eq 3 ? 'selected':''}>[중고판매]</option>
					  <c:if test="${user.role eq 'admin'}">
					  <option value="4" ${post.postType eq 4 ? 'selected':''}>[! 공지사항 !]</option>
					  </c:if>
					</select>
			    </div>
			  </div>		
			  <div class="form-group">
			    <label class="col-sm-2 control-label">게시물 제목</label>
			    <div class="col-sm-10">
			      <input type="text" name="postTitle" style="width:100%;" value="${post.postTitle}" placeholder="제목을 입력해주세요.">
			    	<font id="postTitle" size="2" color="blue">제목은 최소 3자 이상 최대 20자까지 허용됩니다.</font>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">게시물 내용</label>
			    <div class="col-sm-10">
			    	<textarea id="summernote" name="postContents">${post.postContents}</textarea>
			    	<font id="postContents" size="2" color="blue">내용은 최소 10자 이상 최대 500자까지 허용됩니다.</font>
			    </div>
			  </div>
			  <div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
			    	<a> 본 게시물은 본인 선호구단 게시판에 업로드됩니다.</a><br>
			   	 <a> 게시물 작성 규정에 어긋나는 글은 운영자가 언제든 삭제할 수 있습니다.</a>
			      <button type="submit" class="btn btn-default">수정하기</button>
			    </div>
			  </div>
		</form>	
		    
</body>
</html>
