<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>毕业生信息管理系统</title>

<link href="${pageContext.request.contextPath}/resources/login/css/main.css" rel="stylesheet" type="text/css" />

</head>
<body>


<div class="login">
    <div class="box png">
		<div class="logo png"></div>
		<div class="input">
			<div class="log">
				<div class="name">
					<label>用户名</label><input type="text" class="text" id="value_1" placeholder="用户名" name="value_1" tabindex="1">
				</div>
				<div class="pwd">
					<label>密　码</label><input type="password" class="text" id="value_2" placeholder="密码" name="value_2" tabindex="2">
				</div>
				<div class="role">
					<label>权&nbsp;&nbsp;限</label><label style="width: 50px" ><input type="radio" name="role" checked>学生</label>
					<label style="width: 50px"><input type="radio" name="role" >教师</label>
					<label style="width: 60px"><input type="radio" name="role" >管理员</label>
					<input type="button" class="submit" tabindex="4" value="登录">
					<div class="check"></div>
				</div>
				<div class="tip"></div>
			</div>
		</div>
	</div>
    <div class="air-balloon ab-1 png"></div>
	<div class="air-balloon ab-2 png"></div>
    <div class="footer"></div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/login//js/jQuery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/login//js/fun.base.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/login//js/script.js"></script>


<!--[if IE 6]>
<script src="js/DD_belatedPNG.js" type="text/javascript"></script>
<script>DD_belatedPNG.fix('.png')</script>
<![endif]-->
</body>
</html>