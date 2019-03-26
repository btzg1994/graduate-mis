<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<base href="${pageContext.request.contextPath}/resources/front/">
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="X-UA-Compatible" content="IE=edge"/>
		<title>系统简介</title>
		<link rel="stylesheet" type="text/css" href="css/style.css"/>
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
					<div class="con_title">系统简介</div>
					<div class="con_box">
						<div class="r_title" id="title"><p id="createTime"></p></div>
						<p id="content"></p>
						<!-- <p>秘书是领导者、主事者身边的综合辅助者和公务服务者，是以辅助决策、综合协调、沟通信息、办文办会办事等为主要职能活动的领导者、决策者的参谋助手。秘书学是以秘书工作为研究对象，研究其主体与客体及其相互关系的一门学科。它研究秘书工作的产生与发展、职能与环境、性质与作用、规律与特征、原则与要求、程序与环节、方法与艺术、机构与人员，以及秘书工作规范化、科学化、现代化的发展趋势等问题，以促进秘书工作适应社会发展的需要。</p> -->
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
		<script type="text/javascript" src="js/jquery-1.11.0.min.js" ></script>
		<script type="text/javascript" src="js/jquery.SuperSlide.2.1.js" ></script>
		<script type="text/javascript" src="js/common.js" ></script>
		<script type="text/javascript">
			$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/b/sysinfo/selectAll",
					dataType : "json",
					success : function(data) {
						if (data.status == "success")
						 var jianJie = data.list;
						 for(var i = 0; i < jianJie.length; i++){
							var curr = jianJie[i];
							$("#title").html("毕业生管理系统简介");
							$('#content').html(curr.sysIntro);
							$('#createTime').html("2019-03-01 11:00:00");
						}
					}
				});
		</script>
	</body>
</html>
