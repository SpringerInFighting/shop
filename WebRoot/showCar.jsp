<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<%@include file="/public/head.jspf"%>
	<link rel="stylesheet" href="${shop}/css/public.css" />
	<link rel="stylesheet" href="${shop}/css/style.css" />
	
	<link rel="stylesheet" type="text/css" href="css/mbox.css"/>  <!--背景样式 弹框样式-->  
    <script type="text/javascript" src="js/jquery-1.10.2.min.js" ></script><!--jquery库-->  
    <script type="text/javascript" src="js/jm-qi.js" ></script><!--自定义弹框大小，提示信息，样式，icon。。。。-->  
	<script type="text/javascript">
		function deleteSorder(sorderProductId){

			$.mbox({  
                area: [ "350px", "auto" ], //弹框大小  
                border: [ 0, .5, "#666" ],  
                dialog: {  
                    msg: "是否删除！！！",  
                    btns: 2,   //1: 只有一个按钮   2：两个按钮  3：没有按钮 提示框  
                    type: 2,   //1:对钩   2：问号  3：叹号    
                    btn: [ "不要了", "留着"],  //自定义按钮  
                    yes: function() {  //点击左侧按钮：成功   
                       
                        		$.post('sorder_deleteSorderById.action',{'product.id':sorderProductId},function(isOk){
                					/* alert(isOk); */
                					parent.location.reload();
                				},"text");
                       
                    },  
                    no: function() { //点击右侧按钮：失败  
                        return false;  
                    }  
                }
            });
		}
		function deleteForder(){
			$.mbox({  
                area: [ "350px", "auto" ], //弹框大小  
                border: [ 0, .5, "#666" ],  
                dialog: {  
                    msg: "是否清除购物车！！！",  
                    btns: 2,   //1: 只有一个按钮   2：两个按钮  3：没有按钮 提示框  
                    type: 2,   //1:对钩   2：问号  3：叹号    
                    btn: [ "清除", "留着"],  //自定义按钮  
                    yes: function() {  //点击左侧按钮：成功   
                       
                        		$.post('forder_deleteForder.action',function(isOk){
                					/* alert(isOk); */
                					parent.location.reload();
                				},"text");
                       
                    },  
                    no: function() { //点击右侧按钮：失败  
                        return false;  
                    }  
                }
            });
		}
		$(function(){
			// id选择器只能选中第一个
			$(".text").change(function(){
				// 1: 验证数据的有效性
				var number = this.value;// $(this).val();
				if(!isNaN(number) && parseInt(number)==number && number>0){
					//更新合法数据的值
					$(this).attr("lang",number);
					
					// 获取当前商品的id编号
					var pid = $(this).parents("tr:first").attr("lang");
					// 发送ajax请求,如果get请求会先到浏览器缓存, 返回新的总价格
					$.post('sorder_alterSorder.action',{'product.id':pid,number:number},function(jsonMap){
					
						$("#totalPrice").html('￥' + jsonMap.totalPrice);
						$("#totalProduct").html(jsonMap.totalProduct);
						$("#total").html('￥'+jsonMap.totalPrice);
						$("#littleTotal").html('￥'+jsonMap.totalPrice);
						
						
					},"json");
					//更新单个商品的小计
					$(this).parent().next().html(($(this).parent().prev().html()*number).toFixed(2));
				}else{
				// 重置原来的数据
					this.value=$(this).attr("lang");
				}
			});
		});
	</script>
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
			<div id="shopping_cart">
				<div class="message success">我的购物车</div>
				<span id="tableForder">
				<table class="data-table cart-table" cellpadding="0" cellspacing="0">
					<tr>
						<th class="align_center" width="10%">商品编号</th>
						<th class="align_left" width="35%" colspan="2">商品名称</th>
						<th class="align_center" width="10%">销售价格</th>
						<th class="align_center" width="20%">数量</th>
						<th class="align_center" width="15%">小计</th>
						<th class="align_center" width="10%">删除</th>
					</tr>
					
					<c:forEach items="${sessionScope.forder.sorderList }" var="sorder">
					
						<tr lang="${sorder.product.id }">
							<td class="align_center"><a href="#" class="edit">${sorder.product.id }</a>
							</td>
							<td width="80px"><img src="${shop }/image/${sorder.product.pic }" width="80"
								height="80" />
							</td>
								<td class="align_left"><a class="pr_name" href="#">${sorder.name }</a>
							</td>
							<td class="align_center vline">
								${sorder.product.price }
							</td>
							<td class="align_center vline">
								
									<input class="text" style="height: 20px;" value="${sorder.number }" lang="${sorder.number }">		
								
							</td>
							<td class="align_center vline">
								${sorder.price * sorder.number }
							</td>
							<td class="align_center vline"><a href="#" class="remove" onclick="deleteSorder(${sorder.product.id})"></a>
							</td>
						</tr>
					
					</c:forEach>
				
				</table>
				<!-- 结算 -->
				<div class="totals">
					<table id="totals-table">
						<tbody>
							<tr>
								<td width="60%" colspan="1" class="align_left"><strong>小计</strong>
								</td>
								<td class="align_right" style="">
								<strong id="littleTotal">￥${sessionScope.forder.total }
								</strong>
								</td>
							</tr>
							<tr>
								<td width="60%" colspan="1" class="align_left">运费</td>
								<td class="align_right" style=""><span class="price">￥0.00</span>
								</td>
							</tr>
							<tr>
								<td width="60%" colspan="1" class="align_left total"><strong>总计</strong>
								</td>
								<td class="align_right" style=""><span class="total"><strong id="total">￥${sessionScope.forder.total }</strong>
								</span>
								</td>
							</tr>
						</tbody>
					</table>
				
			</span>
					<div class="action_buttonbar">
						<button type="button" title="" class="checkout fr"
							style="background-color: #f38256;">
							<font><font><a href="${shop}/user/confirm.jsp">结帐</a></font></font>
						</button>
						<button type="button" title="" class=" fr" onclick="deleteForder()">
							<font><font>清空购物车</font>
							</font>
						</button>
						<button type="button" title="" class="continue fr" >
							<font><font><a href="${shop}/index.jsp">继续购物</a></font>
							</font>
						</button>
						<div style="clear:both"></div>
					</div>
				</div>
			</div>
			<!-- 导航栏结束 -->
			<%@include file="/public/bottom.jsp" %>
		</div>
</body>
</html>
