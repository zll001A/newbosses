function find(local, sch){
	//调用数据库写页面
	$.ajax({
		type:"post",
		url:"chatServlet",
		data:{
			actionName:"inchat",
			local:local,
			sch:sch
		},
		success:function(data){
			console.log("成功");
			window.location.href = "chat/chatList-all.jsp";
		}
	});
}

function findToThis(local,sch){
	$.ajax({
		type:"post",
		url:"http://localhost:8080/newbosses/chatServlet",
		data:{
			actionName:"inchat",
			local:local,
			sch:sch
		},
		success:function(result){
			console.log("成功");
			window.location.href = "chatList-all.jsp";
		}
		
	});
}