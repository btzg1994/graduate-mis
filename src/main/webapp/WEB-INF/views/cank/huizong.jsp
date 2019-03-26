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
					<label class="layui-form-label">地市</label>
					<div class="layui-input-inline">
						<!-- <input type="text" id="city" name="city" autocomplete="off"
							class="layui-input"> -->
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
					<button id="down" style="width: 10%;  float:right;"
						class="layui-btn layui-btn-normal">数据导出</button>
				</div>
			</div>
		</form>


		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 20px;">
			<legend>结果展示</legend>
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
						<th>地市</th>
						<th>已支持红包商户数</th>
						<!-- <th>签约进度</th> -->
						<th>有收款记录商户数</th>
						<th>领红包用户数</th>
						<th>兑付用户数</th>
						<th>兑付总金额</th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
			<div id="fenye" style="display:none ;float:right;"></div>
		</div>
	</div>
	<!-- <td>{{jindu}}</td> -->
	<script type="text/html" id="row">
					<tr>
						<td>{{index}}</td>
						<td>{{city}}</td>
						<td>{{shanghushu}}</td>
						
						<td>{{youshoukuanjilu}}</td>
						<td>{{userCount}}</td>
						<td>{{useUserCount}}</td>
						<td>{{totalFee}}</td>
					</tr>
	</script>

	<script src="plugins/layui/layui.js"></script>
	<script src="js/template-web.js"></script>
	<script>
		var allData = JSON.parse('${collectData}');
		
		layui.use([ 'jquery', 'laydate', 'form', 'layer', 'laypage' ], function() {
			var laypage = layui.laypage,
				layer = layui.layer;
				
			var laydate = layui.laydate;
			var $ = layui.jquery;
			//执行一个laydate实例
			laydate.render({
				elem : '#beginTime' //指定元素
			});
			laydate.render({
				elem : '#endTime' //指定元素
			});
			$('#down').click(function(){
				window.location.href = "${pageContext.request.contextPath}/downloadCollectData";
				return false;
			});
			function addRow(data) {
				var j = 1;
				for (var i = 0; i < data.length; i++) {
					var map = data[i];
					var curr = {};
					for (var key in map) {
						//if(map[key] == "unknown") continue;
						curr.index = j;
						if (key == "city") {
							curr.city = map[key];
						} else if (key == "兑付人数") {
							curr.useUserCount = map[key];
						} else if (key == "领卡用户") {
							curr.userCount = map[key];
						} else if (key == "金额") {
							curr.totalFee = map[key];
						} else if (key == "签约进度") {
							curr.jindu = map[key];
						} else if (key == "商户数") {
							curr.shanghushu = map[key];
						} else if (key == "可兑付商户") {
							curr.youshoukuanjilu = map[key];
						}
					}
					if("unknown" != curr.city){
						var html = template('row', curr);
						$('tbody').append(html);
						j++;
					}
				}
			}
			addRow(allData);
			var form = layui.form;
	
	
			form.on('submit(*)', function(data) {
				console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
				console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
				console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
				var city = $('#city').val();
				var beginTime = $('#beginTime').val();
				var endTime = $('#endTime').val();
				//alert(city + beginTime + endTime);
	
				$.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/getCollectDataByCondition",
						data : {
							city : $('#city').val(),
							beginTime : $('#beginTime').val(),
							endTime : $('#endTime').val()
						},
						dataType:"json",
						success : function(data) {
						$('tbody').empty();
							addRow(data);
						}
					});
	
				return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
			});
		});
		
	</script>

</body>
</html>

