//========================= 添加类型========================
/**
 * 添加按钮绑定事件
 */
$("#addBtn").click(function(){
	
	// 清空文本框的值
	$("#modalTypeName").val("");
	
	// 设置模态框的标题
	$("#myModalLabel").html("添加话题");
	
	// 手动打开模态框
	$("#myModalType").modal("show");
	$(".modal-backdrop")[0].style.display="none";   //去除模态框阴影
});

/**
 * 保存按钮的点击事件
 */
$("#btn_submit").click(function(){
	console.log("aqqqaaaa");
	// 得到类型名称的值
	var typeName = $("#modalTypeName").val();
	// 非空判断
	if (isEmpty(typeName)) {
		$("#msg").html("话题名称不能为空！");
		return;
	}
	
	var typeId = $("#typeId").val();
	
	// 如果不为空，则发送ajax请求
	$.ajax({
		type:"post",
		url:"noteServlet",
		data:{
			actionName:"createType",
			typeName:typeName,
		},
		success:function(data) {
			// 判断是否更新成功
			if (data.code == 1) { // 成功
				// 手动关闭模态框
				$("#myModalType").modal("hide");
				// 提示成功
				swal(data.msg,"","success");
				
				// 添加行为的DOM操作
				addDom(data.result);
					
			} else {
				// 提示用户失败
				swal(data.msg,"","error");
			}
		}
	});
	
});
/**
 * 添加类型的DOM操作
 * 	1、添加tr
 * 		如果存在数据，则可以直接append到table对象中
 * 		如果没有数据，则需要创建table，在将table追加进去
 * 	2、添加左侧类型分组的li
 * 
 * @param type
 */
function addDom (type) {
	// 1、添加tr
	// 得到类型ID和名称
	var typeId = type.typeId;
	var typeName = type.typeName;
	var schId = type.schId;
	
	// 创建tr对象
	var tr = '<tr id="tr_'+typeId+'"> <td>'+typeId+'</td><td>'+typeName+'</td><td>'+schId+'</td></tr>';
	
	// 得到table对象
	var table = $("#myTable");
	
	// 判断table是否存在
	if (table.length == 1) { // 存在表格，可以直接appendtr
		// 向table中的tbody中追加tr对象
		table.children().append(tr);
	} else {
		
		// 创建table对象
		var myTable = '<table class="table table-hover table-striped" id="myTable"><tbody>'+
						'<tr> <th>编号</th> <th>话题</th> <th>关于哪里</th> </tr>' + tr + '</tbody></table>';
		
		// 得到父元素div
		var div = $("#myDiv");
		div.html(myTable);
	}
	
}	
	


// =====================验证类型名唯一性===================
/**
 * 类型名文本失焦聚焦事件
 */
$("#modalTypeName").blur(function(){
	// 得到类型名称的值
	var typeName = $("#modalTypeName").val();
	// 非空判断
	if (isEmpty(typeName)) {
		$("#msg").html("类型名称不能为空！");
		// 禁用按钮
		$("#btn_submit").prop("disabled",true);
		return;
	}
	
	// 发送ajax请求后台，判断类型名是否可用
	var params = {
			actionName:"checkType",
			typeName:typeName,
	};
	$.get("noteServlet",params,function(data){
		console.log(data);
		$("#msg").html(data.msg);
		if (data.code != 1) { // 失败
			// 禁用按钮
			$("#btn_submit").prop("disabled",true);
		}
	});
	
}).focus(function(){
	$("#msg").html("");
	// 按钮可用
	$("#btn_submit").prop("disabled",false);
});



	




