<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>论坛</title>
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
<script src="../statics/35chat/js/chatList.js"></script>
<!-- 调用find方法 -->


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
								<a class="navbar-brand" href="../index.jsp">Just<span>Do
										it</span></a>
							</h1>
						</div>
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse nav-wil"
							id="bs-example-navbar-collapse-1">
							<nav class="cl-effect-15" id="cl-effect-15">
								<ul>
									<li><a href="http://localhost:8080/newbosses/index.jsp" class="active"
										data-hover="返回主页">返回主页</a></li>
									<li><a href="#" class="dropdown-toggle"
										data-toggle="dropdown" role="button" aria-haspopup="true"
										aria-expanded="false">学校 <span class="caret"></span></a>
										<ul class="dropdown-menu">
											<li><a href="#hb">华北地区</a></li>
											<li><a href="#hd">华东地区</a></li>
											<li><a href="#hz">华中地区</a></li>
											<li><a href="#hn">华南地区</a></li>
											<li><a href="#db">东北地区</a></li>
											<li><a href="#xn">西南地区</a></li>
											<li><a href="#xb">西北地区</a></li>
											<li><a href="#ggt">港澳台地区</a></li>
										</ul></li>
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
									<li><a href="../user/selfCenter.jsp" data-hover="个人中心">个人中心</a></li>
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
				</div>

				<!--Header-->
				<!--Chat-->
				<br>
				<br>
				<br>
				<br>

				<div id="chat-list">
					<!-- start of page content -->

					<div class="span8 main-listing">

						<article class="format-standard type-post hentry clearfix">

							<header class="clearfix">

								<h3 class="post-title">
									<span onclick="findToThis(2,10001)" style="cursor: pointer"
										id="hb">华北专区</span>
								</h3>

								<div class="post-meta clearfix">
									<!--最后更新日期-->
									<span class="date">最后更新时间:<fmt:formatDate value="${bbsMsg[2].lastPubTime }" pattern="yyyy-MM-dd HH:mm" /></span>
									<!--话题数量        -->
									<span class="comments"><a href="#"
										title="Comment on Integrating WordPress with Your Website">总发帖数:${bbsMsg[2].noteCount }</a></span>
									<!--浏览量 换图标-->
									<span class="like-count">66</span>
								</div>
								<!-- end of post meta -->

							</header>

							<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;华北地区包括河北省、山西省，北京市，天津市，和内蒙古中部（呼和浩特市、包头市、鄂尔多斯市、乌兰察布市）。
							主要为温带季风气候。夏季高温多雨，冬季寒冷干燥。年平均气温在8°C-13°C左右。年降水量在400-1000mm左右。内蒙古自治区降水量少于400mm，为半干旱区域。
							华北地区是我国高教最为发达的地区，百年名校北京大学，清华大学，中国人民大学，北京师范大学等众多高等学府藏于此地，是中国教育的摇篮。</p>
							<br>

						</article>
						<article class="format-standard type-post hentry clearfix">

							<header class="clearfix">

								<h3 class="post-title">
									<span onclick="findToThis(3,10246)" style="cursor: pointer"
										id="hd">华东专区</span>
								</h3>

								<div class="post-meta clearfix">
									<span class="date">最后更新时间:<c:forEach items="${bbsMsg }" var="item"><c:if test="${item.schLocal==3 }"><fmt:formatDate value="${item.lastPubTime }" pattern="yyyy-MM-dd HH:mm" /></c:if></c:forEach></span> <span class="comments"><a
										href="#" title="Comment on Using Javascript">总发帖数:${bbsMsg[3].noteCount }</a></span> <span
										class="like-count">18</span>
								</div>
								<!-- end of post meta -->

							</header>

							<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;华东地区是政治划分，不是人文和自然划分。如今，华东仍被用作地区用名，包括（现上海、江苏、浙江、安徽、福建、江西、山东、台湾）七省一市，其中，台湾因特殊性，而单独列出，统计资料时一般也不包含在内。除此以外，其余六省一市的行政区划代码均以“3”开头。
							此外,华东地区交通便利,旅游资源丰富</p>
							<br>
						</article>



						<article class=" type-post  format-standard hentry clearfix">

							<header class="clearfix">

								<h3 class="post-title">
									<span onclick="findToThis(4,11902)" style="cursor: pointer"
										id="hz">华中专区</span>
								</h3>

								<div class="post-meta clearfix">
									<span class="date">最后更新时间:<c:forEach items="${bbsMsg }" var="item"><c:if test="${item.schLocal==4 }"><fmt:formatDate value="${item.lastPubTime }" pattern="yyyy-MM-dd HH:mm" /></c:if></c:forEach></span> <span class="comments"><a
										href="#" title="Comment on WordPress Site Maintenance">总发帖数:${bbsMsg[4].noteCount }</a></span> <span class="like-count">15</span>
								</div>
								<!-- end of post meta -->

							</header>

							<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;中国华中地区，简称华中，中国七大地理分区之一，包括河南、湖北、湖南三省（按照自北向南排序），华中国土总面积约56万平方公里，约占全国国土总面积的5.9%。截至2017年底，华中地区常住人口约2.23亿人，生产总值约11.61万亿元，人均生产总值约5.20万元。
							华中地区历史文化厚重，资源丰富，水陆交通便利，是全国工业农业的心脏和交通中心之一。拥有多所重点中学及高等院校。</p>
							<br>
						</article>
						<article class=" type-post  format-standard hentry clearfix">

							<header class="clearfix">

								<h3 class="post-title">
									<span onclick="findToThis(5,10384)" style="cursor: pointer"
										id="hn">华南专区</span>
								</h3>

								<div class="post-meta clearfix">
									<span class="date">最后更新时间:<c:forEach items="${bbsMsg }" var="item"><c:if test="${item.schLocal==5 }"><fmt:formatDate value="${item.lastPubTime }" pattern="yyyy-MM-dd HH:mm" /></c:if></c:forEach></span> <span class="comments"><a
										href="#" title="Comment on WordPress Site Maintenance">总发帖数:${bbsMsg[5].noteCount }</a></span> <span class="like-count">15</span>
								</div>
								<!-- end of post meta -->

							</header>

							<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;华南地区，中国大区之一，包括广东省、广西壮族自治区、海南省、香港特别行政区、澳门特别行政区。民国时代，华南范围涵盖广东、广西、海南、福建及云南、贵州，1945年抗日战争胜利后又列入台湾省，合称“华南六省”，而民间的“华南地区”则有多种说法，广义自然地理上的华南地区包括福建及台湾省。
							华南地区教育资源丰富,拥有多所高等院校及广州美术学院、星海音乐学院、香港演艺学院、广西艺术学院等艺术类院校。</p>
							<br>
						</article>
						<article class=" type-post  format-standard hentry clearfix">

							<header class="clearfix">

								<h3 class="post-title">
									<span onclick="findToThis(1,10213)" style="cursor: pointer"
										id="db">东北专区</span>
								</h3>

								<div class="post-meta clearfix">
									<span class="date">最后更新时间:<c:forEach items="${bbsMsg }" var="item"><c:if test="${item.schLocal==1 }"><fmt:formatDate value="${item.lastPubTime }" pattern="yyyy-MM-dd HH:mm" /></c:if></c:forEach></span> <span class="comments"><a
										href="#" title="Comment on WordPress Site Maintenance">总发帖数:${bbsMsg[1].noteCount }</a></span> <span class="like-count">15</span>
								</div>
								<!-- end of post meta -->

							</header>

							<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;东北地区，是一个地理文化大区和经济大区，不是行政区；“东北”一词，最早发见于《周礼·职方氏》。“东北曰幽州，其镇山曰医巫闾。”《山海经》中，“东北海之外，大荒之中”， “有山，名曰不咸，有肃慎氏之国”。
							1945年至1954年中共设东北局和东北人民政府，以辖辽东、辽西、热河、内蒙古自治区、吉林、松江省、黑龙江7个省区。东北地区交通便捷，拥有众多工业类高等学府。</p>
							<br>
						</article>
						<article class=" type-post  format-standard hentry clearfix">

							<header class="clearfix">

								<h3 class="post-title">
									<span onclick="findToThis(7,10611)" style="cursor: pointer"
										id="xn">西南专区</span>
								</h3>

								<div class="post-meta clearfix">
									<span class="date">最后更新时间:<c:forEach items="${bbsMsg }" var="item"><c:if test="${item.schLocal==7 }"><fmt:formatDate value="${item.lastPubTime }" pattern="yyyy-MM-dd HH:mm" /></c:if></c:forEach></span> <span class="comments"><a
										href="#" title="Comment on WordPress Site Maintenance">总发帖数:${bbsMsg[7].noteCount }</a></span> <span class="like-count">15</span>
								</div>
								<!-- end of post meta -->

							</header>

							<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;西南地区，全称为中华人民共和国西南地区，西南地区，中国地理分区之一，东临中南地区，北依西北地区，包括四川省、贵州省、云南省、西藏自治区、重庆市共五个省市区。
							口语中提及的西南地区有时也只指老四川（含重庆不含川西高原）、云南、贵州，即“西南三省”。其中，四川盆地是该地区和中西部人口最稠密、经济最发达、商业最繁华、历史最深厚、文化最昌盛、教育最领先、科技最超前、交通最便捷、区位最重要的地区。盆地内的成都、重庆是西南及中西部最发达的城市、是新一线城市的龙头，合称“西南双子星”。
							西南地区拥有众多普通高校及军事类院校。</p>
							<br>
						</article>
						<article class=" type-post  format-standard hentry clearfix">

							<header class="clearfix">

								<h3 class="post-title">
									<span onclick="findToThis(6,10698)" style="cursor: pointer"
										id="xb">西北专区</span>
								</h3>

								<div class="post-meta clearfix">
									<span class="date">最后更新时间:<c:forEach items="${bbsMsg }" var="item"><c:if test="${item.schLocal==6 }"><fmt:formatDate value="${item.lastPubTime }" pattern="yyyy-MM-dd HH:mm" /></c:if></c:forEach></span> <span class="comments"><a
										href="#" title="Comment on WordPress Site Maintenance">总发帖数:${bbsMsg[6].noteCount }</a></span> <span class="like-count">15</span>
								</div>
								<!-- end of post meta -->

							</header>

							<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;西北是当今中国的七大地理分区之一，行政区划上包括陕西省、甘肃省、青海省、宁夏回族自治区、新疆维吾尔自治区5个省、自治区。主要城市有西安、兰州、西宁、银川、乌鲁木齐等。
							西北地区面积广大，约占全国面积的30%，人口约占全国的7.3%。西北地区是中国少数民族主要聚居地区之一，少数民族人口约占全国少数民族总人口的1/3，主要少数民族有回族、维吾尔族、哈萨克族、藏族、蒙古族、俄罗斯族等。
							</p>
							<br>
						</article>
						<article class=" type-post  format-standard hentry clearfix">

							<header class="clearfix">

								<h3 class="post-title">
									<span onclick="findToThis(8,10998)" style="cursor: pointer"
										id="ggt">港澳台专区</span>
								</h3>

								<div class="post-meta clearfix">
									<span class="date">最后更新时间:<c:forEach items="${bbsMsg }" var="item"><c:if test="${item.schLocal==8 }"><fmt:formatDate value="${item.lastPubTime }" pattern="yyyy-MM-dd HH:mm" /></c:if></c:forEach></span> <span class="comments"><a
										href="#" title="Comment on WordPress Site Maintenance">总发帖数:${bbsMsg[8].noteCount }</a></span> <span class="like-count">15</span>
								</div>
								<!-- end of post meta -->

							</header>

							<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;港澳台地区，是对中华人民共和国香港特别行政区、中华人民共和国澳门特别行政区、中华人民共和国台湾省的统称，因为此三地在政治、经济和文化体制上有诸多类似，有别于大陆（内地）， 故我们常常将香港、澳门、台湾等地区统称为“港澳台”，
							在文化体制上，香港和台湾的娱乐业较为发达，无论是音乐还是电影或是本地戏剧，两地的娱乐文化新闻多，故而在多数娱乐报道将两地的信息放在一起，使用简称合并为“港台”地区。
							在风俗习惯和生活方式方面，受各自人口迁移的影响，香港和台湾的习惯用语有所差异：香港通用广东的粤语；而台湾因为有大量福建人和祖籍为广东的客家族的移民而通用闽南语和客家话。港澳台地区都沿用繁体汉字。
							港澳台地区拥有香港中文大学，澳门大学等高等院校。</p>
							<br>
						</article>
						<br>
						<br>
						<br>

						<!-- end of page content -->

					</div>
					<!--Chat-->

				</div>
			</div>


		</div>
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