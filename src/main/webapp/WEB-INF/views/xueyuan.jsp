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
		<!-- <fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 20px;">
			<legend>筛选条件</legend>
		</fieldset>

		<form class="layui-form" action="#">

			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">地市</label>
					<div class="layui-input-inline">
						<input type="text" id="city" name="city" autocomplete="off"
							class="layui-input">
						<select id="city" name="city" lay-verify="">
							<option value=""></option>
							<option value="西安市">西安市</option>
							<option value="咸阳市">咸阳市</option>
							<option value="商洛市">商洛市</option>
							<option value="安康市">安康市</option>
							<option value="宝鸡市">宝鸡市</option>
							<option value="延安市">延安市</option>
							<option value="榆林市">榆林市</option>
							<option value="汉中市">汉中市</option>
							<option value="渭南市">渭南市</option>
							<option value="铜川市">铜川市</option>
						</select>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">起止时间</label>
					<div class="layui-input-inline">
						<input type="text" name="beginTime" id="beginTime"
							placeholder="请选择开始时间" autocomplete="off" class="layui-input">
					</div>
					<div class="layui-form-mid">-</div>
					<div class="layui-input-inline">
						<input type="text" name="endTime" id="endTime"
							placeholder="请选择结束时间" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-input-block">
					<button lay-submit lay-filter="*" style="width: 10%;"
						class="layui-btn" id="search">查询</button>
					<button style="width: 10%;" type="reset"
						class="layui-btn layui-btn-primary">重置</button>
					<button style="width: 10%;  float:right;"
						class="layui-btn layui-btn-normal" id="down">数据导出</button>
				</div>
			</div>
		</form> -->
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 20px;">
			<legend>现有学院</legend>
		</fieldset>
		<div style="width:100px;height:38px;float:right;padding-bottom:10px">
			<button class="layui-btn" id="addXuanYuan">添加学院</button>
		</div>

		<div class="layui-form">
			<table class="layui-table">
				<colgroup>
					<col width="50">
					<col width="50">
					<col width="50">
					<col width="50">
					<col width="50">
				</colgroup>
				<thead>
					<tr>
						<th>编号</th>
						<th>学院名称</th>
						<th>备注</th>
						<th>已有人数</th>
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
						<td>active</td>
						<td>
							<a href = "javascript:edit({{id}});">编辑</a>
							<a href = "javascript:dele({{id}});">删除</a>
						</td>
					</tr>
	</script>

	<form lay-filter="add" style="margin-top:20px;display: none;" id="form"
		class="layui-form" action="#">


		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">学院名称:</label>
				<div class="layui-input-inline">
					<input type="text" name="name" id="name" autocomplete="off"
						class="layui-input">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">备注:</label>
				<div class="layui-input-inline">
					<input type="text" name="remark" id="remark" autocomplete="off"
						class="layui-input">
				</div>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-input-block">
				<button lay-submit lay-filter="add" style="width: 25%;"
					class="layui-btn" id="save">保存</button>
				<button style="width: 25%;" type="reset"
					class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>
	<form lay-filter="edit" style="margin-top:20px;display: none;" id="form1"
		class="layui-form" action="#">

		<div class="layui-form-item" style = "display: none;">
			<div class="layui-inline">
				<label class="layui-form-label">id:</label>
				<div class="layui-input-inline">
					<input type="hidden" name="id" id="id" autocomplete="off"
						class="layui-input">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">学院名称:</label>
				<div class="layui-input-inline">
					<input type="text" name="name" id="name1" autocomplete="off"
						class="layui-input">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">备注:</label>
				<div class="layui-input-inline">
					<input type="text" name="remark" id="remark1" autocomplete="off"
						class="layui-input">
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
	
		layui.use([ 'jquery', 'laydate', 'form', 'layer', 'laypage' ], function() {
			var laypage = layui.laypage,
				layer = layui.layer,
				$ = layui.jquery;
			var laydate = layui.laydate;
			$('#addXuanYuan').click(function() {
				layer.open({
					title : "添加学院",
					type : 1, //,skin: 'layui-layer-rim'
					shadeClose : true,
					area : [ '400px', '250px' ],
					content : $('#form')
				});
				$('#form').show();
			});
			edit = function(id){
				var curr = map.get(id);
				$('#id').val(id);
				$('#name1').val(curr.name);
				$('#remark1').val(curr.remark);
				layer.open({
					title : "编辑学院",
					type : 1, //,skin: 'layui-layer-rim'
					shadeClose : true,
					area : [ '400px', '250px' ],
					content : $('#form1')
				});
				$('#form1').show();
			}
			
			dele = function(id){
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/b/institute/delete",
					data : {
						key : id
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
			
			
			 $.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/b/institute/selectAll",
					dataType : "json",
					success : function(data) {
						/* $('tbody').empty();
						addRow(data); */
						if(data && data.status == "success"){
							addRow(data.list);
						}
					}
				}); 
			var map = new Map();
			function addRow(data) {
				var j = 1;
				for (var i = 0; i < data.length; i++) {
					var curr = data[i];	
					curr.index = j
					j++;
					var html = template('row', curr);
					map.set(curr.id, curr);
					$('tbody').append(html);
				}
	
			}
			var form = layui.form;
			
			form.on('submit(edit)', function(data) {
				console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
				console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
				console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/b/institute/update",
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
	
			form.on('submit(add)', function(data) {
				console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
				console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
				console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/b/institute/save",
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

