<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<base href="${pageContext.request.contextPath}/resources/front/">
<link rel="stylesheet" type="text/css"
	href="liuyan/bootstrap-3.3.5-dist/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="liuyan/css/main.css">

<script type="text/javascript" src="liuyan/js/jquery-1.12.3.min.js"></script>

<script type="text/javascript"
	src="liuyan/bootstrap-3.3.5-dist/js/bootstrap.js"></script>

<script type="text/javascript" src="liuyan/js/main.js"></script>
<script type="text/javascript">
	$(function() {
		$('.btn-default').on('click', function() {
			$('#myModal').modal({
				backdrop : 'static',
				keyboard : false
			})
		});

		$('#myModal').on('hidden.bs.modal', function(e) {
			$('#edit_form')[0].reset();
		});
		$('#sub_btn').on('click', function getVal() {
			var name = $('#name').val();
			var content = $('#content').val();

			alert(name + "\n" + content);
			$('#myModal').modal('hide');
		});
	});
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="X-UA-Compatible" content="IE=edge" />
<title>招聘信息</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>

	<div class="ylcon">
		<div class="tit">
			<div class="aut_na">
				<span>评论列表</span>
			</div>
			<div class="btn-group btn-group-xs edit_ri" role="group"
				aria-label="...">
				<button type="button" class="btn btn-default">我要留言</button>
			</div>
		</div>

		<div id="messDivId">
			<div class="story">
				<div class="opbtn"></div>
				<div class="m_top">
					<div class="aut_na">
						<h4>
							<strong>繁星点点</strong>&nbsp;&nbsp;&nbsp;
						</h4>
					</div>
					<div class="btn-group btn-group-xs edit_ri" role="group"
						aria-label="...">
						<button type="button" class="btn btn-default">
							<span class="glyphicon glyphicon-new-window" aria-hidden="true"></span>&nbsp;回复
						</button>
					</div>
				</div>
				<p class="story_time">2015/07/12 20:48</p>
				<p class="story_m">为什么要追求bootstrap样式？</p>
			</div>
			<div class="story">
				<div class="opbtn"></div>
				<div class="m_top">
					<div class="aut_na">
						<h4>
							<strong>管理员</strong>&nbsp;&nbsp;&nbsp;
						</h4>
					</div>
					<div class="btn-group btn-group-xs edit_ri" role="group"
						aria-label="...">
						<button type="button" class="btn btn-default">
							<span class="glyphicon glyphicon-new-window" aria-hidden="true"></span>&nbsp;回复
						</button>
					</div>
				</div>
				<p class="story_time">2015/07/13 8:12</p>
				<p class="story_m">Bootstrap是一个兼容性强，操作开发简单的前端框架。</p>
				<p class="story_hf">
					<strong>@繁星点点</strong><small>(2015/07/12 20:48)</small>:为什么要追求bootstrap样式？
				</p>
			</div>
			<div class="story">
				<div class="opbtn"></div>
				<div class="m_top">
					<div class="aut_na">
						<h4>
							<strong>狂澜</strong>&nbsp;&nbsp;&nbsp;
						</h4>
					</div>
					<div class="btn-group btn-group-xs edit_ri" role="group"
						aria-label="...">
						<button type="button" class="btn btn-default">
							<span class="glyphicon glyphicon-new-window" aria-hidden="true"></span>&nbsp;回复
						</button>
					</div>
				</div>
				<p class="story_time">2016/02/10 13:23</p>
				<p class="story_m">渣渣路过</p>
				<p class="story_hf">
					<strong>@管理员</strong><small>(2015/07/13 8:12)</small>:Bootstrap是一个兼容性强，操作开发简单的前端框架。
				</p>
			</div>
		</div>
	</div>


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
						<h4 class="modal-title" id="myModalLabel">留言板</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="name">昵称</label> <input id="name"
								class="form-control" />
						</div>
						<div class="form-group">
							<label for="content">内容</label>
							<textarea id="content" class="form-control" rows="3"></textarea>
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="button" class="btn btn-primary" id="sub_btn">完成</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript" src="js/jquery.SuperSlide.2.1.js" >
	</script>
		<script type="text/javascript" src="js/common.js" ></script>

</html>
