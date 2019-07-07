<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE>
<head>

<style type="text/css">

</style>

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

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据汇总</title>





<!-- 使用单文件引入的方式使用ECharts.JS -->
<script src="statics/js/echarts.min.js"></script>
<script src="statics/js/jquery-2.1.4.min.js"></script>
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
							
							<li><a href="chat/bbs.jsp">论坛</a></li>
							
							<li><a href="about.jsp">关于我们</a></li>	
							<li><a href="user/selfCenter.jsp">个人中心</a></li>			
						</ul>		
						<div class="clearfix"> </div>
					</div><!-- //navigation -->
				
				<div class="clearfix"> </div>
			</div>	
		</nav>		
	</div>	





	<!-- DOM用来设置展示ECharts图表的区域 -->
	<div id="myDiv" style="height: 400px;"></div>
	<script type="text/javascript">
		function loadData(option) {
			$.ajax({
				
				type : 'post', //传输类型
				async : false, //同步执行
				url : 'BarServlet', 
				data : {
					
					
				},
				dataType : 'json', //返回数据形式为json
				success : function(result) {
					if (result) {
						//初始化xAxis[0]的data
						option.xAxis[0].data = [];
						for (var i = 0; i < result.length; i++) {
							option.xAxis[0].data.push(result[i].typeName);
						}
						//初始化series[0]的data
						option.series[0].data = [];
						for (var i = 0; i < result.length; i++) {
							option.series[0].data.push(result[i].count);
						}
					}
				},
				error : function(errorMsg) {
					alert("加载数据失败");
				}
			});//AJAX
		}//loadData()
		var myChart = echarts.init(document.getElementById('myDiv'));
		var option = {
			backgroundColor:'black',
			itemStyle: {
		                color: 'yellow',
		    },
			tooltip : {
				show : true
			},
			legend : {
				data : [ '各主题的帖子数' ],
				textStyle:{
                    fontSize: 18,//字体大小
                    color: 'white'//字体颜色
                }

			},
			xAxis : [ {
				type : 'category',
				axisLabel : {
					show : true,
					textStyle : {
						color : 'white'
					}
				}
			} ],
			yAxis : [ {
				type : 'value',
				axisLabel : {
					show : true,
					textStyle : {
						color : 'white'
					}
				}
			} ],
			series : [ {
				name : '各主题的帖子数',
				type : 'bar'
			} ]
		};
		//加载数据到option
		loadData(option);
		//设置option
		myChart.setOption(option);
	</script>




<!-- DOM用来设置展示ECharts图表的区域 -->
	<div id="myDiv1" style="height: 400px;"></div>
	<script type="text/javascript">
		function loadData(option) {
			$.ajax({
				type : 'post', //传输类型
				async : false, //同步执行
				url : 'LocalBarServlet', 
				data : {
					
					
				},
				dataType : 'json', //返回数据形式为json
				success : function(result) {
					if (result) {
						//初始化xAxis[0]的data
						option.xAxis[0].data = [];
						for (var i = 0; i < result.length; i++) {
							option.xAxis[0].data.push(result[i].localName);
						}
						//初始化series[0]的data
						option.series[0].data = [];
						for (var i = 0; i < result.length; i++) {
							option.series[0].data.push(result[i].count);
						}
					}
				},
				error : function(errorMsg) {
					alert("加载数据失败");
				}
			});//AJAX
		}//loadData()
		var myChart = echarts.init(document.getElementById('myDiv1'));
		var option = {
			backgroundColor:'black',
			itemStyle: {
		                color: 'red',
		    },
			tooltip : {
				show : true
			},
			legend : {
				data : [ '各地区大学分布' ],
				textStyle:{
                    fontSize: 18,//字体大小
                    color: 'white'//字体颜色
                }

			},
			xAxis : [ {
				type : 'category',
				axisLabel : {
					show : true,
					textStyle : {
						color : 'white'
					}
				}
			} ],
			yAxis : [ {
				type : 'value',
				axisLabel : {
					show : true,
					textStyle : {
						color : 'white'
					}
				}
			} ],
			series : [ {
				name : '各地区大学分布',
				type : 'bar'
			} ]
		};
		//加载数据到option
		loadData(option);
		//设置option
		myChart.setOption(option);
	</script>




<!-- DOM用来设置展示ECharts图表的区域 -->
	<div id="myDiv2" style="height: 400px;"></div>
	<script type="text/javascript">
		function loadData(option) {
			$.ajax({
				type : 'post', //传输类型
				async : false, //同步执行
				url : 'totalBarServlet', 
				data : {
					
					
				},
				dataType : 'json', //返回数据形式为json
				success : function(result) {
					if (result) {
						//初始化xAxis[0]的data
						option.xAxis[0].data = [];
						for (var i = 0; i < result.length; i++) {
							option.xAxis[0].data.push(result[i].pubTime);
						}
						//初始化series[0]的data
						option.series[0].data = [];
						for (var i = 0; i < result.length; i++) {
							option.series[0].data.push(result[i].count);
						}
					}
				},
				error : function(errorMsg) {
					alert("加载数据失败");
				}
			});//AJAX
		}//loadData()
		var myChart = echarts.init(document.getElementById('myDiv2'));
		var option = {
			backgroundColor:'black',
			itemStyle: {
		                color: 'green',
		    },
			tooltip : {
				show : true
			},
			legend : {
				data : [ '每日发帖数量' ],
				textStyle:{
                    fontSize: 18,//字体大小
                    color: 'white'//字体颜色
                }

			},
			xAxis : [ {
				type : 'category',
				axisLabel : {
					show : true,
					textStyle : {
						color : 'white'
					}
				}
			} ],
			yAxis : [ {
				type : 'value',
				axisLabel : {
					show : true,
					textStyle : {
						color : 'white'
					}
				}
			} ],
			series : [ {
				name : '每日发帖数量',
				type : 'bar'
			} ]
		};
		//加载数据到option
		loadData(option);
		//设置option
		myChart.setOption(option);
	</script>




</body>

