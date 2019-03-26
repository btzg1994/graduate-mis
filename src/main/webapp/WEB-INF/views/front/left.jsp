<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<div class="left_list">
					<div class="nav_title">系统导航</div>
					<div class="sidemenu">
						<ul>
							<li class="on"><a href="${pageContext.request.contextPath }/page/f/to?target=liuyan">在线留言</a></li>
							<li class="on"><a href="${pageContext.request.contextPath }/page/f/to?target=zhaopin">招聘信息</a></li>
							<li class="on"><a href="${pageContext.request.contextPath }/page/f/to?target=news">学校新闻</a></li>
						</ul>
					</div>
					<div class="contact">
						<a href="${pageContext.request.contextPath }/page/f/to?target=connect"><img src="images/tel.jpg" /></a>
					</div>
</div>
</html>
