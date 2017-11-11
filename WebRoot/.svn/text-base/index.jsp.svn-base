<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <%@ include file="/public/head.jspf" %>
    
    <script type="text/javascript">
    	function addProduct(id){
    		
    		$(function(){
    			/* alert(id); */
    			$.post('sorder_addIndexSorder.action',{'product.id':id},function(jsonMap){

    				$("#totalPrice").html('￥'+jsonMap.totalPrice);
    				$("#totalProduct").html(jsonMap.totalProduct);
    				
    			},"json");
    		});
    	}
    </script>
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
                <li class="active highlight"><a href="#">女装</a>
                    <!--二级菜单-->
                    <ul class="sub_menu">
                        <li > <a href="#">裙装</a>
                            <ul>
                                <li><a href="#">短裙</a></li>
                                <li><a href="#">短裤 </a></li>
                                <li><a href="#">裤子</a></li>
                                <li><a href="#">卡其裤</a></li>
                                <li><a href="#">休闲裤</a></li>
                                <li><a href="#">牛仔裤</a></li>
                                <li><a href="#">风衣 & 运动夹克</a></li>
                            </ul>
                        </li>
                        <li> <a href="#">装饰品 </a>
                            <ul>
                                <li><a href="#"> 太阳镜</a></li>
                                <li><a href="#">围巾 </a></li>
                                <li><a href="#">发饰品 </a></li>
                                <li><a href="#">帽子和手套 </a></li>
                                <li><a href="#">生活时尚 </a></li>
                                <li><a href="#">牛仔系列 </a></li>
                                <li><a href="#">风衣 & 西服</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                    <!--二级菜单结束-->
                
                <li><a href="#">男装</a>
                    <!--二级菜单-->
                    <ul class="sub_menu">
                        <li> <a href="#">男士夏装</a>
                            <ul>
                                <li><a href="#">裤子</a></li>
                                <li><a href="#">休闲裤</a></li>
                                <li><a href="#">卡其裤</a></li>
                                <li><a href="#">牛仔裤</a></li>
                                <li><a href="#">风衣 & 运动夹克</a></li>
                            </ul>
                        </li>
                         <li> <a href="#">装饰品 </a>
                            <ul>
                                <li><a href="#"> 太阳镜</a></li>
                                <li><a href="#">围巾 </a></li>
                                <li><a href="#">发饰品 </a></li>
                                <li><a href="#">帽子和手套 </a></li>
                                <li><a href="#">生活时尚 </a></li>
                                <li><a href="#">牛仔系列 </a></li>
                                <li><a href="#">风衣 & 西服</a></li>
                            </ul>
                        </li>
                    </ul>
                    <!--二级菜单结束-->
                </li>
                <li><a href="#">儿童</a></li>
                <li><a href="#">时尚</a></li>
                <li><a href="#">装饰品 </a></li>
            </ul>
        </div>
        </div>
        <!--导航栏结束-->

        
        <div class="section_container">
            <!--左侧导航-->
            <div id="side_nav">
                <div class="sideNavCategories">
                    <h1>女装</h1>
                    <ul class="category departments">
                        <li class="header">分类</li>
                        <li><a href="#">毛衣</a></li>
                        <li><a href="#">针织衫 </a></li>
                        <li><a href="#">衬衫 </a></li>
                        <li><a href="#">T恤</a></li>
                        <li><a href="#">短裤</a></li>
                        <li><a href="#">牛仔 </a></li>
                        <li><a href="#">连身裙</a></li>
                        <li><a href="#">短裙 </a></li>
                    </ul>
                </div>
                
            </div>
            <!-- 右侧焦点图区域 -->
            <div id="main_content ">
                <div > <img src="images/lm_banner_1.jpg" /> </div>
            </div>
        </div>

            <!-- 产品列表 -->
            <!-- 大循环开始 -->
            <c:forEach var="productList" items="${applicationScope.bigList }">
            <div class="products_list products_slider clear">
            	<!-- 显示当前商品所属类别 -->
            	
                <h2 class="sub_title">${productList[0].category.type }</h2>
                <ul id="first-carousel" class="first-and-second-carousel jcarousel-skin-tango">
                    <!-- 小循环开始 -->
                    <c:forEach var="product" items="${productList }">
	                    <li> <a  href="${shop }/product_get.action?id=${product.id}"class="product_image"><img src="${shop }/image/${product.pic }" /></a>
	                        <div class="product_info">
	                            <h3><a href="#">${product.name }</a></h3>
	                            <small>${product.remark }</small> 
	                        </div>
	                        <div class="price_info"> 
	                            <button onclick="addProduct(${product.id})"><span class="pr_add">添加购物车</span></button>
	                            <button class="price_add" title="" type="button">
	                            	<span class="pr_price">￥${product.price }</span>
	                            </button>
	                        </div>
	                    </li>
	                   <!-- 小循环结束 -->
                    </c:forEach>
              	</ul>
            </div>
            <!-- 大循环结束 -->
            </c:forEach>
        <!--产品列表结束  -->
        <!-- 导航栏结束 -->
	<%@include file="/public/bottom.jsp" %>
    </div>
  </body>
</html>
 