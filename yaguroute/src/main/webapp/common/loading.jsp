<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <style type="text/css">
    	/* body { 
	    	margin-top: 100px; 
	    	background-color: #137b85; 
	    	color: #fff; 
	    	text-align:center; 
    	} */
    	.img-size{
    		width: auto;
    		height: 300px;
    		padding-left: 100px;
    		padding-right: 100px
    	}
	    .loading {
	      position: fixed;
	      top: 0;
	      left: 0;
	      width: 100%;
	      height: 100%;
	      background-color: #137b85;
	      display: flex;
	      justify-content: center;
	      align-items: center;
	      z-index: 9999;
	    }
	    #back-img {
		  position: fixed;
		  width: 100%;
		  height: 100vh;
		  overflow: hidden;
		}
	    .loading-screen{
		  display: block;
		  width: 50px;
		  height: 50px;
		  border: 3px solid rgba(255,255,255,.3);
		  border-radius: 50%;
		  border-top-color: #fff;
		  animation: spin 1s ease-in-out infinite;
		  -webkit-animation: spin 1s ease-in-out infinite;
		}
	    @keyframes spin {
		  to { -webkit-transform: rotate(360deg); }
		}
		@-webkit-keyframes spin {
		  to { -webkit-transform: rotate(360deg); }
		}
    </style>
    <script type="text/javascript">
		$(window).on('load',function() {
			$('.loading').fadeOut();
		});
		$(window).on("beforeunload", function() {
			$(".loading").fadeIn();
		});
		$(window).on("unload", function() {
		    $(".loading").hide();
		  });
	</script>
</head>
<body>
<div class="loading">
	
	<img id="back-img" alt="" src="/images/baseball/loading_img_01.png">
	<!-- <img id="back-img" alt="" src="https://png.pngtree.com/background/20230426/original/pngtree-man-cleaning-a-baseball-field-picture-image_2491841.jpg"> -->
<div class="mathc-live-broadcasts background" style="margin-top: 0px;">
	<div class="broadcast-tabs-wrapper">
		<ul class="nav nav-tabs" role="tablist">
			<li style="border-radius: 30%;background: content-box;"><h1 style="margin-left: 30px;margin-right: 30px;color:white;font-size: 50px;font-family:'Gwangyang'">경기 불러오는 중</h1></li>
		</ul>
	</div>
</div>
	<!-- <div><h1 style="font-size: 60px;">경기 불러오는 중</h1></div>
	   -->
</div>
</body>
</html>