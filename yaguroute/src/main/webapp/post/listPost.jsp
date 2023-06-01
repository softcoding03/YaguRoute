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
    <script type="text/javascript">
    
    function fncGetPostList(currentPage){
		$("#currentPage").val(currentPage);
		var teamCode = String($('#teamCode').val());
		$("form").attr("method" ,"GET").attr("action" , "/post/getPostList?teamCode="+teamCode).submit();
	}
    
    $(function(){
    	$( "td:nth-child(3)" ).on("click" , function() {
    		 self.location ="/post/getPost?postNo="+$(this).siblings("td:nth-child(1)").text();
    	});
    	$( "button.btn.btn-default" ).on("click" , function() {
			fncGetPostList(1);
		});
    	$('.addPost').on("click" , function() {
			self.location = "/post/addPost?teamCode="+String($('#teamCode').val())
		});
    	$("button:nth-child(n+1)").on("click" , function() {
			self.location = "/post/getPostList?teamCode="+$(this).val().trim();
			console.log($(this).val().trim())
		});
		$( ".getMyPostList" ).on("click" , function() {
			self.location = "/post/getMyPostList"
		});
    })
   
    </script>
</head>
<body>
<button type="button" class="getMyPostList">내가 작성한 게시물 보기</button>
    <table>
    <tr>
    <td>
	    <button type="button" class="btn btn-warning" value="HH">한화</button>
	    <button type="button" class="btn btn-warning" value="HT">KIA</button>
	    <button type="button" class="btn btn-warning" value="KT">KT</button>
	    <button type="button" class="btn btn-warning" value="LG">LG</button>
	    <button type="button" class="btn btn-warning" value="LT">롯데</button>
	    <button type="button" class="btn btn-warning" value="NC">NC</button>
	    <button type="button" class="btn btn-warning" value="OB">두산</button>
	    <button type="button" class="btn btn-warning" value="SK">SSG</button>
	    <button type="button" class="btn btn-warning" value="SS">삼성</button>
	    <button type="button" class="btn btn-warning" value="WO">키움</button>
	    <button type="button" class="btn btn-warning" value="NN">통합게시판</button>
    </td>
	</table>
<div>
	<table class="table table-hover table-striped" >
        <thead>
          <tr>
            <th align="center">게시물번호</th>
            <th align="left">게시물 종류</th>
            <th align="left">게시물 제목</th>
            <th align="left">글쓴이</th>
            <th align="left">작성일</th>
            <th align="left">조회수</th>
            <th align="left">추천수</th>
          </tr>
        </thead>
       
		<tbody>
		<c:forEach var="noticePost" items="${noticeList}">
			<tr>
			  <td align="center">${noticePost.postNo}</td>
			  <td align="left">[[[공지사항]]]</td>
			  <td align="left">${noticePost.postTitle}</td>
			  <td align="left">${noticePost.user.userNickName}</td>
			  <td align="left">${noticePost.postDate}</td>
			  <td align="left">${noticePost.postViews}</td>
			  <td align="left">${noticePost.postLikes}</td>
			</tr>
        </c:forEach>
		<c:forEach var="bestPost" items="${bestList}">
			<tr>
			  <td align="center">${bestPost.postNo}</td>
			  <td align="left"> 
			  	<c:choose>
					<c:when test="${bestPost.postType == '0'}">[잡담]</c:when>
					<c:when test="${bestPost.postType == '1'}">[응원]</c:when>
					<c:when test="${bestPost.postType == '2'}">[중고구매]</c:when>
					<c:when test="${bestPost.postType == '3'}">[중고판매]</c:when>
				</c:choose> -베스트 게시물^^*-
			  </td>
			  <td align="left">${bestPost.postTitle}</td>
			  <td align="left">${bestPost.user.userNickName}</td>
			  <td align="left">${bestPost.postDate}</td>
			  <td align="left">${bestPost.postViews}</td>
			  <td align="left">${bestPost.postLikes}</td>
			</tr>
        </c:forEach>
		<c:forEach var="post" items="${list}">
			<tr>
			  <td align="center">${post.postNo}</td>
			  <td align="left"> 
			  	<c:choose>
					<c:when test="${post.postType == '0'}">[잡담]</c:when>
					<c:when test="${post.postType == '1'}">[응원]</c:when>
					<c:when test="${post.postType == '2'}">[중고구매]</c:when>
					<c:when test="${post.postType == '3'}">[중고판매]</c:when>
				</c:choose>
			  </td>
			  <td align="left">${post.postTitle}</td>
			  <td align="left">${post.user.userNickName}</td>
			  <td align="left">${post.postDate}</td>
			  <td align="left">${post.postViews}</td>
			  <td align="left">${post.postLikes}</td>
			</tr>
        </c:forEach>
        
        </tbody>
      
      </table>
      <c:if test="${user.teamCode eq list[0].teamCode || user.role eq 'admin'}">
      	<button type="button" class="addPost">게시물 작성</button>
      </c:if>
      		<!-- Search시작 -->
      		<div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>사용자닉네임</option>
				        <option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>게시물제목</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  <input type="hidden" id="teamCode" name="teamCode" value="${list[0].teamCode}"/>
				</form>
	    	</div>
</div>
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_all.jsp">
		<jsp:param name="id" value="post" />
	</jsp:include>
	<!-- PageNavigation End... -->
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