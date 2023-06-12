<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      
<!DOCTYPE html>
<!-- saved from url=(0040)https://fifaonline4.nexon.com/datacenter -->
<html lang="ko"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
        <title>선수 조회</title>
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
	    background: #fff url(/images/user/image.png) center 0 no-repeat;
	}
		.sub .datacenter .tab_list.large ul li a {
	    background-color: #2a2ac7;
	}
		.sub .datacenter .tab_list.large ul li {
	    border-color: #000000;
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
    <h1 style="font-family: 'Gwangyang';">선수 조회</h1>
    <div class="desc" style="font-family: 'Gwangyang';">YAGU ROUTE™ 야구루트의 다양한 데이터를 만나보세요.</div>
    

<script type="text/javascript">
    
	function fncGetPlayerList(currentPage) {
		
		alert(currentPage);
		$("#currentPage").val(currentPage);
		alert($("#currentPage").val());
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
			 alert("searching ㅎㅇ");
			fncGetPlayerList(1);
		});
		 
		 $("a[href='teamCodeHref']").on('click',function(){
			 
			 alert("teamCode ㅎㅇ");
			 
	         teamCode = $(this).find("input[name='teamCode']").val()
	       	 alert(teamCode);
	    	 self.location = "/player/listPlayer?teamCode="+teamCode;
		});
	});
	
	$(document).keydown(function(event) {
		  if (event.which === 13) {
		    // 엔터 키를 눌렀을 때 수행할 동작을 여기에 작성
		    loginFunction();
		  }
	});
	
	/* $(function(){
		
		$("td:nth-child(1)").on("click", function(){
			self.location.href="/player/getPlayer?playerId="+$(this).text().trim();
		});
		$( "td:nth-child(1)" ).css("color" , "green");
	}); */
	
</script>

<div class="coach_area">
</div>
</div>
<div class="tab_list large" style="font-family: 'Gwangyang';">
    <ul class="nav nav-tabs" role="tablist">
            <c:forEach var="team" items="${allTeam}">
                <li class="${team.teamCode eq teamCode ?'active':''}" role="presentation">
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

			
			<form role="form" id="form1" >	
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
                
       			<input type="hidden" id="playerTeamCode" name="playerTeamCode" value="${player.teamCode}" /> 
				<input type="hidden" id="currentPage" name="currentPage" value="" />
                
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

                <div class="thumb"><img src="${player.playerImage}" alt="" onerror="this.src=&#39;https://fo4.dn.nexoncdn.co.kr/live/externalAssets/common/players/not_found.png&#39;"></div>
                <div class="info_top">
                    <div class="season">&nbsp;</div>
                    <div class="name">${player.playerName}</div>
                    <input type="hidden" name="Strong100140601" value="1/3">
                </div>
                <div class="info_middle">
                        &nbsp;&nbsp;&nbsp;<span class="position df"><span class="txt">${player.playerPosition}</span><span class="skillData_100140601">${player.playerNumber}</span> </span>
				</div>
                <div class="info_bottom">
                    &nbsp;&nbsp;&nbsp;<a href="javascript:;" data-no="100140601" class="btn_preview"><span></span></a>
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
                    <span class="skillData_100140601" data-type="sprintspeed">
                        ${player.playerBirth}
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
                        ${player.teamCode}
                    </span>
                </span>
        </div>

        <div class="td td_ar_bp bp_100140601">
            <span class="span_bp1" style="">${player.playerSalary}만원</span>
        </div>
        <div class="td td_ar_score"><span>${player.playerNumber}</span></div>
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
<div id="playerPreview" class="pointer_popup layer_preview" style="display:none">

</div>

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