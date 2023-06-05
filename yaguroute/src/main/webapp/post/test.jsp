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
                <a href="#"><span class="count">4</span>게시물 작성하기</a>
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
                <a href="#"><span class="count">4</span>내가 작성한 게시물 보기</a>
            </li>
            <li>
                <a href="#"><span class="count">4</span>Best5 게시물 보기</a>
            </li>
            <li>
                <a href="#"><span class="count">4</span>공지사항 보기</a>
            </li>
        </ul>
    </div>
    <div class="sidebar-search-wrap">
        <h6>Search</h6>
        <form>
            <div class="wrap">
                <input type="text">
                <button><i class="fa fa-search" aria-hidden="true"></i></button>
            </div>
        </form>
    </div>
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

                <!--NEWS LIST BEGIN-->
<div class="news-list col-xs-12 col-md-9">
    <p class="hidden-md hidden-lg">
        <button type="button" class="btn sidebar-btn" data-toggle="offcanvas" title="Toggle sidebar">sidebar</button>
    </p>
    <c:forEach var="post" items="${list}">
	    <div class="item">
	        <div class="info">
	            <a href="news-single.html" class="name">${post.postTitle}</a>	
	            <div class="wrap">
	                <a href="news-single.html">${post.postDate}</a> by <a href="news-single.html">${post.user.userNickName}</a>
	            </div>
	            <div class="comment-quantity">3 comments</div>
	            <div class="clear"></div>
	            <p>Pabst irony tattooed, synth sriracha selvage pok pok. Wayfarers kinfolk sartorial, helvetica you probably haven't heard of them tumeric venmo deep v mixtape semiotics brunch.  Next level paleo taxidermy, bespoke messenger bag leggings occupy food truck.</p>
	            <a href="news-single.html" class="continue">Continue Reading</a>
	            <div class="comment-quantity">${post.postViews} Views</div>
	            <div class="comment-quantity">${post.postLikes} Likes</div>
	        </div>
	    </div>
    </c:forEach>
    
    <div class="pagination-wrap">
        <ul class="pagination">
            <li><a href="#"><i class="fa fa-chevron-left" aria-hidden="true"></i></a></li>
            <li><a href="#">1</a></li>
            <li class="active"><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li><a href="#"><i class="fa fa-chevron-right" aria-hidden="true"></i></a></li>
        </ul>
    </div>
</div>
<!--NEWS LIST END-->


        </div>
    </div>
</div>

<!--CONTENT END-->