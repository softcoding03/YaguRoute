<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  
<!DOCTYPE html>
<!-- saved from url=(0040)https://fifaonline4.nexon.com/datacenter -->
<html lang="ko"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
    <title>야구ROUTE</title>
   	<link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
    <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/player/fo4_ssl.css" media="all">
    
    <style>
    .player_list .player_list_wrap .thead .th.default {
    /* line-height: 80px; */
	    font-size: 20px;
	    color: #7a7984;
	    width: 439px;
	}
	.player_list .player_list_wrap .thead .th {
	    line-height: 60px;
	    font-size: 14px;
	    color: #7a7984;
	    position: relative;
	    vertical-align: top;
	    text-align: center;
	    height: 70px;
	    float: left;
	    border-right: 1px solid #3e3d55;
	    width: 91px;
	}
		#middle.sub>div.datacenter {
	    background: #fff /images/player/playerG.pngrl(\) center 0 no-repeat !important; 
	}
		.sub .datacenter .tab_list.large ul li a {
	    /*background-color: #2a2ac7;*/
	}
		/* .sub .datacenter .tab_list.large ul li {
	    border-color: #000000;
	} */
	.pointer_popup .content_header .pay_side {
	    position: absolute;
	    top: 29px;
	    right: 415px;
	    line-height: 38px;
	    text-align: center;
	    background-image: url(https://ssl.nexon.com/s2/game/fo4/obt/sprite_210600.png);
	    background-position: 0px -723px;
	    width: 37px;
	    height: 38px;
	    margin-top: 5px;
	}
	.pointer_popup .content_middle {
		    width: 700px;
		    height: 165px;
		    background: #edeff8;
		    overflow: hidden;
		    box-shadow: inset 0 8px 22px rgba(0,0,0,.4);
		    border-radius: 6px;
		}
	.pointer_popup .content_header .info_wrap .info_line.info_etc span {
		    display: unset;
		    position: relative;
		    padding-right: 14px;
		    margin-right: 12px;
		    float: none;
		    font-size: 20px;
		    top: 67px;
		}
		.close {
		    float: right;
		    font-size: 21px;
		    font-weight: 700;
		    line-height: revert;
		    color: #000;
		    text-shadow: 0 1px 0 #fff;
		    opacity: 0.2;
		    display: contents;
		}
    </style>
    
       <style>
        /* 모달 스타일 */
        .modal {
            display: none; /* 초기에는 숨김 */
            position: fixed; /* 화면에 고정 */
            z-index: 9999; /* 다른 요소보다 위에 표시 */
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* 반투명한 배경 */
        }
        

        .modal-content {
		    background-color: #fff;
		    margin: 10% auto;
		    padding: 20px;
		    border: 1px solid #ccc;
		    width: 701px;
		    max-width: 90%;
		    text-align: center;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
		    height: 416px;
		}

        .close {
        	position: inherit;
		    color: #aaa;
		    float: inline-end;
		    font-size: 44px;
		    font-weight: bold;
		    cursor: pointer;
		}
        
        .pointer_popup .content_header .info_wrap .info_line {
		    margin-bottom: -2px;
		}
		.pointer_popup .content_middle ul li {
		    float: left;
		    width: 114px;
		    text-align: center;
		    padding-top: 22px;
		    zing: border-box;
		}
		.pointer_popup .content_header .thumb {
		    position: absolute;
		    top: 4px;
		    left: 11px;
		    width: 140px;
		    height: 205px;
		}
		.pointer_popup .content_header .thumb .img img {
		    width: 122px;
		    height: 113px;
		}
		.pointer_popup .content_header .thumb .card_back img {
		    width: 187px;
		    height: 244px;
		}	
		.pointer_popup .content_header .thumb .img {
		    position: absolute;
		    top: 41px;
		    right: -20px;
		    z-index: 1;
		    overflow: hidden;
		    width: 131px;
		    height: 170px;
		}
		.pointer_popup .content_header .thumb .pay {
		    position: absolute;
		    bottom: -11px;
		    left: 68%;
		    width: 32px;
		    height: 18px;
		    background-color: rgba(0,0,0,0);
		    margin: 8.66px 0;
		    border-left: solid 2px #a7a9ae;
		    border-right: solid 2px #a7a9ae;
		    transform: scale(0.55) translateX(-30px);
		    font-size: 17px;
		    color: #3f434a;
		    text-align: center;
		    font-weight: bold;
		    font-family: "EASANS";
		    line-height: 20px;
		    font-weight: 600;
		    letter-spacing: 1px;
		    opacity: .74;
		}
		.pointer_popup .content_header .thumb .name_wrap {
		    width: 100%;
		    position: absolute;
		    top: 160px;
		    left: 21px;
		    text-align: center;
		}
		.pointer_popup .content_header .thumb .name_wrap .name {
		    font-size: 19px;
		    display: inline-block;
		    max-width: 93px;
		    white-space: nowrap;
		    overflow: hidden;
		    text-overflow: ellipsis;
		    font-family: 'Gwangyang';
		}
		.pointer_popup .content_header .info_wrap .info_line .position span {
	    margin-right: 8px;
	    vertical-align: text-bottom;
	    font-size: 25px;
	    font-family: 'Gwangyang';
	}
	#middle.sub>div.datacenter {
    	background: #fff url(/images/player/playerALL.jpg) center 0 no-repeat;
    	background-size: 1920px;
	}
	.sub .datacenter .tab_list.large ul li a {
    	background-color: #1c459d;
	}
	.sub .datacenter .tab_list.large ul li {
    	border-color: #16105b;
	}
	#middle.sub .board_header .tit {
    	padding-top: 290px;
	}
	#middle.sub .board_header {
    	height: 480px;
    	position: relative;
	}
    </style>
    
<jsp:include page="/common/topBar.jsp"></jsp:include>
<body class="default">
<main id="middle" class="sub">
    <input type="hidden" id="hidParam" value="">
    <!-- 데이터센터 -->
    <div class="datacenter">
        <input type="hidden" id="PlayerVs1" value="">

        <div class="wrap">
            <div class="board_header">                
                

<div class="tit">
    <h1 style="font-family: 'Gwangyang'; text-align: right;">선수 조회</h1>
    <div class="desc" style="font-family: 'Gwangyang'; text-align: right;">YAGU ROUTE™ 야구루트의 다양한 데이터를 만나보세요.</div>
    

<script type="text/javascript">
    
	function fncGetPlayerList(currentPage) {
		
		$("#currentPage").val(currentPage);
		 $("form").attr("method" , "GET").attr("action" , "/player/listPlayer").submit();
		
		/* self.location.href="/player/listPlayer?currentPage="+currentPage; */
		
		}
	
	$(function() {
		 
		// teamCode 누르면 조회되는 방식
		$("button.btn-success").on("click", function() {
			$("#playerTeamCode").val($(this).val());
			fncGetPlayertList(1);
		});
		
		 $( "#searching" ).on("click" , function() {
			 
			 var searchKeyword = $("#searchKeyword").val();
			    
			 if(searchKeyword.length <= 1){
			    	alert("최소 두 자 이상 검색해 주세요.");
			    	document.getElementById("searchKeyword").value = "";
			    	window.location.href = "/player/listPlayer";
			 }
			 
			fncGetPlayerList(1);
		});
		 
		 $("a[href='teamCodeHref']").on('click',function(){
			 
	         teamCode = $(this).find("input[name='teamCode']").val()
	    	 self.location = "/player/listPlayer?teamCode="+teamCode;
		});
	});
	
	$(document).keydown(function(event) {
		  if (event.which === 13) {
		    // 엔터 키를 눌렀을 때 수행할 동작을 여기에 작성
		    
		    var searchKeyword = $("#searchKeyword").val();
		    
		    if(searchKeyword.length <= 1){
		    	alert("최소 두 자 이상 검색해 주세요.");
		    	document.getElementById("searchKeyword").value = "";
		    	window.location.href = "/player/listPlayer";
		    }
		    
		    fncGetPlayerList(1);
		  }
	});
	
	$(function(){
		
		$("a[href='preview']").on('click',function(){
			 event.preventDefault();
	         playerId = $(this).find("span[id='playerId']").text().trim();
	         /* self.location.href="/player/getPlayer?playerId="+playerId; */
	         document.getElementById("myModal").style.display = "block";
	         
	         $.ajax({
	 	        url: "/player/getPlayer/",
	 	        method: "GET",
	 	        dataType: "json",
	 	        data: {playerId: playerId},
	 	        success: function(Player) {
	 	        	console.log(Player);
	 	        	
	 	        	// 생년월일 로직
	 	        	var playerBirth = Player.playerBirth;
	 	        	var year  = playerBirth.slice(0,4);
	 	        	var month = playerBirth.slice(4,6);
	 	        	var day = playerBirth.slice(6,8);
	 	        	var settingBirth = year+"-"+month+"-"+day;
	 	        	
	 	        	var teamCode = "${teamCode}";
	 	        	var allTeamString = "${allTeam}";

	 	        	// JSTL 표현식 내의 따옴표와 공백 제거
	 	        	allTeamString = allTeamString.replace(/["'\s]/g, '');

	 	        	// 리스트로 변환
	 	        	var allTeam = allTeamString.split(',');

	 	        	var extractedTeamCode = null;

	 	        	// teamCode 추출
	 	        	for (var i = 0; i < allTeam.length; i++) {
	 	        	  var currentTeamCode = allTeam[i].split('=')[1]; // "teamCode=값"에서 값을 추출
	 	        	  if (currentTeamCode === teamCode) {
	 	        	    extractedTeamCode = currentTeamCode;
	 	        	    break;
	 	        	  }
	 	        	}

	 	        	console.log(extractedTeamCode);
	 	        	
	 	        	$("#playerName1").text(Player.playerName);
	 	        	$("#playerName2").text(Player.playerName);
	 	        	$("#playerHeight").text(Player.playerHeight+"cm");
	 	        	$("#playerBirth").text(settingBirth);
	 	        	$("#playerWeight").text(Player.playerWeight+"kg");
	 	        	$("#playerPosition").text(Player.playerPosition);
	 	        	$("#playerNumber1").text(Player.playerNumber);
	 	        	$("#playerNumber2").text(Player.playerNumber);
	 	        	$("#playerNumber3").text(Player.playerNumber);
	 	        	$("#era").text(Player.era);
	 	        	$("#battingAvg").text(Player.battingAvg);
	 	        	$("#hitter").text(Player.hitter);
	 	        	$("#stolenBase").text(Player.stolenBase);
	 	        	$("#threeOut").text(Player.threeOut);
	 	        	$("#homeRun").text(Player.homeRun);
	 	        	$('#playerImage1').attr('src', Player.playerImage);
	 	        	$('#teamCode').attr(Player.teamCode);
	 	        },
	 	        error: function(xhr, status, error) {
	 	            alert("오류 발생(이유) : " + error);
	 	            return;
	 	          }
	 	      });
		});
	});
	    
	 $(function(){
		
		 $("#close").on("click", function(){
			
			 console.log("창 닫기");
			 
			 document.getElementById("myModal").style.display = "none";
		 });
	 });
	 
	 window.addEventListener("click", function(event){
		
		 var modal = document.getElementById("myModal");
		 //var modal = $("#myModal");
		 if(event.target == modal){
			
			modal.style.display = "none"; 
		 }
	 });
	 
	 $(function(){
		
		 $(".btn_reset").on("click", function(){
			
			 window.location.href="/player/listPlayer";
		 });
	 });

</script>

<div class="coach_area">
</div>
</div>

<div class="tab_list large" style="font-family: 'Gwangyang';"> <!-- pointer-events: none; -->
    <ul class="nav nav-tabs" role="tablist">
            <c:forEach var="team" items="${allTeam}">
                <li class="${team.teamCode eq (teamCode == null ? 'ALL' : teamCode) ? 'active' : ''}" role="presentation">
                    <a href="teamCodeHref" role="tab" data-toggle="tab">
                        <img alt="img" src="${team.teamEmblem}" style="width: 37px; height: 33px;" >
                        <span class="info">
                            <span class="title">${team.teamNickName}</span>
                            <input type="hidden" name="teamCode" value="${team.teamCode}"/>
                        </span> 
                    </a>
                </li>
            </c:forEach>
        </ul>
</div> 


 
</div>

			
			
            <div class="player_view">
                <div class="header">
                    <div class="tit" style="font-family: 'Gwangyang'">선수 검색</div>
                </div>
            </div>
				
                총 ${resultPage.totalCount } 명의 선수가 검색되었습니다.
                
                <%-- <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>선수이름</option>
					</select>
				</div> --%>
                <%-- <p>${allTeam}</p> --%>
                <form role="form" id="form1" >
	                <div class="search_panel">
	                    <div class="search_input_name">
	                        <input type="text" id="searchKeyword" name="searchKeyword" style="font-family: 'Gwangyang'" placeholder="선수명을 입력해주세요." value="${! empty search.searchKeyword ? search.searchKeyword : '' }"></div>
	                    <div class="search_input_detail">
	                    </div>
	                    <div class="search_input_submit">
	                        <button type="button" class="btn_search" id="searching" style="font-family: 'Gwangyang'" >검색</button>
	                        <button type="button" class="btn_reset" style="font-family: 'Gwangyang'" >초기화</button>
	                    </div>
	                </div>
                <input type="hidden" id="playerTeamCode" name="teamCode" value="${search.teamCode}" /> 
				<input type="hidden" id="currentPage" name="currentPage" value="" />
              	</form> 
            <div class="player_list">
                <div class="content">
                    <div class="player_list_wrap">
                        <div class="thead">
                            <div class="tr">
                                <div class="th default" style="font-family: 'Gwangyang'; line-height: 60px;">기본정보</div>
                                <div class="th pay" style="font-family: 'Gwangyang'">
                                    선수 등번호
                                </div>
                                <div class="th th_ar ovr" style="font-family: 'Gwangyang'">
                                    <span>포지션<em>(기본포지션)</em></span>
                                </div>
                                <div class="th th_ar">
                                    <a style="font-family: 'Gwangyang'"><span>생년월일</span></a>
                                </div>
                                <div class="th th_ar">
                                    <a style="font-family: 'Gwangyang'"><span>신장</span></a>
                                </div>
                                <div class="th th_ar">
                                    <a style="font-family: 'Gwangyang'"><span>몸무게</span></a>
                                </div>
                                <div class="th th_ar">
                                    <a style="font-family: 'Gwangyang'"><span>구단</span></a>
                                </div>
                                <div class="th th_ar_bp" style="font-family: 'Gwangyang'">
                                    선수 가치(연봉기준)
                                </div>
                                <div class="th th_ar_score" style="font-family: 'Gwangyang'">
                                    타수
                                </div>
                            </div>
                        </div>
                        <div class="tbody">
                            <div id="divPlayerList">
		<tr>
		<c:set var="i" value="0" />
		  				<c:forEach var="player" items="${list}">
						<c:set var="i" value="${ i+1 }" />
						<tr>
        <div class="td default">
            <div class="player_info">

                <div class="players_utils players_utils_100140601">
                </div>

                <div class="thumb">
                <a><img src="${player.playerImage}" alt="선수 이미지" onerror="this.src=&#39;https://fo4.dn.nexoncdn.co.kr/live/externalAssets/common/players/not_found.png&#39;"></a></div>
                <div class="info_top">
                    <div class="season">&nbsp;</div>
                    <div class="name">${player.playerName}</div>
                    <input type="hidden" name="Strong100140601" value="1/3">
                </div>
                <div class="info_middle">
                        &nbsp;&nbsp;&nbsp;<span class="position df"><span class="txt">${player.playerPosition}</span><span class="skillData_100140601">${player.playerNumber}</span> </span>
				</div>
				
                <div class="info_bottom">
                    &nbsp;&nbsp;&nbsp;<a href="preview" data-no="100140601" class="btn_preview">
                    <span class="playerId" id="playerId" hidden="">&nbsp;${player.playerId}</span>
                    </a>
                </div>
                
            </div>
        </div>
        <div class="td td_ar">
            <span class="pay">${player.playerNumber}</span>
        </div>
            <div class="td td_ar ">
                <span>
                    <span class="skillData_100140601">${player.playerPosition}</span>

                </span>
            </div>
        <div class="td td_ar">
                <span>
                    <span class="skillData_100140601" data-type="sprintspeed" id="castBirth">
                    	<c:set var="birthYear" value="${fn:substring(player.playerBirth, 0, 4)}" />
            			<c:set var="birthMonth" value="${fn:substring(player.playerBirth, 4, 6)}" />
            			<c:set var="birthDay" value="${fn:substring(player.playerBirth, 6, 8)}" />
                       	${birthYear}-${birthMonth}-${birthDay}
                    </span>
                </span>
        </div>
        <div class="td td_ar">
                <span>
                    <span class="skillData_100140601" data-type="acceleration">
                        ${player.playerHeight}cm
                    </span>
                    
                </span>
        </div>
        <div class="td td_ar">
                <span>
                    <span class="skillData_100140601" data-type="strength">
                        ${player.playerWeight}kg
                    </span>
                </span>
        </div>
        <div class="td td_ar">
                <span>
                    <span class="skillData_100140601" data-type="stamina">
                    	<c:forEach var="team" items="${allTeam}">
	                    	<c:if test="${team.teamCode eq player.teamCode }">
	                        	<img alt="구단 엠블럼" src="${team.teamEmblem}" style="width: 50px; height: 51px; position: inherit; top: -16px;"> 
	                    	</c:if>
                    	</c:forEach>
                    </span>
                </span>
        </div>
        <div class="td td_ar_bp bp_100140601">
        	<c:set var="salary" value="${player.playerSalary}"/>
            	<span class="span_bp1">
            		<fmt:formatNumber value="${salary * 10000}" pattern="#,###"/>₩
            </span>
        </div>        
        <div class="td td_ar_score"><span>${player.era}</span></div>
        </tr>
        </c:forEach>
        <jsp:include page="/common/pageNavigator_all.jsp">
        <jsp:param name="id" value="player"/>
        </jsp:include>
        </tr>
        </div>
        </div>
        
        </div>
        </div>
    </div>
    <!-- //데이터센터 -->
</main>
<!-- //MAIN -->
<!-- 미리보기 팝업 -->

<!-- 비교하기 팝업-->
<div id="playerCompare" class="compare_popup layer_compare">
</div>
	
        <!-- //MAIN -->
        <!-- 공통 FOOTER -->
        <footer id="footer" role="contentinfo">
    <div class="inner">
        <nav class="nav">
            <ul style="text-align: center; margin: auto;">
                <li class="menu1"><a href="http://company.nexon.com/" target="_blank" title="새창">회사소개</a></li>
                <li class="menu2"><a href="http://career.nexon.com/" target="_blank" title="새창">채용안내</a></li>
                <li class="menu3"><a href="https://member.nexon.com/policy/stipulation.aspx" target="_blank">이용약관</a></li>
                <li class="menu4"><a href="https://fifaonline4.nexon.com/datacenter#none" title="새창" onclick="$f.popup(&#39;/Content/common/gameuser.html&#39;, 500, 440); return false;">게임이용등급안내</a></li>
                <li class="menu5"><a href="https://member.nexon.com/policy/privacy.aspx" target="_blank" title="새창">개인정보처리방침</a></li>
                <li class="menu6"><a href="https://member.nexon.com/policy/youthprotection.aspx" target="_blank" title="새창">청소년보호정책</a></li>
                <li class="menu7"><a href="http://pcbang.nexon.com/" target="_blank" title="새창">넥슨PC방</a></li>
                <li class="menu8"><a href="https://fifaonline4.nexon.com/datacenter#none" title="새창" onclick="$f.popup(&#39;/Content/common/rule_operation.html&#39;, 800, 800); return false;">운영정책</a></li>
            </ul>
        </nav>
    </div>
</footer>


<!-- 모달 창 -->
<div id="myModal" class="modal">
<div class="modal-content">
<div id="playerPreview" class="pointer_popup layer_preview" style="display: block; position: absolute;  left: -0.8px; left: -1px; height: 407px; width: 700px;">
<div class="layer_content">
    <div class="wrap">
        <div class="content_header">
            <a href="#" class="btn_delete"><em></em><em></em></a>
            <div class="thumb icontm _ICONTM" >
                <div class="card_back"><img src="/images/player/icon.png" alt="카드 이미지"></div>
                <div class="img"><img id="playerImage1" src="" alt="" onerror="this.src = 'https://fo4.dn.nexoncdn.co.kr/live/externalAssets/common/players/not_found.png'"></div>
                <div class="live_wrap">
				
                </div>
                <div class="name_wrap">
                	<div class="season">
	                	<c:forEach var="team" items="${allTeam}">
		                	<c:if test="${team.teamCode eq player.teamCode}">
		                		<img src="${team.teamEmblem}" alt="구단 이미지1">
		                	</c:if>
	                	</c:forEach>
                	</div>
                	<div class="name" id="playerName1"></div>
                	</div>
                <div class="pay" id="playerNumber1"></div>
            </div>
            <div class="info_wrap">
                <div class="info_line info_name">
                    <div class="season"><c:forEach var="team" items="${allTeam}">
		                	<c:if test="${team.teamCode eq player.teamCode}">
		                		<img src="${team.teamEmblem}" alt="구단 이미지2">
		                	</c:if>
	                	</c:forEach></div>
                    <div class="name" id="playerName2" style="font-size: 25px;"></div>
                </div>
                <div class="info_line info_ab" style="position: inherit;">
                        <span class="position fw">
                        	<div>
                       	 		<span class="txt" id="playerPosition" style="font-family: 'Gwangyang'; font-size: 23px;"></span>
                       	 		<span class="skillData_100190045 value" id="playerNumber2"></span>
                        	</div>                        
                    </span>
                </div>
                <div class="info_line info_etc">
                	<div class="info"><br>
                    <span class="etc birth" id="playerBirth"></span>
                    <span class="etc height" id="playerHeight"></span>
                    <span class="etc weight" id="playerWeight"></span>
                    </div>
                </div>
                <div class="info_line">
                    <div class="etc team">

                    </div>
                </div>
            </div>
            <div class="pay_side" id="playerNumber3"></div>
        </div>
        <div class="content_middle">
            <ul>
                    <li class="ab">
                        <div class="txt">평균 자책점</div>
                        <div class="value over120" id="era"></div>
                    </li>
                    <li class="ab">
                        <div class="txt">타율</div>
                        <div class="value over120" id="battingAvg"></div>
                    </li>
                    <li class="ab">
                        <div class="txt">타수</div>
                        <div class="value over120" id="hitter"></div>
                    </li>
                    <li class="ab">
                        <div class="txt">홈런 수</div>
                        <div class="value over120" id="homeRun"></div>
                    </li>
                    <li class="ab">
                        <div class="txt">도루 수</div>
                        <div class="value over80" id="stolenBase"></div>
                    </li>
                    <li class="ab">
                        <div class="txt">삼진 수</div>
                        <div class="value over110" id="threeOut"></div>
                    </li>
            </ul>
        	</div>
   		 </div>
   		         		<div class="closed" id="close">
			<span class="close">&times;</span>
			</div>
		</div>
	</div>
</div>
</div>
<!-- 모달 창 종료 -->
<jsp:include page="/common/quickMenu.jsp"/>
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