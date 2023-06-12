<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>s
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
    <title>Soccer Player Positions</title>
    <style>
    	
        .soccer-field {
		    position: relative;
		    width: 1600px;
    		height: 900px;
		    background-image: url(/images/player/playGround.jpg);
		    background-size: cover;
		    margin: 0 auto;
		}
        .player {
            position: absolute;
            width: 60px;
            height: 60px;
            background-color: #f00;
            border-radius: 50%;
            text-align: center;
            line-height: 60px;
            color: #fff;
            font-weight: bold;
        }

        .player.goalkeeper {
            top: 45%;
            left: 5%;
        }

        .player.defender1 {
            top: 25%;
            left: 20%;
        }

        .player.defender2 {
            top: 65%;
            left: 20%;
        }

        .player.defender3 {
            top: 45%;
            left: 30%;
        }

        .player.defender4 {
            top: 25%;
            left: 40%;
        }

        .player.midfielder1 {
            top: 65%;
            left: 40%;
        }

        .player.midfielder2 {
            top: 45%;
            left: 50%;
        }

        .player.midfielder3 {
            top: 25%;
            left: 60%;
        }

        .player.midfielder4 {
            top: 65%;
            left: 60%;
        }

        .player.forward1 {
            top: 45%;
            left: 70%;
        }

        .player.forward2 {
            top: 25%;
            left: 80%;
        }
    </style>
</head>

<body>

    <div class="soccer-field">
        <div class="player goalkeeper">GK</div>
        <div class="player defender1">D</div>
        <div class="player defender2">D</div>
        <div class="player defender3">D</div>
        <div class="player defender4">D</div>
        <div class="player midfielder1">M</div>
        <div class="player midfielder2">M</div>
        <div class="player midfielder3">M</div>
        <div class="player midfielder4">M</div>
        <div class="player forward1">F</div>
        <div class="player forward2">F</div>
    </div>
</body>
</html>