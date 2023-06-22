<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
		<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-solid-rounded/css/uicons-solid-rounded.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-solid-rounded/css/uicons-solid-rounded.css'>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>야구루트</title>
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script type="text/javascript">
    	//따라다니는 퀵메뉴
		/* $(document).ready(function(){
			var currentPosition = parseInt($(".quickmenu").css("top"));
			$(window).scroll(function() {
		   	var position = $(window).scrollTop(); 
		   	$(".quickmenu").stop().animate({"top":position+currentPosition+"px"},700);
		  	});
			
		  	$('.quickmenu li a[href="#back"]').click(function(e) {
				history.back();
		 	});
		  	
		  	$('.quickmenu li a[href="#forward"]').click(function(e) {
			   history.forward();
		 	});
		}); */
		//따라다니는 퀵메뉴 끝
    
    	// 로그아웃 버튼 구현
    	$(function(){
    		$('a.getNotice').click("onclick", function(){
    			var postNo = $(this).siblings("input.postNo").val();
    			self.location="/post/getPost?postNo="+postNo;
    		})
    		
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
					    	console.log(tmpGame.gameCode)
					    	var gameState = tmpGame.gameStatusCode 
					    	var message = (gameState === '0' ? '준비중' : (gameState === '1' ? 'LIVE' : (gameState === '2' || gameState === '4' ? '경기종료' : '경기취소')));
					    	var tmpClass = (gameState === '1' ? 'stream' : (gameState === '0' || gameState === '2' || gameState === '4' ? 'atag' : 'cancel'));
					    	var location = (gameState === '0' ? '/game/getGamePreview?gameCode='+tmpGame.gameCode : (gameState === '1' ? '/channel/getStreaming?gameCode='+tmpGame.gameCode : (gameState === '2' || gameState === '4' ? '/game/getGameRecord?gameCode='+tmpGame.gameCode : '경기취소')));
					    	tmpItem += '<div id="'+tmpGame.gameCode+'" class="item '+(k===0 ? 'active' : '')+ '">'+
					    	'<a class="first-slide" href="'+location+'">'+
						    	'<div style="position: relative;" class="score">'+
						          	'<img src="'+tmpGame.homeTeam.teamTopBar+'" alt="First slide" style="width: auto;height: 245px;">'+
						          	'<h1 style="position: absolute; top: 20%; transform: translateY(-50%); right: 5%;color:#EEEEEE;">'+tmpGame.homeTeam.teamNickName+'</h1>'+
						          	'<h5 class="'+tmpClass+'" style="position: absolute; top: 50%; transform: translateY(-80%); right: 80%;">'+message+'</h5>'+
						          	'<img class="first-slide" src="/images/ticket/vs.png" alt="vs" style="width: auto;height: 200px; position: absolute; top: 50%; transform: translateY(-55%); right: 0;">'+
						          	'<img class="first-slide" src="'+tmpGame.awayTeam.teamTopBar+'" alt="Second slide" style="width: auto;height: 245px;">'+
						          	'<h1 style="position: absolute; top: 70%; transform: translateY(-50%); right: 5%;color:#EEEEEE;">'+tmpGame.awayTeam.teamNickName+'</h1>'+
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
    	
    </script>
    
    
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
    		font-family: "Gwangyang" !important;
    	}
		.table-css td,.table-css th{
    		font-size: 15px !important;
    		font-weight: 500 !important;
    		font-family: "Gwangyang" !important;
    	}
    	.table-css td:nth-child(2),th:nth-child(2){
    		width: 200px;
    		padding-left: 0px !important;
    	}
    	/* 따라다니는 퀵메뉴 */
		/* 
		div, ul, li {-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;padding:0;margin:0}
		a {text-decoration:none;}
		.quickmenu {position:absolute;width:50px;top:70%;margin-top:-70px;right:10px;background:#fff;}
		.quickmenu ul {position:relative;float:left;width:100%;display:inline-block;*display:inline;border:1px solid #ddd;}
		.quickmenu ul li {float:left;width:100%;border-bottom:1px solid #ddd;text-align:center;display:inline-block;*display:inline;}
		.quickmenu ul li a {position:relative;float:left;width:100%;height:50px;line-height:50px;text-align:center;color:#999;font-size:9.5pt;}
		.quickmenu ul li a:hover {color:#000;}
		.quickmenu ul li:last-child {border-bottom:0;}
		.content {position:relative;min-height:1000px;}
		.glyphicon {
 			font-family: 'Glyphicons Halflings' !important;
		}
		 */
		/*퀵메뉴 끝*/
		div,span,a,h2,td,th,tr{
			font-family:"Gwangyang" !important;
		}
		span{
			font-size:16px;
		}
		span.championship{
			font-size:14px !important;
		}
		.sponsor-icons{
			width:500px;
		}
		#back-img {
		  position: fixed;
		  width: 100%;
		  height: 100vh;
		  overflow: hidden;
		}
		
	/* div.container.bestPost{
	    background-color: rgba(255, 255, 2, 0.8) !important; /* 흰색 배경과 투명도 조절 */
	  } */ 
	  
	  div.col-md-12{
	  		display:flex;
	  		justify-content:center;
	  		align-items: center;
	  }
	  	i.fi-sr-heart {
	  		color:#ff0000;
	  }
	  .fa-2x,div.comment-quantity{
	  		font-size:16px !important;
	  }
	  
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
<!-- <a type="hidden" id="top"/> -->
<jsp:include page="/common/loading.jsp"/>
<jsp:include page="/common/topBar.jsp"/>

<!-- <section class="image-header" style="min-height: 0px;height: 0px;  z-index: -1;">
	<div class="row">
		<div class="col-md-12" >
           	<img id="back-img" src="/images/background/ballpark.jpg" alt="img">
        </div>	
	</div>
</section>  -->



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
                    			 <input type="hidden" class="postNo" value="${noticeList[0].postNo}">
                            <a href="javascript:;" class="getNotice">
                                <span class="date notice">${postDateList[0]}<span>/</span>
                                </span>	
                                <span class="news notice">${noticeList[0].postTitle}</span>
                            </a>
	                     </div>
                    		<c:set var="size" value="${noticeList.size()}"/>
								<c:forEach var="i" begin="1" end="${size -1}" step="1">
	                        <div class="item">
	                        	 <input type="hidden" class="postNo" value="${noticeList[i].postNo}">
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

<!-- 팀 순위 -->
	<section class="main-match-shedule">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<h2 style="text-align: center; margin-top: 50px;">Today's Match</h2>
				</div>
				<div class="col-md-12 col-sm-12 col-xs-12" style="text-align: center; display: none;">
					<h1 id="noGame">안녕하세요</h1>
				</div>
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
				<div class="col-md-12 col-sm-12 col-xs-12">
					<h2 style="text-align: center; margin-top: 100px;">팀 순위</h2>
				</div>
				<div class="col-md-12">
					<h4 id="nowYear"></h4>
					<table class="table-standings" id="teamRanking">
						<tr class="table-css">
							<th>순위</th>
							<th>팀</th>
							<th style="width: 50px; padding-right: 50px;"></th>
							<th>경기</th>
							<th>승리</th>
							<th>무승부</th>
							<th>패배</th>
							<th>승률</th>
						</tr>
					</table>
				</div>
				
			</div>
		</div>
	</section>
<!-- 팀 순위 끝 -->
<hr>
<div class="container">
	<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<h2 style="text-align: center; margin-top: 50px;">Best Player</h2>
		</div>
		<div class="col-md-12" style="text-align: center; ">
			<a href="/player/listBestPlayer">
				<img src="/images/player/KBOLEGEND_2.png" style="width:70%;">
			</a>
		</div>
	</div>
</div>
<!-- <hr> -->
    <!--     MAIN SPONSOR SLIDER BEGIN
<div id="main-sponsor-slider" class="carousel slide main-sponsor-slider" data-ride="carousel">
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 text-center">
                    		<a href="/ticket/getGameList2w?teamCode=NC">
                        <img class="sponsor-icons" src="/images/ticket/낙동강더비.png" alt="sponsor-image">
                        </a>	
                    </div>
                </div>
            </div>	
        </div>
        <div class="item">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 text-center">
                    		<a href="https://allstar.koreabaseball.com/Default.aspx">
                        <img class="sponsor-icons" src="/images/ticket/올스타전1.png" alt="sponsor-image">
                        </a>	
                    </div>
                </div>
            </div>	
        </div>
        <div class="item">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 text-center">
                    		<a href="https://allstar.koreabaseball.com/Default.aspx">
                        <img class="sponsor-icons" src="/images/ticket/올스타전2.png" alt="sponsor-image">
                        </a>	
                    </div>
                </div>
            </div>	
        </div>
        Controls
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
MAIN SPONSOR SLIDER END -->



<hr>
<!--인기 게시물 Best 5-->
<div class="container bestPost">
    <div class="row">
        <div class="col-md-12">
            <h2>
            	인기 게시물 Best 4
            </h2>
            <div class="row">
            	  <c:forEach var="bestPost" items="${bestPostList}">
                 <div class="col-md-3">
                     <div style="display: flex;">
                     	<img src="${bestPost.user.userImage}" style="width:50px;object-fit: cover; display: block; margin-right: auto; " alt="succes-icon"> 
                     	<img src="/images/teamEmblem/${bestPost.user.teamCode}.png" style="width:50px; object-fit: cover; display: block;  margin-left: auto;">
                     </div>
                     <div class="title">${bestPost.user.userNickName }</div>
                     <a href="/post/getPost?postNo=${bestPost.postNo}" style="font-size:20px;">${bestPost.postTitle}</a>
                     <div>
							<div class="comment-quantity" style="display: inline-block;">Views ${bestPost.postViews} &nbsp;&nbsp;</div>
							<div class="comment-quantity" style="display: inline-block;"><i class="fi fi-sr-heart fa-2x"> ${bestPost.postLikes}</i> &nbsp;&nbsp;</div>
							<div class="comment-quantity" style="display: inline-block;"> <i class="fi fi-rr-comment-alt"></i>${bestPost.postComments} </div>
                 		</div>
                 </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>	
<!--인기 게시물 Best 5-END-->
<hr>

<!-- 상품 시작 -->

						
<div class="main-store-list">
    <div class="container">
        <div class="tab-content">
            <div id="hotdeal" class="tab-pane fade in active">
                <div class="row">
                <h2>
                	인기 상품
                </h2>
                    <c:forEach var="bestTran" items="${bestTranList}">
                        <div class="col-md-3 col-sm-6">
                            <div class="store-list-item">
                                <div>
                                    <a>
                                        <span class="store-badge hot">hot</span>
                                        <img style="height: 250px;" src="${bestTran.tranDetailProd.prodImageFirst }" alt="product-image">
                                    </a>
                                    <div class="info">
                                        <span class="name"><c:choose>
														    <c:when test="${team.teamCode eq 'HH'}">[한화 이글스]</c:when>
														    <c:when test="${team.teamCode eq 'SS'}">[삼성 라이온스]</c:when>
														    <c:when test="${product.prodTeamCode eq 'HT'}">[기아 타이거즈]</c:when>
														    <c:when test="${product.prodTeamCode eq 'SK'}">[SSG 랜더스]</c:when>
														    <c:when test="${product.prodTeamCode eq 'LG'}">[LG 트윈스]</c:when>
														    <c:when test="${product.prodTeamCode eq 'OB'}">[두산 베어스]</c:when>
														    <c:when test="${product.prodTeamCode eq 'KT'}">[KT 위즈]</c:when>
														    <c:when test="${product.prodTeamCode eq 'LT'}">[롯데 자이언츠]</c:when>
														    <c:when test="${product.prodTeamCode eq 'WO'}">[키움 히어로즈]</c:when>
														    <c:when test="${product.prodTeamCode eq 'NC'}">[NC 다이노스]</c:when>
														    <c:otherwise>팀 정보 없음</c:otherwise>
														  </c:choose><br>${bestTran.tranDetailProd.prodName}</span>
                                        <span class="price"><input type="hidden" value="${bestTran.tranDetailProd.prodPrice}">
                                        <fmt:formatNumber value="${bestTran.tranDetailProd.prodPrice}" pattern="###,###"/>원 </span>	 
                                        <div class="btn-wrap">
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
<hr>




    <!--MAIN TEAM STORE END-->

<!-- 퀵메뉴 -->
<!-- <div class="quickmenu">
  <ul>
    <li><a href="#top"><span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span></a></li>
    <li><a href="#bottom"><span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></a></li>
    <li><a href="#back"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span></a></li>
    <li><a href="#forward"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></a></li>
  </ul>
</div>    -->  
<jsp:include page="/common/quickMenu.jsp"/>

<!-- <a type="hidden" id="bottom"/> -->

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
