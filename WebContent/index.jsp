<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<!-- <div id="top""></div> -->
<head>
<title>主页</title> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<link href="statics/css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="statics/css/style.css" type="text/css" rel="stylesheet" media="all">
<link href="statics/css/font-awesome.css" rel="stylesheet">  <!-- font-awesome icons --> 
<!-- //Custom Theme files -->
<!-- js -->
<script src="statics/js/jquery-2.2.3.min.js"></script>   
<!-- //js -->
 <style>
 	#banner1{
 		margin:0px;
 		padding:0px;
 		margin:0 auto;
 	}
 </style>
</head>
<body>
	<!-- header -->
	<div class="header">
		<nav class="navbar navbar-default">
			<div class="container">
				<div class="navbar-header navbar-left wthree">
					<h1><a href="index.jsp">New Bosses<span>萌新成长之路</span></a></h1>
				</div>
				<!-- navigation -->
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				
					
					<!-- 标题 -->
					<div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">					
						<ul class="nav navbar-nav navbar-left cl-effect-14">
							<li><a href="index.jsp" class="active">主页</a></li>
							<li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">学校 <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="#华北">华北地区</a></li>
									<li><a href="#华东">华东地区</a></li>
									<li><a href="#华中">华中地区</a></li>
									<li><a href="#华南">华南地区</a></li>
									<li><a href="#东北">东北地区</a></li>
									<li><a href="#西南">西南地区</a></li>
									<li><a href="#西北">西北地区</a></li>
									<li><a href="#港澳台">港澳台地区</a></li>
								</ul>
							</li> 
							<li><a href="typeServlet?actionName=noteCount">论坛</a></li>
							<li><a href="echart.jsp">数据分析</a></li>
							<li><a href="about.jsp">关于我们</a></li>	

							<li class="active"><a href="user/selfCenter.jsp">${user.uName }</a></li>			
						</ul>		
						<div class="clearfix"> </div>
					</div><!-- //navigation -->
				
				<div class="clearfix"> </div>
			</div>	
		</nav>		
	</div>	
	
	<!-- 分部分 -->
		<!-- banner  图片 -->
		<div id="banner1">
			<img src="statics/images/banner.jpg" height="400" width="1500" alt=" " />
		</div>
		<!-- banner  图片 -->
	
		<div class="col-md-12 welcome-w3lright">
			<!-- 动态包含 -->
			<jsp:include page="schmsg.jsp"></jsp:include><!-- 学校缩略图 -->
			<!-- 动态包含 -->
		</div>
	<!-- 分部分 -->			

	
	<!-- banner Slider starts Here  图片样式 -->
	<script src="statics/js/responsiveslides.min.js"></script>
	<script>
		// You can also use "$(window).load(function() {"
		$(function () {
		  // Slideshow 3
		  $("#slider3").responsiveSlides({
			auto:false,
			pager: true,
			nav: false,
			speed: 500,
			namespace: "callbacks",
			before: function () {
			  $('.events').append("<li>before event fired.</li>");
			},
			after: function () {
			  $('.events').append("<li>after event fired.</li>");
			}
		  });
	
		});
	</script>
	<!-- //End-slider-script -->
    <script src="statics/js/bootstrap.js"></script>
</body>
</html>