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
<link rel="stylesheet" type="text/css" href="front/css/style.css" />
<style type="text/css">
.buttonBox {
	cursor: pointer;
}
</style>
</head>

<body>
	<div style="padding:0px 50px 0px 50px; margin-top:30px;">
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 20px;">
			<legend>已有招聘</legend>
		</fieldset>
		<div class="layui-row">
			<div class="layui-col-md7">
				<div class="right_content">
					<div class="con_box">
						<ul class="img-list" id="news">

						</ul>
						<div class="clear"></div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="layui-col-md5">
				<form lay-filter="" style="margin-top:20px;"
					id="form" class="layui-form" action="#">

					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">招聘标题:</label>
							<div class="layui-input-inline">
								<input type="text" name="title" autocomplete="off"
									class="layui-input">
							</div>
						</div>
						<div class="layui-input-inline">
							<input type="hidden" name="type" value="3" autocomplete="off"
								class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">备注:</label>
							<div class="layui-input-inline">
								<input type="text" name="remark" autocomplete="off"
									class="layui-input">
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">招聘图片</label>
							<div class="layui-input-block">
								<input type="file" name="file" autocomplete="off"
									class="layui-input">
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline" style="width:80%">
							<label class="layui-form-label">招聘内容</label>
							<div class="layui-input-block">
								<textarea placeholder="请输入内容" name="content"
									class="layui-textarea"></textarea>
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
			</div>
		</div>

	</div>

	<script type="text/html" id="row">
				<li><a href="{{imgUrl}}"><img style="width:174px;height:116px;"  src="{{imgUrl}}"><b>{{title}}</b></a><br><b>{{createTime}}</b>
					<br/><b><a style="color:green" href = "javascript:edit({{id}});">编辑</a>&nbsp;&nbsp;&nbsp; <a style="color:rgb(109,125,247)" href = "javascript:dele({{id}})">删除</a></b>	
				</li>
	</script>

	<form lay-filter="edit" style="margin-top:20px;display: none;"
		id="form1" class="layui-form" action="#">

		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">招聘标题:</label>
				<div class="layui-input-inline">
					<input type="text" name="title" id="title" autocomplete="off"
						class="layui-input">
				</div>
			</div>
			<div class="layui-input-inline">
				<input type="hidden" name="type" value="3" autocomplete="off"
					class="layui-input">
			</div>
			<div class="layui-input-inline">
				<input type="hidden" name="id" id="id"  value="" autocomplete="off"
					class="layui-input">
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
			<div class="layui-inline">
				<label class="layui-form-label">招聘图片</label>
				<div class="layui-input-block">
					<input type="file" name="file" autocomplete="off"
						class="layui-input">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline" style="width:80%">
				<label class="layui-form-label">招聘内容</label>
				<div class="layui-input-block">
					<textarea placeholder="请输入内容" id="content" name="content" class="layui-textarea"></textarea>
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
			$('#addNews').click(function() {
				layer.open({
					title : "添加招聘",
					type : 1, //,skin: 'layui-layer-rim'
					shadeClose : true,
					area : [ '600px', '450px' ],
					content : $('#form')
				});
				$('#form').show();
			});
			edit = function(id) {
				var curr = map.get(id);
				$('#id').val(id);
				$('#name').val(curr.name);
				$('#title').val(curr.title);
				$('#content').val(curr.content);
				$('#remark').val(curr.remark);
				layer.open({
					title : "编辑招聘",
					type : 1, //,skin: 'layui-layer-rim'
					shadeClose : true,
					area : [ '600px', '450px' ],
					content : $('#form1')
				});
				$('#form1').show();
			}
	
			dele = function(id) {
				if(!confirm("确定要删除吗?")) return;
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/b/article/delete",
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
	
			var map = new Map();
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/b/article/selectAll",
				dataType : "json",
				async : false,
				success : function(data) {
					if (data && data.status == "success") {
						var list = data.list;
						for (var i = 0; i < list.length; i++) {
							var curr = list[i];
							if (curr.type == "3") {
								curr.imgUrl = '${pageContext.request.contextPath}/file2stream?url=' + curr.imgUrl;
								var html = template('row', curr);
								map.set(curr.id, curr);
								$('#news').append(html);
							}
						}
					}
				}
			});
			
	
			form.on('submit(edit)', function(data) {
				var formData = new FormData(document.getElementById("form1"));
				$.ajax({
					url : "${pageContext.request.contextPath}/b/article/update",
					type : "POST",
					data : formData,
					processData : false, //必不可缺
					contentType : false, //必不可缺
					success : function(res) {
						res = JSON.parse(res);
						if (res.status == "success") {
							alert("招聘信息修改成功!");
							window.location.reload();
						}
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
					url : "${pageContext.request.contextPath}/b/article/save",
					type : "POST",
					data : formData,
					processData : false, //必不可缺
					contentType : false, //必不可缺
					success : function(res) {
						res = JSON.parse(res);
						if (res.status == "success") {
							alert("招聘信息录入成功!");
							window.location.reload();
						}
					}
				});
	
				return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
			});
	
	
		});
	</script>
</body>
</html>

