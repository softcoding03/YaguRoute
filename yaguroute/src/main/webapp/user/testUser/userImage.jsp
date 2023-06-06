<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://rawgit.com/enyo/dropzone/master/dist/dropzone.js"></script>    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css">
<title>Insert title here</title>

<script type="text/javascript">

//fileDropzone dropzone 설정할 태그의 id로 지정
Dropzone.options.fileDropzone = {
    url: '/users/addUserImage', //업로드할 url (ex)컨트롤러)
    init: function () {
        /* 최초 dropzone 설정시 init을 통해 호출 */
        var submitButton = document.querySelector("#btn-upload-file");
        var myDropzone = this; //closure
        alert("ㅎㅇ");
        submitButton.addEventListener("click", function () {
            alert("업로드");
            myDropzone.processQueue();
        });
    },
    autoProcessQueue: true, // 자동업로드 여부 (true일 경우, 바로 업로드 되어지며, false일 경우, 서버에는 올라가지 않은 상태임 processQueue() 호출시 올라간다.)
    clickable: true, // 클릭가능여부
    thumbnailHeight: 40, // Upload icon size
    thumbnailWidth: 30, // Upload icon size
    maxFiles: 1, // 업로드 파일수
    maxFilesize: 1, // 최대업로드용량 : 1MB
    parallelUploads: 1, // 동시파일업로드 수(이걸 지정한 수 만큼 여러파일을 한번에 컨트롤러에 넘긴다.)
    addRemoveLinks: true, // 삭제버튼 표시 여부
    dictRemoveFile: '삭제', // 삭제버튼 표시 텍스트
    uploadMultiple: false, // 다중업로드 기능
	};
	
</script>

</head>
<body>
<div name="fname">
     								<div class="dropzone" id="fileDropzone"></div> 
     								<!-- <button id="btn-upload-file">서버전송</button> -->
 								</div>
 								<button id="btn-upload-file">서버전송</button>
 </form>
</body>
</html>