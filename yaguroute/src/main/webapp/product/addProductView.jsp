<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 등록</title>
	<link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script type="text/javascript">


    $(function(){
    	function fncAddProduct(){
   	
    	//Form 유효성 검증  	
    	    var name = $("input[name='prodName']").val();
    	    var price = $("input[name='prodPrice']").val();
    	    var stock = $("input[name='prodStock']").val();
    	    var category = $("input[name='prodCategory']").val();
    	    var teamcode = $("input[name='prodTeamCode']").val();
    	    
    	    if(name == null || name.length<1){
    	      alert("상품명은 반드시 입력하여야 합니다.");
    	      return;
    	    }
    	    if(price == null || price.length<1){
    	      alert("가격은 반드시 입력하셔야 합니다.");
    	      return;
    	    }
    	    if(stock == null || stock.length<1){
    	      alert("재고는 반드시 입력하셔야 합니다.");
    	      return;
    	    }
    	    if(category == null || category.length<1){
    	      alert("상품카테고리는 반드시 입력하셔야 합니다.");
    	      return;
    	    }  
    	    if(teamcode == null || teamcode.length<1){
    		      alert("팀 코드는 반드시 입력하셔야 합니다.");
    		      return;
    		    } 
    	    // 폼 제출
    	    $("form").attr("enctype","multipart/form-data").attr("method","POST").attr("action","/product/addProduct").submit();
    	}
    	
    	  $(".comment-submit:contains('등록')").on('click', function(){
    		    fncAddProduct();
    		  });
    		});

    </script>	
</head>

<style>

.comment-submit {
  background-color: #8CD790; /* 배경색 설정 */
  color: white; /* 글자색 설정 */
  border: none; /* 테두리 제거 */
  padding: 10px 20px; /* 안쪽 여백 설정 */
  font-size: 16px; /* 글자 크기 설정 */
  cursor: pointer; /* 마우스 커서를 손가락 모양으로 변경 */
}

.comment-submit:hover {
  background-color: #4CAF50; /* 마우스 오버 시 배경색 변경 */
}


</style>

<body bgcolor="#ffffff" text="#000000">


<div class="container">
   <div class="row">
<div class="col-md-12 col-sm-12 col-xs-12">
    <!--BREADCRUMBS BEGIN-->
<section class="image-header">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="info">
                    <div class="wrap">
                        <ul class="breadcrumbs">
                            <li><a href="algudgodmain.jsp">Main</a>/</li>
                            <li>Category</li>
                        </ul>
                        <h1>Category</h1>
                    </div>
                </div>
            </div>	
        </div>
    </div>
</section>
<!--BREADCRUMBS END-->

    <!--CHECKOUT WRAP BEGIN-->

 			<div class="col-md-7">
                <h4>상품 등록</h4>
               	</br>
                <div class="customer-info">
                    <form>
                        <div class="row">
                            <div class="col-md-9">
                                <div class="item">
                                    <label>
                                        <span>상품명<i>*</i></span>
                                        <input type="text" placeholder="상품명을 입력하세요" name="prodName">
                                    </label>
                                </div>
                            </div>
                            
                            
                  			<div class="col-md-12">
                                <div class="item">
                                    <label>
                                        <span>상품 이미지 <i>*</i></span>
                                        <input  type="file" name="prodImage" multiple="multiple">
                                    </label>
                                </div>
                            </div>
                            
                            
                            <div class="col-md-9">
                                <div class="item">
                                    <label>
                                        <span>가격 <i>*</i></span>
                                        <input type="text" placeholder="가격을 입력하세요" name="prodPrice">
                                    </label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="item">
                                    <label>
                                        <span>상품카테고리 <i>*</i></span>
                                        <select  name="prodCategory">  <!-- 나중에 에러나니까 제거 -->
                                     	    <option value="0" ${ prodCategory ==0 ? "selected" : ""}>상품 카테고리를 선택하세요</option>
                                            <option value="1" ${ prodCategory ==1 ? "selected" : ""}>유니폼</option>
                                            <option value="2" ${ prodCategory ==2 ? "selected" : ""}>모자</option>
                                            <option value="3" ${ prodCategory ==3 ? "selected" : ""}>야구용품</option>
                                            <option value="4" ${ prodCategory ==4 ? "selected" : ""}>잡화</option>
                                        </select>
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="item">
                                    <label>
                                        <span>구단<i>*</i></span>
                                        <select class="basic" name="prodTeamCode">
                                       	 <option value="">구단을 선택하세요</option>
                                            <option value="OB">두산베어스</option>
                                            <option value="LT">롯데자이언츠</option>
                                            <option value="LG">LG트윈스</option>
                                            <option value="KT">KT위즈</option>
                                            <option value="HT">기아타이거즈</option>
                                            <option value="SK">SSG랜더스</option>
                                            <option value="NC">NC다이노스</option>
                                            <option value="WO">키움히어로즈</option>
                                            <option value="SS">삼성라이온즈</option>
                                            <option value="HH">한화이글스</option>
                                            
                                        </select>
                                    </label>
                                </div>
                            </div>
                 
    
                            <div class="col-md-9">
                                <div class="item">
                                    <label>
                                        <span>상품재고 <i>*</i></span>
                                        <input  type="text" placeholder="수량을 입력하세요"name="prodStock">
                                    </label>
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="filter-item">
                            <ul>
                                <li>
                                    <input type="checkbox" class="filter-check" id="test22">
                                    <label for="test22">내용을 확인 하셨습니까?</label>
                                </li>
                            </ul>
                        </div>
                        
                        </form>
                       </div>
                     </div>
                       
				</div>
			</div>
		</div>
  							
	<div class="col-md-8 text-center" >
	<button class="comment-submit">등록</button>
	</div>


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