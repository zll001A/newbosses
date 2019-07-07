<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>个人中心</title>
<!-- Meta Tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />

<!-- self -->

<link rel="stylesheet" href="css/common.css" />
<link rel="stylesheet" href="css/shopsManager.css" /><!-- 下面的列表 -->

<script type="text/javascript" src="js/common.js"></script>


<script src="js/utils.js"></script>


<link href="bootstrap.css" rel="stylesheet">
<link href="note.css" rel="stylesheet">
<script type="text/javascript" src="bootstrap.js"></script>
<script type="text/javascript" src="jquery-1.11.3.js"></script>
<!-- //Meta Tags -->
<!-- Style-sheets -->
<link
	href="http://localhost:8080/newbosses/statics/1633chat/css/bootstrap.css"
	rel="stylesheet" type="text/css" media="all" />
<link
	href="http://localhost:8080/newbosses/statics/1633chat/css/style.css"
	rel="stylesheet" type="text/css" media="all" />




</head>
	<style type="text/css">
		html {
			background-image: url(../user/images/bann2.jpg);
			background-repeat: repeat;
			background-size:cover; 
		}
		nav,#chat-list{background-color: white;}
		#toTopHover,#toTop{background-color: black;filter:alpha(Opacity=80);-moz-opacity:0.5;opacity: 0.5; }
		#pagination{background-color: rgb(181,193,187);text-align:center}
		#chat-list {padding:30px;}
	</style>
	
	 <!-- Style Sheet-->
	  <link rel='stylesheet' id='main-css-css'  href='../statics/35chat/css/main5152.css?ver=1.0' type='text/css' media='all' />
	
<body>

	<!--Header-->
	<div class="header" id="home">
		<!--top-bar-w3-agile-->
		<div class="top-bar-w3-agile">
			<div class="container">
				<div class="header-top-agileits">
					<div class="agile_forms">
						<p>
							<span class="fa fa-map-marker" aria-hidden="true"></span>稻花香里说丰年
							传授人生经验
						</p>
					</div>

					<div class="clearfix"></div>
					<!-- 浮动边界 -->
				</div>
				<div class="header-nav">
					<nav class="navbar navbar-default">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed"
								data-toggle="collapse"
								data-target="#bs-example-navbar-collapse-1">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
							<h1>
								<a class="navbar-brand" href="#">个人<span>中心</span></a>
							</h1>
						</div>
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse nav-wil"
							id="bs-example-navbar-collapse-1">
							<nav class="cl-effect-15" id="cl-effect-15">
								<ul>
									<li><a href="http://localhost:8080/newbosses/index.jsp"
										class="active" data-hover="返回主页">返回主页</a></li>
									<li><a href="http://localhost:8080/newbosses/typeServlet?actionName=noteCount" data-hover="返回论坛">返回论坛</a></li>

									<li><a href="http://localhost:8080/newbosses/echart.jsp" data-hover="数据分析">数据分析</a></li>
									<li class="dropdown menu__item">
										<a href="#" class="dropdown-toggle menu__link active" data-toggle="dropdown" data-hover="发帖相关" role="button" aria-haspopup="true"
										    aria-expanded="false">发帖相关<span class="caret"></span></a>
										<ul class="dropdown-menu">
											 <li><a href="../noteServlet?actionName=edit">发布新帖</a></li>
											<li><a href="../noteServlet?actionName=changeNote">修改原帖</a></li>
											<li><a href="../noteServlet?actionName=selectType">发起话题</a></li>
										</ul>
									</li>
									<li></li>
									<li></li>
									<li></li>
									<li></li>
									<li></li>
									<li></li>
									<li></li>
									<li></li>
									<li><a href="../userServlet?actionName=logout"
										class="active" data-hover="退出">退出</a></li>
								</ul>
							</nav>
						</div>
					</nav>




					<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->


					<!--Header-->
					<!--Chat-->
					<br>
					<br>
					<br>
					<br>
					

					<div id="chat-list">
						<!-- start of page content -->

						<div class="span8 main-listing">

							
				<!--用户信息  开始 -->
				<form action="../userServlet" class="form-horizontal" method="post"
					enctype="multipart/form-data">

					<div class="container" style="width: 950px">

						<div class="col-md-7">
							<div class="form-group" >
								<input type="hidden" name="actionName" value="updateUser">
								<label for="nickName" class="col-sm-2 control-label">昵称:</label>
								<div class="col-sm-10">
									<input class="form-control" name="nick" id="nickName"
										placeholder="昵称" value="${user.nick }">
								</div>
								
							</div>
							<div class="form-group">
								<label for="mood" class="col-sm-2 control-label">心情:</label>
								<div class="col-sm-10">
									<textarea class="form-control" name="mood" id="mood" rows="3">${user.mood }</textarea>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" id="btn" class="btn btn-success"
										onclick="return checkForm()">修改</button>
									&nbsp;&nbsp; <span style="color: red" id="msg">${updateUserMsg }</span>
								</div>
							</div>
						</div>
					</div>
				</form>
				<!-- 模块 -->

				<ul class="cus02" style="width: 800px">
					<li>
						<p>
							<span>原创文章</span><a href="../noteServlet?actionName=edit">去上传</a>
					</li>
					<li>
						<p>
							<span>帖子数量：${user.noteCount }</span>
						</p>
					</li>
					<li>
						<p>
							<span>来自哪里：</span><span>${user.schName }</span>
						</p>

					</li>
				</ul>
			</div>
		</div>
							
							

						</div>
						<!-- end of page content -->

					</div>

				</div>
			</div>
	
	<script>
	// 在js中使用el表达式，需要加上引号
	var name = '${user.nick }';
	console.log(name);

	$("#nickName").blur(function() { // 失焦事件

		// 得到文本框的值
		var nick = $("#nickName").val();
		// 判断是否为空
		if (isEmpty(nick)) {
			// 提示信息
			$("#msg").html("用户昵称不可为空！");
			// 禁用提交按钮
			$("#btn").prop("disabled", true);
			return;
		}
		// 判断原本的昵称值和修改后的是否一致，不一致才请求后台
		if (nick == name) {
			return;
		}
		// 发送ajax请求后台
		$.ajax({
			type : "get",
			url : "userServlet",
			data : {
				actionName : "checkNick",
				nick : nick
			},
			success : function(data) {
				// 判断是否可用   1=可用，否则不可用
				if (data.code != 1) {
					// 提示信息
					$("#msg").html(data.msg);
					// 禁用提交按钮
					$("#btn").prop("disabled", true);
				}
			}
		});

	}).focus(function() { // 聚焦事件
		// 提示信息
		$("#msg").html("");
		// 禁用提交按钮
		$("#btn").prop("disabled", false);
	});

	/**
	 * 表单验证
	 */
	function checkForm() {
		// 得到文本框的值
		var nick = $("#nickName").val();
		// 判断是否为空
		if (isEmpty(nick)) {
			// 提示信息
			$("#msg").html("用户昵称不可为空！");
			// 禁用提交按钮
			$("#btn").prop("disabled", true);
			return false;
		}
	}
</script>
		
</body>
    <!-- js -->
	<script type="text/javascript" src="../statics/1633chat/js/jquery-2.2.3.min.js"></script>
	
	<!-- //js -->
	<script src="../statics/1633chat/js/responsiveslides.min.js"></script><!-- 搜索框要用 -->
	

	<!--search-bar-->
	<script src="../statics/1633chat/js/main.js"></script>   <!-- 搜索框 -->
	<!--//search-bar-->


	<a href="#home" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"><img src="../statics/xc/images/backtop.jpg"></img></span></a>
	
	<!-- //平滑滚动 -->
	<script type="text/javascript" src="../statics/1633chat/js/bootstrap-3.1.1.min.js"></script>
</html>