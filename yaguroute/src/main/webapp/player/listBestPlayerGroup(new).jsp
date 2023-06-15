<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<!-- saved from url=(0027)https://www.netflix.com/kr/ -->
<html lang="ko" class=" ">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Player Of The Week</title>
    <link type="text/css" rel="stylesheet" href="./netflix_files/WebsiteDetect" data-uia="botLink">
    <script type="text/javascript">function OptanonWrapper() { };</script>
    <link type="text/css" rel="stylesheet" href="./netflix_files/error-page.b122c37502204303115a.css" data-uia="botLink">
    <link type="text/css" rel="stylesheet" href="/css/player/bestplayerList.css">
    <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
    <link type="text/css" rel="stylesheet" data-uia="botLink">
    <link type="text/css" rel="stylesheet" href="./netflix_files/nmhp-45996.5cc65a59edf8f0b00d2f.css">
    <link type="text/css" rel="stylesheet" href="./netflix_files/nmhp-reskin.309575c64003a24f4045.css"
        data-uia="botLink">
        <link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
    <link type="text/css" rel="stylesheet" href="./netflix_files/koreanLineBreak.79eaf7e509ee07919e31.css"
        data-uia="botLink">
        
    <link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
    <script>window.netflix = window.netflix || {}; netflix.notification = window.netflix.notification = window.netflix.notification || {}; window.netflix.notification.specification = netflix.notification.specification || {};;</script>
    <script>window.netflix = window.netflix || {}; netflix.notification.constants = { "pageName": "nmLanding", "locale": "ko-KR", "sessionLength": 30, "uiMode": "nonmember", "ownerToken": null, "accept-language": "ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7" };</script>
    <script>window.netflix = window.netflix || {}; netflix.notification.specification.uiView = { "impression": { "send": "both", "overlapping": true }, "command": { "send": "both" }, "search": { "send": "both" }, "uma": { "send": "both" }, "focus": { "send": "both" }, "scdWizardStep": { "send": "both" }, "navigationLevel": { "send": "both" }, "presentation": { "send": "both" }, "onrampSimilarsGroup": { "send": "both" } };</script>
    <script>window.netflix = window.netflix || {}; netflix.notification.specification.uiAction = { "manageSubscriptions": { "send": "end" }, "removeActivityHistory": { "send": "end" }, "promoShareFacebook": { "send": "end" }, "promoShareTwitter": { "send": "end" }, "rateTitle": { "send": "end" }, "addToPlaylist": { "send": "both" }, "selectProfile": { "send": "end" }, "addProfile": { "send": "end" }, "trailerPlay": { "send": "both" }, "startTrailerPlay": { "send": "both" }, "onRamp": { "send": "both" }, "submitUnsupportedCountryEmail": { "send": "both" }, "iTunesPriceFetching": { "send": "both" }, "iTunesPurchase": { "send": "both" }, "iTunesRestore": { "send": "both" }, "iTunesSubmitReceipt": { "send": "both" }, "iTunesSubmitRestoredReceipt": { "send": "both" }, "iTunesSignUpFallback": { "send": "both" }, "iTunesTracerPurchaseBegin": { "send": "both" }, "iTunesTracerPurchasePostBridge": { "send": "both" }, "iTunesTracerPurchaseHandleReceipt": { "send": "both" }, "iTunesTracerPurchaseHasReceipt": { "send": "both" }, "iTunesTracerPurchasePreFailure": { "send": "both" }, "iTunesTracerPurchaseFailure": { "send": "both" }, "iTunesTracerPurchaseCancel": { "send": "both" }, "iTunesTracerPurchasePreFailureDevice": { "send": "both" }, "iTunesTracerPurchaseFailureDevice": { "send": "both" }, "iTunesTracerPurchaseMissingReceipt": { "send": "both" }, "iTunesTracerPurchasePreSendReceipt": { "send": "both" }, "iTunesTracerPurchaseSendReceipt": { "send": "both" }, "iTunesTracerPurchaseMoneyballError": { "send": "both" }, "iTunesTracerPurchaseSendReceiptEnd": { "send": "both" }, "playStorePriceFetching": { "send": "both" }, "playStorePurchase": { "send": "both" }, "playStoreRestore": { "send": "both" }, "playStoreSubmitReceipt": { "send": "both" }, "playStoreSubmitRestoredReceipt": { "send": "both" }, "playStoreFlowFallback": { "send": "both" }, "playStoreSignUpFallback": { "send": "both" }, "playStoreAndroidSignUp": { "send": "both" }, "playStoreAndroidRetrySignUp": { "send": "both" }, "playStoreTracerPurchaseBegin": { "send": "both" }, "playStoreTracerPurchasePostBridge": { "send": "both" }, "playStoreTracerPurchaseHandleReceipt": { "send": "both" }, "playStoreTracerPurchaseHasReceipt": { "send": "both" }, "playStoreTracerPurchasePreFailure": { "send": "both" }, "playStoreTracerPurchaseFailure": { "send": "both" }, "playStoreTracerPurchaseCancel": { "send": "both" }, "playStoreTracerPurchasePreFailureDevice": { "send": "both" }, "playStoreTracerPurchaseFailureDevice": { "send": "both" }, "playStoreTracerPurchaseMissingReceipt": { "send": "both" }, "playStoreTracerPurchasePreSendReceipt": { "send": "both" }, "playStoreTracerPurchaseSendReceipt": { "send": "both" }, "playStoreTracerPurchaseMoneyballError": { "send": "both" }, "playStoreTracerPurchaseSendReceiptEnd": { "send": "both" }, "simplicitySubmit": { "send": "both" }, "simplicityFlowEndpointTiming": { "send": "both" }, "editPaymentSubmit": { "send": "both" }, "processAsDebitChecked": { "send": "both" }, "processAsDebitSubmit": { "send": "both" }, "processAsDebitUrl": { "send": "both" }, "processAsDebitRendered": { "send": "both" }, "navigate": { "send": "both" }, "submitOnrampResults": { "send": "both" } };</script>
    <script>window.netflix = window.netflix || {}; netflix.notification.specification.search = { "focus": { "send": "both" } };</script>
    <script>window.netflix = window.netflix || {}; netflix.notification.specification.uiQOE = { "appSession": { "send": "both" }, "userSession": { "send": "both" }, "uiStartup": { "send": "end" }, "uiBrowseStartup": { "send": "end" }, "uiModalViewChanged": { "eventProperties": { "value": "modalView" }, "send": "start" }, "uiModelessView": { "send": "both", "overlapping": "true" }, "partnerSession": { "send": "both", "overlapping": false } };</script>
    <script>window.netflix = window.netflix || {}; netflix.notification.specification.www = { "playbackPerformance": { "send": "both" }, "playbackFeatureDetection": { "send": "end" }, "playbackError": { "send": "end" }, "windowOnError": { "send": "end" } };</script>
    <script>window.netflix = window.netflix || {}; netflix.notification.specification.login = { "poll": { "send": "both" }, "autofill": { "send": "both" } };</script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <style>
    	
    	 td {
    	background-color: #000000; /* 원하는 배경색으로 변경 */
  	}
    	
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
            /* background-color: #; */
            border-radius: 50%;
            text-align: center;
            line-height: 60px;
            color: #fff;
            font-weight: bold;
        }
		
		        .player.defender1 {
		    top: -10%;
		    left: 11%;
		}
		
		        .player.defender2 {
		    top: 16.2%;
		    left: 36.6%;
		}
		
		        .player.defender3 {
		    top: 18%;
		    left: 14%;
		}
		
		        .player.defender4 {
		    top: 4%;
		    left: 47%;
		}
		
		        .player.midfielder1 {
		    top: 4%;
		    right: 70.1%;
		}
		
		        .player.midfielder2 {
		    left: 36.5%;
		    top: -18%;
		}
		
		        .player.midfielder3 {
		    top: -9.8%;
		    left: 64%;
		}
		
		        .player.forward1 {
		    top: 18%;
		    left: 59%;
		}
		
		
		        .player.forward2 {
		    top: 44.3%;
		    left: 36.5%;
		}
		.player-card {
		    width: 428px;
		    height: 600px;
		    background-image: url(/images/player/icon.png);
		    background-position: center center, top left;
		    background-repeat: no-repeat, no-repeat;
		    position: absolute;
		    background-size: 188px;
		    opacity: 1.0;
		    filter: blur(0.6px);
		    filter: brightness(85%);
		}

        .player-image {
		    position: absolute;
		    top: 46.19%;
		    left: 50%;
		    transform: translate(-50%, -50%);
		    width: 128px;
		    /* border-radius: 50%; */
		    height: 112px;
		}
		.player-name {
		    position: absolute;
		    bottom: 10px;
		    left: 50%;
		    transform: translateX(-50%);
		    text-align: center;
		    font-size: 18px;
		    color: #1a2a7f;
		    top: 58%;
		}
    </style>
    
    <style>
    .default-ltr-cache-g899g1 {
    	height: 700px;
    	background-image: linear-gradient(103.24deg, rgba(0, 8, 29, 0.9) 23.83%, rgba(0, 8, 29, 0.3) 96.1%), url(/images/player/KBOLEGEND.jpg);
    	width: 1900px;
	}
	/* 가운데 정렬된 div의 스타일 */
    .centered-div {
      background-color: #f2f2f2;
      padding: 20px;
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh; /* 화면 높이에 맞춤 */
    }
    </style>
    <script type="text/javascript">
    	$(function(){
    		var list = "${list}";
    	});
    </script>
    
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
        image.src = "${list[0].playerImage }";
    });
    </script>
</head>
<jsp:include page="/common/topBar.jsp"></jsp:include>
<body>
    <div id="appMountPoint">
        <div class="basicLayout">
            <div class="netflix-sans-font-loaded">
                <div data-uia="loc" lang="ko" dir="ltr">
                    <div class="our-story-desktop-framework"
                        style="width:100%;background:transparent;position:relative">
                        <div>
                            <div class="our-story-container our-story-container--use-extended-diacritics" dir="ltr"
                                style="width:100%;background:transparent">
                                <div class="default-ltr-cache-1y8lke9 e1ch15fu0">
                                    <div class="default-ltr-cache-1e3sida e1w825jf0">
                                        <div class="default-ltr-cache-1aubja5 eslj5pt1">
                                            <div data-id="container" class="default-ltr-cache-kfi2fd eslj5pt0">
                                                <div data-id="layoutItem" class="default-ltr-cache-1w6qzx6 ew2l6qe0">
                                                    <div class="default-ltr-cache-1d3w5wq e1uka1tf1">
                                                        <div class="default-ltr-cache-1aubja5 eslj5pt1">
                                                            <div data-id="container"
                                                                class="default-ltr-cache-g899g1 eslj5pt0">
                                                                <div data-id="layoutItem"
                                                                    class="default-ltr-cache-1wu85v3 ew2l6qe0">
                                                                    <div data-id="layoutItem"
                                                                        class="default-ltr-cache-7rcuhd ew2l6qe0">
                                                                        <div
                                                                            class="default-ltr-cache-1d3w5wq e1uka1tf1">
                                                                            <div
                                                                                class="default-ltr-cache-1aubja5 eslj5pt1">
                                                                                <div data-id="container"
                                                                                    class="default-ltr-cache-b0dpst eslj5pt0">
                                                                                    <div data-id="layoutItem"
                                                                                        class="default-ltr-cache-7rcuhd ew2l6qe0">
                                                                                        <div
                                                                                            class="default-ltr-cache-2k4z6y e1uka1tf0">
                                                                                            <div
                                                                                                class=" default-ltr-cache-1sqmrp6 e1uka1tf1">
                                                                                                <div
                                                                                                    class="default-ltr-cache-1aubja5 eslj5pt1">
                                                                                                    <header
                                                                                                        data-id="container"
                                                                                                        data-uia="nmhp-card-header+container"
                                                                                                        class="default-ltr-cache-10pakhj eslj5pt0">
                                                                                                        <div data-id="layoutItem"
                                                                                                            class="default-ltr-cache-pk87ox ew2l6qe0">
                                                                                                            <span
                                                                                                                class="default-ltr-cache-0 eaitdun0"
                                                                                                                data-uia="nmhp-card-header+logo"><svg
                                                                                                                    viewBox="0 0 111 30"
                                                                                                                    version="1.1"
                                                                                                                    xmlns="http://www.w3.org/2000/svg"
                                                                                                                    xmlns:xlink="http://www.w3.org/1999/xlink"
                                                                                                                    aria-hidden="true"
                                                                                                                    role="img"
                                                                                                                    class="default-ltr-cache-mv4tc2 eaitdun1">
                                                                                                                    <g>
                                                                                                                    <!-- <image> -->
                                                                                                                    </g>
                                                                                                                </svg><span
                                                                                                                    class="default-ltr-cache-1qwdmuy">넷플릭스</span></span>
                                                                                                        </div>                                                                                                 </header>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div data-id="layoutItem"
                                                                    class="default-ltr-cache-1wosl0z ew2l6qe0">
                                                                    <div class="default-ltr-cache-ktjgi6 e1uka1tf0">
                                                                        <div class="default-ltr-cache-1aubja5 eslj5pt1">
                                                                            <div data-id="container"
                                                                                class="default-ltr-cache-zxanvu eslj5pt0">
                                                                                <div data-id="layoutItem"
                                                                                    class="default-ltr-cache-1wpqai4 ew2l6qe0">
                                                                                    <h1
                                                                                        class=" default-ltr-cache-5xz0yv euy28770">
                                                                                        ${bestplayer.bestDate}</h1>
                                                                                </div>
                                                                                <div data-id="layoutItem"
                                                                                    class="default-ltr-cache-1wpqai4 ew2l6qe0">
                                                                                    <p class=" default-ltr-cache-14ej0as euy28770" style="font-size: 55px; margin-bottom: 25px;">
                                                                                        KBO BEST 9</p>
                                                                                </div>
                                                                                <div data-id="layoutItem"
                                                                                    class="default-ltr-cache-1wpqai4 ew2l6qe0">
                                                                                    <p
                                                                                        class=" default-ltr-cache-14ej0as euy28770">
                                                                                        이번 주 최고의 활약을 펼친 선수를 확인하세요.</p>
                                                                                </div>
                                                                                <div data-id="layoutItem"
                                                                                    class="default-ltr-cache-xvcm50 ew2l6qe0">
                                                                                    <div
                                                                                        class="default-ltr-cache-kuuci8 eyn22su0">
                                                                                        <div
                                                                                            class="default-ltr-cache-p7x7yf ep680992">
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div data-id="layoutItem"
                                                                    class="default-ltr-cache-yvyeub ew2l6qe0">
                                                                    <div></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div data-id="layoutItem" class="default-ltr-cache-d8ux31 ew2l6qe0">
                                                    <div>
                                                        <div class="default-ltr-cache-1aubja5 eslj5pt1">
                                                            <div data-id="container"
                                                                class="default-ltr-cache-1aoxmxf eslj5pt0">
                                                                <div data-id="layoutItem"
                                                                    class="default-ltr-cache-sbdl01 ew2l6qe0">
                                                                    <div class="default-ltr-cache-1d3w5wq e1uka1tf1">
                                                                        <div class="default-ltr-cache-1aubja5 eslj5pt1">
                                                                            <div data-id="container"
                                                                                class="reskin-value-props-container default-ltr-cache-19iqike eslj5pt0"
                                                                                style="display: grid;">
                                                                                <div data-id="layoutItem"
                                                                                    class="reskin-value-props-container Furious default-ltr-cache-1bduhq9 ew2l6qe0">
                                                                                    
                                                                                    <a class=""></a>                                                                                    

                                                                                    <div
                                                                                        class="default-ltr-cache-1d3w5wq e1uka1tf1">
                                                                                        <div
                                                                                            class="default-ltr-cache-1aubja5 eslj5pt1">
                                                                                            <div data-id="container" class="default-ltr-cache-xf9jx8 eslj5pt0">
                                                                                                <span class="BestPlayerdate" style="font-size: 30px; font-family: 'Gwangyang'; color: white;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${bestDate} THE BEST.</span>
                                                                                                <div data-id="layoutItem"
                                                                                                    class="default-ltr-cache-1t4jy5t ew2l6qe0">
                                                                                                    <div
                                                                                                        class="default-ltr-cache-1aubja5 eslj5pt1">
                                                                                                        <div data-id="container"
                                                                                                            class="default-ltr-cache-1lp83tr eslj5pt0">
                                                                                                            <div data-id="layoutItem"
                                                                                                                class="default-ltr-cache-1pgwnji ew2l6qe0">
                                                                                                                <p color="OnSurfaceTextColorStandard"
                                                                                                                    class=" default-ltr-cache-11wpyi6 euy28770">
<!--                                                                                                                     TV로
                                                                                                                    즐기세요 -->
                                                                                                                </p>
                                                                                                            </div>
                                                                                                            <div data-id="layoutItem"
                                                                                                                class="default-ltr-cache-1pgwnji ew2l6qe0">
                                                                                                                <p color="OnSurfaceTextColorStandard"
                                                                                                                    class=" default-ltr-cache-1c7d321 euy28770">
<!--                                                                                                                     스마트
                                                                                                                    TV,
                                                                                                                    PlayStation,
                                                                                                                    Xbox,
                                                                                                                    Chromecast,
                                                                                                                    Apple
                                                                                                                    TV,
                                                                                                                    블루레이
                                                                                                                    플레이어
                                                                                                                    등
                                                                                                                    다양한
                                                                                                                    디바이스에서
                                                                                                                    시청하세요. -->
                                                                                                                </p>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div data-id="layoutItem"
                                                                                    class="reskin-value-props-container Furious default-ltr-cache-1bduhq9 ew2l6qe0">
                                                                                    <div
                                                                                        class="default-ltr-cache-1d3w5wq e1uka1tf1">
                                                                                        <div
                                                                                            class="default-ltr-cache-1aubja5 eslj5pt1">
                                                                                            <div data-id="container"
                                                                                                class="default-ltr-cache-xf9jx8 eslj5pt0">
                                                                                                <div data-id="layoutItem"
                                                                                                    class="default-ltr-cache-1kv2dw4 ew2l6qe0">
                                                                                                    <div width="100%"
                                                                                                        class="default-ltr-cache-1w0kbai e18pqjcv1">
                                                                                                        <!-- <img width="100%"
                                                                                                            src="./netflix_files/en(1).png"
                                                                                                            alt="다양한 디바이스에서 시청하세요"
                                                                                                            class="default-ltr-cache-92t2lk e18pqjcv0"> -->
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div data-id="layoutItem"
                                                                                                    class="default-ltr-cache-1t4jy5t ew2l6qe0">
                                                                                                    <div
                                                                                                        class="default-ltr-cache-1aubja5 eslj5pt1">
                                                                                                        <div data-id="container"
                                                                                                            class="default-ltr-cache-1lp83tr eslj5pt0">
                                                                                                            <div data-id="layoutItem"
                                                                                                                class="default-ltr-cache-1pgwnji ew2l6qe0">
                                                                                                                <!-- <p color="OnSurfaceTextColorStandard"
                                                                                                                    class=" default-ltr-cache-11wpyi6 euy28770">
                                                                                                                    다양한
                                                                                                                    디바이스에서
                                                                                                                    시청하세요
                                                                                                                </p> -->
                                                                                                            </div>
                                                                                                            <div data-id="layoutItem"
                                                                                                                class="default-ltr-cache-1pgwnji ew2l6qe0">
                                                                                                                <!-- <p color="OnSurfaceTextColorStandard"
                                                                                                                    class=" default-ltr-cache-1c7d321 euy28770">
                                                                                                                    각종
                                                                                                                    영화와
                                                                                                                    시리즈를
                                                                                                                    스마트폰,
                                                                                                                    태블릿,
                                                                                                                    노트북,
                                                                                                                    TV에서
                                                                                                                    무제한으로
                                                                                                                    스트리밍하세요.
                                                                                                                </p> -->
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div data-id="layoutItem"
                                                                                    class="reskin-value-props-container Furious default-ltr-cache-1bduhq9 ew2l6qe0">
                                                                                    <div
                                                                                        class="default-ltr-cache-1d3w5wq e1uka1tf1">
                                                                                        <div
                                                                                            class="default-ltr-cache-1aubja5 eslj5pt1">
                                                                                            <div data-id="container"
                                                                                                class="default-ltr-cache-xf9jx8 eslj5pt0">
                                                                                                <div data-id="layoutItem"
                                                                                                    class="default-ltr-cache-1kv2dw4 ew2l6qe0">
                                                                                                    <div width="100%"
                                                                                                        class="default-ltr-cache-1w0kbai e18pqjcv1">
                                                                                                        <!-- <img width="100%"
                                                                                                            src="./netflix_files/ko.png"
                                                                                                            alt="어린이 전용 프로필을 만들어 보세요"
                                                                                                            class="default-ltr-cache-92t2lk e18pqjcv0"> -->
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div data-id="layoutItem"
                                                                                                    class="default-ltr-cache-1t4jy5t ew2l6qe0">
                                                                                                    <div
                                                                                                        class="default-ltr-cache-1aubja5 eslj5pt1">
                                                                                                        <div data-id="container"
                                                                                                            class="default-ltr-cache-1lp83tr eslj5pt0">
                                                                                                            <div data-id="layoutItem"
                                                                                                                class="default-ltr-cache-1pgwnji ew2l6qe0">
                                                                                                                <!-- <p color="OnSurfaceTextColorStandard"
                                                                                                                    class=" default-ltr-cache-11wpyi6 euy28770">
                                                                                                                    어린이
                                                                                                                    전용
                                                                                                                    프로필을
                                                                                                                    만들어
                                                                                                                    보세요
                                                                                                                </p> -->
                                                                                                            </div>
                                                                                                            <div data-id="layoutItem"
                                                                                                                class="default-ltr-cache-1pgwnji ew2l6qe0">
                                                                                                                <!-- <p color="OnSurfaceTextColorStandard"
                                                                                                                    class=" default-ltr-cache-1c7d321 euy28770">
                                                                                                                    자기만의
                                                                                                                    공간에서
                                                                                                                    좋아하는
                                                                                                                    캐릭터와
                                                                                                                    즐기는
                                                                                                                    신나는
                                                                                                                    모험.
                                                                                                                    자녀에게
                                                                                                                    이
                                                                                                                    특별한
                                                                                                                    경험을
                                                                                                                    선물하세요.
                                                                                                                    넷플릭스
                                                                                                                    회원이라면
                                                                                                                    무료입니다.
                                                                                                                </p> -->
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div data-id="layoutItem"
                                                                                    class="reskin-value-props-container Furious default-ltr-cache-1bduhq9 ew2l6qe0">
                                                                                    <div
                                                                                        class="default-ltr-cache-1d3w5wq e1uka1tf1">
                                                                                        <div
                                                                                            class="default-ltr-cache-1aubja5 eslj5pt1">
                                                                                            <div data-id="container"
                                                                                                class="default-ltr-cache-xf9jx8 eslj5pt0">
                                                                                                <div data-id="layoutItem"
                                                                                                    class="default-ltr-cache-1kv2dw4 ew2l6qe0">
                                                                                                    <div width="100%"
                                                                                                        class="default-ltr-cache-1w0kbai e18pqjcv1">
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div data-id="layoutItem" class="default-ltr-cache-1t4jy5t ew2l6qe0">
                                                                                                    <div
                                                                                                        class="default-ltr-cache-1aubja5 eslj5pt1">
                                                                                                        <div data-id="container"
                                                                                                            class="default-ltr-cache-1lp83tr eslj5pt0">
                                                                                                            <div data-id="layoutItem"
                                                                                                                class="default-ltr-cache-1pgwnji ew2l6qe0">
                                                                                                            </div>
                                                                                                            <div data-id="layoutItem"
                                                                                                                class="default-ltr-cache-1pgwnji ew2l6qe0">
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
		
	   <div class="soccer-field" style="margin-bottom: 180px;">
	   		
	        <div class="player defender1"><div class="player-card"><img class="player-image" alt="1번 선수" src="${list[0].playerImage }"><div class="player-name"><a style="color: firebrick; font-size: 14px;">NO.${list[0].playerNumber}</a> ${list[0].playerName }</div></div></div>
	        <div class="player defender2"><div class="player-card"><img class="player-image" alt="2번 선수" src="${list[1].playerImage }"><div class="player-name"><a style="color: firebrick; font-size: 14px;">NO.${list[1].playerNumber}</a> ${list[1].playerName }</div></div></div>
	        <div class="player defender3"><div class="player-card"><img class="player-image" alt="3번 선수" src="${list[2].playerImage }"><div class="player-name"><a style="color: firebrick; font-size: 14px;">NO.${list[2].playerNumber}</a> ${list[2].playerName }</div></div></div>
	        <div class="player defender4"><div class="player-card"><img class="player-image" alt="4번 선수" src="${list[3].playerImage }"><div class="player-name"><a style="color: firebrick; font-size: 14px;">NO.${list[3].playerNumber}</a> ${list[3].playerName }</div></div></div>
	        <div class="player midfielder1"><div class="player-card"><img class="player-image" alt="5번 선수" src="${list[4].playerImage }"><div class="player-name"><a style="color: firebrick; font-size: 14px;">NO.${list[4].playerNumber}</a> ${list[4].playerName }</div></div></div>
	        <div class="player midfielder2"><div class="player-card"><img class="player-image" alt="6번 선수" src="${list[5].playerImage }"><div class="player-name"><a style="color: firebrick; font-size: 14px;">NO.${list[5].playerNumber}</a> ${list[5].playerName }</div></div></div>
	        <div class="player midfielder3"><div class="player-card"><img class="player-image" alt="7번 선수" src="${list[6].playerImage }"><div class="player-name"><a style="color: firebrick; font-size: 14px;">NO.${list[6].playerNumber}</a> ${list[6].playerName }</div></div></div>
	        <div class="player forward1"><div class="player-card"><img class="player-image" alt="8번 선수" src="${list[7].playerImage }"><div class="player-name"><a style="color: firebrick; font-size: 14px;">NO.${list[7].playerNumber}</a> ${list[7].playerName }</div></div></div>
	        <div class="player forward2"><div class="player-card"><img class="player-image" alt="9번 선수" src="${list[8].playerImage }"><div class="player-name"><a style="color: firebrick; font-size: 14px;">NO.${list[8].playerNumber}</a> ${list[8].playerName }</div></div></div>
	    </div>
	    
	    
</body>

</html>