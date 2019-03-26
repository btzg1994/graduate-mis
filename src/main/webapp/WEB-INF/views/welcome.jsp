<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/plugins/layui/css/layui.css">
	<style type="text/css">
		.container{margin: 20px;}
	</style>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/layui/layui.js"></script>
  </head>
  
  <body>
  	<div class="container">
	  	<div class="layui-row layui-col-space20">
		  	
	
		  	<div class="layui-col-md12" align="center">
		    	<canvas id="canvas" width="1140" height="200"></canvas>
		  	</div>
	
		</div>
	
		<div class="layui-row layui-col-space20">
		  	<div class="layui-col-md4">
		  		<div class="layui-collapse">
					<div class="layui-colla-item">
			    		<h2 class="layui-colla-title">杜甫</h2>
			    		<div class="layui-colla-content layui-show">
							占位内容<br>
							占位内容<br>
							占位内容<br>
							占位内容<br>
							占位内容<br>
							占位内容<br>
							占位内容<br>
							占位内容<br>
							占位内容<br>
							占位内容<br>
			    		</div>
			  		</div>
				</div>
		  	</div>
	
		  	<div class="layui-col-md8">
		    	<div class="layui-collapse">
					<div class="layui-colla-item">
			    		<h2 class="layui-colla-title">杜甫</h2>
			    		<div class="layui-colla-content layui-show">
							占位内容<br>
							占位内容<br>
							占位内容<br>
							占位内容<br>
							占位内容<br>
							占位内容<br>
							占位内容<br>
							占位内容<br>
							占位内容<br>
							占位内容<br>
			    		</div>
			  		</div>
				</div>
		  	</div>
	
		</div>
	</div>
    
<script>
layui.use('element', function(){
  var element = layui.element;
  
  //…
});
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/time/digit.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/time/app.js"></script>
  </body>
</html>
