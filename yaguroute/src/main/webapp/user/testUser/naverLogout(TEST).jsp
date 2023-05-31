<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js" integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>

<script>
  Kakao.init('492090239797ebad0d3181db65216b78'); // 사용하려는 앱의 JavaScript 키 입력
</script>
<meta charset="EUC-KR">
<title>Insert title here</title>

</head>
<body>


<button class="api-btn" onclick="unlinkApp()">앱 탈퇴하기</button>

<script>
  function unlinkApp() {
    Kakao.API.request({
      url: '/v1/user/unlink',
    })
      .then(function(res) {
        alert('success: ' + JSON.stringify(res));
        deleteCookie();
      })
      .catch(function(err) {
        alert('fail: ' + JSON.stringify(err));
      });
  }

  // 아래는 데모를 위한 UI 코드입니다.
  function deleteCookie() {
    document.cookie = 'authorize-access-token=5BlF5RIITwceaAse-RydqhQXmyee8-jExtATkJQpCj1zmwAAAYhSkpP1';
  }
</script>

</body>
</html>