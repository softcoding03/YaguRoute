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
    <style>
		button[type="button"]:hover {
			background-color: #99BEFF;
		}
		
		button[type="button"] {
			width: 100%;
			height: 35px;
			background-color: #ffffff;
			color: #000000;
			border: 1px solid #ccc;
			border-radius: 5px;
			cursor: pointer;
			font-size: 15px;
			text-align: center;
		}
    </style>
	<script type="text/javascript">
	 
	$(function() {
		
		//대댓글작성창 출력(reply 클릭)
		$(document).on("click", ".reply", function() {
			var insertPosition = $(this).closest('.comment-item');
			var commentNo = insertPosition.find("input[name='commentNo']").val();
			var secondComment =   "<div class=\"comment-item answer addSecond\">"
									  	 +	"<form>"								
							          +   	   "<div class=\"item\">"
							          +    	          "<span>댓글을 입력해주세요. (100자 제한)</span>"
							          +    	          "<textarea name=\"commentContents\"></textarea>"
							          +    	 "</div>"
								       +  	"<input type=\"hidden\" name=\"postNo\" value=\"${post.postNo}\">"
								       +  	"<input type=\"hidden\" name=\"secondCommentNo\" value="+commentNo+">"
								   	 + "</form>"
							          + "<button type=\"button\" class=\"addComment\">댓글 작성</button>"
							   	 	 +"</div>";
			if(insertPosition.find(".comment-item.answer.addSecond").length === 0){ //작성창 출력된 상태 x 
				insertPosition.append(secondComment);
			} else {
				insertPosition.find(".comment-item.answer.addSecond").remove(); //작성창 출력된 상태 o
			}
		});
		
var currentComment; // 수청 취소 시 기존 댓글로 복구 위함
		//수정창 출력(수정 클릭)
		$(document).on("click", ".quote.update", function() {
			var commentNo = $(this).closest('.comment-item').find("input[name='commentNo']").val();
			var postNo = $("#postNo").val();
			var replacePosition = $(this).closest(".info");
			currentComment = replacePosition.html(); // 기존 댓글 저장
			var commentContents = $(this).closest(".info").find(".contents").text();
			var commentBody = "<form>"
						         +   	"<div class=\"item\">"
						         +  	     "<textarea name=\"commentContents\">"+commentContents+"</textarea>"
							      + 	   "</div>"
									+		"<div class=\"col-md-6\" style=\"text-align:right;\">"
						         +   		"<button type=\"button\" class=\"updateComment\">수정 하기</button>"
						         +		"</div>"
						         +		"<div class=\"col-md-6\" style=\"text-align:right;\">"
						         +   		"<button type=\"button\" class=\"cancelUpdate\">취소</button>"
						         +		"</div>"
						         +	"<input type=\"hidden\" name=\"commentNo\" value="+commentNo+">"
						         +	"<input type=\"hidden\" name=\"postNo\" value="+postNo+">"
						         +"</form>";
			replacePosition.html(commentBody);
		});
		
		//댓글등록 클릭 시 동작
		$(document).on("click", ".addComment" , function() {
			var formData = $(this).siblings('form').serialize();
			var isSecond = $(this).parent().siblings('.comment-item.answer.second').length > 0; //second가 존재하는지 안하는지
			console.log(isSecond);
			var insertPosition1 = $("div.leave-comment-wrap"); //1레이어 댓글 등록 시
			var insertPosition2 = $(this).parent(); //2레이어 댓글 등록 시
			
			$.ajax({
					type : 'post',
					url : '/comment/rest/addComment',
					data : formData,
					dataType : 'json',
					success : function(json){
						console.log(json);
						var userId = json.user.userId;
						var addComment1 =
		           		"<div class=\"comment-item\">"
				         +    "<div class=\"avatar\"><img src="+json.user.userImage+" alt=\"author-avatar\"></div>"
				         +       "<div class=\"info\">"
				         +           "<div class=\"date\">"
				         +               "<a>"+json.commentDate+"</a> by <a>"+json.user.userNickName+"</a>"
				         +					"<a href=\"javascript:;\" class=\"quote update\">수정</a><br>"
						   + 					"<a href=\"javascript:;\" class=\"quote delete\">삭제</a>"
				         +				"</div>"
				         +   		   "<p class=\"contents\">"+json.commentContents+"</p>"
				         +    	 "<a href=\"javascript:reply;\" class=\"reply\">reply</a>"
				         +    "</div>"
				         +    "<input type=\"hidden\" name=\"commentNo\" value="+json.commentNo+"><br>"
				         +"</div>";
				      
				      var addComment2 =
				    	  "<div class=\"comment-item answer second\">"
			           +     "<div class=\"avatar\"><img src="+json.user.userImage+" alt=\"author-avatar\"></div>"
			           +     "<div class=\"info\">"
			           +         "<div class=\"date\">" 
			           +             "<a>"+json.commentDate+"</a> by <a>"+json.user.userNickName+"</a>"
				        +                "<a href=\"javascript:;\" class=\"quote update\">수정</a><br>"
				        +                "<a href=\"javascript:;\" class=\"quote delete\">삭제</a>"
			           +         "</div>"
			           +         "<p class=\"contents\">"+json.commentContents+"</p>"
			           +     "</div>"
			           +     "<input type=\"hidden\" name=\"commentNo\" value="+json.commentNo+">"
			           + "</div>";
		            
				      if(json.secondCommentNo == 0){ //1번 레이어라면
					    	  insertPosition1.before(addComment1);
					    	  $("textarea.body").val("");
				      } else if(isSecond) { //second가 존재하면
					    	  insertPosition2.siblings('.comment-item.answer.second').last().after(addComment2);
					    	  insertPosition2.remove();
				      } else {
					    	  insertPosition2.parent().append(addComment2);
					    	  insertPosition2.remove();
				      }
					}
			});
		});
		
		//수정완료 로직
		$(document).on("click", ".updateComment", function() {
			var replacePosition = $(this).closest("div.info");
			var formData = $(this).closest('form').serialize();
			$.ajax({
					type : 'post',
					url : '/comment/rest/updateComment',
					data : formData,
					dataType : 'json',
					success : function(json){
						console.log(json);
						var userId = json.user.userId;
						var updateComment =
						  "<div class=\"date\">"
                   +     "<a>"+json.commentDate+"</a> by <a>"+json.user.userNickName+"</a>"
	                +        "<a href=\"javascript:;\" class=\"quote update\">수정</a><br>"
	                +        "<a href=\"javascript:;\" class=\"quote delete\">삭제</a>"
                   +     "<a style=\"color:#b4b4b4;\">(수정됨)</a>"
                   + "</div>"
                   + "<p class=\"contents\">"+json.commentContents+"</p>";
                   
                   if(json.secondCommentNo == 0){
                	   updateComment	+= "<a href=\"javascript:reply;\" class=\"reply\">reply</a>";  
                   };					
                   
                  replacePosition.html(updateComment);
					}
			})
		});
		
		//수정취소요청시 로직
		$(document).on("click", ".cancelUpdate", function() {
			var replacePosition = $(this).closest("div.info");
			replacePosition.html(currentComment);
		});
		
		//댓글삭제시 로직
		$(document).on("click", ".quote.delete", function() {
			var commentNo = $(this).closest('.info').siblings("input[name='commentNo']").val();
			console.log(commentNo);
			var deletePosition = $(this).closest(".date").siblings("p.contents");
			//var postNo = $('#postNo').val();
			var confirmation = confirm("정말로 삭제하시겠습니까?");
			var deleteComment = "<p style=\"color:#b4b4b4;\">--- 삭제된 댓글입니다 ---</p>"
	 		if(confirmation){
	 			$.ajax({
					type : 'get',
					url : '/comment/rest/deleteComment/'+commentNo,
					dataType : 'text',
					success : function(json){
						console.log("결과"+json);
						deletePosition.replaceWith(deleteComment);
					}
				})
	 		}
		});
		
		
		
	});
	
	</script>

</head>

<body>
       	<div class="comments-wrap">
           <h4>댓 글</h4>
           <!-- 1번레이어 for문 시작 -->
           <c:forEach var="list1" items="${commentList1}">
				<div class="comment-item">
						<div class="avatar"><img src="${list1.user.userImage}" alt="author-avatar"></div>
						<div class="info">
							<div class="date"><a>${list1.commentDate}</a> by <a>${list1.user.userNickName}</a>
								<c:if test="${list1.changed != 2 && user.userId eq list1.user.userId }">
									<a href="javascript:;" class="quote update">수정</a><br>
									<a href="javascript:;" class="quote delete">삭제</a>
								</c:if>
								<c:if test="${list1.changed == 1}"><a style="color:#b4b4b4;">(수정됨)</a>	</c:if>
							</div>
							<c:if test="${list1.changed !=2}">
								<p class="contents">${list1.commentContents}</p>
								<a href="javascript:reply;" class="reply">reply</a>
							</c:if>
							<c:if test="${list1.changed ==2}">
								<p style="color:#b4b4b4;">--- 삭제된 댓글입니다 ---</p>			                 
							</c:if>
						</div>
						<input type="hidden" name="commentNo" value="${list1.commentNo}"> <br>
				
						<!-- 2번레이어 for문 시작 -->
	           		<c:forEach var="list2" items="${commentList2}">
		           		<c:if test="${list2.secondCommentNo == list1.commentNo}">
			           		<div class="comment-item answer second">
				                <div class="avatar"><img src="${list2.user.userImage}" alt="author-avatar"></div>
				                <div class="info">
				                    <div class="date">
				                        <a>${list2.commentDate}</a> by <a>${list2.user.userNickName}</a>
				                        <c:if test="${list2.changed !=2 && user.userId eq list2.user.userId}">
					                        <a href="javascript:;" class="quote update">수정</a><br>
					                        <a href="javascript:;" class="quote delete">삭제</a>
				                        </c:if>
				                        <c:if test="${list2.changed == 1}"><a style="color:#b4b4b4;">(수정됨)</a></c:if>
				                    </div>
				                    <c:if test="${list2.changed ==2}">
				                    		<p style="color:#b4b4b4;">--- 삭제된 댓글입니다 ---</p>
				                    </c:if>
				                    <c:if test="${list2.changed !=2}">
				                    		<p class="contents">${list2.commentContents}</p>
				                    </c:if>
				                </div>
				                <input type="hidden" name="commentNo" value="${list2.commentNo}">
				            </div>
		           		</c:if>
		           	</c:forEach><!-- 2번레이어 for문 끝 -->	
	           </div><!-- 하나의 comment-item 끝 -->
           </c:forEach><!-- 1번레이어 for문 끝 -->
				           
           <div class="leave-comment-wrap">
               <h4>댓글 작성</h4>	
               <form>								
                   <div class="row">
                       <div class="col-md-12">
                           <div class="item">
                               <label>
                                   <span>댓글을 입력해주세요. (100자 제한)</span>
                                   <textarea name="commentContents" class="body"></textarea>
                               </label>
                           </div>
                       </div>
                      
                   </div>
                   <input type="hidden" name="postNo" id="postNo" value="${post.postNo}">
               </form>
               <button type="button" class="addComment">댓글 작성</button>
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
