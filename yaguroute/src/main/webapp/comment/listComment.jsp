<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type="text/javascript">
	 
	$(function() {
		$( ".addComment" ).on("click" , function() {
			var form = $(this).closest('form');
			form.attr("method" ,"POST").attr("action" , "/comment/addComment").submit();
		});
		$( ".reply" ).on("click" , function() {
			var insertPosition = $(this).closest('.comment-item');
			var commentNo = insertPosition.find("input[name='commentNo']").val();
			var secondComment =   "<div class=\"comment-item answer\">"
								  +	"<form>"								
						          + "<div class=\"row\">"
						          +  "<div class=\"col-md-12\">"
						          +      "<div class=\"item\">"
						          +          "<label>"
						          +              "<span>Your comment</span>"
						          +              "<textarea name=\"commentContents\"></textarea>"
						          +          "</label>"
						          +      "</div>"
						          +  "</div>"
						          +  "<div class=\"col-md-12\">"
						          +      "<button class=\"addComment\">post a comment</button>"
						          +  "</div>"
							      +  "</div>"
							      +  "<input type=\"hidden\" name=\"postNo\" value=\"${post.postNo}\">"
							      +  "<input type=\"hidden\" name=\"secondCommentNo\" value="+commentNo+">"
							   	  + "</form>"
							   	  +"</div>";
			if(insertPosition.find(".comment-item.answer").length === 0){
				insertPosition.append(secondComment);
			} else {
				insertPosition.find(".comment-item.answer").remove();
			}
		});
	});
	</script>

</head>

<body>
	<div class="preloader-wrapper" id="preloader">
    <div class="motion-line dark-big"></div>
    <div class="motion-line yellow-big"></div>
    <div class="motion-line dark-small"></div>
    <div class="motion-line yellow-normal"></div>
    <div class="motion-line yellow-small1"></div>
    <div class="motion-line yellow-small2"></div>
	</div>

    
       	<div class="comments-wrap">
           <h4>Comments</h4>
           <c:forEach var="list" items="${commentList1}">
	           <div class="comment-item">
	                <div class="avatar"><img src="/images/common/${list.user.userImage}" alt="author-avatar"></div>
	                <div class="info">
	                    <div class="date">
	                        <a>${list.commentDate}</a> by <a>${list.user.userNickName}</a>
	                    </div>
	                    <p>${list.commentContents}</p>
	                    <a href="javascript:;" class="reply">reply</a>
	                </div>
	                <input type="hidden" name="commentNo" value="${list.commentNo}">
	           </div>
           </c:forEach>
           <c:forEach var="list" items="${commentList2}">
	           <div class="comment-item answer">
	                <div class="avatar"><img src="/images/common/${list.user.userImage}" alt="author-avatar"></div>
	                <div class="info">
	                    <div class="date">
	                        <a>${list.commentDate}</a> by <a>${list.user.userNickName}</a>
	                    </div>
	                    <p>${list.commentContents}</p>
	                </div>
	           </div>
           </c:forEach>
           
           <div class="comment-item">
               <div class="avatar"><img src="images/common/author-avatar.jpg" alt="author-avatar"></div>
               <div class="info">
                   <div class="date">
                       <a href="#">25 Sep 2016</a> by <a href="#">Ian Finch</a>
                       <a href="#" class="quote">#</a>
                   </div>
                   <p>Pabst irony tattooed, synth sriracha selvage pok pok. Wayfarers kinfolk sartorial, helvetica you probably haven't heard of them tumeric venmo deep v mixtape semiotics brunch.</p>
                   <a href="javascript:;" class="reply">reply</a>
               </div>
           </div>
           <div class="comment-item answer">
               <div class="avatar"><img src="images/common/author-avatar.jpg" alt="author-avatar"></div>
               <div class="info">
                   <div class="date">
                       <a href="#">25 Sep 2016</a> by <a href="#">Ian Finch</a>
                       <a href="javascript:;" class="quote">#</a>
                   </div>
                   <p>Pabst irony tattooed, synth sriracha selvage pok pok. Wayfarers kinfolk sartorial, helvetica you probably haven't heard of them tumeric venmo deep v mixtape semiotics brunch.</p>
               </div>
           </div>
           
           <div class="leave-comment-wrap">
               <h4>Leave a comment</h4>	
               <form>								
                   <div class="row">
                       <div class="col-md-12">
                           <div class="item">
                               <label>
                                   <span>Your comment</span>
                                   <textarea name="commentContents"></textarea>
                               </label>
                           </div>
                       </div>
                       <div class="col-md-12">
                           <button class="addComment">post a comment</button>
                       </div>
                   </div>
                   <input type="hidden" name="postNo" value="${post.postNo}">
               </form>
           </div>
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
    
	
</body>

</html>
