<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script src="http://localhost:8080/newbosses/statics/js/bootstrap.js"></script>
<script
	src="http://localhost:8080/newbosses/statics/js/sweetalert2.min.js"></script>
<script src="http://localhost:8080/newbosses/statics/js/utils.js"></script>
<!-- 配置文件 -->
<script type="text/javascript"
	src="http://localhost:8080/newbosses/statics/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript"
	src="http://localhost:8080/newbosses/statics/ueditor/ueditor.all.js"></script>

<title>发帖区</title>
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
								<a class="navbar-brand" href="#">发布<span>新帖</span></a>
							</h1>
						</div>
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse nav-wil"
							id="bs-example-navbar-collapse-1">
							<nav class="cl-effect-15" id="cl-effect-15">
								<ul>
									<li><a href="http://localhost:8080/newbosses/index.jsp"
										class="active" data-hover="返回主页">返回主页</a></li>
									<li><a href="bbs.jsp" data-hover="返回论坛">返回论坛</a></li>


									<li><a href="user/selfCenter.jsp" data-hover="个人中心">个人中心</a></li>
								</ul>
							</nav>
						</div>
					</nav>
					<div class="w3ls_search">
						<div class="cd-main-header">
							<ul class="cd-header-buttons">
								<li><a class="cd-search-trigger" href="#cd-search"> <span></span></a></li>
							</ul>
							<!-- cd-header-buttons -->
						</div>
						<div id="cd-search" class="cd-search">
							<form action="#" method="post">
								<input name="Search" type="search" placeholder="Search...">
								<!-- 搜索框 -->
							</form>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>

<div class="col-md-9">
	<div class="data_list">
		<div class="data_list_title">
			<span class="glyphicon glyphicon glyphicon-th-list"> </span>&nbsp; 云记列表 
		</div>
		
		<c:if test="${empty page }">
			<h2>暂未查询到云记数据！ </h2>
		</c:if>
		<c:if test="${!empty page }">	
		<div class="note_datas">
			<ul>
				<c:forEach items="${page.dataList }" var="item">
					<li>
						『 <fmt:formatDate value="${item.pubTime }" pattern="yyyy-MM-dd"/>』&nbsp;&nbsp;
						<a href="noteServlet?actionName=detail&noteId=${item.noteId }">${item.title }</a> 
					</li>
				</c:forEach>
				
			</ul>
		<%-- </div>
		<nav style="text-align: center">
		  <ul class="pagination   center">
		  		<c:if test="${page.pageNum > 1 }">
    				<li> <a href="indexServlet?pageNum=${page.prePage }&actionName=${actionName}&title=${title}"> <span>«</span> </a></li>
    			</c:if>
    			<c:forEach begin="${page.startNavPage }" end="${page.endNavPage }" var="p">
    				<li <c:if test="${page.pageNum == p }">class="active"</c:if> ><a href="indexServlet?pageNum=${p }&actionName=${actionName}&title=${title}">${p }</a></li>
    			</c:forEach>
    			<c:if test="${page.pageNum < page.totalPages }">
			    	<li> <a href="indexServlet?pageNum=${page.nextPage }&actionName=${actionName}&title=${title}"> <span>»</span> </a></li>
			    </c:if>
		  </ul>
		</nav> --%>
		
		
		</div>
		
		<nav style="text-align: center">
		  <ul class="pagination   center">
		  		<c:if test="${page.pageNum > 1 }">
    				<li> <a href="indexServlet?pageNum=${page.prePage }<c:if test="${!empty actionName }">&actionName=${actionName }</c:if><c:if test="${!empty title }">&title=${title }</c:if><c:if test="${!empty date }">&date=${date }</c:if><c:if test="${!empty typeId }">&typeId=${typeId }</c:if>"> <span>«</span> </a></li>
    			</c:if>
    			<c:forEach begin="${page.startNavPage }" end="${page.endNavPage }" var="p">
    				<li <c:if test="${page.pageNum == p }">class="active"</c:if> ><a href="indexServlet?pageNum=${p }<c:if test="${!empty actionName }">&actionName=${actionName }</c:if><c:if test="${!empty title }">&title=${title }</c:if><c:if test="${!empty date }">&date=${date }</c:if><c:if test="${!empty typeId }">&typeId=${typeId }</c:if>">${p }</a></li>
    			</c:forEach>
    			<c:if test="${page.pageNum < page.totalPages }">
			    	<li> <a href="indexServlet?pageNum=${page.nextPage }<c:if test="${!empty actionName }">&actionName=${actionName }</c:if><c:if test="${!empty title }">&title=${title }</c:if><c:if test="${!empty date }">&date=${date }</c:if><c:if test="${!empty typeId }">&typeId=${typeId }</c:if>"> <span>»</span> </a></li>
			    </c:if>
		  </ul>
		</nav>
		
		</c:if>
	</div>	
</div>

			</div>
		</div>


	</div>
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