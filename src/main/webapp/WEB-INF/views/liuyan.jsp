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
<link rel="stylesheet" type="text/css"
	href="front/liuyan/bootstrap-3.3.5-dist/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="front/liuyan/css/main.css">

<script type="text/javascript" src="front/liuyan/js/jquery-1.7.1.min.js"></script>

<script type="text/javascript"
	src="front/liuyan/bootstrap-3.3.5-dist/js/bootstrap.js"></script>
<script src="plugins/layui/layui.js"></script>
<script src="js/template-web.js"></script>
<style type="text/css">
.buttonBox {
	cursor: pointer;
}
</style>
<script type="text/javascript">
	$(function() {});
</script>
</head>

<body>

	<div style="padding:0px 50px 0px 50px;">
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 20px;">
			<legend>留言列表</legend>
		</fieldset>
		<div class="ylcon">
			<div id="messDivId"></div>
		</div>
		<script type="text/html" id="content">
			<div class="story">
					<div class="opbtn"></div>
					<div class="m_top">
						<div class="aut_na">
							<h4>
								<strong>{{nickname}}</strong>&nbsp;&nbsp;&nbsp;
							</h4>
						</div>
						<div class="btn-group btn-group-xs edit_ri" role="group" aria-label="...">
							<button style="height:20px; width:60px;" type="button" class="btn btn-default btn-reply" val ={{id}} id = "reply_btn_{{id}}"> 
								<span class="glyphicon glyphicon-new-window" aria-hidden="true"></span>&nbsp;回复
							</button>
							<button style="height:20px; width:60px;" type="button" class="btn btn-default btn-dele" val ={{id}}>
								<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp;删除
							</button>
						</div>
					</div>
					<p class="story_time">{{levelTime}}</p>
					<p class="story_m" id = "reply_{{id}}">{{content}}</p>
					
			</div>
		</script>

		<script type="text/html" id="replyContent">
			<p class="story_hf">
						<strong>@{{nickname}}</strong><small>({{replyTime}})</small>:{{replyContent}}
			</p>
		</script>

		<!-- 模态框 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<form role="form" id="edit_form">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">回复内容</h4>
						</div>
						<div class="modal-body">
							<div class="form-group" style = "display:none">
								<label for="name">昵称</label> <input id="name"
									class="form-control" />
							</div>
							<div class="form-group">
								<label for="content">内容</label>
								<textarea id="reply_msg" class="form-control" rows="3"></textarea>
							</div>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal" style="height:30px;">取消</button>
							<button type="button" style="height:30px;"
								class="btn btn-primary" id="sub_btn">完成</button>
						</div>
					</div>
				</form>
			</div>
		</div>

		<script>
		
			var edit;
			var dele;
			var menu;
		
			layui.use([ 'laydate', 'form', 'element', 'layer', 'laypage' ], function() {
				var laypage = layui.laypage,
					layer = layui.layer,
					//$ = layui.jquery,
					form = layui.form;
				var element = layui.element;
				var laydate = layui.laydate;
		
				var menuMap = new Map();
		
				var map = new Map();
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/b/message/selectAll",
					dataType : "json",
					async : false,
					success : function(data) {
						if (data && data.msg == "成功") {
							var list = data.list;
							for (var i = 0; i < list.length; i++) {
								var curr = list[i];
								$('#messDivId').append(template('content', curr));
								if (curr.replyTeacherId) {
									$('#reply_' + curr.id).append(template('replyContent', curr));
									$('#reply_btn_' + curr.id).hide();
								}
							}
						}
					}
				});
				var currMsg = "";
				$('.btn-reply').on('click', function() {
					currMsg = $(this).attr('val');
					$('#myModal').modal({
						backdrop : 'static',
						keyboard : false
					})
				});
				$('.btn-dele').on('click', function() {
					$.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/b/message/delete",
						dataType : "json",
						data : {
							"key" : $(this).attr('val')
						},
						success : function(data) {
							if (data && data.msg == "成功") {
								alert("删除成功!");
								window.location.reload();
							}
						}
					});
				});
		
				$('#myModal').on('hidden.bs.modal', function(e) {
					$('#edit_form')[0].reset();
				});
				$('#sub_btn').on('click', function getVal() {
					var name = $('#name').val();
					var content = $('#reply_msg').val();
					alert(name + "\n" + content + "\n" + currMsg);
					$.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/b/message/update",
						dataType : "json",
						data : {
							"id" : currMsg,
							"replyContent" : content,
							"replyTeacherId" : "1"
						},
						success : function(data) {
							if (data && data.msg == "成功") {
								alert("回复成功!");
								window.location.reload();
							}
						}
					});
					$('#myModal').modal('hide');
				});
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
				$('#addRole').click(function() {
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

