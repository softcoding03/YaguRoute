<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-solid-rounded/css/uicons-solid-rounded.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-solid-rounded/css/uicons-solid-rounded.css'>
   <style type="text/css">
.main-menu-wrap {
	position: sticky !important;
}

div, a {
	font-family: "Gwangyang" !important;
}

.background {
	display: flex !important;
	justify-content: center !important;
	align-items: center !important;
	margin-top: 50px !important;
}

.wrap {
	display: flex !important;
	align-items: center !important;
}

.wrap>* {
	margin-right: 10px !important;
}

.wrap label {
	width: 70px !important; /* 원하는 크기로 지정 */
	height: 50px !important;
	margin-top: 5px !important;
	display: inline-block !important;
}

.sidebar {
	position: sticky !important;
	top: 100px !important;
	right: 300px !important;
}

.image-container {
	position: relative !important;
	display: inline-block !important;
	width: 100% !important;
}

section.h1 {
	display: flex !important;
	justify-content: center !important;
}

h1 {
	color: white !important;
	position: relative !important;
	z-index: 9900 !important;
	font-family: "Gwangyang" !important;
}

.row-align {
	display: flex !important;
	align-items: center !important;
}

div.emote {
	text-align: center !important;
}

button.thumbs-btn {
	width: 30px !important;
}

#back-img {
	position: fixed !important;
	width: 100% !important;
	height: 100vh !important;
	overflow: hidden !important;
}

.row-offcanvas {
	background-color: rgba(217, 217, 217, 0.8) !important;
	/* 흰색 배경과 투명도 조절 */
}

.name {
	font-family: "Gwangyang" !important;
	font-size: 13px !important;
}

.row.emote, div.emote {
	font-family: "Gwangyang" !important;
	font-size: 13px !important;
	display: flex;
	justify-content: center;
}

a.emote.like {
	color: #ff0000;
}

a.emote.disLike {
	color: #337ab7;
}

/* 따라다니는 퀵메뉴 */
div, ul, li {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 0;
	margin: 0
}

a {
	text-decoration: none;
}

.quickmenu {
	position: absolute;
	width: 50px;
	top: 70%;
	margin-top: -70px;
	right: 10px;
	background: #fff;
}

.quickmenu ul {
	position: relative;
	float: left;
	width: 100%;
	display: inline-block;
	*display: inline;
	border: 1px solid #ddd;
}

.quickmenu ul li {
	float: left;
	width: 100%;
	border-bottom: 1px solid #ddd;
	text-align: center;
	display: inline-block;
	*display: inline;
}

.quickmenu ul li a {
	position: relative;
	float: left;
	width: 100%;
	height: 50px;
	line-height: 50px;
	text-align: center;
	color: #999;
	font-size: 9.5pt;
}

.quickmenu ul li a:hover {
	color: #000;
}

.quickmenu ul li:last-child {
	border-bottom: 0;
}

.content {
	position: relative;
	min-height: 1000px;
}

.quickmenu .submenu {
	display: none;
}
</style>
    
    <script type="text/javascript">
	
    function fncGetPostList(currentPage){
    		var teamCode = $("#teamCode");
			$("#currentPage").val(currentPage);
			$("form").attr("method" ,"GET").attr("action" , "/post/getPostList?teamCode="+teamCode).submit();
	 }
    
    $(function(){
    	var teamCode = "${teamCode}";
    	var MyTeamCode = "${user.teamCode}";
		console.log(teamCode);
		
	    	$( "td:nth-child(3)" ).on("click" , function() {
	    		 self.location ="/post/getPost?postNo="+$(this).siblings("td:nth-child(1)").text();
	    	});
	    	$( "i.fa.fa-search").on("click" , function() {
				fncGetPostList(1);
			});
			
			//#태그 핸들러
			$("a[href='teamCodeHref']").on('click',function(){
	    		teamCode = $(this).find("input[name='foreachTeamCode']").val()
	    		self.location = "/post/getPostList?teamCode="+teamCode;
		   });
			$("a.talk").on("click",function(){
				self.location = "/post/getPostList?postType=0&teamCode="+teamCode;
			});
			$("a.cheer").on("click",function(){
				self.location = "/post/getPostList?postType=1&teamCode="+teamCode;
			});
			$("a.buy").on("click",function(){
				self.location = "/post/getPostList?postType=2&teamCode="+teamCode;
			});
			$("a.sell").on("click",function(){
				self.location = "/post/getPostList?postType=3&teamCode="+teamCode;
			});
		   $("a.getPostList").on('click',function(){
			   self.location = "/post/getPostList?teamCode="+teamCode;
		   });
		   $("a.getMyPostList").on('click',function(){
			   self.location = "/post/getMyPostList";
		   });
		   $("a.getBestList").on('click',function(){
			   self.location = "/post/getBestList?teamCode="+teamCode;
		   });
		   $("a.getNoticeList").on('click',function(){
			   self.location = "/post/getNoticeList?teamCode="+teamCode;
		   });
    })
    $(function(){
    		$("a.addPostView").on('click',function(){
    			window.open("/post/addPostView.jsp","게시물 작성",'width=1000,height=700');
		   });
    })

    ////////////////게시물 부분/////////
var postNo;
	
    $(document).ready(function() {
		postNo = $('#postNo').val();
		teamCode = $('#teamCode').val();
	 });
	
	$(function(){
		//addLike or addDislike 시작
	 	$("a.emote").on("click" , function() {
	 		var type = $(this).closest("div.emote").siblings("input").val();
	 		var isLiked = false;
	 		var isDisliked = false;
	 		var likes = parseInt($('#likes').text().trim());
	 		var disLikes = parseInt($('#disLikes').text().trim());
	 		console.log("현재 L/D ??"+likes,disLikes);
	 		console.log("type ??"+type)
	 		if($(this).hasClass("like")){
	 			console.log("like클릭")
	 			isLiked = true;
	 		} else if ($(this).hasClass("disLike")){
	 			isDisliked = true;
	 			console.log("dislike클릭")
	 		}
			
	 		$.ajax({
	 			url:"/post/rest/addLike/"+postNo+"/"+type,
				method : "GET",
				dataType : "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData, status) {
					console.log(JSONData.likes);
					console.log(JSONData.disLikes);
		            if (isLiked) {
		            	$('#likes').html(JSONData.likes);
		            	$('#disLikes').html(JSONData.disLikes);
		            	if(likes < JSONData.likes){
		            		console.log("?1");
		            		$('a.like').html("<i class=\"fi fi-sr-heart fa-2x\"></i>");
		            		$('a.disLike').html("<i class=\"fi fi-rr-face-confused fa-2x\"></i>");
		            	} else {
		            		console.log("?2");
		            		$('a.like').html("<i class=\"fi fi-rr-heart fa-2x\"></i>");
		            		$('a.disLike').html("<i class=\"fi fi-rr-face-confused fa-2x\"></i>");
		            	}
		            } else if (isDisliked) {
		            	$('#likes').html(JSONData.likes);
		            	$('#disLikes').html(JSONData.disLikes);
		                if(disLikes < JSONData.disLikes){
		                	console.log("?3");
		            		$('a.like').html("<i class=\"fi fi-rr-heart fa-2x\"></i>");
		            		$('a.disLike').html("<i class=\"fi fi-sr-face-confused fa-2x\"></i>");
		                } else {
		                	console.log("?4");
		                	$('a.like').html("<i class=\"fi fi-rr-heart fa-2x\"></i>");
		                	$('a.disLike').html("<i class=\"fi fi-rr-face-confused fa-2x\"></i>");
		            	}
		            }
				}
	 		});
	 	});
		//addLike or addDislike 끝
		
	 	//수정 및 삭제
	 	$('.updatePost').on("click" , function() {
	 		var url = "/post/updatePost?postNo="+postNo;
	 		window.open(url,"게시물 수정",'width=1000,height=700');
	 		
		});
	 	$('.deletePost').on("click" , function() {
	 		var confirmation = confirm("정말로 삭제하시겠습니까?");
	 		if(confirmation){
				self.location = "/post/deletePost?postNo="+postNo;
	 		}
		});
	});
    //따라다니는 퀵메뉴
	$(document).ready(function(){
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
	});
	//따라다니는 퀵메뉴 끝	
   </script>
   <!-- include summernote css/js-->
	
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
<a type="hidden" id="top"/>
<jsp:include page="/common/topBar.jsp"/>

<section class="image-header" style="min-height: 0px;height: 0px;">
	<div class="row">
		<div class="col-md-12" >
           	<img id="back-img" src="/images/background/background1.jpg" alt="img">
        </div>	
	</div>
</section>

<c:if test="${post.postType ne '4'}">
	<section class="h1">
		<h1>커뮤니티 게시판</h1>
	</section>
</c:if>
<c:if test="${post.postType eq '4'}">
	<section class="h1">
		<h1>공지사항</h1>
	</section>
</c:if>	
	
<!--CONTENT BEGIN-->
<div class="content">
    <div class="container">
        <div class="row row-offcanvas row-offcanvas-left">

<c:if test="${post.postType ne '4'}">
<!--SIDEBAR BEGIN-->
<section class="sidebar col-xs-6 col-md-3 sidebar-offcanvas" id="sidebar">
    <div class="sidebar-menu-wrap">
        <h6>Categories</h6>
        <ul class="categories-list">
            <li>
                <a href="javascript:;" class="addPostView"><span class="count 1">1</span>게시물 작성하기</a>
            </li>
            <li>
                <a href="javascript:;" class="getPostList"><span class="count 2">2</span>전체 게시글 보기</a>
            </li>
            <li>
                <a href="javascript:;" class="getMyPostList"><span class="count 3">3</span>내가 작성한 게시글 보기</a>
            </li>
            <li>
                <a href="javascript:;" class="getBestList"><span class="count 4">4</span>Best5 게시글 보기</a>
            </li>
            <li>
                <a href="javascript:;" class="getNoticeList"><span class="count 5">5</span>공지사항 보기</a>
            </li>
        </ul>
    </div>
	   <!-- Search -->
		<div class="sidebar-search-wrap">
		  <h6>Search</h6>
		  <form>
		    <div class="wrap">
		      <label>
		        <select class="year basic" name="searchCondition">
		          <option value="0" ${!empty search.searchCondition && search.searchCondition==0 ? "selected" : ""}>ID</option>
		          <option value="1" ${!empty search.searchCondition && search.searchCondition==1 ? "selected" : ""}>제목</option>
		        </select>
		      </label>
		      <label class="sr-only" for="searchKeyword">검색어</label>
		      <input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="검색어" value="${!empty search.searchKeyword ? search.searchKeyword : ''}">
		    	<button><i class="fa fa-search" aria-hidden="true"></i></button>
		    <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
		    <input type="hidden" id="currentPage" name="currentPage" value="" />
		    <input type="hidden" id="teamCode" name="teamCode" value="${list[0].teamCode}" />
		    </div>
		  </form>
		</div>
		<!-- Search -->
    <div class="recent-news">
          <h6>Notice</h6>
          <c:forEach var="notice" items="${noticeList}">
	          <div class="item">
	              <div class="date"><span>${notice.postDate}</span> in <span>Notice</span></div>
	              <a href="javascript:;" class="getNotice">${notice.postTitle }</a>
	          </div>
			 </c:forEach>
      </div>
    <div class="sidebar-tags-wrap">
        <h6>Tags</h6>
        <div class="tags">
            <a href="javascript:;" class="talk">잡담</a>
            <a href="javascript:;" class="cheer">응원</a>
            <a href="javascript:;" class="buy">중고구매</a>
            <a href="javascript:;" class="sell">중고판매</a>
        </div>
    </div>
</section>	
<!--SIEDBAR END-->
</c:if>

<!--NEWS SINGLE BEGIN-->
<c:if test="${post.postType eq '4'}">
	<section class="news-single col-xs-12 col-md-12">
</c:if>
<c:if test="${post.postType ne '4'}">
	<section class="news-single col-xs-12 col-md-9">
</c:if>
		<p class="hidden-md hidden-lg">
        <button type="button" class="btn sidebar-btn" data-toggle="offcanvas" title="Toggle sidebar">sidebar</button>
    </p>
    <div class="item">
        <div class="top-info">
            <h3>
	            <c:choose>
						<c:when test="${post.postType == '0'}">[잡담]</c:when>
						<c:when test="${post.postType == '1'}">[응원]</c:when>
						<c:when test="${post.postType == '2'}">[중고구매]</c:when>
						<c:when test="${post.postType == '3'}">[중고판매]</c:when>
						<c:when test="${post.postType == '4'}">[공지사항]</c:when>
					</c:choose>
					${post.postTitle}
				</h3>
            <div class="comment-quantity">Views: ${post.postViews}&nbsp;&nbsp;&nbsp;&nbsp; 작성일: ${post.postDate}&nbsp;&nbsp;&nbsp;&nbsp; 게시물 번호: ${post.postNo}</div>
        		<hr>
        		<c:if test="${post.user.userId eq user.userId}">
	        		<div class="comment-quantity">
	        			<a href="javascript:;" class="updatePost">수정</a>&nbsp;&nbsp;/&nbsp;&nbsp; 
	        			<a href="javascript:;" class="deletePost">삭제</a>
	        		</div>
        		</c:if>
        </div>
        <div class="post-text">${post.postContents}</div>
        <div class="author-box">
            <div class="top">
                <div class="avatar"><img src="${post.user.userImage}" alt="author-avatar"></div>
                <div class="info">
                    <div class="name">${post.user.userNickName}</div>
                    <div class="name">${post.user.userEmail}</div>
                </div>
            </div>
        </div>
       <hr>
      <!-- 좋아요 싫어요 -->
		<div class="row emote">
		<div class="col-md-1">
			<div class="emote">
	  			<input type="hidden" value="Like"/>
	  			<div class="col-xs-8 col-md-1 check1 emote">
		  			<a href="javascript:;" class="emote like">
						<c:choose>
					        <c:when test="${emote.like == 1}">
					            <i class="fi fi-sr-heart fa-2x"></i>
					        </c:when>
					        <c:otherwise>
					            <i class="fi fi-rr-heart fa-2x"></i>
					        </c:otherwise>
					    </c:choose>
					</a>
				</div>
			</div>		
		</div>
		<div class="col-md-1">			
			<div class="emote">
	  			<input type="hidden" value="DisLike"/>
				<div class="col-xs-8 col-md-1 check2 emote">	  			
	  				<a href="javascript:;" class="emote disLike">
						<c:choose>
					        <c:when test="${emote.disLike == 1}">
					            <i class="fi fi-sr-face-confused fa-2x"></i>
					        </c:when>
					        <c:otherwise>
					            <i class="fi fi-rr-face-confused fa-2x"></i>
					        </c:otherwise>
					    </c:choose>
					</a>
				</div>
			</div>	
		</div>				
		</div>
		<div class="row emote">
			<div class="col-xs-8 col-md-1 emote" id="likes">${post.postLikes}</div>
			<div class="col-xs-8 col-md-1 emote" id="disLikes">${post.postDislikes}</div>
		</div>
			<!-- Comment Start... -->
			<jsp:include page="../comment/listComment.jsp"/>
			<!-- Comment End... -->
    </div>
</section>
<!--NEWS SINGLE END-->

        </div>
    </div>
</div>
<!--CONTENT END-->
      
<!-- 퀵메뉴 -->
<div class="quickmenu">
  <ul>
    <li><a href="#top"><span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span></a></li>
    <li><a href="#bottom"><span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></a></li>
    <li><a href="#back"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span></a></li>
    <li><a href="#forward"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></a></li>
  </ul>
</div>   

<a type="hidden" id="bottom"/> 	

</body>
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

</html>