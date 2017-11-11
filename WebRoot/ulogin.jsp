<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<%@include file="/public/head.jspf"%>
	<link rel="stylesheet" href="${shop}/css/public.css" />
	<link rel="stylesheet" href="${shop}/css/style.css" />
	<style type="text/css">
		#dd div{
			padding: 5px;
		}
	</style>
<body>
	<div class="wrapper">
		<%@include file="/public/head2.jsp" %>
		<!-- 头部结束 -->
		<!-- 导航栏 -->
		<div class="navigation_container">
			<!---->
			<div class="nav">
				<ul class="primary_nav">
					<li class="active highlight"><a href="#">女装</a> <!--二级菜单-->
						<ul class="sub_menu">
							<li><a href="#">裙装</a>
								<ul>
									<li><a href="#">短裙</a></li>
									<li><a href="#">短裤</a></li>
									<li><a href="#">裤子</a></li>
									<li><a href="#">卡其裤</a></li>
									<li><a href="#">休闲裤</a></li>
									<li><a href="#">牛仔裤</a></li>
									<li><a href="#">风衣 & 运动夹克</a></li>
								</ul></li>
							<li><a href="#">装饰品</a>
								<ul>
									<li><a href="#">太阳镜</a></li>
									<li><a href="#">围巾</a></li>
									<li><a href="#">发饰品</a></li>
									<li><a href="#">帽子和手套</a></li>
									<li><a href="#">生活时尚</a></li>
									<li><a href="#">牛仔系列</a></li>
									<li><a href="#">风衣 & 西服</a></li>
								</ul></li>
						</ul></li>
					<!--二级菜单结束-->
					<li><a href="#">男装</a> <!--二级菜单-->
						<ul class="sub_menu">
							<li><a href="#">男士夏装</a>
								<ul>
									<li><a href="#">裤子</a></li>
									<li><a href="#">休闲裤</a></li>
									<li><a href="#">卡其裤</a></li>
									<li><a href="#">牛仔裤</a></li>
									<li><a href="#">风衣 & 运动夹克</a></li>
								</ul></li>
							<li><a href="#">装饰品</a>
								<ul>
									<li><a href="#">太阳镜</a></li>
									<li><a href="#">围巾</a></li>
									<li><a href="#">发饰品</a></li>
									<li><a href="#">帽子和手套</a></li>
									<li><a href="#">生活时尚</a></li>
									<li><a href="#">牛仔系列</a></li>
									<li><a href="#">风衣 & 西服</a></li>
								</ul></li>
						</ul> <!--二级菜单结束--></li>
					<li><a href="#">儿童</a></li>
					<li><a href="#">时尚</a></li>
					<li><a href="#">装饰品</a></li>
				</ul>
			</div>
		</div>
		<!--导航栏结束-->
		<div class="section_container">
			<!-- 购物车 -->
			<div id="dd" class="action_buttonbar" style="text-align:center;">
				<form method="post" action="${shop}/user_login.action">
					<div>
						<label for="login">账号:&nbsp;</label> 
						<input type="text" name="login" value="user"/>
					</div>
					<div>
						<label for="pass">密码:&nbsp</label> 
						<input type="password" name="pass" value="user"/>
					</div>
					<div>
						${sessionScope.error}  
					</div>
					<div>
						<input type="submit" value="登陆" style="width:60px;height:30px" />
						<input type="button" value="注册" onclick="window.open('${shop}/register.jsp','_self')" style="width:60px;height:30px" />
					</div>
			   </form>
			   <div style="clear:both"></div>
			</div>
		</div>
			<!-- 导航栏结束 -->
			<%@include file="/public/bottom.jsp" %>
</body>
</html>
