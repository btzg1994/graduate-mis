<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<base href="${pageContext.request.contextPath}/resources/front/">
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="X-UA-Compatible" content="IE=edge"/>
		<title>招聘信息</title>
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
					<div class="con_title">系统公告</div>
					<div class="con_box">
						<ul class="items-list" id="gonggao">
						</ul>
						<!--分页-->
						<!-- <div class="record">
	                        <span class="prev"><a href="">上一页</a></span>
	                        <span class="word"><a href="">1</a></span>
	                        <span class="word"><a href="">2</a></span>
	                        <span class="word"><a href="">3</a></span>
	                        <span class="word"><a href="">4</a></span>
	                        <span class="word"><a href="">5</a></span>
	                        <span class="word"><a href="">6</a></span>
	                        <span class="next"><a href="">下一页</a></span>
	                        <span class="sum">共6页</span>
	                    </div> -->
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
					url : "${pageContext.request.contextPath}/b/article/selectAll",
					dataType : "json",
					success : function(data) {
						if (data.status == "success") {
							var list = data.list;
							for(var i = 0; i < list.length; i++){
								var curr = list[i];
								var type = curr.type;
								if(type == "1"){
									$('#gonggao').append('<li><a href="'+curr.imgUrl+'">'+curr.title+'</a><span class="date">'+curr.createTime+'</span></li>');
								}
							}
						}
						 	
						else 
							alert("添加失败!"); 
					}
				});
		</script>
	</body>
</html>
