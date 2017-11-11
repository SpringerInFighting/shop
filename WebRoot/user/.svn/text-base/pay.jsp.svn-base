<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@include file="/public/head.jspf"%>
</head>
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
			<div class="pay-skip">
				<h1>感谢您在本商城购物</h1>
				<div class="payskip-inner">
					<div>
						<span>订单号:</span><strong>${requestScope.p2_Order }</strong><span>&#91;请您记住这个号码，以便在付款和查询时使用&#93;</span>
					</div>
					<div>
						<span>支付金额：</span><strong>￥${requestScope.p3_Amt }</strong>
					</div>
					<div>
						<span>支付方式：</span><img class="zffs" src="${shop }/image/yibao.jpg" alt="" />
					</div>
					<div>
						<span>支付银行：</span><img class="zfyh" src="${shop }/image/bank/${requestScope.pd_FrpId}.gif"
							alt="" />
					</div>
					<div class="pay-sub">
						<!-- <a href="">登陆网上银行，立即支付</a> -->
						<form name="yeepay" action='https://www.yeepay.com/app-merchant-proxy/node' method='POST' target="_blank">
							<input type='hidden' name='p0_Cmd'   value='${requestScope.p0_Cmd}'>
							<input type='hidden' name='p1_MerId' value='${requestScope.p1_MerId}'>
							<input type='hidden' name='p2_Order' value='${requestScope.p2_Order}'>
							<input type='hidden' name='p3_Amt'   value='${requestScope.p3_Amt}'>
							<input type='hidden' name='p4_Cur'   value='${requestScope.p4_Cur}'>
							<input type='hidden' name='p5_Pid'   value='${requestScope.p5_Pid}'>
							<input type='hidden' name='p6_Pcat'  value='${requestScope.p6_Pcat}'>
							<input type='hidden' name='p7_Pdesc' value='${requestScope.p7_Pdesc}'>
							<input type='hidden' name='p8_Url'   value='${requestScope.p8_Url}'>
							<input type='hidden' name='p9_SAF'   value='${requestScope.p9_SAF}'>
							<input type='hidden' name='pa_MP'    value='${requestScope.pa_MP}'>
							<input type='hidden' name='pd_FrpId' value='${requestScope.pd_FrpId}'>
							<input type="hidden" name="pr_NeedResponse"  value="${requestScope.pr_NeedResponse}">
							<input type='hidden' name='hmac' value='${requestScope.hmac}'>
							<input type='submit' value="立即支付" style="width: 80px; height: 40px;" >
						</form>
					</div>
				</div>
			</div>




			<%@include file="/public/bottom.jsp" %>
</body>
</html>
