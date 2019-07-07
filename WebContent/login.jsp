<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
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
	<h2>登录</h2>
	<div class="login-top">
	<form action="userServlet?actionName=login" method="post" onsubmit="return checkForm()">	
		<input name="uname" id="uname" type="text">
		<input name="upwd" id="upwd" type="password">
	    <input name="rem" id="rem" type="checkbox" value="1"  class="inputcheckbox" checked="checked"> <label>记住密码</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="msg" style="color:red;font-size:12px">&nbsp;&nbsp;</span>
	    <div class="forgot">
	    	<a href="#">忘记密码</a>
	    	<input type="submit" value="登录"  onclick="checkForm()">
	    </div>
	</form>
	</div>
	<div class="login-bottom">
		<h3>新用户 &nbsp;<a href="register.jsp">注册</a></h3>
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
		
		 // 判断值是否为空
		if (isEmpty(uname)) {
			$("#msg").html("用户名称不能为空！");
			return false;
		}
		if (isEmpty(upwd)) {
			$("#msg").html("用户密码不能为空！");
			return false;
		} 
		
		$("#msg").html("&nbsp;&nbsp;");
		
		/* 发送ajax请求
		$.ajax({
			type:"post",
			url:"userServlet",
			data:{
				uname:uname,
				upwd:upwd,
				actionName:"login" // 告诉servlet当前该做什么操作（登录、查询列表、添加、修改、删除）
			},
			success:function(data) {
				console.log(data);
				// 判断响应结果 失败提示用户；1=成功，0=失败
				if (data.code == 1) { // 成功跳转到首页
					window.location.href = "index.jsp";
				} else {
					$("#msg").html(data.msg);
				}
			}
		});*/
		
		
	}
	

</script>
</html>