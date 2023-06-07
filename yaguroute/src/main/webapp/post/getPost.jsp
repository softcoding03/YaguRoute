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
    
   <style type="text/css">
    	.background {
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  margin-top: 50px;
		}
	  .wrap {
	    display: flex;
	    align-items: center;
	  }
	  .wrap > * {
	    margin-right: 10px;
	  }		
	  .wrap label {
	    width: 70px; /* 원하는 크기로 지정 */
	    height: 50px;
	    margin-top: 5px;
	    display: inline-block;
	  }	  
	  	.teamTopBar {
		  width: 100%;
		  height: auto;
		}
		.image-container {
		  position: relative;
		  display: inline-block;
		  width: 100%;
		}
		h1{
		color: white;
		}
		.text-overlay {
		  position: absolute;
		  top: 50%;
		  left: 50%;
		  transform: translate(-50%, -50%);
		  
		  font-size: 18px;
		  margin-left:300px;
		  /* 기타 스타일 속성 설정 */
		}
	  .row-align {
	    display: flex;
	    align-items: center;
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
	 	$(".thumbs-btn").on("click" , function() {
	 		var type = $(this).closest('.row').find("input[name='type']").val().trim();
	 		var isLiked = false;
	 		var isDisliked = false;
	 		var likes = parseInt($('#likes').text().trim());
	 		var disLikes = parseInt($('#disLikes').text().trim());
	 		console.log("check용"+likes,disLikes);
	 		
	 		if($(this).hasClass("liked")){
	 			isLiked = true;
	 		} else if ($(this).hasClass("disliked")){
	 			isDisliked = true;
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
		            	$('#disLikes').html("-"+JSONData.disLikes);
		            	if(likes < JSONData.likes){
		            		$('.check1').html("<span class=\"glyphicon glyphicon-heart\""
		            							+"aria-hidden=\"true\" style=\"color: red; font-size: 20px;\"/>");
		            		$('.check2').html("<span class=\"glyphicon glyphicon-thumbs-down\""
		            							+"aria-hidden=\"true\"></span>");
		            	} else {
		            		$('.check1').html("<span class=\"glyphicon glyphicon-thumbs-up\""
		            							+"aria-hidden=\"true\"></span>");
		            	}
		            } else if (isDisliked) {
		            	$('#likes').html(JSONData.likes);
		            	$('#disLikes').html("-"+JSONData.disLikes);
		                if(disLikes < JSONData.disLikes){
		                	$('.check2').html("<span class=\"glyphicon glyphicon-heart\"" 
		                						+"aria-hidden=\"true\" style=\"color: red; font-size: 20px;\"/>");
		            		$('.check1').html("<span class=\"glyphicon glyphicon-thumbs-up\""
		            							+"aria-hidden=\"true\"></span>");
		                } else {
		                	$('.check2').html("<span class=\"glyphicon glyphicon-thumbs-down\""
		                						+"aria-hidden=\"true\"></span>");
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
	
   </script>
   <!-- include summernote css/js-->
	
</head>
<body>


<jsp:include page="/common/topBar.jsp"/>
<div class="image-container">
  <img class="teamTopBar" src="${team.teamTopBar}">
  <div class="text-overlay"><h1>커뮤니티 게시판</h1></div>
</div>

<!-- 팀 구분 툴바 -->
<div class="mathc-live-broadcasts background">
	<div class="broadcast-tabs-wrapper">
       <ul class="nav nav-tabs" role="tablist">
       <c:forEach var="team" items="${allTeam}">
            
            <li class="${team.teamCode eq teamCode ?'active':''}" role="presentation">
            <a href="teamCodeHref" role="tab" data-toggle="tab">
             <img alt="img" src="${team.teamEmblem}">
             <span class="info">
             	<span class="title">${team.teamNickName}</span>
             </span>
             <input type="hidden" name="foreachTeamCode" value="${team.teamCode}"/> 
            </a>
            </li>
       </c:forEach>
       </ul>
    </div>
</div>	
	
	
<!--CONTENT BEGIN-->
<div class="content">
    <div class="container">
        <div class="row row-offcanvas row-offcanvas-left">

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
            <!-- <li> 추후에 사용할지 ..?
                <a href="#"><span class="count">22</span>Competitions & Reviews</a>
                <ul>
                    <li><a href="#"><span class="count">12</span></a></li>
                    <li><a href="#"><span class="count">10</span>Competitions & Reviews</a></li>
                    <li><a href="#"><span class="count">9</span></a></li>
                    <li><a href="#"><span class="count">8</span></a></li>
                    <li><a href="#"><span class="count">7</span>Other</a></li>	
                </ul>
            </li> -->
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
    
    <div class="sidebar-tags-wrap">
        <h6>Tags</h6>
        <div class="tags">
            <a href="#">잡담</a>
            <a href="#">응원</a>
            <a href="#">중고구매</a>
            <a href="#">중고판매</a>
        </div>
    </div>
</section>	
<!--SIEDBAR END-->


<!--NEWS SINGLE BEGIN-->
<section class="news-single col-xs-12 col-sm-12 col-md-9">
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
                </div>
            </div>
        </div>
        
		<!-- 좋아요 싫어요 -->
		<div class="row">
	  		<input type="hidden" name="type" value="Like"/>
	  		<div class="col-xs-4 col-md-2"><strong>좋아요</strong></div>
	  		<button type="button" class="btn btn-default btn-lg thumbs-btn liked">
		  		<div class="col-xs-4 col-md-1 check1">
						<c:choose>
					        <c:when test="${emote.like == 1}">
					            <span class="glyphicon glyphicon-heart" aria-hidden="true" style="color: red; font-size: 20px;"></span>
					        </c:when>
					        <c:otherwise>
					            <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
					        </c:otherwise>
					    </c:choose>
				</div>
			</button>
			<div class="col-xs-8 col-md-4" id="likes">${post.postLikes}</div>
		</div>
		<hr/>
		<div class="row">
	  		<input type="hidden" name="type" value="DisLike"/>
	  		<div class="col-xs-4 col-md-2"><strong>싫어요</strong></div>
	  		<button type="button" class="btn btn-default btn-lg thumbs-btn disliked">
			  	<div class="col-xs-4 col-md-1 check2">
						<c:choose>
					        <c:when test="${emote.disLike == 1}">
					            <span class="glyphicon glyphicon-heart" aria-hidden="true" style="color: red; font-size: 20px;"></span>
					        </c:when>
					        <c:otherwise>
					            <span class="glyphicon glyphicon-thumbs-down" aria-hidden="true"></span>
					        </c:otherwise>
					    </c:choose>
				</div>
			</button>
			<div class="col-xs-8 col-md-4" id="disLikes">-${post.postDislikes}</div>
		</div>    
		<!-- 좋아요 싫어요 끝-->
		<div>
			
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