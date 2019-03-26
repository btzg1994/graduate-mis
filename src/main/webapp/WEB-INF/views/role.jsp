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
			<legend>已有功能</legend>
		</fieldset>
		<div style="padding: 20px; background-color: #F2F2F2;">
			<div id="card" class="layui-row layui-col-space15"></div>
		</div>
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 20px;">
			<legend>已有角色</legend>
		</fieldset>
		<div style="width:100px;height:38px;float:right;padding-bottom:10px">
			<button class="layui-btn" id="addRole">添加角色</button>
		</div>
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
				</colgroup>
				<thead>
					<tr>
						<th>编号</th>
						<th>姓名</th>
						<th>描述</th>
						<th>已有功能</th>
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
						<td>{{remark}}</td>
						<td>{{menus}}</td>
						<td>{{createTime}}</td>
						<td>
							<a href = "javascript:edit({{id}});">编辑</a>
							<a href = "javascript:menu({{id}});">分配功能</a>
							<a href = "javascript:dele({{id}});">删除</a>
						</td>
					</tr>
	</script>
	<script type="text/html" id="card1">
				<div class="layui-col-md3">
					<div class="layui-card">
						<div class="layui-card-header">功能:{{name}}</div>
						<div class="layui-card-body">
							描述:{{remark}}
							<br/>
							<div style = "display:none" id = "menuId">{{id}}</div>
						</div>
					</div>
				</div>
	</script>

	<form lay-filter="add" style="margin-top:20px;display: none;"
		id="form1" class="layui-form" action="#">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">角色名称:</label>
				<div class="layui-input-inline">
					<input type="text" name="name" placeholder="请输入角色名称"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">角色描述:</label>
				<div class="layui-input-inline">
					<input type="text" name="remark" placeholder="请输入角色描述"
						autocomplete="off" class="layui-input">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button lay-submit lay-filter="add" style="width: 20%;"
					class="layui-btn">提交</button>
				<button style="width: 20%;" type="reset"
					class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>

	<form lay-filter="edit" style="margin-top:20px;display: none;"
		id="form" class="layui-form" action="#">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">角色名称:</label>
				<div class="layui-input-inline">
					<input type="text" name="name" id="name" placeholder="请输入角色名称"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">角色描述:</label>
				<div class="layui-input-inline">
					<input type="text" name="remark" id="remark" placeholder="请输入角色描述"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline" style = "display: none;">
				<label class="layui-form-label">角色描述:</label>
				<div class="layui-input-inline">
					<input type="text" name="id" id="id" placeholder="请输入角色描述"
						autocomplete="off" class="layui-input">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button lay-submit lay-filter="edit" style="width: 20%;"
					class="layui-btn">提交</button>
				<button style="width: 20%;" type="reset"
					class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>
	<form lay-filter="menu" style="margin-top:20px;display: none;"
		id="form2" class="layui-form" action="#">
		<div class="layui-form-item">
			<label class="layui-form-label">功能选择</label>
			<div class="layui-input-block" id="box"></div>
			<div style="display: none">
				<input type="text" name="id" id="roleId">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button lay-submit lay-filter="menu" style="width: 25%;"
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
		var menu;
	
		layui.use([ 'jquery', 'laydate', 'form', 'element', 'layer', 'laypage' ], function() {
			var laypage = layui.laypage,
				layer = layui.layer,
				$ = layui.jquery,
				form = layui.form;
			var element = layui.element;
			var laydate = layui.laydate;
	
			var menuMap = new Map();
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/b/menu/selectAll",
				dataType : "json",
				async : false,
				success : function(data) {
					if (data && data.status == "success") {
						var list = data.list;
						for (var i = 0; i < list.length; i++) {
							var curr = list[i];
							menuMap.set(curr.id, curr);
	
							$('#box').append('<input type="checkbox" name="' + curr.id + '" title="' + curr.name + '">');
							var html = template('card1', curr);
							$("#card").append(html);
						}
					}
					form.render('checkbox');
				}
			});
	
			var map = new Map();
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/b/role/selectAll",
				dataType : "json",
				async : false,
				success : function(data) {
					if (data && data.msg == "成功") {
						addRow(data.list);
					}
				}
			});
	
			function addRow(data) {
				var j = 1;
				for (var i = 0; i < data.length; i++) {
					var curr = data[i];
					curr.index = j;
					var ids = curr.menuIdList ? curr.menuIdList.split(',') : undefined;
					var menus = "";
					for (var k = 0; ids && k < ids.length; k++) {
						var menu = menuMap.get(parseInt(ids[k]));
						menus += menu.name + ",";
					}
					curr.menus = ids ? menus.substr(0, menus.length - 1) : "暂未分配功能";
					j++;
					var html = template('row', curr);
					map.set(curr['id'], curr);
					$('tbody').append(html);
				}
	
			}
	
			menu = function(roleId) {
				var curr = map.get(roleId);
				$('#roleId').val(roleId);
				layer.open({
					title : "分配功能",
					type : 1, //,skin: 'layui-layer-rim'
					shadeClose : true,
					area : [ '400px', '300px' ],
					content : $('#form2')
				});
				$('#form2').show();
			}
	
			edit = function(id) {
				var curr = map.get(id);
				$('#name').val(curr.name);
				$('#remark').val(curr.remark);
				$('#id').val(id);
				layer.open({
					title : "编辑角色",
					type : 1, //,skin: 'layui-layer-rim'
					shadeClose : true,
					area : [ '400px', '300px' ],
					content : $('#form')
				});
				$('#form').show();
			}
	
			dele = function(id) {
				if (!confirm("确定要删除吗!"))
					return;
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/b/role/delete",
					data : {
						key : id
					},
					dataType : "json",
					success : function(data) {
						/* $('tbody').empty();
						addRow(data); */
						if (data && data.status == "success") {
							alert("删除成功!");
							window.location.reload();
						}
					}
				});
			}
	
			form.on('submit(add)', function(data) {
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
					url : "${pageContext.request.contextPath}/b/role/update",
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
	
			form.on('submit(menu)', function(data) {
				console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
				console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
				console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
	
				var field = data.field;
				var menus = [];
				var menuIdList = "";
				for (var key in field) {
					if (field[key] == "on") {
						var menu = {
							id : key
						};
						menuIdList += key + ","
					}
				}
				var reqBody = {
					id : field['id'],
					menuIdList : menuIdList.substr(0, menuIdList.length - 1)
				}
				console.log(JSON.stringify(reqBody));
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/b/role/update",
					data : reqBody,
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
			$('#addRole').click(function(){
				layer.open({
					title : "添加角色",
					type : 1, //,skin: 'layui-layer-rim'
					shadeClose : true,
					area : [ '400px', '300px' ],
					content : $('#form1')
				});
				$('#form1').show();
			});
	
		});
	</script>

</body>
</html>

