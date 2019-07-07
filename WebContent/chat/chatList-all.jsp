<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>论坛专区</title>
<!-- Meta Tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />


<!-- //Meta Tags -->
<!-- Style-sheets -->
<link href="http://localhost:8080/newbosses/statics/1633chat/css/bootstrap.css" rel="stylesheet"
	type="text/css" media="all" />
<link href="http://localhost:8080/newbosses/statics/1633chat/css/style.css" rel="stylesheet"
	type="text/css" media="all" />




</head>
	<style type="text/css">
html {
	background-image: url(http://localhost:8080/newbosses/statics/1633chat/images/bann1.jpg);
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
	href='http://localhost:8080/newbosses/statics/35chat/css/main5152.css?ver=1.0' type='text/css'
	media='all' />
	
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
								<a class="navbar-brand" href="bbs.jsp">${Lname }<span><c:if test="${Lname eq '搜索'}">${page.dataList[0].sel }</c:if><c:if test="${Lname ne '搜索'}">专区</c:if></span></a>
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
									<li><a href="http://localhost:8080/newbosses/user/selfCenter.jsp" data-hover="个人中心">个人中心</a></li>
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
							<form action="http://localhost:8080/newbosses/indexServlet" method="post">
								<input name="title" type="search" placeholder="Search..."
									value="${title }">
								<!-- 搜索框 -->
							</form>
						</div>
					</div>
					<div class="clearfix"></div>



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

						<!-- 按地区显示帖子和按搜索显示帖子共页 -->
							<c:forEach items="${page.dataList }" var="item">
								<article class="format-standard type-post hentry clearfix">

									<header class="clearfix">

										<h3 class="post-title">
											<a href="#" id="hb">${item.title}</a>
										</h3>

										<div class="post-meta clearfix">
											<!--最后更新日期-->
											<span class="date"><fmt:formatDate
													value="${item.pubTime }" pattern="yyyy-MM-dd HH:mm" /></span>
											<!--话题标签        -->
											<span class="category"><a href="#"
												title="View all posts in Server &amp; Database">${item.typeName }
													&amp; ${item.schName }</a></span>
											<!--话题数量     [不要了]   -->
											<span class="comments"><a href="#"
												title="Comment on Integrating WordPress with Your Website"> </a></span>
											<!--浏览量 换图标-->
											<span class="like-count">66</span>
										</div>
										<!-- end of post meta -->

									</header>

									<p id="reply_${item.noteId }">${item.content }<br><br><div style="text-align:right"><a class="readmore-link"
											href="#reply_${item.noteId }"<%--  onclick="addreply(${item.noteId })" --%>>回到开头</a></div>
											<%-- <div>这里填回复,样式参照话题列表,完成后删除标题userId reply replyTime
											<table id="reply_${item.noteId }">
												<c:forEach items="${item.replyMsg }" var="replyAll">
											 		<tr id="tr_${replyAll.replyId }">
											 			<td>${replyAll. }</td>
											 			<td>${replyAll. }</td>
											 			<td>${replyAll. }</td>
											 		</tr>
									 			</c:forEach>
								 			</table>
											</div> --%>
									</p>
									<br>
								</article>
							</c:forEach>
							<br>
							<br>
							<br>
							<c:if test="${empty page.dataList[0].sel }">
								<div id="pagination">
								<a href="http://localhost:8080/newbosses/chatServlet?actionName=page&pageNum=1" class="btn">« 首页</a>
								<c:if test="${page.pageNum > 1 }">
									<a href="http://localhost:8080/newbosses/chatServlet?actionName=page&pageNum=${page.prePage }" class="btn">上一页 «</a>
								</c:if>
								<c:forEach begin="${page.startNavPage }" end="${page.endNavPage }" var="p">
									<a href="http://localhost:8080/newbosses/chatServlet?actionName=page&pageNum=${p }" class="btn <c:if test="${page.pageNum == p }">active</c:if>">${p }</a>
								</c:forEach>
								<c:if test="${page.pageNum < page.totalPages }">
									<a href="http://localhost:8080/newbosses/chatServlet?actionName=page&pageNum=${page.nextPage }" class="btn">下一页 »</a>
								</c:if>
								<a href="http://localhost:8080/newbosses/chatServlet?actionName=page&pageNum=${page.totalPages }" class="btn">尾页 »</a>
								</div>
							</c:if>
							<c:if test="${page.dataList[0].sel == 'search' }">
								<div id="pagination">
								<a href="http://localhost:8080/newbosses/indexServlet?pageNum=1" class="btn">« 首页</a>
								<c:if test="${page.pageNum > 1 }">
									<a href="http://localhost:8080/newbosses/indexServlet?pageNum=${page.prePage }" class="btn">上一页 «</a>
								</c:if>
								<c:forEach begin="${page.startNavPage }" end="${page.endNavPage }" var="p">
									<a href="http://localhost:8080/newbosses/indexServlet?pageNum=${p }" class="btn <c:if test="${page.pageNum == p }">active</c:if>">${p }</a>
								</c:forEach>
								<c:if test="${page.pageNum < page.totalPages }">
									<a href="http://localhost:8080/newbosses/indexServlet?pageNum=${page.nextPage }" class="btn">下一页 »</a>
								</c:if>
								<a href="http://localhost:8080/newbosses/indexServlet?pageNum=${page.totalPages }" class="btn">尾页 »</a>
								</div>
							</c:if>
							

						</div>
						<!-- end of page content -->

					</div>

				</div>
			</div>
		</div>
		
		<!-- <div class="modal fade" id="myModalType" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	    <div class="modal-dialog" role="document" >
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">×</span></button>
	          <h4 class="modal-title" id="myModalLabel">新增</h4>
	        </div>
	        <div class="modal-body"> 
	          <div class="form-group">
	            <label for="typename">进行评论</label>
	             <input type="hidden" name="noteId" id="noteId"> 
	            <input type="text" name="modalTypeName" class="form-control" id="modalTypeName" placeholder="评论内容">         	
	          </div>      
	        </div>
	        <div class="modal-footer">
	          <span style="color:red;font-size:12px" id="msg"></span> &nbsp;&nbsp;&nbsp;
	          <button type="button" class="btn btn-default" data-dismiss="modal">
	          <span class="glyphicon glyphicon-remove"></span>关闭</button>
	          <button type="button" id="btn_submit" class="btn btn-primary">
	          <span class="glyphicon glyphicon-floppy-disk"></span>发布</button>
	        </div>
	      </div>
	    </div>
	  </div>
<script type="text/javascript" src="http://localhost:8080/newbosses/statics/35chat/js/jquery-1.11.3.js"></script>	  
<script type="text/javascript" src="http://localhost:8080/newbosses/statics/1633chat/js/bootstrap-3.1.1.min.js"></script>	  
<script type="text/javascript">

//========================= 添加评论[搞不出来,时间紧,不弄了]========================
	
	var noteId_num = null;
	
/**
 * 添加按钮绑定事件
 */
function addreply(noteId){
	
	var noteId = $("#noteId").val(noteId);
	
	// 清空文本框的值
	$("#modalTypeName").val("");
	
	// 设置模态框的标题
	$("#myModalLabel").html("进行评论");
	
	// 手动打开模态框
	$("#myModalType").modal("show");
	
	
};

/**
 * 保存按钮的点击事件
 */
$("#btn_submit").click(function(){
	
	// 得到类型名称的值
	var reply = $("#modalTypeName").val();
	// 非空判断
	if (isEmpty(typeName)) {
		$("#msg").html("评论不能为空！");
		return;
	}
	
	var typeId = $("#typeId").val();
	
	// 如果不为空，则发送ajax请求
	$.ajax({
		type:"post",
		url:"noteServlet",   //跟找帖子放到一起好了
		data:{
			actionName:"replyMsg",
			reply:reply,
			noteId:noteId
		},
		success:function(data) {
			// 判断是否更新成功
			if (data.code == 1) { // 成功
				//获取成功写入数据库的noteId
				noteId_num = $("#noteId").val();
				// 手动关闭模态框
				$("#myModalType").modal("hide");
				// 提示成功
				swal(data.msg,"","success");
				
				// 添加行为的DOM操作
				addReplyDom(data.result);
					
			} else {
				// 提示用户失败
				swal(data.msg,"","error");
			}
		}
	});
	
});
/**
 * 添加评论内容的DOM操作
 * 	1、添加tr
 * 		如果存在数据，则可以直接append到table对象中
 * 		如果没有数据，则需要创建table，在将table追加进去
 * 	
 * 
 * @param type
 */
function addReplyDom (replyMsg) {
	// 1、添加tr
	// 得到发布评论的用户名,评论内容,评论时间,来自学校,评论Id
	var uName = replyMsg.uName;
	var reply = replyMsg.reply;
	var replyId = replyMsg.replyId;
	var replyTime = replyMsg.replyTime;  //时间不够考虑加其中一个
	var schName = replyMsg.schName;   
	// 创建tr对象
	var tr = '<tr id="tr_'+replyId+'"> <td>'+uName+'</td><td>'+reply+'</td><td>'+replyTime+'</td></tr>';
	
	// 得到table对象
	var table = $("#myTable");
	
	// 判断table是否存在
	if (table.length == 1) { // 存在表格，可以直接appendtr
		// 向table中的tbody中追加tr对象
		table.children().append(tr);
	} else {
		
		// 创建table对象
		var myTable = '<table class="table table-hover table-striped" id="myTable"><tbody>'+
						'<tr> <th>用户名</th> <th>评论内容</th> <th>来自学校</th> </tr>' + tr + '</tbody></table>';
		
		// 得到父元素div
		var div = $("#noteId_num");
		div.html(myTable);
	}
	
}	
	





</script>		 -->
		
</body>
    <!-- js -->
<script type="text/javascript"
	src="http://localhost:8080/newbosses/statics/1633chat/js/jquery-2.2.3.min.js"></script>

<!-- //js -->
<script src="http://localhost:8080/newbosses/statics/1633chat/js/responsiveslides.min.js"></script>
<!-- 搜索框要用 -->


<!--search-bar-->
<script src="http://localhost:8080/newbosses/statics/1633chat/js/main.js"></script>
<!-- 搜索框 -->
<!--//search-bar-->


<a href="#home" id="toTop" style="display: block;"> <span
	id="toTopHover" style="opacity: 1;"><img
		src="http://localhost:8080/newbosses/statics/xc/images/backtop.jpg"></img></span></a>

<!-- //平滑滚动 -->
<script type="text/javascript"
	src="http://localhost:8080/newbosses/statics/1633chat/js/bootstrap-3.1.1.min.js"></script>
</html>