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
    <!--[if lte IE 10]>
    <script>location.href = "https://fifaonline4.nexon.com/common/ie9";</script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="/css/player/fo4_ssl.css" media="all">
<jsp:include page="/common/topBar.jsp"></jsp:include>
<body class="default">

<script type="text/javascript" src="/js/player/ngb_bodystart.js" charset="euc-kr"></script>
<script type="text/javascript" src="/js/player/ngb_bodystart.js(1)" charset="euc-kr"></script>
<main id="middle" class="sub">
    <input type="hidden" id="hidParam" value="">
    <!-- 데이터센터 -->
    <div class="datacenter">
        <input type="hidden" id="PlayerVs1" value="">

        <div class="wrap">
            <div class="board_header">                
                

<div class="tit">
    <h1>선수조회</h1>
    <div class="desc">YaguROUTE의 다양한 데이터를 만나보세요.</div>
    

<script type="text/javascript">
</script>

<div class="coach_area">
</div>
</div>

<div class="tab_list large">
    <ul>
        <li class="tab8 "><a href="https://fifaonline4.nexon.com/datacenter/dailysquad">데일리차트</a></li>
        <li class="tab8 active"><a href="https://fifaonline4.nexon.com/datacenter">선수 정보</a></li>
        <li class="tab8 "><a href="https://fifaonline4.nexon.com/datacenter/manager">감독 정보/팀컬러</a></li>
        <li class="tab8 "><a href="https://fifaonline4.nexon.com/datacenter/rank">공식 경기 랭킹</a></li>
        <li class="tab8 "><a href="https://fifaonline4.nexon.com/datacenter/rank_volta_topplayer">볼타 라이브 랭킹</a></li>
        <li class="tab8 "><a href="https://fifaonline4.nexon.com/datacenter/rank_arena">아레나 모드 랭킹</a></li>
        <li class="tab8 "><a href="https://fifaonline4.nexon.com/datacenter/playergrow">강화 부스트 도우미</a></li>
        <li class="tab8 "><a href="https://fifaonline4.nexon.com/datacenter/squadmaker">스쿼드 메이커</a></li>
    </ul>
</div>                
            </div>

            <div class="player_view">
                <div class="header">
                    <div class="tit">선수 검색</div>
                </div>
            </div>

            <form role="form" id="form1" onsubmit="return false;">
                <input type="hidden" name="n1Confederation" value="0">
                <input type="hidden" name="n4LeagueId" value="0">
                <input type="hidden" name="strSeason">
                <input type="hidden" name="strPosition">
                <input type="hidden" name="strPhysical">
                <input type="hidden" name="n1LeftFootAblity" value="0">
                <input type="hidden" name="n1RightFootAblity" value="0">
                <input type="hidden" name="n1SkillMove" value="0">
                <input type="hidden" name="n1InterationalRep" value="0">
                <input type="hidden" name="n4BirthMonth" value="0">
                <input type="hidden" name="n4BirthDay" value="0">
                <input type="hidden" name="n4TeamId" value="0">
                <input type="hidden" name="n4NationId" value="0">
                <input type="hidden" name="strAbility1">
                <input type="hidden" name="strAbility2">
                <input type="hidden" name="strAbility3">
                <input type="hidden" name="strTrait1">
                <input type="hidden" name="strTrait2">
                <input type="hidden" name="strTrait3">
                <input type="hidden" name="strTraitNon1">
                <input type="hidden" name="strTraitNon2">
                <input type="hidden" name="strTraitNon3">
                <input type="hidden" name="n1Strong" value="1">
                <input type="hidden" name="n1Grow" value="0">
                <input type="hidden" name="n1TeamColor" value="0">
                <input type="hidden" name="strSkill1" value="sprintspeed">
                <input type="hidden" name="strSkill2" value="acceleration">
                <input type="hidden" name="strSkill3" value="strength">
                <input type="hidden" name="strSkill4" value="stamina">
                <input type="hidden" name="strSearchStatus" value="off">
                <input type="hidden" name="strOrderby">
                <input type="hidden" name="teamcolorid" value="0">
                <input type="hidden" name="strTeamColorCategory">
                <input type="hidden" name="n1History" value="0">
                <input type="hidden" name="n4PlayYear" value="0">
                
                <div class="search_panel">
                    <div class="search_input_name">
                        <input type="text" id="searchName" name="strPlayerName" placeholder="선수명을 입력해주세요." class="ui-autocomplete-input" autocomplete="off">
                    <div class="autoList"><ul id="ui-id-1" tabindex="0" class="ui-menu ui-widget ui-widget-content ui-autocomplete ui-front" style="display: none;"></ul></div></div>
                    <div class="search_input_detail">
                        
                    </div>
                    <div class="search_input_submit">
                        <button class="btn_search" onclick="DataCenter.SetSearch();">검색</button>
                        <button class="btn_reset" onclick="location.href=&#39;/datacenter&#39;">초기화</button>
                    </div>

                </div>
            </form>
            <div class="player_list">
                <div class="content">
                    <div class="player_list_wrap">
                        <div class="thead">
                            <div class="tr">
                                <div class="th default">기본정보</div>
                                <div class="th pay">
                                    급여
                                </div>
                                <div class="th th_ar ovr">
                                    <span>OVR<em>(기본OVR)</em></span>
                                </div>
                                <div class="th th_ar">
                                    <a href="https://fifaonline4.nexon.com/datacenter#" class="btn_ar_sort"><span>속력</span></a>
                                </div>
                                <div class="th th_ar">
                                    <a href="https://fifaonline4.nexon.com/datacenter#" class="btn_ar_sort"><span>가속력</span></a>
                                </div>
                                <div class="th th_ar">
                                    <a href="https://fifaonline4.nexon.com/datacenter#" class="btn_ar_sort"><span>몸싸움</span></a>
                                </div>
                                <div class="th th_ar">
                                    <a href="https://fifaonline4.nexon.com/datacenter#" class="btn_ar_sort"><span>스태미너</span></a>
                                </div>
                                <div class="th th_ar_bp">
                                    선수 가치(BP)
                                </div>
                                <div class="th th_ar_score">
                                    평가 점수
                                </div>
                            </div>
                        </div>
                        <div class="tbody">
                            <div id="divPlayerList">

        <div class="td default">
            <div class="player_info">

                <div class="players_utils players_utils_100140601">
                    <a href="https://fifaonline4.nexon.com/datacenter#" class="btn_collect " onclick="DataCenter.SetPlayerFavorit(this, 100140601, 1)"></a>
                    <a href="https://fifaonline4.nexon.com/datacenter#" onclick="DataCenter.GetPlayerGrow(this,100140601,$(&#39;#hidParam&#39;).val())" class="btn_boost_helper"></a>
                    <a href="https://fifaonline4.nexon.com/datacenter#" onclick="DataCenter.GetPlayerDetail(this,100140601,$(&#39;#hidParam&#39;).val(),2)" class="btn_detail_link"></a>
                    <a href="https://fifaonline4.nexon.com/datacenter#" class="btn_vs" onclick="DataCenter.GetPlayerCompare(100140601);"></a>
                </div>

                <div class="players_alert">
                    <div class="pop_collect collect_100140601">
                        <span class="ico ico_dt_arr_big"></span>
                        <p><span class="player">네마냐 비디치</span>(이)가<br>관심 선수로 등록 되었습니다.</p>
                    </div>
                    <div class="pop_alert alert_100140601">
                        <span class="ico ico_dt_ap_big"></span>
                        <p>관심 선수가 가득 차서 더 이상<br>등록이 안됩니다.</p>
                    </div>
                    <div class="pop_alert alert_del_100140601">
                        <span class="ico ico_dt_ap_big"></span>
                        <p><span class="player">네마냐 비디치</span>(이)가<br>관심 선수에서 삭제 되었습니다.</p>
                    </div>
                </div>

                <div class="thumb"><img src="/js/player/p100140601.png" alt="" onerror="this.src=&#39;https://fo4.dn.nexoncdn.co.kr/live/externalAssets/common/players/not_found.png&#39;"></div>
                <div class="info_top">
                    <div class="season"><img src="/js/player/icontm(1).png" alt=""></div>
                    <div class="name">네마냐 비디치</div>
                    <input type="hidden" name="Strong100140601" value="1/3">
                </div>
                <div class="info_middle">
                        <span class="position df"><span class="txt">CB</span><span class="skillData_100140601">120</span> </span>
                                                        </div>
                <div class="info_bottom">
                    <div class="en_wrap selector_wrap">
                        <a href="https://fifaonline4.nexon.com/datacenter#" class="ability en_level1">1</a>
                        <div class="selector_list" style="display: none;">
                            <ul>
                                <li><a class="selector_item en_level0" href="https://fifaonline4.nexon.com/datacenter#" onclick="DataCenter.SetSkillPoint(&#39;0/0&#39;, &#39;skillData_100140601&#39;, &#39;Strong100140601&#39;, 100140601)">-</a></li>
                                <li><a class="selector_item en_level1" href="https://fifaonline4.nexon.com/datacenter#" onclick="DataCenter.SetSkillPoint(&#39;1/3&#39;, &#39;skillData_100140601&#39;, &#39;Strong100140601&#39;, 100140601)">1</a></li>
                                <li><a class="selector_item en_level2" href="https://fifaonline4.nexon.com/datacenter#" onclick="DataCenter.SetSkillPoint(&#39;2/4&#39;, &#39;skillData_100140601&#39;, &#39;Strong100140601&#39;, 100140601)">2</a></li>
                                <li><a class="selector_item en_level3" href="https://fifaonline4.nexon.com/datacenter#" onclick="DataCenter.SetSkillPoint(&#39;3/5&#39;, &#39;skillData_100140601&#39;, &#39;Strong100140601&#39;, 100140601)">3</a></li>
                                <li><a class="selector_item en_level4" href="https://fifaonline4.nexon.com/datacenter#" onclick="DataCenter.SetSkillPoint(&#39;4/7&#39;, &#39;skillData_100140601&#39;, &#39;Strong100140601&#39;, 100140601)">4</a></li>
                                <li><a class="selector_item en_level5" href="https://fifaonline4.nexon.com/datacenter#" onclick="DataCenter.SetSkillPoint(&#39;5/9&#39;, &#39;skillData_100140601&#39;, &#39;Strong100140601&#39;, 100140601)">5</a></li>
                                <li><a class="selector_item en_level6" href="https://fifaonline4.nexon.com/datacenter#" onclick="DataCenter.SetSkillPoint(&#39;6/11&#39;, &#39;skillData_100140601&#39;, &#39;Strong100140601&#39;, 100140601)">6</a></li>
                                <li><a class="selector_item en_level7" href="https://fifaonline4.nexon.com/datacenter#" onclick="DataCenter.SetSkillPoint(&#39;7/14&#39;, &#39;skillData_100140601&#39;, &#39;Strong100140601&#39;, 100140601)">7</a></li>
                                <li><a class="selector_item en_level8" href="https://fifaonline4.nexon.com/datacenter#" onclick="DataCenter.SetSkillPoint(&#39;8/18&#39;, &#39;skillData_100140601&#39;, &#39;Strong100140601&#39;, 100140601)">8</a></li>
                                <li><a class="selector_item en_level9" href="https://fifaonline4.nexon.com/datacenter#" onclick="DataCenter.SetSkillPoint(&#39;9/22&#39;, &#39;skillData_100140601&#39;, &#39;Strong100140601&#39;, 100140601)">9</a></li>
                                <li><a class="selector_item en_level10" href="https://fifaonline4.nexon.com/datacenter#" onclick="DataCenter.SetSkillPoint(&#39;10/27&#39;, &#39;skillData_100140601&#39;, &#39;Strong100140601&#39;, 100140601)">10</a></li>
                            </ul>
                        </div>
                    </div>
                    <a href="javascript:;" data-no="100140601" class="btn_preview"><span></span></a>
                </div>
            </div>
        </div>
        <div class="td td_ar">
            <span class="pay">30</span>
        </div>
            <div class="td td_ar ">
                <span>
                    <span class="skillData_100140601">                        
120                    </span>

                </span>
            </div>
        <div class="td td_ar">
                <span>
                    <span class="skillData_100140601" data-type="sprintspeed">
                        120
                    </span>
                    
                </span>
        </div>
        <div class="td td_ar">
                <span>
                    <span class="skillData_100140601" data-type="acceleration">
                        115
                    </span>
                    
                </span>
        </div>
        <div class="td td_ar">
                <span>
                    <span class="skillData_100140601" data-type="strength">
                        123
                    </span>
                    
                </span>
        </div>
        <div class="td td_ar">
                <span>
                    <span class="skillData_100140601" data-type="stamina">
                        117
                    </span>
                    
                </span>
        </div>

        <div class="td td_ar_bp bp_100140601">
            <span class="span_bp0" style="display:none">-</span>
            <span class="span_bp1" style="">308,000,000,000</span>
            <span class="span_bp2" style="display:none">357,000,000,000</span>
            <span class="span_bp3" style="display:none">399,000,000,000</span>
            <span class="span_bp4" style="display:none">638,000,000,000</span>
            <span class="span_bp5" style="display:none">1,280,000,000,000</span>
            <span class="span_bp6" style="display:none">2,820,000,000,000</span>
            <span class="span_bp7" style="display:none">6,770,000,000,000</span>
            <span class="span_bp8" style="display:none">17,600,000,000,000</span>
            <span class="span_bp9" style="display:none">49,300,000,000,000</span>
            <span class="span_bp10" style="display:none">158,000,000,000,000</span>
        </div>
        <div class="td td_ar_score"><span>9.2 <em>(13)</em></span></div>

    <div class="tr" onclick="$(&#39;#PlayerVs1&#39;).val(&#39;278252371&#39;);">
        <div class="td default">
            <div class="player_info">

                <div class="players_utils players_utils_278252371">
                    <a href="https://fifaonline4.nexon.com/datacenter#" class="btn_collect " onclick="DataCenter.SetPlayerFavorit(this, 278252371, 1)"></a>
                    <a href="https://fifaonline4.nexon.com/datacenter#" onclick="DataCenter.GetPlayerGrow(this,278252371,$(&#39;#hidParam&#39;).val())" class="btn_boost_helper"></a>
                    <a href="https://fifaonline4.nexon.com/datacenter#" onclick="DataCenter.GetPlayerDetail(this,278252371,$(&#39;#hidParam&#39;).val(),2)" class="btn_detail_link"></a>
                    <a href="https://fifaonline4.nexon.com/datacenter#" class="btn_vs" onclick="DataCenter.GetPlayerCompare(278252371);"></a>
                </div>

                <div class="players_alert">
                    <div class="pop_collect collect_278252371">
                        <span class="ico ico_dt_arr_big"></span>
                        <p><span class="player">J. 벨링엄</span>(이)가<br>관심 선수로 등록 되었습니다.</p>
                    </div>
                    <div class="pop_alert alert_278252371">
                        <span class="ico ico_dt_ap_big"></span>
                        <p>관심 선수가 가득 차서 더 이상<br>등록이 안됩니다.</p>
                    </div>
                    <div class="pop_alert alert_del_278252371">
                        <span class="ico ico_dt_ap_big"></span>
                        <p><span class="player">J. 벨링엄</span>(이)가<br>관심 선수에서 삭제 되었습니다.</p>
                    </div>
                </div>

                <div class="thumb"><img src="/js/player/p278252371.png" alt="" onerror="this.src=&#39;https://fo4.dn.nexoncdn.co.kr/live/externalAssets/common/players/not_found.png&#39;"></div>
                <div class="info_top">
                    <div class="season"><img src="/js/player/23toty(1).png" alt=""></div>
                    <div class="name">J. 벨링엄</div>
                    <input type="hidden" name="Strong278252371" value="1/3">
                </div>
                <div class="info_middle">
                        <span class="position mf"><span class="txt">CM</span><span class="skillData_278252371">111</span> </span>
                                                        </div>
                <div class="info_bottom">
                    <div class="en_wrap selector_wrap">
                        <a href="https://fifaonline4.nexon.com/datacenter#" class="ability en_level1">1</a>
                        <div class="selector_list" style="display: none;">
                            <ul>
                                <li><a class="selector_item en_level0" href="https://fifaonline4.nexon.com/datacenter#" onclick="DataCenter.SetSkillPoint(&#39;0/0&#39;, &#39;skillData_278252371&#39;, &#39;Strong278252371&#39;, 278252371)">-</a></li>
                                <li><a class="selector_item en_level1" href="https://fifaonline4.nexon.com/datacenter#" onclick="DataCenter.SetSkillPoint(&#39;1/3&#39;, &#39;skillData_278252371&#39;, &#39;Strong278252371&#39;, 278252371)">1</a></li>
                                <li><a class="selector_item en_level2" href="https://fifaonline4.nexon.com/datacenter#" onclick="DataCenter.SetSkillPoint(&#39;2/4&#39;, &#39;skillData_278252371&#39;, &#39;Strong278252371&#39;, 278252371)">2</a></li>
                                <li><a class="selector_item en_level3" href="https://fifaonline4.nexon.com/datacenter#" onclick="DataCenter.SetSkillPoint(&#39;3/5&#39;, &#39;skillData_278252371&#39;, &#39;Strong278252371&#39;, 278252371)">3</a></li>
                                <li><a class="selector_item en_level4" href="https://fifaonline4.nexon.com/datacenter#" onclick="DataCenter.SetSkillPoint(&#39;4/7&#39;, &#39;skillData_278252371&#39;, &#39;Strong278252371&#39;, 278252371)">4</a></li>
                                <li><a class="selector_item en_level5" href="https://fifaonline4.nexon.com/datacenter#" onclick="DataCenter.SetSkillPoint(&#39;5/9&#39;, &#39;skillData_278252371&#39;, &#39;Strong278252371&#39;, 278252371)">5</a></li>
                                <li><a class="selector_item en_level6" href="https://fifaonline4.nexon.com/datacenter#" onclick="DataCenter.SetSkillPoint(&#39;6/11&#39;, &#39;skillData_278252371&#39;, &#39;Strong278252371&#39;, 278252371)">6</a></li>
                                <li><a class="selector_item en_level7" href="https://fifaonline4.nexon.com/datacenter#" onclick="DataCenter.SetSkillPoint(&#39;7/14&#39;, &#39;skillData_278252371&#39;, &#39;Strong278252371&#39;, 278252371)">7</a></li>
                                <li><a class="selector_item en_level8" href="https://fifaonline4.nexon.com/datacenter#" onclick="DataCenter.SetSkillPoint(&#39;8/18&#39;, &#39;skillData_278252371&#39;, &#39;Strong278252371&#39;, 278252371)">8</a></li>
                                <li><a class="selector_item en_level9" href="https://fifaonline4.nexon.com/datacenter#" onclick="DataCenter.SetSkillPoint(&#39;9/22&#39;, &#39;skillData_278252371&#39;, &#39;Strong278252371&#39;, 278252371)">9</a></li>
                                <li><a class="selector_item en_level10" href="https://fifaonline4.nexon.com/datacenter#" onclick="DataCenter.SetSkillPoint(&#39;10/27&#39;, &#39;skillData_278252371&#39;, &#39;Strong278252371&#39;, 278252371)">10</a></li>
                            </ul>
                        </div>
                    </div>
                    <a href="javascript:;" data-no="278252371" class="btn_preview"><span></span></a>
                </div>
            </div>
        </div>
        <div class="td td_ar">
            <span class="pay">26</span>
        </div>
            <div class="td td_ar ">
                <span>
                    <span class="skillData_278252371">                        
111                    </span>

                </span>
            </div>
        <div class="td td_ar">
                <span>
                    <span class="skillData_278252371" data-type="sprintspeed">
                        109
                    </span>
                    
                </span>
        </div>
        <div class="td td_ar">
                <span>
                    <span class="skillData_278252371" data-type="acceleration">
                        111
                    </span>
                    
                </span>
        </div>
        <div class="td td_ar">
                <span>
                    <span class="skillData_278252371" data-type="strength">
                        101
                    </span>
                    
                </span>
        </div>
        <div class="td td_ar">
                <span>
                    <span class="skillData_278252371" data-type="stamina">
                        117
                    </span>
                    
                </span>
        </div>

        <div class="td td_ar_bp bp_278252371">
            <span class="span_bp0" style="display:none">-</span>
            <span class="span_bp1" style="">20,300,000,000</span>
            <span class="span_bp2" style="display:none">22,000,000,000</span>
            <span class="span_bp3" style="display:none">37,000,000,000</span>
            <span class="span_bp4" style="display:none">85,000,000,000</span>
            <span class="span_bp5" style="display:none">376,000,000,000</span>
            <span class="span_bp6" style="display:none">966,000,000,000</span>
            <span class="span_bp7" style="display:none">2,320,000,000,000</span>
            <span class="span_bp8" style="display:none">6,030,000,000,000</span>
            <span class="span_bp9" style="display:none">16,900,000,000,000</span>
            <span class="span_bp10" style="display:none">54,100,000,000,000</span>
        </div>
        <div class="td td_ar_score"><span>8.1 <em>(10)</em></span></div>
    </div>
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

<script>
    var sliderDefaultOption = {
        range: true,
        min: 0,
        max: 200,
        values: [ 0, 200],
        change: function (event, ui) {

            var target = $(this).slider();
            target.find(".min_num").text(ui.values[0]);
            target.find(".max_num").text(ui.values[1]);
            target.closest(".range_slider").find(".min_val").val(ui.values[0])
            target.closest(".range_slider").find(".max_val").val(ui.values[1]);
            fn_CheckSearchCount();

        },
        slide: function (event, ui) {

            var target = $(this).slider();
            target.find(".min_num").text(ui.values[0]);
            target.find(".max_num").text(ui.values[1]);
            target.closest(".range_slider").find(".min_val").val(ui.values[0])
            target.closest(".range_slider").find(".max_val").val(ui.values[1]);
        },
        create: function (event, ui) {

            var that = this;
            var target = $(this).slider();

            target.eq(0).append("<span class='half_num'>" + (parseInt(($(this).slider("option", "min") + $(this).slider("option", "max")) / 2)) + "</span>")
            target.find(".ui-slider-handle").eq(0).append("<span class='min_num'>" + $(this).slider("values", 0) + "</span>");
            target.find(".ui-slider-handle").eq(1).append("<span class='max_num'>" + $(this).slider("values", 1) + "</span>");
            target.closest(".range_slider").find(".min_val").val($(this).slider("values", 0));
            target.closest(".range_slider").find(".max_val").val($(this).slider("values", 1));

            target.closest(".range_slider").find(".min_val").on("change", function () {

                if ($(this).val() > $(that).slider("values", 1)) {
                    $(that).slider("values", 0, $(that).slider("values", 1));
                    return
                }
                $(that).slider("values", 0, $(this).val());
            });
            target.closest(".range_slider").find(".max_val").on("change", function () {
                if ($(this).val() < $(that).slider("values", 0)) {
                    $(that).slider("values", 1, $(that).slider("values", 0));
                    return
                }
                $(that).slider("values", 1, $(this).val());
            });
        },
    };

    $("#slider1 .wrap_slider").slider(sliderDefaultOption);
    $("#slider2 .wrap_slider").slider($.extend(sliderDefaultOption, { min: 4, max: 99, values: [0,99] }));

    $("#slider3 .wrap_slider").slider($.extend(sliderDefaultOption, { min: 40, max: 200, values: [0,200] }));
    $("#slider4 .wrap_slider").slider($.extend(sliderDefaultOption, { min: 40, max: 200, values: [0,200] }));
    $("#slider5 .wrap_slider").slider($.extend(sliderDefaultOption, { min: 40, max: 200, values: [0,200] }));

    $("#slider6 .wrap_slider").slider($.extend(sliderDefaultOption, { min: 1900, max: 2010, values: [1900,2010] }));
    $("#slider7 .wrap_slider").slider($.extend(sliderDefaultOption, { min: 140, max: 208, values: [140,208] }));
    $("#slider8 .wrap_slider").slider($.extend(sliderDefaultOption, { min: 50, max: 110, values: [50,110] }));
    $("#slider9 .wrap_slider").slider($.extend(sliderDefaultOption, { min: 0, max: 99999, values: [0, 99999] }));
    $("#slider19 .wrap_slider").slider($.extend(sliderDefaultOption, { min: 0, max: 10, values: [0, 10] }));


    $("body").click(function (e) {
        if ($(e.target).hasClass("btn_preview")) {
        } else {
            $("#playerPreview").hide();
            $(".btn_preview").removeClass("active");
        }
    });

    $(function () {
        var _targetEl = $('#searchName');
        _targetEl.parent().append("<div class='autoList'></div>");

        var _txt;
        _targetEl.autocomplete({
            source: function (request, response) {
                _txt = request.term;
                return $.ajax({
                    url: "/datacenter/searchtxtplayerlist",
                    type: "POST",
                    cache: false,
                    dataType: "text",
                    data: { strsearch: $("#searchName").val() }
                }).done(function (data) {
                    if (data.length) {
                        var arr = $.parseJSON(data);
                        arr.splice(10);
                        response(arr);
                    }
                })
            },
            delay: 1000,
            appendTo: ".autoList",
            autoFocus: true,
            focus: function (event, ui) {
                return false;
            },
            minLength: 1,
            select: function (evt, ui) {
                $("#searchName").val(ui.item.label);
                return false;
            }
        }).autocomplete("instance")._renderItem = function (ul, item) {
            var regex = new RegExp(_txt, 'gi');
            return $("<li>")
                .append("<div>" + (item.label.replace(regex, "<span style='color:#25c7f5'>" + _txt + "</span>")) + "</div>")
                .appendTo(ul);
        };
    });
</script>

        <!-- //MAIN -->
        <!-- 공통 FOOTER -->
        <footer id="footer" role="contentinfo">
    <div class="inner">
        <h2 class="logo"><a href="https://fifaonline4.nexon.com/"><img src="/js/player/logo_fo4.png" alt="NEXON Korea - EA SPORTS ™ FIFA ONLINE 4"></a></h2>
        <nav class="nav">
            <ul>
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
        <!-- //공통 FOOTER -->

                <div class="list_aside" style="">
                    <ul>
                        <li><a style="cursor:pointer;" class="btn_list_top"><span class="ico ico_btn_top">위로</span></a></li>
                    </ul>
                </div>

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