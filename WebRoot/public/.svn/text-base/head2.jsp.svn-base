<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath }" var="shop"/>
<div class="header">
	<div class="header_container">
		<!--头部开始-->
		<div class="top_bar clear">
			<!--头部小导航-->
			<div class="welcom fl">欢迎光临LEISUPET SHOP!</div>
			<ul class="top_links fr">
				<li class="highlight"><a href="${shop }/index.jsp">首页</a></li>
				<!-- <li><a href="#">我的账户</a></li> -->
				<li><a href="${shop }/showCar.jsp">购物车</a></li>
				<c:choose>
					<c:when test="${sessionScope.user == null }">
						<li><a href="${shop }/register.jsp">注册</a></li>
						<li><a href="${shop }/ulogin.jsp">登录</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="#">${sessionScope.user.name }</a></li>
						<li><a href="${shop }/user_logout.action">退出登录</a></li>
					</c:otherwise>
				</c:choose>
				
			</ul>
			<!--头部小导航结束-->
			<!-- logo -->
			<h1 class="logo clear fl">
				<a href="index.jsp"><img src="${shop }/images/logo.png" /></a>
			</h1>
			<!-- 购物车 -->
			<div class="minicart">
				<a class="minicart_link" href="${shop }/showCar.jsp"> <span class="item"> <b id="totalProduct">${sessionScope.totalProduct }</b>
						件/
				</span> <span class="price"> <b id="totalPrice">￥${sessionScope.totalPrice }</b>
				</span>
				</a>
			</div>
			<!-- 购物车结束 -->
			<!-- 搜索框 -->
			<div class="header_search">
				<div class="form-search ">
					<input value="请输入商品名称" class="input-text" type="text" />
					<button type="submit" title="Search"></button>
				</div>
			</div>

		</div>

	</div>
</div>

