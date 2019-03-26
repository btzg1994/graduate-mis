<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<div class="top_wrap">
			<!--top index-->
			<div class="top">
				<span class="welcome">欢迎您访问XX大学秘书学系网站！</span>
				<div class="corner">
					<a onclick=SetHome(this,window.location) title="设为首页" href="javascript:void(0);">设为首页</a>
					<span>|</span>
					<a onclick=addFavorite(window.location,document.title) title="添加收藏" href="javascript:void(0);">加入收藏</a>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<!--logo and nav-->
		<div class="header_wrap">
			<div class="header">
				<a href="index.html" class="logo"><img src="images/logo.jpg" /></a>
				<div class="nav_list">
					<ul id="nav" class="nav clearfix">
						<li class="nLi" style="display: none;"></li>
						<li class="nLi">
							<h3><a href="${pageContext.request.contextPath }/page/f/index">首页</a></h3>
							<!-- <ul class="sub">
								<li><a href="about.html">专业简介</a></li>
								<li><a href="about.html">培养方案</a></li>
							</ul> -->
						</li>
						<li class="nLi">
							<h3><a href="javascript:;">关于系统</a></h3>
							<ul class="sub">
								<li><a href="${pageContext.request.contextPath }/page/f/to?target=jianjie">系统简介</a></li>
								<li><a href="${pageContext.request.contextPath }/page/f/to?target=gonggao">系统公告</a></li>
								<li><a href="${pageContext.request.contextPath }/page/f/to?target=news">学校新闻</a></li>
							</ul>
						</li>
						<li class="nLi">
							<h3><a href="${pageContext.request.contextPath }/page/f/to?target=zhaopin">招聘信息</a></h3>
							<!-- <ul class="sub">
								<li><a href="study.html">学习成果</a></li>
								<li><a href="study.html">活动掠影</a></li>
								<li><a href="student.html">优秀毕业生</a></li>
							</ul> -->
						</li>
						<li class="nLi">
							<h3><a href="${pageContext.request.contextPath }/page/f/to?target=liuyan">在线留言</a></h3>
							<!-- <ul class="sub">
								<li><a href="serve.html">对外培训</a></li>
								<li><a href="serve.html">志愿服务</a></li>
								<li><a href="serve.html">秘书职业资格证</a></li>
							</ul> -->
						</li>
						<li class="nLi">
							<h3><a href="${pageContext.request.contextPath }/page/f/to?target=friend">友情链接</a></h3>
							<!-- <ul class="sub">
								<li><a href="resource.html">技能类</a></li>
								<li><a href="resource.html">法文类</a></li>
								<li><a href="resource.html">其他</a></li>
								<li><a href="resource.html">探秘天下</a></li>
							</ul> -->
						</li>
						<li class="nLi">
							<h3><a href="resource.html">系统登录</a></h3>
							<ul class="sub">
								<li><a href="resource.html">教师入口</a></li>
								<li><a href="resource.html">学生入口</a></li>
								<li><a href="resource.html">管理员入口</a></li>
							</ul>
						</li>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
		</div>
</html>
