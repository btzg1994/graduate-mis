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
			<legend>优秀论文</legend>
		</fieldset>
		<div style="width:100px;height:38px;float:right;padding-bottom:10px">
			<button class="layui-btn" id="addLink">上传论文</button>
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
					<col width="200">
				</colgroup>
				<thead>
					<tr>
						<th>编号</th>
						<th>名称</th>
						<th>论文类别</th>
						<th>论文指导老师</th>
						<th>简介</th>
						<th>发布时间</th>
						<th>附件下载</th>
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
						<td>{{type}}</td>
						<td>{{teacher}}</td>
						<td>{{title}}</td>
						<td>{{createTime}}</td>
						<td><a href = "{{downUrl}}">下载</a></td>
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
				<label class="layui-form-label">名称:</label>
				<div class="layui-input-inline">
					<input type="text" name="name" id="name" autocomplete="off"
						class="layui-input">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">类型:</label>
				<div class="layui-input-inline">
					<input type="text" name="type" id="type" autocomplete="off"
						class="layui-input">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label">简介</label>
					<div class="layui-input-block">
						<textarea name="title" placeholder="请输入内容" class="layui-textarea"></textarea>
					</div>
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">指导老师</label>
			<div class="layui-input-inline">
				<select name="teacherId" id="teacher">
					<option value="">请选择指导老师</option>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">附件上传</label>
				<div class="layui-input-block">
					<input type="file" name="file" autocomplete="off"
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
	<form lay-filter="edit" style="margin-top:20px;display: none;"
		id="form1" class="layui-form" action="#">

		<div class="layui-form-item" style="display: none;">
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
				<label class="layui-form-label">名称:</label>
				<div class="layui-input-inline">
					<input type="text" name="name" id="name2" autocomplete="off"
						class="layui-input">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">类型:</label>
				<div class="layui-input-inline">
					<input type="text" name="type" id="type2" autocomplete="off"
						class="layui-input">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label">简介</label>
					<div class="layui-input-block">
						<textarea name="title" id="title2" placeholder="请输入内容" class="layui-textarea"></textarea>
					</div>
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">指导老师</label>
			<div class="layui-input-inline">
				<select name="teacherId" id="teacher2">
					<option value="">请选择指导老师</option>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">附件上传</label>
				<div class="layui-input-block">
					<input type="file" name="file" autocomplete="off"
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
			var form = layui.form;
			$('#addLink').click(function() {
				layer.open({
					title : "添加优秀论文",
					type : 1, //,skin: 'layui-layer-rim'
					shadeClose : true,
					area : [ '400px', '350px' ],
					content : $('#form')
				});
				$('#form').show();
			});
			edit = function(id) {
				var curr = map.get(id);
				$('#id').val(id);
				$('#name2').val(curr.name);
				$('#title2').val(curr.title);
				$('#type2').val(curr.type);
				layer.open({
					title : "编辑优秀论文",
					type : 1, //,skin: 'layui-layer-rim'
					shadeClose : true,
					area : [ '500px', '500px' ],
					content : $('#form1')
				});
				$('#form1').show();
			}
	
			dele = function(id) {
				if(!confirm("确定要删除吗?"))
				return false;
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/b/paper/delete",
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
			var teacherMap = new Map();
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/b/teacher/selectAll",
				async : false,
				dataType : "json",
				success : function(data) {
					if (data.status == "success") {
						var tList = data.list;
						for (var i = 0; i < tList.length; i++) {
							var curr = tList[i];
							$('#teacher').append('<option value="' + curr.id + '">' + curr.name + '</option>');
							$('#teacher2').append('<option value="' + curr.id + '">' + curr.name + '</option>');
							teacherMap.set(curr.id +"", curr)
						}
						form.render('select');
					}
				}
			});
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/b/paper/selectAll",
				dataType : "json",
				success : function(data) {
					/* $('tbody').empty();
					addRow(data); */
					if (data && data.status == "success") {
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
					curr.teacher = teacherMap.get(curr.teacherId + "").name;
					curr.downUrl = '${pageContext.request.contextPath}/file2stream?url='+curr.filepath;
					j++;
					var html = template('row', curr);
					map.set(curr.id, curr);
					$('tbody').append(html);
				}
	
			}
	
			form.on('submit(edit)', function(data) {
				console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
				console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
				console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
				var formData = new FormData(document.getElementById("form1"));
				var file = formData.get("file");
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/b/paper/update",
					data : formData,
					processData : false, //必不可缺
					contentType : false, //必不可缺
					success : function(res) {
						res = JSON.parse(res);
						if (res.status == "success"){
							alert("更新成功!");
							window.location.reload();
						}
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
				var formData = new FormData(document.getElementById("form"));
				var file = formData.get("file");
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/b/paper/save",
					data : formData,
					processData : false, //必不可缺
					contentType : false, //必不可缺
					success : function(data) {
						res = JSON.parse(data);
						if (res.status == "success") {
							alert("添加成功");
							window.location.reload();
						}
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

