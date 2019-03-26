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
		<div style="width:100px;height:38px;float:right;padding-bottom:10px">
			<button class="layui-btn" id="addGonggao">添加公告</button>
		</div>
		<div style="padding-top:50px;">
			<div class="layui-row" id="row">
				
			</div>

		</div>
		<script type="text/html" id="gonggao">
			<div class="layui-col-md4">
					<div class="grid-demo grid-demo-bg1">
						<blockquote class="layui-elem-quote layui-quote-nm">
							<span>{{title}}</span> 
								 <span style="float:right"><a href="javascript:edit({{id}});"> &nbsp;&nbsp;编辑</a></span> 
								 <span style="float:right"><a href="javascript:dele({{id}});">删除</a></span>	
							<br> <br> 
							 &nbsp;&nbsp;&nbsp;&nbsp;<span id="">{{content}}</span >
							<br> <br> 
							<span id="">{{createTime}}</span>
						</blockquote>
					</div>
			</div>
		</script>	
	</div>

	<form lay-filter="add" style="margin-top:20px;display: none;" id="form"
		class="layui-form" action="#">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">公告名称:</label>
				<div class="layui-input-inline"  style="width:300px;">
					<input type="text" name="title"  autocomplete="off"
						class="layui-input">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">备注:</label>
				<div class="layui-input-inline"  style="width:300px;">
					<input type="text" name="remark" autocomplete="off"
						class="layui-input">
				</div>
			</div>
		</div>
			
		<div class="layui-form-item">
			<div class="layui-inline"  style="width:80%">
				<label class="layui-form-label">公告内容</label>
			    <div class="layui-input-block">
			      <textarea placeholder="请输入内容" name = "content" class="layui-textarea"></textarea>
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

		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">公告名称:</label>
				<div class="layui-input-inline"  style="width:300px;">
					<input type="text" name="title" id="title" autocomplete="off"
						class="layui-input">
				</div>
			</div>
			<div class="layui-inline" style = "display: none;">
				<label class="layui-form-label">公告名称:</label>
				<div class="layui-input-inline"  style="width:300px;">
					<input type="text" name="id" id="id" autocomplete="off"
						class="layui-input">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">备注:</label>
				<div class="layui-input-inline"  style="width:300px;">
					<input type="text" name="remark" id="remark" autocomplete="off"
						class="layui-input">
				</div>
			</div>
		</div>
			
		<div class="layui-form-item">
			<div class="layui-inline"  style="width:80%">
				<label class="layui-form-label">公告内容</label>
			    <div class="layui-input-block">
			      <textarea placeholder="请输入内容" id="content" name = "content" class="layui-textarea"></textarea>
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
			$('#addGonggao').click(function() {
				layer.open({
					title : "添加公告",
					type : 1, //,skin: 'layui-layer-rim'
					shadeClose : true,
					area : [ '600px', '400px' ],
					content : $('#form')
				});
				$('#form').show();
			});
			edit = function(id) {
				var curr = map.get(id);
				$('#id').val(id);
				$('#title').val(curr.title);
				$('#content').text(curr.content);
				$('#remark').val(curr.remark);
				layer.open({
					title : "编辑公告",
					type : 1, //,skin: 'layui-layer-rim'
					shadeClose : true,
					area : [ '600px', '400px' ],
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
						if (data.status == "success") {
							var list = data.list;
							for(var i = 0; i < list.length; i++){
								var curr = list[i];
								var type = curr.type;
								if(type == "1"){
									curr.content = curr.content.substring(0, 100);
									var html = template('gonggao',curr);
									map.set(curr.id, curr);
									$('#row').append(html);
								}
							}
						}
						 	
						else 
							alert("添加失败!"); 
					}
				});
	
			
			var form = layui.form;
	
			form.on('submit(edit)', function(data) {
				console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
				console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
				console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/b/article/update",
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
				var body = data.field;
					body.type = 1;
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/b/article/save",
					data : body,
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

