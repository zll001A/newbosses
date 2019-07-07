<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="col-md-12">
	<div class="data_list">
		<div class="data_list_title">
			<span class="glyphicon glyphicon-list"></span>&nbsp;话题列表
			<span class="noteType_add">
				<button class="btn btn-sm btn-success" type="button" id="addBtn">添加话题</button>
			</span>
			
		 </div>
		<div id="myDiv">
			<c:if test="${empty typeList}">
				<h2>现在还没有话题，快来创建新的话题吧！</h2>
			</c:if>
		 	<c:if test="${!empty typeList && typeList.size() > 0 }">
		 		<table class="table table-hover table-striped" id="myTable">
			 		<tbody>
				 		<tr>
				 			<th>编号</th>
				 			<th>话题</th>
				 			<th>关于哪里</th>
				 		</tr>
				 		<c:forEach items="${typeList }" var="item">
					 		<tr id="tr_${item.typeId }">
					 			<td>${item.typeId }</td>
					 			<td>${item.typeName }</td>
					 			<td>${item.schName }</td>
					 		</tr>
				 		</c:forEach>
					</tbody>
				</table>
		 	</c:if>
		</div>	
	</div>
	<div class="modal fade" id="myModalType" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	    <div class="modal-dialog" role="document" >
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">×</span></button>
	          <h4 class="modal-title" id="myModalLabel">新增</h4>
	        </div>
	        <div class="modal-body"> 
	          <div class="form-group">
	            <label for="typename">想要添加的话题名称</label>
	            <!-- <input type="hidden" name="modalTypeId" id="modalTypeId"> --> 
	            <input type="text" name="modalTypeName" class="form-control" id="modalTypeName" placeholder="话题名称">         	
	          </div>      
	        </div>
	        <div class="modal-footer">
	          <span style="color:red;font-size:12px" id="msg"></span> &nbsp;&nbsp;&nbsp;
	          <button type="button" class="btn btn-default" data-dismiss="modal">
	          <span class="glyphicon glyphicon-remove"></span>关闭</button>
	          <button type="button" id="btn_submit" class="btn btn-primary">
	          <span class="glyphicon glyphicon-floppy-disk"></span>保存</button>
	        </div>
	      </div>
	    </div>
	  </div>
</div>	

<script type="text/javascript" src="statics/35chat/js/type.js"></script>