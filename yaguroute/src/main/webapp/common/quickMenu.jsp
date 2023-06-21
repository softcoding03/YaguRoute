<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript">
function isNextPageAvailable() {
	  var currentPosition = history.length;
	  history.forward();
	  var newPosition = history.length;
	  history.go(currentPosition - newPosition);
	  return newPosition > currentPosition;
	}

$(document).ready(function(){
	var currentPosition = parseInt($(".quickmenu").css("top"));
	$(window).scroll(function() {
	   	var position = $(window).scrollTop(); 
	   	$(".quickmenu").stop().animate({"top":position+currentPosition+"px"},400);
  	});
	
	$('#top').click(function(e) {
		$('html, body').animate({ scrollTop: 0 }, 400);
 	});
	
	$('#bottom').click(function(e) {
		var bottomPosition = $(document).height() - $(window).height();
		$('html, body').animate({ scrollTop: bottomPosition }, 400);
 	});
	
  	$('#back').click(function(e) {
  		if(history.length === 1){
  			e.preventDefault()
  		}else{
  			history.back();
  		}
 	});
  	
  	$('#forward').click(function(e) {
  		if(isNextPageAvailable()){
  			e.preventDefault()
  		}else{
  			history.forward();
  		}
 	});
  	
});
/* $(document).ready(function(){
	
	var currentPosition = parseInt($(".quickmenu").css("top"));
	$(window).scroll(function() {
	   	var position = $(window).scrollTop(); 
	   	$(".quickmenu").animate({"top":position+currentPosition+"px"},500);
  	});
	
	$('#top').click(function() {
		 $('html, body').animate({ scrollTop: 0 }, 400);
 	});
	
	$('#bottom').click(function() {
		var bottomPosition = $(document).height() - $(window).height();
		$('html, body').animate({ scrollTop: bottomPosition }, 400);
	});
	
  	$('#back').click(function() {
		history.back();
 	});
  	
  	$('#forward').click(function() {
	   history.forward();
 	});
}); */
</script>
<style type="text/css">
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
	top: 50%;
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

.glyphicon {
	font-family: 'Glyphicons Halflings' !important;
}
</style>
<div class="quickmenu">
  <ul>
    <li><a role="button" id="top"><span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span></a></li>
    <li><a role="button" id="back"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span></a></li>
    <li><a role="button" id="forward"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></a></li>
    <li><a role="button" id="bottom"><span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></a></li>
  </ul>
</div>
<!-- <div class="quickmenu">
  <ul>
    <li><a role="button" id="top"><span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span></a></li>
    <li><a role="button" id="bottom"><span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></a></li>
    <li><a role="button" id="back"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span></a></li>
    <li><a role="button" id="forward"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></a></li>
  </ul>
</div>   -->