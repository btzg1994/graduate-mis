<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<base href="${pageContext.request.contextPath}/resources/front/">
<link rel="stylesheet" type="text/css" href="liuyan/css/main.css">

<script type="text/javascript" src="liuyan/js/jquery-1.12.3.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="X-UA-Compatible" content="IE=edge" />
<title>招聘信息</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>
	<!--header-->
	<jsp:include page="head.jsp"></jsp:include>
	<!--content-->
	<div class="i_content">
		<!-- <div class="adr_wrap">
				<div class="adr">
					<span class="adr_link"><a href="index.html">首   页</a>&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;最新通知</span>
				</div>
			</div> -->
		<div class="c_area">
			<jsp:include page="left.jsp"></jsp:include>
			<div class="right_content">

				<jsp:include page="liuyancontent.jsp"></jsp:include>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	</body>
	<script type="text/javascript" src="js/jquery.SuperSlide.2.1.js" ></script>
	<script type="text/javascript" src="js/common.js" ></script>
</html>
