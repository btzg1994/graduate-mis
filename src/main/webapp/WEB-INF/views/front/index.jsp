<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="X-UA-Compatible" content="IE=edge" />
<meta name="keywords" content="秘书学系" />
<meta name="description" content="XX大学秘书学系" />
<title>秘书学系</title>
<base href="${pageContext.request.contextPath}/resources/front/">
<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>
	<!--header-->
	<jsp:include page="head.jsp"></jsp:include>
	<!--banner-->
	<div class="banner">
		<div class="bd">
			<ul>
				<li class="first"><a href="javascript:void(0);"></a></li>
				<li class="second"><a href="javascript:void(0);"></a></li>
				<li class="third"><a href="javascript:void(0);"></a></li>
				<li class="fourth"><a href="javascript:void(0);"></a></li>
				<li class="fifth"><a href="javascript:void(0);"></a></li>
			</ul>
		</div>
		<div class="hd">
			<ul></ul>
		</div>
	</div>
	<!--content-->
	<div class="content">
		<div class="left_tab">
			<div class="hd">
				<ul>
					<li class="first">最新招聘</li>
					<li class="second">学校新闻</li>
				</ul>
			</div>
			<div class="bd">
				<div class="box">
					<a href="${pageContext.request.contextPath }/page/f/to?target=zhaopin" class="more">MORE+</a>
					<ul class="clearfix" id="zhaopin">
						
					</ul>
				</div>
				<div class="box">
					<a href="${pageContext.request.contextPath }/page/f/to?target=news" class="more">MORE+</a>
					<ul class="clearfix" id="xinwen">
					</ul>
				</div>
			</div>
		</div>
		<div class="right_box">
			<!--notice-->
			<div class="notice">
				<div class="n_title">
					<b>系统公告</b> <a href="${pageContext.request.contextPath }/page/f/to?target=gonggao">MORE+</a>
				</div>
				<div class="bd">
					<ul class="infoList" id="gonggao">
						
					</ul>
				</div>
			</div>
		</div>
		<div class="clear"></div>
		<div class="friend_link">
			<b id="link">友情链接：</b>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="js/jquery.SuperSlide.2.1.js"></script>
	<script type="text/javascript" src="js/common.js"></script>
	<script type="text/javascript">
		//banner滚动效果
		jQuery(".banner").slide({
			titCell : ".hd ul",
			mainCell : ".bd ul",
			effect : "fold",
			autoPlay : true,
			autoPage : true,
			trigger : "click"
		});
		//tab切换效果
		jQuery(".left_tab").slide();
		//news滚动效果
		jQuery(".notice").slide({
			mainCell : ".bd ul",
			autoPage : true,
			effect : "top",
			autoPlay : true,
			vis : 3
		});
	</script>
	<script type="text/javascript">
			
			// 友情链接初始化
			$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/b/link/selectAll",
					dataType : "json",
					success : function(data) {
						if (data.status == "success")
						 var links = data.list;
						 for(var i = 0; i < links.length; i++){
							var curr = links[i];
							$('#link').after('<a href="'+curr.url+'" target="_blank">'+curr.name+'</a>');
						}
					}
				});
				/* var links = [{id:1,name:"测试链接",url:"http://www.baidu.com"},{id:2,name:"技术期刊",url:"http://www.baidu.com"}];
				for(var i = 0; i < links.length; i++){
					var curr = links[i];
					$('#link').after('<a href="'+curr.url+'" target="_blank">'+curr.name+'</a>');
				} */
				
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
									$('#gonggao').append('<li><a href="javascript:;">'+curr.title+'</a><span class="date">'+curr.createTime+'</span></li>');
								} else if("2" == type){
									$('#xinwen').append('<li><a href="'+curr.imgUrl+'"><img src="'+curr.url+'" /><h4>'+curr.title+'</h4> <span class="date">'+curr.createTime+'</span></a></li>');
								} else {
									$('#zhaopin').append('<li><a href="'+curr.imgUrl+'"><img src="'+curr.url+'" /><h4>'+curr.title+'</h4> <span class="date">'+curr.createTime+'</span></a></li>');
									
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
