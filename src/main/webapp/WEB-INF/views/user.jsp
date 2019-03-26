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
	<div style="padding:20px 50px 0px 50px;">
		<form class="layui-form layui-form-pane" action="" id="form">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">姓名</label>
					<div class="layui-input-block">
						<input type="text" name="name" autocomplete="off"
							class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">上传头像</label>
					<div class="layui-input-block">
						<input type="file" name="file" autocomplete="off"
							class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">学号</label>
					<div class="layui-input-block">
						<input type="text" name="id" autocomplete="off"
							class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">登录密码</label>
					<div class="layui-input-inline">
						<input type="password" name="loginPwd" autocomplete="off"
							class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item" pane="">
				<label class="layui-form-label">性别</label>
				<div class="layui-input-block">
					<input type="radio" name="gender" value="1" title="男" checked="">
					<input type="radio" name="gender" value="0" title="女">
					<!-- <input
						type="radio" name="sex" value="禁" title="禁用" disabled=""> -->
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">手机号</label>
					<div class="layui-input-block">
						<input type="text" name="phone" id="phone" autocomplete="off"
							class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">身份证</label>
					<div class="layui-input-inline">
						<input type="text" name="idcard" autocomplete="off"
							class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">联系住址</label>
				<div class="layui-input-block">
					<input type="text" name="nativePlace" autocomplete="off"
						placeholder="请输入标题" class="layui-input">
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
					<label class="layui-form-label">学院</label>
					<div class="layui-input-inline">
						<select name="xueyuan" id="xueyuan" lay-filter = "xueyuan">
							<option value="">请选择学院</option>
						</select>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">专业</label>
					<div class="layui-input-inline">
						<select name="zhuanye" id="zhuanye" >
							<option value="">请选择专业</option>
						</select>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">角色</label>
					<div class="layui-input-inline">
						<select name="roleId" id="roleId" >
							<option value="">请选择角色</option>
						</select>
					</div>
				</div>
			</div>


			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">备注</label>
				<div class="layui-input-block">
					<textarea name="remark" placeholder="请输入内容" class="layui-textarea"></textarea>
				</div>
			</div>
			<div class="layui-form-item">
				<button class="layui-btn" lay-submit="" lay-filter="add">保存</button>
			</div>
		</form>
	</div>


	<script src="plugins/layui/layui.js"></script>
	<script src="js/template-web.js"></script>
	<script>
		layui.use([ 'jquery', 'laydate', 'form', 'layer', 'laypage', 'element', 'upload' ], function() {
			var laypage = layui.laypage,
				layer = layui.layer,
				$ = layui.jquery;
			var laydate = layui.laydate;
			var form = layui.form;
	
			var upload = layui.upload;
	
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/b/teacher/selectAll",
				dataType : "json",
				success : function(data) {
					if (data.status == "success"){
						var tList = data.list;
						for(var i = 0; i < tList.length; i++){
							var curr = tList[i];
							$('#teacher').append('<option value="'+curr.id+'">'+curr.name+'</option>');
						}
						form.render('select');
					}
				}
			});
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/b/role/selectAll",
				dataType : "json",
				success : function(data) {
					if (data.status == "success"){
						var tList = data.list;
						for(var i = 0; i < tList.length; i++){
							var curr = tList[i];
							$('#roleId').append('<option value="'+curr.id+'">'+curr.name+'</option>');
						}
						form.render('select');
					}
				}
			});
			
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/b/institute/selectAll",
				dataType : "json",
				success : function(data) {
					if (data.status == "success"){
						var tList = data.list;
						for(var i = 0; i < tList.length; i++){
							var curr = tList[i];
							$('#xueyuan').append('<option value="'+curr.id+'">'+curr.name+'</option>');
						}
						form.render('select');
					}
				}
			});
			
			
			
			form.on('select(xueyuan)', function(data) {
				$('#zhuanye').html('<option value=""></option>');
				form.render('select');
				//console.log(data.elem); //得到select原始DOM对象
				//console.log(data.value); //得到被选中的值
				//console.log(data.othis); //得到美化后的DOM对象
				var val = data.value;
				$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/b/department/selectAll",
				dataType : "json",
				success : function(data) {
					if (data.status == "success"){
						var tList = data.list;
						for(var i = 0; i < tList.length; i++){
							var curr = tList[i];
							if(curr.instituteId == val){
								$('#zhuanye').append('<option value="'+curr.id+'">'+curr.name+'</option>');
							}
						}
						form.render('select');
					}
				}
			});
			});
			
			form.on('submit(add)', function(data) {
				console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
				console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
				console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
				var formData = new FormData(document.getElementById("form"));
				var file = formData.get("file");
				$.ajax({
					url : "${pageContext.request.contextPath}/b/graduate/save",
					type : "POST",
					data : formData,
					processData : false, //必不可缺
					contentType : false, //必不可缺
					success : function(res) {
						res = JSON.parse(res);
						if(res.status == "success"){
							alert("毕业生信息录入成功!");
							window.location.reload();
						} else {
							alert("该学号已存在!");
						}
					}
				});
				return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
			});
		});
	</script>
</body>
</html>

