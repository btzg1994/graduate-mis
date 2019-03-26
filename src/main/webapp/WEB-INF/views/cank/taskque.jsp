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
			<legend>下载队列</legend>
		</fieldset>

		<div class="layui-form">
			<table class="layui-table" lay-size="sm">
				<thead>
					<tr>
						<th style="width:30px">编号</th>
						<th style="width:30px">文件名</th>
						<th style="width:30px">任务时间</th>
						<th style="width:30px">任务状态</th>
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
			<td>{{path}}</td>
			<td>{{createTime}}</td>
			<td style="color:{{css}};">{{status}}</td>
			<td>{{if path == null}}{{else}}<a href="javascript:down('{{id}}');">下载</a>{{/if}}</td>
		</tr>
	</script>

	<script src="plugins/layui/layui.js"></script>
	<script src="js/template-web.js"></script>
	<script>
		var tasks = JSON.parse('${tasks}');
		var $;
		layui.use([ 'jquery', 'laydate', 'form', 'layer', 'laypage', 'element' ], function() {
			var laypage = layui.laypage,
				layer = layui.layer;
	
				$ = layui.jquery;
			var laydate = layui.laydate;
			var form = layui.form;
	
			// ------------------------- 初始化二级选择框
			$.download = function(url, method, filedir) {
				$('<form action="' + url + '" method="' + (method || 'post') + '">' + // action请求路径及推送方法
					'<input type="text" name="filePath" value="' + filedir + '"/>' + // 文件路径
					'</form>')
					.appendTo('body').submit().remove();
			};
			(function(data) {
				for (var i = 0; data && i < data.length; i++) {
					var curr = data[i];
					curr.index = i + 1;
					curr.status = !curr.path ? "任务正在进行" : "任务已完成";
					curr.css = !curr.path ? "red" : "rgb(0,150,136)";
					var html = template('row', curr);
					$('tbody').append(html);
				}
			})(tasks);
			
		});
		
	
			function down(id) {
				var url = '${pageContext.request.contextPath}/down?id=' + id;
				$.download(url, 'post', '');
				return false;
			}
	</script>

</body>
</html>

