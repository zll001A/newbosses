<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">

<head>
<link href="http://localhost:8080/newbosses/statics/css/note.css" rel="stylesheet">
<link href="http://localhost:8080/newbosses/statics/css/bootstrap.css" rel="stylesheet">
<link href="http://localhost:8080/newbosses/statics/css/sweetalert2.min.css" rel="stylesheet">
<script src="http://localhost:8080/newbosses/statics/js/jquery-1.11.3.js"></script>

<script src="http://localhost:8080/newbosses/statics/js/sweetalert2.min.js"></script>
<script src="http://localhost:8080/newbosses/statics/js/utils.js"></script>

<!-- 配置文件 -->
<script type="text/javascript" src="http://localhost:8080/newbosses/statics/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="http://localhost:8080/newbosses/statics/ueditor/ueditor.all.js"></script>

	<title>编辑区</title>
	<!-- Meta Tags -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="" />
	
	
	<!-- //Meta Tags -->
	<!-- Style-sheets -->
	<link href="http://localhost:8080/newbosses/statics/1633chat/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link href="http://localhost:8080/newbosses/statics/1633chat/css/style.css" rel="stylesheet" type="text/css" media="all" />
	
	
	

</head>
	<style type="text/css">
		html {
			background-image: url(http://localhost:8080/newbosses/statics/1633chat/images/bann1.jpg);
			background-repeat: repeat;
			background-size:cover; 
		}
		nav,#chat-list{background-color: white;}
		#toTopHover,#toTop{background-color: black;filter:alpha(Opacity=80);-moz-opacity:0.5;opacity: 0.5; }
		#pagination{background-color: rgb(181,193,187);text-align:center}
		#chat-list {padding:30px;}
	</style>
	
	 <!-- Style Sheet-->
	  <link rel='stylesheet' id='main-css-css'  href='http://localhost:8080/newbosses/statics/35chat/css/main5152.css?ver=1.0' type='text/css' media='all' />
	  
<body >



	<!--Header-->
	<div class="header" id="home">
		<!--top-bar-w3-agile-->
		<div class="top-bar-w3-agile">
			<div class="container">
				<div class="header-top-agileits">
					<div class="agile_forms">
						<p><span class="fa fa-map-marker" aria-hidden="true"></span>稻花香里说丰年 传授人生经验</p>
					</div>
					
					<div class="clearfix"></div>   <!-- 浮动边界 -->
				</div>
				<div class="header-nav">
					<nav class="navbar navbar-default">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
									<span class="sr-only">Toggle navigation</span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
								</button>
							<h1><a class="navbar-brand" href="#">发布<span><c:if test="${empty Lname2 }">专区</c:if><c:if test="${!empty Lname2 }">${Lname2 }</c:if></span></a></h1>
						</div>
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
							<nav class="cl-effect-15" id="cl-effect-15">
								<ul>
									<li><a href="http://localhost:8080/newbosses/index.jsp" class="active" data-hover="返回主页">返回主页</a></li>
									<li><a href="http://localhost:8080/newbosses/chat/bbs.jsp"  data-hover="返回论坛">返回论坛</a></li>
									<li class="dropdown menu__item"><a href="#"
										class="dropdown-toggle menu__link active"
										data-toggle="dropdown" data-hover="发帖相关" role="button"
										aria-haspopup="true" aria-expanded="false">发帖相关<span
											class="caret"></span></a>
										<ul class="dropdown-menu">
											<li><a href="http://localhost:8080/newbosses/noteServlet?actionName=edit">发布新帖</a></li>

											<li><a href="http://localhost:8080/newbosses/noteServlet?actionName=changeNote">修改原帖</a></li>
											<li><a href="http://localhost:8080/newbosses/noteServlet?actionName=selectType">发起话题</a></li>
										</ul></li>
								
									<li><a href="user/selfCenter.jsp" data-hover="个人中心">个人中心</a></li>
								</ul>
							</nav>
						</div>
					</nav>
				
				
				
			<!--Header-->
<!-- 节约页面，动态包含 -->
<c:if test="${empty changePage }">			
			<div class="col-md-12">
	<div class="data_list">
		<div class="data_list_title">
			<span class="glyphicon glyphicon-cloud-upload"></span>&nbsp;
			<span>发布新帖</span>
		</div>
		<div class="container-fluid">
			<div class="container-fluid">
		  <div class="row" style="padding-top: 20px;">
		  	<div class="col-md-12">
		  		
			  		<form class="form-horizontal" method="post" action="noteServlet">
			  		   <div class="form-group">
					    <label for="typeId" class="col-sm-2 control-label">类别:</label>
					    <div class="col-sm-8">
					    	<select id="typeId" class="form-control" name="typeId">
								<option value="">请选择帖子类别...</option>
								<c:forEach items="${typeList }" var="item">
									<option value="${item.typeId }"   <c:if test="${noteInfo.typeId == item.typeId }">selected</c:if>  >${item.typeName }</option>
								</c:forEach>
							</select>
					    </div>
					  </div>
					  <div class="form-group">
					 	 <input type="hidden" name="noteId" value="${noteInfo.noteId }">
					  	<input type="hidden" name="actionName" value="addOrUpdate">
					    <label for="title" class="col-sm-2 control-label">标题:</label>
					    <div class="col-sm-8">
					      <input class="form-control" name="title" id="title" placeholder="帖子标题" value="${noteInfo.title }">
					    </div>
					   </div>
					  
					  <div class="form-group">
					 	<label for="content" class="col-sm-2 control-label">内容:</label>
					    <div class="col-sm-8">
					    	<textarea id="noteContent" name="content">${noteInfo.content }</textarea>
					    </div>
					  </div>			 
					  <div class="form-group">
					    <div class="col-sm-offset-5 col-sm-4">
					      <input type="submit" class="btn btn-primary" onclick="return saveNote();" value="保存">
						  &nbsp;&nbsp;&nbsp;<font id="error" color="red" style="font-size: 12px">${resultInfo.msg }</font>  
					    </div>
					  </div>
					</form>
		  	</div>
		  </div>
		</div>	
	</div>		
	</div>
</div>	

<script type="text/javascript">
var ue;
// 预加载
$(function(){
	// 实例化编辑器
   ue  = UE.getEditor('noteContent'); // noteContent是容器id属性值
});


</script>



</c:if>
<c:if test="${!empty changePage }">
	<jsp:include page="${changePage }"></jsp:include>
</c:if>
<!-- 节约页面，动态包含 -->




		





			
			
			
			<!--Header-->	
			</div>
		</div>
	 

	</div>  
</body>

	<!-- js -->
	<script type="text/javascript" src="http://localhost:8080/newbosses/statics/1633chat/js/jquery-2.2.3.min.js"></script>
	
	


	<a href="#home" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"><img src="http://localhost:8080/newbosses/statics/xc/images/backtop.jpg"></img></span></a>
	
	<!-- //平滑滚动 -->
	<script type="text/javascript" src="http://localhost:8080/newbosses/statics/1633chat/js/bootstrap-3.1.1.min.js"></script>
</html>