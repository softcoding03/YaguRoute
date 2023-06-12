<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <style>
        canvas {
            border: 1px solid black;
        }
    </style>
</head>
<body>
    <canvas id="myCanvas" width="400" height="400"></canvas>

    <script>
    $(function(){
        // 이미지 로드
        var canvas = document.getElementById("myCanvas");
        var context = canvas.getContext("2d");
        var image = new Image();

        image.onload = function() {
            // 이미지 그리기
            context.drawImage(image, 0, 0);

            // 이미지 데이터 가져오기
            var imageData = context.getImageData(0, 0, canvas.width, canvas.height);
            var data = imageData.data;

            // 픽셀 반복하여 배경을 투명하게 변경
            for (var i = 0; i < data.length; i += 4) {
                var red = data[i];
                var green = data[i + 1];
                var blue = data[i + 2];

                // 배경이 흰색인 경우 투명으로 변경
                if (red === 255 && green === 255 && blue === 255) {
                    data[i + 3] = 0; // 알파 채널을 0으로 설정하여 투명하게 만듦
                }
            }

            // 변경된 이미지 데이터를 다시 캔버스에 그리기
            context.putImageData(imageData, 0, 0);
        };

        // 이미지 경로 설정
        image.src = "/images/user/53559.jpg";
    });
    </script>
</body>
</html>