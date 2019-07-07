<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<title>Home</title>
<!-- Custom Theme files -->
<link href="statics/loginAndRegister/css/loginstyle.css" rel="stylesheet" type="text/css" media="all"/>
<!-- Custom Theme files -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta name="keywords" content="Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<!--Google Fonts-->

</head>
<body>
<div class="login">
	<h2>用户注册</h2>
	<div class="login-top">
		<form action="userServlet?actionName=register" method="post" onsubmit="return checkForm()">
		<ul>
		<li>用户名：<input name="uname" id="uname" type="text"></li>
		<li>密码：<input name="upwd" id="upwd" type="password">	 </li>
		<li>确认密码：  <input name="upwd2" id="upwd2" type="password"></li>
		<li>昵称：  <input name="name" id="name" type="text"></li>
		<li>个性签名：<input name="mood" id="mood" type="text"></li>
		<li>学校代码：<input name="universityId" id="universityId" type="text"></li>
		</ul>
		<center>
		<input type="submit" value="提交"/><br>
		<span id="msg" style="color:red;font-size:12px">&nbsp;&nbsp;</span>
		</center>
		</form>
	</div>	
</div>	

</body>

<script type="text/javascript" src="statics/js/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="statics/js/utils.js"></script>

<script type="text/javascript">

	/**
	 * 验证非空
	 */
	function checkForm() {
		
		// 得到姓名和密码的值
		var uname = $("#uname").val();
		var upwd = $("#upwd").val();
		var upwd2 = $("#upwd2").val();
		var name = $("#name").val();
		var mood = $("#mood").val();
		var universityId = $("#universityId").val();
		
		 // 判断值是否为空
		if (isEmpty(uname)) {
			$("#msg").html("用户名称不能为空！");
			return false;
		}
		if (isEmpty(upwd)) {
			$("#msg").html("用户密码不能为空！");
			return false;
		} 
		if(upwd2!=upwd) {
			$("#msg").html("两次密码不一致！");
			return false;
		} 
		if(isEmpty(name)) {
			$("#msg").html("真实姓名不能为空！");
			return false;
		}
		if(isEmpty(mood)) {
			$("#msg").html("个性签名不能为空！");
			return false;
		} 
		if(isEmpty(universityId)) {
			$("#msg").html("学校编码不能为空！");
			return false;
		} 
		$("#msg").html("&nbsp;&nbsp;");
		
		/* 发送ajax请求
		$.ajax({
			type:"post",
			url:"userServlet",
			data:{
				userName:uname,
				userPassword:upwd,
				mood:mood,
				name:name,
				universityId:universityId,
				actionName:"register" // 告诉servlet当前该做什么操作（登录、查询列表、添加、修改、删除）
			},
			success:function(data) {
				console.log(data);
				// 判断响应结果 失败提示用户；1=成功，0=失败
				if (data.code == 1) { // 成功跳转到首页
					window.location.href = "login.jsp";
				} else {
					$("#msg").html("注册失败，请重试！");
				}
			}
		});*/
		
		
	}
	

</script>
</html>