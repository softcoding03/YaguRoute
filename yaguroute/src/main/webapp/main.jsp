<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Team HTML</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script type="text/javascript">
    	// 로그아웃 버튼 구현
    	$(function(){
    		$('.logout').click("onclick", function(){
    			alert("로그아웃 성공");
    			window.location.href="/users/logout";
    		})
    		
    		$("#myCarousel").on('slid.bs.carousel',function(){
    			$("#select").attr('id','');
    			var index = $("#myCarousel").find(".carousel-inner div.active").attr("id");
    			$("a."+index).attr('id','select')
    		})
    		
    		$.ajax({
    			url : "/game/json/getTeam",
				method : "POST",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData,status){
					for(var i=0;i<JSONData.length;i++){
						var team = JSONData[i];
						if(team.teamCode === 'ALL')
							continue;
						$("#teamRanking").append(
							'<tr class="table-css" id="'+team.teamCode+'">'+ /* 이미지를 요소에 맞게 확대/축소하여 채움 */
			                	'<td>'+team.teamRanking+'</td>'+
			                	'<td>'+team.teamNickName+'<img src="'+team.teamEmblem+'" alt="team-image" style="padding-left:10px;width:35px;height:25px;">'+'</td>'+
			                	'<td style="width: 50px;padding-right:50px;"></td>'+
			                	'<td>'+team.endGameCount+'</td>'+
			                	'<td>'+team.winCount+'</td>'+
			                	'<td>'+team.tieCount+'</td>'+
			                	'<td>'+team.loseCount+'</td>'+
			                	'<td>'+team.winRate+'</td>'+
			                '</tr>'
						)
						if(i<4){
							$("#"+team.teamCode+" td:nth-child(2)").find("img").remove()
							/* $("#"+team.teamCode+" td:first").attr("style",'color:white;background-color:'+team.teamColor+';') */
							$("#"+team.teamCode+" td:nth-child(2)").attr("style",'border-radius: 50%;width:240px;height:60px;text-align:right;color:white;background-image:url('+team.teamTopBar+');background-repeat: no-repeat;background-size: cover;');
							$("#"+team.teamCode).attr("class","top-css")
						}
					}
				}
    		})
    		
    		$.ajax({
				url : "/game/json/getTodayGameInfo",
				method : "POST",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData, status){
					if(JSONData.length != 0){
						for(var i=0;i<JSONData.length;i++){
							var game = JSONData[i];
							console.log(game.gameDate)
							$(".main-lates-matches").append(
									'<a '+(i === 0 ? 'id="select"' : 'id')+' role="button" class="item '+game.gameCode+'" data-target="#myCarousel" data-slide-to="'+i+'">'
							        +'<span class="championship">'+game.gameTime+' / '+game.homeTeam.stadiumName+'</span>'
							        +'<span class="teams-wrap">'
							               +'<span class="team">'
							                    +'<span>'
							                        +'<img src="'+game.homeTeam.teamEmblem+'" alt="team-image">'
							                    +'</span>'
							                    +'<span style="color:black;">'+game.homeTeam.teamNickName+'</span>'
							                +'</span>'
							                +'<span  class="score">'
							                    +`<span style="font-family: 'FontAwesome';">`+game.gameScore+`</span>`
							                +'</span>'
							                +'<span class="team1">'
							                    +'<span style="color:black;">'+game.awayTeam.teamNickName+'</span>'
							                    +'<span><img src="'+game.awayTeam.teamEmblem+'" alt="team-image"></span>'
							                +'</span>'
							        +'</span>'
							    +'</a>'/**/
							) //end of append(".main-lates-matches")
						}//end of for
					      
					    var tmpStr = "";
					    var tmpItem = "";
					    for(var k=0;k<JSONData.length;k++){
					    	var tmpGame = JSONData[k];
					    	var gameState = tmpGame.gameStatusCode 
					    	var message = (gameState === '0' ? '준비중' : (gameState === '1' ? 'LIVE' : (gameState === '2' || gameState === '4' ? '경기종료' : '경기취소')));
					    	var tmpClass = (gameState === '1' ? 'stream' : (gameState === '0' || gameState === '2' || gameState === '4' ? 'atag' : 'cancel'));
					    	var location = (gameState === '0' ? '/game/getGamePreview?gameCode='+game.gameCode : (gameState === '1' ? '/channel/getStreaming?gameCode='+game.gameCode : (gameState === '2' || gameState === '4' ? '/game/getGameRecord?gameCode='+game.gameCode : '경기취소')));
					    	tmpItem += '<div id="'+tmpGame.gameCode+'" class="item '+(k===0 ? 'active' : '')+ '">'+
					    	'<a class="first-slide" href="'+location+'">'+
						    	'<div style="position: relative;" class="score">'+
						          	'<img src="'+tmpGame.homeTeam.teamTopBar+'" alt="First slide" style="width: auto;height: 220px;">'+
						          	'<h1 style="position: absolute; top: 20%; transform: translateY(-50%); right: 60px;color:#EEEEEE;">'+tmpGame.homeTeam.teamNickName+'</h1>'+
						          	'<h5 class="'+tmpClass+'" style="position: absolute; top: 50%; transform: translateY(-80%); right: 175px;">'+message+'</h5>'+
						          	'<img class="first-slide" src="/images/ticket/vs.png" alt="vs" style="width: auto;height: 200px; position: absolute; top: 50%; transform: translateY(-55%); right: 0;">'+
						          	'<img class="first-slide" src="'+tmpGame.awayTeam.teamTopBar+'" alt="Second slide" style="width: auto;height: 220px;">'+
						          	'<h1 style="position: absolute; top: 70%; transform: translateY(-50%); right: 60px;color:#EEEEEE;">'+tmpGame.awayTeam.teamNickName+'</h1>'+
						        '</div>'+
					    	'</a>'+
					    	'</div>'
						}
						$("#myCarousel").append(
							'<div class="carousel-inner" role="listbox">'+
							tmpItem+
							'</div>'+
							'<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">'+
					        '<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>'+
					        '<span class="sr-only">Previous</span>'+
					      '</a>'+
					      '<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">'+
					        '<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>'+
					        '<span class="sr-only">Next</span>'+
					      '</a>'
						)//end of append("#myCarousel")
					}else{
						$("#noGame").text("오늘 진행되는 경기가 없습니다.");
						$("#noGame").parent().attr('style','display:block;text-align: center;');
						$("section.main-match-shedule h6").remove();
					}
				}//end of success
				
			})//end of ajax
    		
    	});
    	
    	/* $(function(){
    		$('#userlist').on("click", function(){
    			alert("회원 목록 조회로 떠납니다.");
    			window.location.href="/users"
    		});
    	}); */
    </script>
    
    <!-- <script type="text/javascript">
    // 잘못된 접근(세션 끝났는데 뒤로가기로 메인페이지 접근할 때...)
    window.addEventListener('pageshow', function(event) {
        var historyTraversal = event.persisted || 
                               (typeof window.performance != 'undefined' && 
                                window.performance.navigation.type === 2);
        if (historyTraversal) {
            // 잘못된 접근 감지됨, index.jsp로 리디렉션
            alert("잘못된 접근입니다.");
            window.location.href = '/user/loginTest(new).jsp';
        }
    });
    
</script> -->
<style type="text/css">
		#select{
			 background-color: #5e8208 !important;
		}
		.atag {
		  padding: 10px 10px 10px 10px;
		  background-color: #BDBDBD !important;
		  border-radius: 15%;
		}
		.cancel{
			border-radius: 15%;
			background-color: #db5e5e !important;
			padding: 10px 10px 10px 10px;
		}
		.stream{
			border-radius: 15%;
			background-color: #f03a3a !important;
			padding: 10px 10px 10px 10px;
		}
		table tr td:first-child{
    		width: 100px;
    		font-size: 20px !important;
    		font-weight: 600 !important;
    	}
    	table tr td:nth-child(5){
    		color:blue;
    	}
    	table tr td:nth-child(7){
    		color:red;
    	}
		.top-css td,.top-css th{
    		font-size: 16px !important;
    		font-weight: 550 !important;
    		font-family: none !important;
    	}
		.table-css td,.table-css th{
    		font-size: 15px !important;
    		font-weight: 500 !important;
    		font-family: none !important;
    	}
    	.table-css td:nth-child(2),th:nth-child(2){
    		width: 200px;
    		padding-left: 0px !important;
    	}
<%-- end of 최성락 css --%>
</style>
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

<jsp:include page="/common/topBar.jsp"/>
<!-- 공지사항 -->
<div class="main-breaking-news">
    <div class="container">
        <div class="row">
            <div class="col-md-2 col-sm-3 col-xs-12 ">
                <div class="break-title">
                    <span>공지사항</span>
                </div>
            </div>
            <div class="col-md-10 col-sm-9 col-xs-12">
                <div id="main-breaking-list" class="carousel slide main-breaking-list" data-ride="carousel">
                    <div class="carousel-inner" role="listbox">
                    		<div class="item active">
                            <a href="javascript:;" class="getNotice">
                                <span class="date notice">${postDateList[0]}<span>/</span>
                                </span>	
                                <span class="news notice">${noticeList[0].postTitle}</span>
                            </a>
	                     </div>
                    		<c:set var="size" value="${noticeList.size()}"/>
								<c:forEach var="i" begin="1" end="${size -1}" step="1">
	                        <div class="item">
	                            <a href="javascript:;" class="getNotice">
	                                <span class="date notice">${postDateList[i]}<span>/</span>
	                                </span>	
	                                <span class="news notice">${noticeList[i].postTitle}</span>
	                            </a>
	                        </div>
                        </c:forEach>
                    </div>	
                    <div class="arrow-wrap">
                        <!-- Controls -->
                        <a class="nav-arrow left-arrow" href="#main-breaking-list" role="button" data-slide="prev">
                            <i class="fa fa-caret-left" aria-hidden="true"></i>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="nav-arrow right-arrow" href="#main-breaking-list" role="button" data-slide="next">
                            <i class="fa fa-caret-right" aria-hidden="true"></i>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 공지사항 END -->
<!-- <div class="main-slider-section">
    <div class="main-slider">
        <div id="main-slider" class="carousel slide" data-ride="carousel" data-interval="4000" style="position: relative;display: flex;">
	        	<img alt="img" src="/images/teamTopBar/WO.jpg" style="width:100%;height: auto;">
	        	<img alt="img" src="/images/teamTopBar/HH.jpg" style="width:100%;height: auto;">
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <div class="main-slider-caption">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="match-date">26 Sep 2016 / 9:30 PM / city arena</div>
                                    <div class="team"> Team Name 1
                                        <div class="big-count">
                                            2:0
                                        </div>
                                        Team Name 2
                                    </div>                                    
                                    <div class="booking">
                                        <a href="matches-list.html">
                                            Match Page
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="main-slider-caption">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="match-date">26 Sep 2016 / 9:30 PM / city arena</div>
                                    <div class="team"> Team Name 1 - Team Name 2
                                    </div>                                        
                                    <div class="counter" data-date="1534185200000">
                                        <ul>
                                            <li>
                                                <div class="digit days"></div>
                                                <div class="descr">Days</div>
                                            </li>
                                            <li>
                                                <div class="digit hours"></div>
                                                <div class="descr">Hours</div>
                                            </li>
                                            <li>
                                                <div class="digit minutes"></div>
                                                <div class="descr">Minutes</div>
                                            </li>
                                            <li>
                                                <div class="digit seconds"></div>
                                                <div class="descr">Seconds</div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="booking">
                                        <a href="match-live.html">
                                            Watch live
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="item">
                    <div class="main-slider-caption">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="match-date">26 Sep 2016 / 9:30 PM / city arena</div>
                                    <div class="team"> Team Name 1
                                        <div class="big-count">
                                            2:0
                                        </div>
                                        Team Name 2
                                    </div>                                                                          
                                    <div class="booking">
                                        <a href="match-live.html">
                                            Watch live
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            Controls
            <a class="nav-arrow left-arrow" href="#main-slider" role="button" data-slide="prev">
                <i class="fa fa-angle-left" aria-hidden="true"></i>
                <span class="sr-only"></span>
            </a>
            <a class="nav-arrow right-arrow" href="#main-slider" role="button" data-slide="next">
                <i class="fa fa-angle-right" aria-hidden="true"></i>
                <span class="sr-only"></span>
            </a>

            <div class="event-nav">
                <div class="container">
                    <div class="row no-gutter carousel-indicators">

                        <div class="col-sm-4 active" data-slide-to="0" data-target="#main-slider">
                            <a href="#" class="nav-item">
                                <span class="championship">National cup - quarterfinal</span>
                                <span class="teams-wrap">
                                    <span class="team"><img src="/images/baseball/team-logo1.png" alt="team-logo"></span>
                                    <span class="score">
                                        <span>1:0</span>
                                    </span>

                                    <span class="team1">
                                        <span><img src="/images/baseball/team-logo2.png" alt="team-logo"></span>
                                    </span>
                                </span>
                                <span class="game-result">(5-4) penalties</span>
                            </a>
                        </div>

                        <div class="col-sm-4" data-slide-to="1" data-target="#main-slider">
                            <a href="#" class="nav-item">
                                <span class="championship">Team Name 1 - Team Name 2</span>
                                <span class="teams-wrap">

                                    <span class="team"><img src="/images/baseball/team-logo5.png" alt="team-logo"></span>
                                    <span class="score countdown" data-date="1534185200000">
                                        <span class="days"></span>
                                        <span class="hours"></span>
                                        <span class="minutes"></span>
                                        <span class="seconds"></span>
                                    </span>

                                    <span class="team1">
                                        <span><img src="/images/baseball/team-logo1.png" alt="team-logo"></span>
                                    </span>

                                </span>
                                <span class="game-result">26 Sep 2016 / 9:30 PM / city arena</span>
                            </a>
                        </div>
                        
                        <div class="col-sm-4" data-slide-to="2" data-target="#main-slider">
                            <a href="#" class="nav-item">
                                <span class="championship">National cup - quarterfinal</span>
                                <span class="teams-wrap">
                                    <span class="team"><img src="/images/baseball/team-logo3.png" alt="team-logo"></span>
                                    <span class="score">
                                        <span>VS</span>
                                    </span>

                                    <span class="team1">
                                        <span><img src="/images/baseball/team-logo4.png" alt="team-logo"></span>
                                    </span>
                                </span>
                                <span class="game-result">(5-4) penalties</span>
                            </a>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

    <div class="main-news-list">
    <div class="owl-carousel owl-theme match-page-slider">
        <a href="" class="item">
            <img src="/images/baseball/news1.jpg" class="img-responsive" alt="">
            <span class="caption">
                <span class="date">20 sep 2016</span>
                <span class="name">Chelsea claims Premier League lead after</span>
            </span>
        </a>
        <a href="" class="item">
            <img src="/images/baseball/news2.jpg" class="img-responsive" alt="">
            <span class="caption">
                <span class="date">20 sep 2016</span>
                <span class="name">Chelsea claims Premier League lead after</span>
            </span>
        </a>
        <a href="" class="item">
            <img src="/images/baseball/news3.jpg" class="img-responsive" alt="">
            <span class="caption">
                <span class="date">20 sep 2016</span>
                <span class="name">Chelsea claims Premier League lead after</span>
            </span>
        </a>
    </div>
</div> -->

    <!--MAIN MACTH SHEDULE BEGIN-->

    <section class="main-match-shedule">
        <div class="container">
            <div class="row">
            	<div class="col-md-12"><h4 style="text-align:center;padding-bottom: 0px;">팀 순위</h4></div>
            	<div class="col-md-12">
					<h4 id="nowYear"></h4>
					<table class="table-standings" id="teamRanking">
		                        <tr class="table-css">
		                        	<th>순위</th>
		                        	<th>팀</th>
		                        	<th style="width: 50px;padding-right:50px;"></th>
		                        	<th>경기</th>
		                        	<th>승리</th>
		                        	<th>무승부</th>
		                        	<th>패배</th>
		                        	<th>승률</th>
		                        </tr>
		                    </table>
				
				</div>
				<div class="col-md-12 col-sm-12 col-xs-12"><h4 style="text-align: center;margin-top: 50px;">Today's  Match</h4></div>
                <div class="col-md-6 col-sm-12 col-xs-12">
                    
<div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
    </div>
                </div>
                <div class="col-md-6 col-sm-12 col-xs-12">                
	<div class="main-lates-matches">
    <!-- <a href="" class="item">
        <span class="championship">National cup - quarterfinal</span>
        <span class="teams-wrap">
                <span class="team">
                    <span>
                        <img src="/images/common/team-logo4.png" alt="team-image">
                    </span>
                    <span>Team 1</span>
                </span>
                <span class="score">
                    <span>3:2</span>

                </span>
                <span class="team1">
                    <span>Team 2</span>
                    <span><img src="/images/common/team-logo5.png" alt="team-image"></span>
                </span>
        </span>
        <span class="game-result">(5-4) penalties</span>
    </a> -->
</div>
                </div>
                <div class="col-md-12 col-sm-12 col-xs-12" style="text-align: center;display: none;">
                	<h1 id="noGame">안녕하세요</h1>
                </div>
            </div>
        </div>
    </section>


    <!--MAIN PLAYERS STAT BEGIN-->

    <section class="main-players-stat bg-cover">
        <div class="container">
            <div class="row">
                <div class="col-md-7">
                    <h4 class="hockey-stats-h4">Players stats</h4>
                    

<div class="single-player-stats players_statistic_slider">
    <ul class="player-filters" role="tablist">        
        <li class="active">
            <a href="#goalkeepers" role="tab" data-toggle="tab">
                goalkeepers
            </a>
        </li>
        <li>
            <a href="#defenders" role="tab" data-toggle="tab">
                defenders
            </a>
        </li>

    </ul>
    <div class="player-stat-slider tab-content">      
        <div id="slider" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner tab-content" role="listbox">
                <div class="item active tab-pane" id="goalkeepers">

                    <div class="wrap">
                        <div class="stat">
                            <div class="top-info with_number">
                                <div class="number">12</div>
                                <a href="player-second-page.html" class="name">
                                    HAYDEN FREEMAN
                                </a>
                            </div>
                            <div class="position">
                                Goalkeeper
                            </div>
                            <div class="progress-wrap">
                                <div class="progress-item">
                                    <div class="bar-label">
                                        <div class="achievement">played</div>
                                        <div class="score">23</div>
                                    </div>
                                    <div class="progress-line">
                                        <div class="bar bar-1" ></div>
                                    </div>
                                </div>
                                <div class="progress-item">
                                    <div class="bar-label">
                                        <div class="achievement">saves</div>
                                        <div class="score">23</div>
                                    </div>
                                    <div class="progress-line">
                                        <div class="bar bar-2" ></div>
                                    </div>
                                </div>
                                <div class="progress-item">
                                    <div class="bar-label">
                                        <div class="achievement">missing</div>
                                        <div class="score">23</div>
                                    </div>
                                    <div class="progress-line">
                                        <div class="bar bar-3" ></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="image">
                            <a href="player-second-page.html" title="player-image">
                                <img src="/images/baseball/player-stat-slider-img.jpg" alt="player-image">
                            </a>
                        </div>	
                    </div>
                </div>
                <div class="item tab-pane" id="defenders">
                    <div class="wrap">
                        <div class="stat">
                            <div class="top-info with_number">
                                <div class="number">1</div>
                                <a href="player.html" class="name">
                                    JORG BELAFFSOON
                                </a>
                            </div>
                            <div class="top-info">
                                <a href="player-second-page.html" class="name">
                                </a>
                            </div>
                            <div class="position">
                                Defender
                            </div>
                            <div class="progress-wrap">
                                <div class="progress-item">
                                    <div class="bar-label">
                                        <div class="achievement">played</div>
                                        <div class="score">23</div>
                                    </div>
                                    <div class="progress-line">
                                        <div class="bar bar-4" ></div>
                                    </div>
                                </div>
                                <div class="progress-item">
                                    <div class="bar-label">
                                        <div class="achievement">saves</div>
                                        <div class="score">23</div>
                                    </div>
                                    <div class="progress-line">
                                        <div class="bar bar-5" ></div>
                                    </div>
                                </div>
                                <div class="progress-item">
                                    <div class="bar-label">
                                        <div class="achievement">missing</div>
                                        <div class="score">23</div>
                                    </div>
                                    <div class="progress-line">
                                        <div class="bar bar-6" ></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="image">
                            <a href="player-second-page.html" title="player-image">
                                <img src="/images/baseball/player-stat-slider-img.jpg" alt="player-image">
                            </a>
                        </div>	
                    </div>
                </div>


                <div class="arrow-wrap">
                    <!-- Controls -->
                    <a class="nav-arrow left-arrow" href="#slider" role="button" data-slide="prev">
                        <i class="fa fa-caret-left" aria-hidden="true"></i>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="nav-arrow right-arrow" href="#slider" role="button" data-slide="next">
                        <i class="fa fa-caret-right" aria-hidden="true"></i>
                        <span class="sr-only">Next</span>
                    </a>
                </div>  
            </div>
        </div>
    </div>
</div>
                </div>
                <div class="col-md-5">
                    <h4 class = "hockey-stats-h4">Best players</h4>
                    <div class="team-best-player">
    <div class="">
        <ul class="player-filters" role="tablist">
            <li class="active">
                <a href="#goals" role="tab" data-toggle="tab">goals</a>
            </li>
            <li>
                <a href="#assist" role="tab" data-toggle="tab">assist</a>
            </li>
        </ul>    
    </div>
    <div class="tab-content">
        <div class="best-players-list tab-pane active" id="goals">
            <a href="player-second-page.html" class="item">
                <span class="number">9</span>
                <span>Luis Hernandez</span>
                <span class="achievement">14</span>
            </a>
            <a href="player.html" class="item">
                <span class="number">9</span>
                <span>Luis Hernandez</span>
                <span class="achievement">14</span>
            </a>
            <a href="player-second-page.html" class="item">
                <span class="number">9</span>
                <span>Luis Hernandez</span>
                <span class="achievement">14</span>
            </a>
            <a href="player.html" class="item">
                <span class="number">9</span>
                <span>Luis Hernandez</span>
                <span class="achievement">14</span>
            </a>
            <a href="player.html" class="item">
                <span class="number">9</span>
                <span>Luis Hernandez</span>
                <span class="achievement">14</span>
            </a>
            <a href="player-second-page.html" class="item">
                <span class="number">9</span>
                <span>Luis Hernandez</span>
                <span class="achievement">14</span>
            </a>
            <a href="player.html" class="item">
                <span class="number">9</span>
                <span>Luis Hernandez</span>
                <span class="achievement">14</span>
            </a>    
        </div>
        <div class="best-players-list tab-pane" id="assist">
            <a href="player.html" class="item">
                <span class="number">1</span>
                <span>Luis Hernandez</span>
                <span class="achievement">14</span>
            </a>
            <a href="player-second-page.html" class="item">
                <span class="number">9</span>
                <span>Luis Hernandez</span>
                <span class="achievement">14</span>
            </a>
            <a href="player.html" class="item">
                <span class="number">9</span>
                <span>Luis Hernandez</span>
                <span class="achievement">14</span>
            </a>
            <a href="player.html" class="item">
                <span class="number">9</span>
                <span>Luis Hernandez</span>
                <span class="achievement">14</span>
            </a>
            <a href="player-second-page.html" class="item">
                <span class="number">9</span>
                <span>Luis Hernandez</span>
                <span class="achievement">14</span>
            </a>
            <a href="player.html" class="item">
                <span class="number">9</span>
                <span>Luis Hernandez</span>
                <span class="achievement">14</span>
            </a>
            <a href="player.html" class="item">
                <span class="number">9</span>
                <span>Luis Hernandez</span>
                <span class="achievement">14</span>
            </a>
        </div>
    </div>
</div>
                </div>
            </div>
        </div>
    </section>

    <!--MAIN PLAYERS STAT END-->

<!--인기 게시물 Best 5-->
<section class="success-story sport">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h4>인기 게시물 Best 5</h4>
                <div class="row">
                	  <c:forEach var="bestPost" items="${bestPostList}">
	                    <div class="col-md-2">
	                        <div class="icon"><img src="${bestPost.user.userImage}" style="width:30px;"alt="succes-icon"></div>
	                        <div class="title">${bestPost.user.userNickName }</div>
	                        <p>${bestPost.postTitle}</p>
	                    </div>
                    </c:forEach>
                </div>
            </div>
            <div class="col-md-5 position-relative">
                <blockquote class="coach-quote">
                    <p>Austin mustache man bun vice helvetica.</p>
                    <p class="name">Brandon Campbell / head coach</p>
                </blockquote>
                <img class="img-responsive" src="/images/baseball/coach.png" alt="coach-image">
            </div>
        </div>
    </div>	
</section>
<!--인기 게시물 Best 5-END-->

    <!--SUCCESS STORY BEGIN-->
<section class="success-story-cybersport">
    <div class="container">
        <div class="row">
            <div class="col-md-7">
                <h4>success story <br>began here</h4>
                <p>Pabst irony tattooed, synth sriracha selvage pok pok. Wayfarers kinfolk sartorial, helvetica you probably haven't heard of them tumeric venmo deep mixtape semiotics brunch. </p>
                <div class="row">
                    <div class="col-md-6">
                        <div class="icon"><img src="/images/common/success-icon.png" alt="succes-icon"></div>
                        <div class="title">Legendary</div>
                        <p>Next level paleo taxidermy, bespoke messenger bag leggings occupy food truck. </p>
                    </div>
                    <div class="col-md-6">
                        <div class="icon"><img src="/images/common/success-icon1.png" alt="succes-icon"></div>
                        <div class="title">Legendary</div>
                        <p>Wayfarers kinfolk sartorial, helvetica you probably haven't heard of them tumeric venmo deep v mixtape semiotics brunch. </p>
                    </div>
                    <div class="col-md-12"><a href="trophies.html" class="booking">trophies</a></div>
                </div>
            </div>

            <div class="col-md-5">
                <div class="wrap position-relative">
                    <div class="cybersport-slogan">
                        <div class="title">Welcome to</div>
                        <div class="big-title">Pubstomps</div>
                        <p>Hella pop-up flexitarian, semiotics migas humblebrag schlitz literally tofu deep v thundercats skateboard viral cornhole.</p>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>
<!--SUCCESS STORY END-->

    <!--AWARD BOX BEGIN-->

    <div class="main-award-box">

        <!--TIMELINE BEGIN-->
<div class="timeline-bar">
    <div class="bar">
        <div class="date date-1" >1990</div>
        <div class="date date-2" >2001</div>
        <div class="date date-3" >2002</div>
        <div class="date date-4" >2007</div>
        <div class="date date-5" >2010</div>
        <div class="date date-6 active" >2016</div>
    </div>
</div>
<!--TIMELINE END-->

        
<div class="main-award-slider">
    <div id="main-award-slider" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner" role="listbox">  
            <div class="item active">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-4 text-center">
                                <div class="award">
                                    <div class="image"><img class="img-responsive" src="/images/common/cup.png" alt="cup-image"></div>
                                    <div class="name">All-Star Series</div>
                                    <div class="year">2016</div>
                                </div>
                            </div>
                            <div class="col-xs-4 text-center">
                                <div class="award">
                                    <div class="image"><img class="img-responsive" src="/images/common/cup1.png" alt="cup-image"></div>
                                    <div class="name">World Class Championship</div>
                                    <div class="year">2016</div>
                                </div>
                            </div>
                            <div class="col-xs-4 text-center">
                                <div class="award">
                                    <div class="image"><img class="img-responsive" src="/images/common/cup2.png" alt="cup-image"></div>
                                    <div class="name">Major League Trophy</div>
                                    <div class="year">2016</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-4 text-center">
                                <div class="award">
                                    <div class="image"><img class="img-responsive" src="/images/common/cup.png" alt="cup-image"></div>
                                    <div class="name">All-Star Series</div>
                                    <div class="year">2016</div>
                                </div>
                            </div>
                            <div class="col-xs-4 text-center">
                                <div class="award">
                                    <div class="image"><img class="img-responsive" src="/images/common/cup1.png" alt="cup-image"></div>
                                    <div class="name">World Class Championship</div>
                                    <div class="year">2016</div>
                                </div>
                            </div>
                            <div class="col-xs-4 text-center">
                                <div class="award">
                                    <div class="image"><img class="img-responsive" src="/images/common/cup2.png" alt="cup-image"></div>
                                    <div class="name">Major League Trophy</div>
                                    <div class="year">2016</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>

        <!-- Controls -->
        <a class="nav-arrow left-arrow" href="#main-award-slider" role="button" data-slide="prev">
            <i class="fa fa-angle-left" aria-hidden="true"></i>
            <span class="sr-only">Previous</span>
        </a>
        <a class="nav-arrow right-arrow" href="#main-award-slider" role="button" data-slide="next">
            <i class="fa fa-angle-right" aria-hidden="true"></i>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>

    </div>

    <!--AWARD BOX END-->

    <!--MAIN CLUB STAFF BEGIN-->
<section class="main-club-stuff">    
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h4 class="soccer-h4">club stuff</h4>  
                <ul class="player-filters" role="tablist">
                    <li class="active">
                        <a href="#managers" role="tab" data-toggle="tab">
                            Managers                  
                        </a>
                    </li>
                    <li>
                        <a href="#firstteam" role="tab" data-toggle="tab">
                            First team
                        </a>
                    </li>
                    <li>
                        <a href="#academy" role="tab" data-toggle="tab">
                            Academy
                        </a>
                    </li>                  
                </ul>
            </div>
        </div>
    </div>           

    <div class="tab-content">
        <div class="tab-pane active" id="managers" role="tabpanel">
            <div id="managers_carousel" class="carousel slide main-stuff-slider" data-ride="carousel" >
                <div class="carousel-inner" role="listbox" >
                    <div class="item active">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="staff-item">
                                        <a href="staff.html">
                                            <span class="info">
                                                <span class="name">Lucas<br>Marshman</span>
                                                <span class="position">Left Forward</span>
                                                <span class="number">14</span>
                                            </span>
                                            <img src="/images/baseball/stuff-person.jpg"  alt="person-slider">
                                        </a>	
                                    </div>
                                </div>                    
                                <div class="col-md-4">
                                    <div class="staff-item">
                                        <a href="staff.html">
                                            <span class="info">
                                                <span class="name">Lucas<br>Marshman</span>
                                                <span class="position">Left Midfielder</span>
                                                <span class="number">8</span>
                                            </span>
                                            <img src="/images/baseball/player-2.jpg"  alt="person-slider">
                                        </a>	
                                    </div>
                                </div>
                                <div class="col-md-4 ">
                                    <div class="staff-item">
                                        <a href="staff.html">
                                            <span class="info">
                                                <span class="name">Lucas<br>Marshman</span>
                                                <span class="position">Central Attacking Midfielder</span>
                                                <span class="number">7</span>
                                            </span>
                                            <img src="/images/baseball/player-3.jpg"  alt="person-slider">
                                        </a>	
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="staff-item">
                                        <a href="staff.html">
                                            <span class="info">
                                                <span class="name">Lucas<br>Marshman</span>
                                                <span class="position">Left Forward</span>
                                                <span class="number">14</span>
                                            </span>
                                            <img src="/images/baseball/player-3.jpg"  alt="person-slider">
                                        </a>	
                                    </div>
                                </div>                    
                                <div class="col-md-4">
                                    <div class="staff-item">
                                        <a href="staff.html">
                                            <span class="info">
                                                <span class="name">Lucas<br>Marshman</span>
                                                <span class="position">Left Midfielder</span>
                                                <span class="number">8</span>
                                            </span>
                                            <img src="/images/baseball/player-2.jpg"  alt="person-slider">
                                        </a>	
                                    </div>
                                </div>
                                <div class="col-md-4 ">
                                    <div class="staff-item">
                                        <a href="staff.html">
                                            <span class="info">
                                                <span class="name">Lucas<br>Marshman</span>
                                                <span class="position">Central Attacking Midfielder</span>
                                                <span class="number">7</span>
                                            </span>
                                            <img src="/images/baseball/stuff-person.jpg"  alt="person-slider">
                                        </a>	
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- Controls -->
                    <a class="nav-arrow left-arrow" href="#managers_carousel" role="button" data-slide="prev">
                        <i class="fa fa-angle-left" aria-hidden="true"></i>
                        <span class="sr-only"></span>
                    </a>
                    <a class="nav-arrow right-arrow" href="#managers_carousel" role="button" data-slide="next">
                        <i class="fa fa-angle-right" aria-hidden="true"></i>
                        <span class="sr-only"></span>
                    </a>
                </div>
            </div>
        </div>

        <div class="tab-pane" id="academy" role="tabpanel">
            <div id="academy_carousel" class="carousel slide main-stuff-slider" data-ride="carousel" >
                <div class="carousel-inner" role="listbox" >
                    <div class="item active">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="staff-item">
                                        <a href="staff.html">
                                            <span class="info">
                                                <span class="name">Vito<br>Palet</span>
                                                <span class="position">Left Forward</span>
                                                <span class="number">14</span>
                                            </span>
                                            <img src="/images/baseball/player-2.jpg"  alt="person-slider">
                                        </a>	
                                    </div>
                                </div>                    
                                <div class="col-md-4">
                                    <div class="staff-item">
                                        <a href="staff.html">
                                            <span class="info">
                                                <span class="name">Lucas<br>Melet</span>
                                                <span class="position">Left Midfielder</span>
                                                <span class="number">8</span>
                                            </span>
                                            <img src="/images/baseball/stuff-person.jpg"  alt="person-slider">
                                        </a>	
                                    </div>
                                </div>
                                <div class="col-md-4 ">
                                    <div class="staff-item">
                                        <a href="staff.html">
                                            <span class="info">
                                                <span class="name">Lucas<br>Marse</span>
                                                <span class="position">Central Attacking Midfielder</span>
                                                <span class="number">7</span>
                                            </span>
                                            <img src="/images/baseball/player-3.jpg"  alt="person-slider">
                                        </a>	
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="staff-item">
                                        <a href="staff.html">
                                            <span class="info">
                                                <span class="name">Lucas<br>Marsan</span>
                                                <span class="position">Left Forward</span>
                                                <span class="number">14</span>
                                            </span>
                                            <img src="/images/baseball/player-3.jpg"  alt="person-slider">
                                        </a>	
                                    </div>
                                </div>                    
                                <div class="col-md-4">
                                    <div class="staff-item">
                                        <a href="staff.html">
                                            <span class="info">
                                                <span class="name">Luscas<br>Mars</span>
                                                <span class="position">Left Midfielder</span>
                                                <span class="number">8</span>
                                            </span>
                                            <img src="/images/baseball/player-2.jpg"  alt="person-slider">
                                        </a>	
                                    </div>
                                </div>
                                <div class="col-md-4 ">
                                    <div class="staff-item">
                                        <a href="staff.html">
                                            <span class="info">
                                                <span class="name">Lucas<br>Mafo</span>
                                                <span class="position">Central Attacking Midfielder</span>
                                                <span class="number">7</span>
                                            </span>
                                            <img src="/images/baseball/stuff-person.jpg"  alt="person-slider">
                                        </a>	
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- Controls -->
                    <a class="nav-arrow left-arrow" href="#academy_carousel" role="button" data-slide="prev">
                        <i class="fa fa-angle-left" aria-hidden="true"></i>
                        <span class="sr-only"></span>
                    </a>
                    <a class="nav-arrow right-arrow" href="#academy_carousel" role="button" data-slide="next">
                        <i class="fa fa-angle-right" aria-hidden="true"></i>
                        <span class="sr-only"></span>
                    </a>
                </div>
            </div>
        </div>

        <div class="tab-pane" id="firstteam" role="tabpanel">
            <div id="firstteam_carousel" class="carousel slide main-stuff-slider" data-ride="carousel" >
                <div class="carousel-inner" role="listbox" >
                    <div class="item active">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="staff-item">
                                        <a href="staff.html">
                                            <span class="info">
                                                <span class="name">James<br>Deshon</span>
                                                <span class="position">Left Forward</span>
                                                <span class="number">14</span>
                                            </span>
                                            <img src="/images/baseball/stuff-person.jpg"  alt="person-slider">
                                        </a>	
                                    </div>
                                </div>                    
                                <div class="col-md-4">
                                    <div class="staff-item">
                                        <a href="staff.html">
                                            <span class="info">
                                                <span class="name">Deshon<br>James</span>
                                                <span class="position">Left Midfielder</span>
                                                <span class="number">8</span>
                                            </span>
                                            <img src="/images/baseball/stuff-person.jpg"  alt="person-slider">
                                        </a>	
                                    </div>
                                </div>
                                <div class="col-md-4 ">
                                    <div class="staff-item">
                                        <a href="staff.html">
                                            <span class="info">
                                                <span class="name">James<br>Deshon</span>
                                                <span class="position">Central Attacking Midfielder</span>
                                                <span class="number">7</span>
                                            </span>
                                            <img src="/images/baseball/player-3.jpg"  alt="person-slider">
                                        </a>	
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="staff-item">
                                        <a href="staff.html">
                                            <span class="info">
                                                <span class="name">Lucas<br>Marsh</span>
                                                <span class="position">Left Forward</span>
                                                <span class="number">14</span>
                                            </span>
                                            <img src="/images/baseball/player-3.jpg"  alt="person-slider">
                                        </a>	
                                    </div>
                                </div>                    
                                <div class="col-md-4">
                                    <div class="staff-item">
                                        <a href="staff.html">
                                            <span class="info">
                                                <span class="name">Luca<br>Mas</span>
                                                <span class="position">Left Midfielder</span>
                                                <span class="number">8</span>
                                            </span>
                                            <img src="/images/baseball/player-2.jpg"  alt="person-slider">
                                        </a>	
                                    </div>
                                </div>
                                <div class="col-md-4 ">
                                    <div class="staff-item">
                                        <a href="staff.html">
                                            <span class="info">
                                                <span class="name">Lucasoto<br>Marsh</span>
                                                <span class="position">Central Attacking Midfielder</span>
                                                <span class="number">7</span>
                                            </span>
                                            <img src="/images/baseball/stuff-person.jpg"  alt="person-slider">
                                        </a>	
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- Controls -->
                    <a class="nav-arrow left-arrow" href="#firstteam_carousel" role="button" data-slide="prev">
                        <i class="fa fa-angle-left" aria-hidden="true"></i>
                        <span class="sr-only"></span>
                    </a>
                    <a class="nav-arrow right-arrow" href="#firstteam_carousel" role="button" data-slide="next">
                        <i class="fa fa-angle-right" aria-hidden="true"></i>
                        <span class="sr-only"></span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>
<!--MAIN CLUB STAFF END-->


    <!--MAIN CLUB STAFF END-->

    <!--CALL TO ACTION BEGIN-->
<div class="call-to-action">
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-sm-9 col-xs-6">
                <div class="text">Become part of a great team</div>
            </div>
            <div class="col-md-2 col-sm-3 col-xs-6 text-right">
                <a href="contacts.html" class="join">Join us</a>
            </div>
        </div>
    </div>
</div>
<!--CALL TO ACTION END-->

    <!--MAIN TEAM STORE BEGIN-->

    <section class="main-team-store">

        <!--MAIN TEAM STORE CONTAINER BEGIN-->
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h4>Team Store</h4>
        </div>	
        <div class="col-md-10 col-xs-9">
            <ul class="tab-filters">
                <li class="active"><a data-toggle="tab" href="#hotdeals">판매인기상품</a></li>
            </ul>
        </div>
        <div class="col-md-2 col-xs-3 text-right">        
                <a id="show-all-link" href="/product/salesProdList?prodTeamCode=ALL">Show all</a>   	
        </div>
    </div>
</div>
<!--MAIN TEAM STORE CONTAINER END-->

        <!--MAIN TEAM STORE LIST BEGIN-->
<div class="main-store-list">
    <div class="container">
        <div class="tab-content">
            <div id="hotdeal" class="tab-pane fade in active">
                <div class="row">
                    <c:forEach var="bestTran" items="${bestTranList}">
                        <div class="col-md-3 col-sm-6">
                            <div class="store-list-item">
                                <div>
                                    <a href="product.html">
                                        <span class="store-badge hot">hot</span>
                                        <img src="/images/product/${bestTran.tranDetailProd.prodImageFirst }" alt="product-image">
                                    </a>
                                    <div class="info">
                                        <span class="name">${bestTran.tranDetailProd.prodName}</span>
                                        <span class="price"><input type="hidden" value="${bestTran.tranDetailProd.prodPrice}">
                                        <fmt:formatNumber value="${bestTran.tranDetailProd.prodPrice}" pattern="###,###"/>원 </span>	 
                                        <div class="btn-wrap">
                                 	       <a class="btn btn-detail">${bestTran.tranQuantity }개</a>
                                             <a href="/product/getProduct?prodNo=${bestTran.tranDetailProd.prodNo}" class="btn btn-detail">상세보기</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>   
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
<br>
<!--MAIN TEAM STORE LIST END-->

        <!--MAIN SPONSOR SLIDER BEGIN-->
<div class="main-sponsor-slider-background">
<div id="main-sponsor-slider" class="carousel slide main-sponsor-slider" data-ride="carousel">
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <div class="container">
                <div class="row">
                    <div class="col-xs-4 text-center">
                        <img class="sponsor-icons" src="/images/common/sponsor-img.png" alt="sponsor-image">	
                    </div>
                    <div class="col-xs-4 text-center">
                        <img class="sponsor-icons" src="/images/common/sponsor-img1.png" alt="sponsor-image">	
                    </div>
                    <div class="col-xs-4 text-center">
                        <img  class="sponsor-icons dota-csgo-image" src="/images/common/sponsor-img2.png" alt="sponsor-image">	
                    </div>
                </div>
            </div>	
        </div>
        <div class="item">
            <div class="container">
                <div class="row">
                    <div class="col-xs-4 text-center">
                        <img class="sponsor-icons" src="/images/common/sponsor-img.png" alt="sponsor-image">	
                    </div>
                    <div class="col-xs-4 text-center">
                        <img  class="sponsor-icons" src="/images/common/sponsor-img1.png" alt="sponsor-image">	
                    </div>
                    <div class="col-xs-4 text-center">
                        <img class="sponsor-icons dota-csgo-image" src="/images/common/sponsor-img2.png" alt="sponsor-image">
                    </div>
                </div>
            </div>	
        </div>
        <!-- Controls -->
        <a class="nav-arrow left-arrow" href="#main-sponsor-slider" role="button" data-slide="prev">
                <i class="fa fa-angle-left" aria-hidden="true"></i>
                <span class="sr-only">Previous</span>
        </a>
        <a class="nav-arrow right-arrow" href="#main-sponsor-slider" role="button" data-slide="next">
                <i class="fa fa-angle-right" aria-hidden="true"></i>
                <span class="sr-only">Next</span>
        </a>
    </div>	
</div>
</div>
<!--MAIN SPONSOR SLIDER END-->

    </section>

    <!--MAIN TEAM STORE END-->

    <!--FOOTER BEGIN-->
<footer class="footer">
    <div class="wrapper-overfllow">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-12">
                    <div class="footer-left">
                        <div class="wrap">
                            <a href="index.html" class="foot-logo"><img src="/images/baseball/footer-logo.png" alt="footer-logo"></a>
                            <p>Activated charcoal trust fund ugh prism af, beard marfa air plant stumptown gastropub farm-to-table jianbing.</p>
                            <ul class="foot-left-menu">
                                <li><a href="staff.html">First team</a></li>
                                <li><a href="staff.html">Second team</a></li>
                                <li><a href="amateurs.html">Amateurs</a></li>
                                <li><a href="donations.html">Donation</a></li>
                                <li><a href="trophies.html">trophies</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12 col-lg-offset-1">
                    <div class="foot-news">
                        <h4>Recent news</h4>
                        <div class="item">
                            <a href="news.html" class="image"><img class="img-responsive" src="/images/baseball/foot-news-img.jpg" alt="news-image"></a>
                            <a href="news.html" class="name">When somersaulting Sanchez shouldered Mexicoâs hopes</a>
                            <a href="news.html" class="date">25 Sep 2016</a>
                            <span class="separator">in</span>
                            <a href="news.html" class="category">Highlights</a>
                        </div>
                    </div>
                </div>
                <div class=" col-lg-3 col-md-4 col-sm-12">
                    <div class="foot-contact">
                        <h4>Contact us</h4>
                        <ul class="contact-list">
                            <li><i class="fa fa-flag" aria-hidden="true"></i><span>276 Upper Parliament Street, Liverpool L8, Great Britain</span></li>
                            <li><i class="fa fa-envelope" aria-hidden="true"></i><a href="mailto:team@email.com">team@email.com</a></li>
                            <li class="phone"><i class="fa fa-phone" aria-hidden="true"></i><span>+61 3 8376 6284</span></li>
                        </ul>
                        <ul class="socials">
                            <li><a href="#"><i class="fa fa-facebook-square" aria-hidden="true"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                            <li><a href="#"><i class="fa fa-google" aria-hidden="true"></i></a></li>
                            <li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
                            <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-menu-wrap">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <ul class="footer-menu">
                        <li class="active"><a href="index.html"><span>Home</span></a></li>
                        <li><a href="matches.html"><span>Matches</span></a></li>
                        <li><a href="staff.html"><span>Team</span></a></li>
                        <li><a href="news.html"><span>News</span></a></li>
                        <li><a href="store.html"><span>Store</span></a></li>
                        <li><a href="contacts.html"><span>Contact</span></a></li>
                    </ul>	
                    <a href="#top" class="foot-up"><span>up <i class="fa fa-caret-up" aria-hidden="true"></i></span></a>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="container">
            <div class="row">
                <div class="col-xs-6">
                    <div class="copyrights">
                        Â© 2017 Team - Sport club psd template
                    </div>
                </div>
                <div class="col-xs-6">
                    <div class="created">
                        <a href="#">Created by <img src="/images/common/created-icon.png" alt="create-by-image"> torbara</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!--FOOTER END-->

    <script type="text/javascript" src="/js/library/jquery.js"></script>
<script type="text/javascript" src="/js/library/jquery-ui.js"></script>
<script type="text/javascript" src="/js/library/bootstrap.js"></script>
<script type="text/javascript" src="/js/library/jquery.sticky.js"></script>
<script type="text/javascript" src="/js/library/jquery.jcarousel.js"></script>
<script type="text/javascript" src="/js/library/jcarousel.connected-carousels.js"></script>
<script type="text/javascript" src="/js/library/owl.carousel.js"></script>
<script type="text/javascript" src="/js/library/progressbar.js"></script>
<script type="text/javascript" src="/js/library/jquery.bracket.min.js"></script>
<script type="text/javascript" src="/js/library/chartist.js"></script>
<script type="text/javascript" src="/js/library/Chart.js"></script>
<script type="text/javascript" src="/js/library/fancySelect.js"></script>
<script type="text/javascript" src="/js/library/isotope.pkgd.js"></script>
<script type="text/javascript" src="/js/library/imagesloaded.pkgd.js"></script>

<script type="text/javascript" src="/js/jquery.team-coundown.js"></script>
<script type="text/javascript" src="/js/matches-slider.js"></script>
<script type="text/javascript" src="/js/header.js"></script>
<script type="text/javascript" src="/js/matches_broadcast_listing.js"></script>
<script type="text/javascript" src="/js/news-line.js"></script>
<script type="text/javascript" src="/js/match_galery.js"></script>
<script type="text/javascript" src="/js/main-club-gallery.js"></script>
<script type="text/javascript" src="/js/product-slider.js"></script>
<script type="text/javascript" src="/js/circle-bar.js"></script>
<script type="text/javascript" src="/js/standings.js"></script>
<script type="text/javascript" src="/js/shop-price-filter.js"></script>
<script type="text/javascript" src="/js/timeseries.js"></script>
<script type="text/javascript" src="/js/radar.js"></script>
<script type="text/javascript" src="/js/slider.js"></script>
<script type="text/javascript" src="/js/preloader.js"></script>
<script type="text/javascript" src="/js/diagram.js"></script>
<script type="text/javascript" src="/js/bi-polar-diagram.js"></script>
<script type="text/javascript" src="/js/label-placement-diagram.js"></script>
<script type="text/javascript" src="/js/donut-chart.js"></script>
<script type="text/javascript" src="/js/animate-donut.js"></script>
<script type="text/javascript" src="/js/advanced-smil.js"></script>
<script type="text/javascript" src="/js/svg-path.js"></script>
<script type="text/javascript" src="/js/pick-circle.js"></script>
<script type="text/javascript" src="/js/horizontal-bar.js"></script>
<script type="text/javascript" src="/js/gauge-chart.js"></script>
<script type="text/javascript" src="/js/stacked-bar.js"></script>

<script type="text/javascript" src="/js/library/chartist-plugin-legend.js"></script>
<script type="text/javascript" src="/js/library/chartist-plugin-threshold.js"></script>
<script type="text/javascript" src="/js/library/chartist-plugin-pointlabels.js"></script>

<script type="text/javascript" src="/js/treshold.js"></script>
<script type="text/javascript" src="/js/visible.js"></script>
<script type="text/javascript" src="/js/anchor.js"></script>
<script type="text/javascript" src="/js/landing_carousel.js"></script>
<script type="text/javascript" src="/js/landing_sport_standings.js"></script>
<script type="text/javascript" src="/js/twitterslider.js"></script>
<script type="text/javascript" src="/js/champions.js"></script>
<script type="text/javascript" src="/js/landing_mainnews_slider.js"></script>
<script type="text/javascript" src="/js/carousel.js"></script>
<script type="text/javascript" src="/js/video_slider.js"></script>
<script type="text/javascript" src="/js/footer_slides.js"></script>
<script type="text/javascript" src="/js/player_test.js"></script>

<script type="text/javascript" src="/js/main.js"></script>
    
    

	
</body>

</html>
