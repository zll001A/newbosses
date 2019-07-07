<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html lang="en">

<head>
<link href="http://localhost:8080/newbosses/statics/css/note.css"
	rel="stylesheet">
<link href="http://localhost:8080/newbosses/statics/css/bootstrap.css"
	rel="stylesheet">
<link
	href="http://localhost:8080/newbosses/statics/css/sweetalert2.min.css"
	rel="stylesheet">
<script
	src="http://localhost:8080/newbosses/statics/js/jquery-1.11.3.js"></script>

<script
	src="http://localhost:8080/newbosses/statics/js/sweetalert2.min.js"></script>
<script src="http://localhost:8080/newbosses/statics/js/utils.js"></script>

<!-- 配置文件 -->
<script type="text/javascript"
	src="http://localhost:8080/newbosses/statics/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript"
	src="http://localhost:8080/newbosses/statics/ueditor/ueditor.all.js"></script>

<title>编辑区</title>
<!-- Meta Tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />


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
	background-image:
		url(http://localhost:8080/newbosses/statics/1633chat/images/bann1.jpg);
	background-repeat: repeat;
	background-size: cover;
}

nav, #chat-list {
	background-color: white;
}

#toTopHover, #toTop {
	background-color: black;
	filter: alpha(Opacity = 80);
	-moz-opacity: 0.5;
	opacity: 0.5;
}

#pagination {
	background-color: rgb(181, 193, 187);
	text-align: center
}

#chat-list {
	padding: 30px;
}

.btn btn-primary {
	align: right;
}
</style>

<!-- Style Sheet-->
<link rel='stylesheet' id='main-css-css'
	href='http://localhost:8080/newbosses/statics/35chat/css/main5152.css?ver=1.0'
	type='text/css' media='all' />

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
								<a class="navbar-brand" href="#">修改<span>原帖</span></a>
							</h1>
						</div>
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse nav-wil"
							id="bs-example-navbar-collapse-1">
							<nav class="cl-effect-15" id="cl-effect-15">
								<ul>
									<li><a href="http://localhost:8080/newbosses/index.jsp"
										class="active" data-hover="返回主页">返回主页</a></li>
									<li><a href="http://localhost:8080/newbosses/chat/bbs.jsp"
										data-hover="返回论坛">返回论坛</a></li>
									<li class="dropdown menu__item"><a href="#"
										class="dropdown-toggle menu__link active"
										data-toggle="dropdown" data-hover="发帖相关" role="button"
										aria-haspopup="true" aria-expanded="false">发帖相关<span
											class="caret"></span></a>
										<ul class="dropdown-menu">
											<li><a href="../noteServlet?actionName=edit">发布新帖</a></li>
											<li><a href="http://localhost:8080/newbosses/noteServlet?actionName=changeNote">修改原帖</a></li>
											<li><a href="http://localhost:8080/newbosses/noteServlet?actionName=selectType">发起话题</a></li>
										</ul></li>

									<li><a href="user/selfCenter.jsp" data-hover="个人中心">个人中心</a></li>
								</ul>
							</nav>
						</div>
					</nav>

					<div class="col-md-12">
						<div class="data_list">
							<div class="data_list_title">
								<span class="glyphicon glyphicon glyphicon-th-list"> </span>&nbsp;
								帖子列表
							</div>

							<div class="note_datas">
								<ul>
									<c:forEach items="${noteList }" var="item">
										<li><span class="col-md-9">『 <fmt:formatDate value="${item.pubTime }"
												pattern="yyyy-MM-dd" />』&nbsp;&nbsp; <a href="">${item.title }</a></span>
											
												<button class="btn btn-primary" type="button"
													onclick="updateNote(${item.noteId})">修改</button>
												<button class="btn btn-danger" type="button"
													onclick="deleteNote(${item.noteId})">删除</button>
											
										</li>
									</c:forEach>

								</ul>
							</div>

						</div>
					</div>



				</div>
			</div>


		</div>
		<script>
	// 跳转到发布云记的页面
	function updateNote(noteId){
		window.location.href="noteServlet?actionName=edit&noteId="+noteId;
	}
	
	function deleteNote(noteId){
		//使用sweet-alert
			swal({
				title: "删除提示",   //弹出框的title
		       text: "确定删除吗？",  //弹出框里面的提示文本
		       type: "warning",    //弹出框类型
		       showCancelButton: true, //是否显示取消按钮
		       confirmButtonColor: "#DD6B55",//确定按钮颜色
		       cancelButtonText: "取消",//取消按钮文本
		       confirmButtonText: "是的，确定删除！"//确定按钮上面的文档
		     }).then(function(isConfirm) {
		    	  if (isConfirm) { 			    		   
		    		  // 发送ajax请求后台，删除指定id的note对象
		    		  $.post("noteServlet",{actionName:"delete",noteId:noteId},function(data){
		    			  if (data.code ==1) {
		    				  // 删除成功,跳转到列表页
		    				  swal("删除成功！","","success");
		    			      
		    				  window.location.href = "chat/bbs.jsp";
		    			  } else {
		    				  swal("删除失败！","","error");
		    			  }
		    		  });
		    		  
		    	  }
		    }); 
	}
</script>
</body>

<!-- js -->
<script type="text/javascript"
	src="http://localhost:8080/newbosses/statics/1633chat/js/jquery-2.2.3.min.js"></script>




<a href="#home" id="toTop" style="display: block;"> <span
	id="toTopHover" style="opacity: 1;"><img
		src="http://localhost:8080/newbosses/statics/xc/images/backtop.jpg"></img></span></a>

<!-- //平滑滚动 -->
<script type="text/javascript"
	src="http://localhost:8080/newbosses/statics/1633chat/js/bootstrap-3.1.1.min.js"></script>
</html>