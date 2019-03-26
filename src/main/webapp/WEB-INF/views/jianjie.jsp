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
			<legend>系统简介</legend>
		</fieldset>

		<form class="layui-form" action="#">
			
			<div class="layui-form-item layui-form-text" style="display: none;">
				<label class="layui-form-label"></label>
				<div class="layui-input-block">
					<textarea name="id" id="id" placeholder="请输入内容" class="layui-textarea"></textarea>
				</div>
			</div>
				
			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">简介内容</label>
				<div class="layui-input-block">
					<textarea name="sysIntro" id="sysIntro" placeholder="请输入内容" class="layui-textarea"></textarea>
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-input-block">
					<button lay-submit lay-filter="*" style="width: 10%;"
						class="layui-btn" id="search">提交</button>
					<button style="width: 10%;" type="reset"
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
					url : "${pageContext.request.contextPath}/b/sysinfo/selectAll",
					dataType : "json",
					success : function(data) {
						/* $('tbody').empty();
						addRow(data); */
						if(data && data.status == "success"){
							//addRow(data.list);
							var sysInfo = data.list[0];
							$('#sysIntro').text(sysInfo.sysIntro);
							$('#id').val(sysInfo.id);
						}
					}
				}); 
			var form = layui.form;
			form.on('submit(*)', function(data) {
				console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
				console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
				console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
				var url = "${pageContext.request.contextPath}/b/sysinfo/save";
				if(data.field.id && data.field.id != ""){
					url = "${pageContext.request.contextPath}/b/sysinfo/update";
				}
				$.ajax({
					url : url,
					type : "POST",
					data : data.field,
					dataType : "json",
					success : function(res) {
						if(res.status == "success"){
							alert("系统简介更新成功!");
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

