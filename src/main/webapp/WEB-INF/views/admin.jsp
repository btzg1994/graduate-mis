<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>layui</title>
<base href="${pageContext.request.contextPath}/resources/">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="plugins/layui/css/layui.css" media="all">
<link rel="stylesheet" href="css/main.css?v=1.1" media="all">
<style type="text/css">
.buttonBox {
	cursor: pointer;
}
</style>
</head>

<body>
	<div style="padding:0px 50px 0px 50px;">
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 20px;">
		</fieldset>

		<form class="layui-form" action="#">

			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">用户名:</label>
					<div class="layui-input-inline">
						<input type="text" name="loginName" 
							placeholder="请输入用户名" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">姓名:</label>
					<div class="layui-input-inline">
						<input type="text" name="name" 
							placeholder="请输入姓名" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">备注:</label>
					<div class="layui-input-inline">
						<input type="text" name="remark" 
							placeholder="请输入备注信息" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">密码:</label>
					<div class="layui-input-inline">
						<input type="password" name="loginPwd"
							autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">确认密码:</label>
					<div class="layui-input-inline">
						<input type="password" name="loginPwd1" 
							autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button lay-submit lay-filter="add" style="width: 10%;"
						class="layui-btn">提交</button>
					<button style="width: 10%;" type="reset"
						class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>
		</form> 
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 20px;">
			<legend>现有管理员</legend>
		</fieldset>

		<div class="layui-form">
			<table class="layui-table">
				<colgroup>
					<col width="50">
					<col width="50">
					<col width="50">
					<col width="50">
					<col width="50">
					<col width="50">
					<col width="50">
					<col width="50">
				</colgroup>
				<thead>
					<tr>
						<th>编号</th>
						<th>姓名</th>
						<th>账户名</th>
						<th>密码</th>
						<th>备注</th>
						<th>角色</th>
						<th>创建时间</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
			<div id="fenye" style="display:none ;float:right;"></div>
		</div>
	</div>
	<script type="text/html" id="row">
					<tr>
						<td>{{index}}</td>
						<td>{{name}}</td>
						<td>{{loginName}}</td>
						<td>{{loginPwd}}</td>
						<td>{{remark}}</td>
						<td>{{if role == ""}}暂未分配权限{{else}}{{role}}{{/if}}</td>
						<td>2017</td>
						<td>
							<a href = "javascript:edit('{{loginName}}');">编辑</a>
							<a href = "javascript:role('{{loginName}}');">分配角色</a>
							<a href = "javascript:dele('{{loginName}}');">删除</a>
						</td>
					</tr>
	</script>

	<form lay-filter="edit" style="margin-top:20px;display: none;" id="form"
		class="layui-form" action="#">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">用户名:</label>
					<div class="layui-input-inline">
						<input type="text" name="loginName" id="loginName"
							placeholder="请输入用户名" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">姓名:</label>
					<div class="layui-input-inline">
						<input type="text" name="name" id="name"
							placeholder="请输入姓名" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">备注:</label>
					<div class="layui-input-inline">
						<input type="text" name="remark" id="remark"
							placeholder="请输入备注信息" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">密码:</label>
					<div class="layui-input-inline">
						<input type="password" name="loginPwd" id="loginPwd"
							autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">确认密码:</label>
					<div class="layui-input-inline">
						<input type="password" name="loginPwd1"  id="loginPwd1"
							autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button lay-submit lay-filter="edit" style="width: 20%;"
						class="layui-btn" >提交</button>
					<button style="width: 20%;" type="reset"
						class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>
	</form>
	<form lay-filter="role" style="margin-top:20px;display: none;" id="form2"
		class="layui-form" action="#">

		<div class="layui-form-item" style = "">
			<div class="layui-inline">
				<label class="layui-form-label">选择角色:</label>
				<div class="layui-input-inline">
						<select id="role" name="roleId" lay-verify="role">
							<option value=""></option>
						</select>
					</div>
			</div>
			<div class="layui-inline" style="display:none;">
				<div class="layui-input-inline">
						<input type="password" name="loginName"  id="loginName2"
							autocomplete="off" class="layui-input">
					</div>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-input-block">
				<button lay-submit lay-filter="edit" style="width: 25%;"
					class="layui-btn" id="save">保存</button>
				<button style="width: 25%;" type="reset"
					class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>

	<script src="plugins/layui/layui.js"></script>
	<script src="js/template-web.js"></script>
	<script>
		
		var edit;
		var dele;
		var role;
	
		layui.use([ 'jquery', 'laydate', 'form', 'layer', 'laypage' ], function() {
			var laypage = layui.laypage,
				layer = layui.layer,
				$ = layui.jquery,
				form = layui.form;
			var laydate = layui.laydate;
			
			
			var roleMap = new Map();
			$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/b/role/selectAll",
					dataType : "json",
					async : false,
					success : function(data) {
						if(data && data.status == "success"){
							var list = data.list;
							for(var i = 0; i < list.length; i++){
								var curr = list[i];
								roleMap.set(curr.id, curr);
								$('#role').append('<option value="'+curr.id+'">'+curr.name+'</option>');
							}
						}
						form.render('select');
					}
				}); 
			
			role = function(loginName){
				var curr = map.get(loginName);
				$('#loginName2').val(loginName);
				layer.open({
					title : "分配角色",
					type : 1, //,skin: 'layui-layer-rim'
					shadeClose : true,
					area : [ '400px', '400px' ],
					content : $('#form2')
				});
				$('#form2').show();
			}
			
			edit = function(loginName){
				var curr = map.get(loginName);
				$('#name').val(curr.name);
				$('#remark').val(curr.remark);
				$('#loginName').val(curr.loginName);
				$('#loginPwd').val(curr.loginPwd);
				$('#loginPwd1').val(curr.loginPwd);
				layer.open({
					title : "编辑管理员",
					type : 1, //,skin: 'layui-layer-rim'
					shadeClose : true,
					area : [ '400px', '400px' ],
					content : $('#form')
				});
				$('#form').show();
			}
			
			dele = function(loginName){
				if(!confirm("确定要删除吗!"))
					return;
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/b/admin/delete",
					data : {
						key : loginName
					},
					dataType : "json",
					success : function(data) {
						/* $('tbody').empty();
						addRow(data); */
						if(data && data.status == "success"){
							alert("删除成功!");
							window.location.reload();
						}
					}
				});		
			}
			
			var map = new Map();
			 $.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/b/admin/selectAll",
					dataType : "json",
					async : false,
					success : function(data) {
						if(data && data.msg == "成功"){
							addRow(data.list);
						}
					}
				}); 
			function addRow(data) {
				var j = 1;
				for (var i = 0; i < data.length; i++) {
					var curr = data[i];	
					curr.index = j;
					curr.role = curr.roleId ? roleMap.get(curr.roleId).name:"";
					j++;
					var html = template('row', curr);
					map.set(curr['loginName'], curr);
					$('tbody').append(html);
				}
	
			}
			var form = layui.form;
			
			form.on('submit(add)', function(data) {
				console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
				console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
				console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/b/admin/save",
					data : data.field,
					dataType : "json",
					success : function(data) {
						if (data.status == "success")
						 window.location.reload();
						else 
							alert("更新失败!"); 
					}
				});
	
				return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
			});
			
			form.on('submit(edit)', function(data) {
				console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
				console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
				console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/b/admin/update",
					data : data.field,
					dataType : "json",
					success : function(data) {
						if (data.status == "success")
						 window.location.reload();
						else 
							alert("更新失败!"); 
					}
				});
	
				return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
			});
	
			form.on('submit(role)', function(data) {
				console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
				console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
				console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/b/role/save",
					data : data.field,
					dataType : "json",
					success : function(data) {
						if (data.status == "success")
						 window.location.reload();
						else 
							alert("添加失败!"); 
					}
				});
	
				return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
			});
	
	
		});
	</script>

</body>
</html>

