<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        .player-card {
            position: relative;
            width: 428px;
            height: 600px;
            background-image: url(/images/player/icon.png);
            background-position: center center, top left;
            background-repeat: no-repeat, no-repeat;
            background-size: 188px;
            opacity: 1.0;
            filter: blur(0.6px);
            filter: brightness(95%);
        }

        .player-image {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 128px;
            height: 112px;
        }

        .player-name {
            position: absolute;
            bottom: 10px;
            left: 50%;
            transform: translateX(-50%);
            text-align: center;
            font-size: 20px;
            color: #ffffff;
        }
    </style>
</head>
<body>
    <div class="player-card">
        <img class="player-image" src="https://lgcxydabfbch3774324.cdn.ntruss.com/KBO_IMAGE/person/middle/2023/79847.jpg" alt="Player Photo">
        <div class="player-name">John Doe</div>
    </div>
</body>
</html>