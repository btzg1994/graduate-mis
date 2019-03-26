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
			<legend>筛选条件</legend>
		</fieldset>

		<form class="layui-form" action="#">

			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">毕业生姓名</label>
					<div class="layui-input-inline">
						<input type="text" name="name" id="name" autocomplete="off"
							class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">学号</label>
					<div class="layui-input-inline">
						<input type="text" name="id" id="id" autocomplete="off"
							class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">性别</label>
					<div class="layui-input-inline">
						<!-- <input type="text" id="city" name="city" autocomplete="off"
							class="layui-input"> -->
						<select id="gender" name="gender" lay-verify="" lay-filter="gender">
							<option value=""></option>
							<option value="1">男</option>
							<option value="0">女</option>
						</select>
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">手机号</label>
					<div class="layui-input-inline">
						<input type="text" name="phone" id="phone" autocomplete="off"
							class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">身份证号</label>
					<div class="layui-input-inline">
						<input type="text" name="idcard" id="idcard" autocomplete="off"
							class="layui-input">
					</div>
				</div>

			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button lay-submit lay-filter="*" style="width: 10%;"
						class="layui-btn" id="search">查询</button>
					<button style="width: 10%;" type="reset"
						class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>
		</form>


		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
			<legend>结果展示</legend>
		</fieldset>

		<div class="layui-form">
			<table class="layui-table" lay-size="sm">
				<thead>
					<tr>
						<th style="width:30px">编号</th>
						<th style="width:30px">学号</th>
						<th style="width:30px">姓名</th>
						<th style="width:50px">性别</th>
						<th style="width:50px">手机号</th>
						<th style="width:50px">身份证号</th>
						<th style="width:50px">联系地址</th>
						<th style="width:50px">指导老师</th>
						<th style="width:50px">学院</th>
						<th style="width:50px">专业</th>
						<th style="width:50px">备注</th>
						<th style="width:50px">操作</th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
			<div id="fenye" style="float:right;"></div>
		</div>
	</div>
	<script type="text/html" id="row">
					<tr>
						<td>{{index}}</td>
						<td>{{id}}</td>
						<td>{{name}}</td>
						<td>{{gender}}</td>
						<td>{{phone}}</td>
						<td>{{idcard}}</td>
						<td>{{nativePlace}}</td>
						<td>{{teacher}}</td>
						<td>{{xueyuan}}</td>
						<td>{{zhuanye}}</td>
						<td>{{remark}}</td>
						<td>
								<a style="color:rgb(26,161,148);" href="javascript:orderDetail({{index}},'{{merName}}');">删除</a>
						</td>
					</tr>
	</script>

	<script src="plugins/layui/layui.js"></script>
	<script src="js/template-web.js"></script>
	<script>
		var orderDetail;
		layui.use([ 'jquery', 'laydate', 'form', 'layer', 'laypage', 'element' ], function() {
			var laypage = layui.laypage,
				layer = layui.layer,
	
				$ = layui.jquery;
			var laydate = layui.laydate;
			var form = layui.form;
	
	
			var map ;
			// 添加数据
			function addRow(data) {
				map = new Map();
				for (var i = 0; data && i < data.length; i++) {
					var curr = data[i];
					curr.index = i + 1;
					curr.teacher = teacherMap.get(curr.teacherId).name;
					curr.xueyuan = xueyuanMap.get(curr.departmentId).name;
					curr.zhuanye = zhuanyeMap.get(curr.instituteId).name;
					map.set(curr.index, curr.orders);
					var html = template('row', curr);
					$('tbody').append(html);
				}
			}
			
			var teacherMap = new Map;
			$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/b/teacher/selectAll",
					async : false,
					contentType : "application/json;charset=utf-8",
					dataType : "json",
					success : function(data) {
						if(data && data.status == "success"){
							var list = data.list;
							for(var i = 0; i < list.length; i++){
								teacherMap.set(list[i].id, list[i]);
							}
						}
					}
				});
			var xueyuanMap = new Map;
			$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/b/institute/selectAll",
					async : false,
					contentType : "application/json;charset=utf-8",
					dataType : "json",
					success : function(data) {
						if(data && data.status == "success"){
							var list = data.list;
							for(var i = 0; i < list.length; i++){
								xueyuanMap.set(list[i].id, list[i]);
							}
						}
					}
				});
			var zhuanyeMap = new Map;
			$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/b/department/selectAll",
					async : false,
					contentType : "application/json;charset=utf-8",
					dataType : "json",
					success : function(data) {
						if(data && data.status == "success"){
							var list = data.list;
							for(var i = 0; i < list.length; i++){
								zhuanyeMap.set(list[i].id, list[i]);
							}
						}
					}
				});			
			$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/b/graduate/selectAll",
					async : false,
					contentType : "application/json;charset=utf-8",
					dataType : "json",
					success : function(data) {
						$('tbody').empty();
						addRow(data.list);
						total = data.total;
					}
				});
		
	
			var downLoadCondition = {};
	
	
			function freshPage(count) {
				laypage.render({
					elem : 'fenye',
					count : count, //数据总数，从服务端得到
					jump : function(obj, first) {
						//obj包含了当前分页的所有参数，比如：
						console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
						console.log(obj.limit); //得到每页显示的条数
						var condition = {
							city : $('#city').val() ? cityCode['610000'][$('#city').val()] : '',
							quxiao : $('#city').val() && $('#quxiao').val() ? cityCode[$('#city').val()][$('#quxiao').val()] : '',
							merName : $('#merName').val(),
							merId : $('#merId').val(),
							beginTime : $('#beginTime').val(),
							endTime : $('#endTime').val(),
							manager : $('#qudaojingli').val(),
							pageNum : obj.curr,
							pageSize : obj.limit
						}
						getData(condition);
	
						//首次不执行
						if (!first) {
							//do something
						}
					}
				});
			}
			var downLoadCondition = {};
=======
>>>>>>> .r52
			form.on('submit(*)', function(data) {
				// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
				// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
				// console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
				
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/b/graduate/selectByCondition",
					data :{
						"name":	data.field.name,
						"idcard":data.field.idcard,
						"gender":data.field.gender,
						"phone":data.field.phone,
						"id":data.field.id
					},
					dataType : "json",
					success : function(data) {
						$('tbody').empty();
						addRow(data.list);
					}
				});
				return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
			});
	});
	</script>

</body>
</html>

