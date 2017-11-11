<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<%@include file="/public/head.jspf"%>
	<link rel="stylesheet" href="${shop}/css/register.css" type="text/css"></link>
	<script type="text/javascript" src="${shop }/js/jquery-1.3.js"></script>
	<script type="text/javascript" src="${shop }/js/jquery.validate.js"></script>
	
	<script type="text/javascript">
	function upValidationCode(){
		$("#validationImage").attr("src","${shop }/validationCodeAction.action?flag="+Math.random());//不加+Math.random()只有第一次点击有效果
	};
		$(function(){
			
			$("#submitBtn").click(function(){
				var obj = $(this);
				var code = $('input[name="validationCode"]').val();
				$.post('user_checkcode.action',{validationCode:code},function(isOk){
					if(isOk == 'true'){
						
						obj.parents('form').submit(); //验证码正确提交表单
					}else{
						$("#upclick").click();
						$("#point").html("验证码错误");
					};
				});
			});
			//验证码
			/* $("#validationCode").change(function(){
				alert(this.value);
				
			}); */
			$.validator.addMethod("phone", function(value,element,param) { 
				  var exp=new RegExp(/^1[358]\d{9}$/);//正则表达式
				  return exp.test(value);
			},"手机号码不正确");
			
			
			
			$("form").validate({
				debug:false,
				errorElement:"label",
				success:'valid',//成功后的样式
				errorPlacement:function(error,element){
					$(element).next().html(error);
				},
				
				/* success:function(label){  // label为存储错误消息的容器
					$(label).html("　");
					$(label).attr("class", "success"); //会把以前的样式移除掉
					//$(label).addClass("success");    //追加样式
					//alert($(label).attr("class"));   //查看目前的样式,多个用空格隔开
				}, */
				
				
				rules:{
					login:{
						required:true,
						rangelength:[3,6],
						remote:{
							url:'user_repeatLogin.action',
							type:'post'
						}
					},
					name:{
						required:true,
					},
					pass:{
						required:true,
						rangelength:[6,12]
					},
					pass2:{
						equalTo:'#pass'
					},
					phone:{
						required:true,
						phone:true
					},
					email:{
						required:true,
						email:true
					},
					
				},
				messages:{
					
					login:{
				    	required:"用户名不能为空",
				    	rangelength:$.format("用户名必须在 {0}~{1}位之间"),
				    	remote:"该昵称已被注册"
				    },
				    name:{
				    	required:"用户名不能为空"
				    },
				    pass:{
				    	required:"密码不能为空",
				    	rangelength:$.format("密码必须在 {0}~{1}位之间")
				    },
				    pass2:{
				    	equalTo:"两次输入的密码不相同"
				    }, 
				    phone:{
				    	required:"电话号码不能为空",
				    	phone:"输入号码的格式错误"
				    },
				    email:{
				      required:"E-mail 不能为空",        
				      email:"E-mail 地址不正确"
				    }
				    
				         
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
									<li><a href="#">短裙</a>
									</li>
									<li><a href="#">短裤</a>
									</li>
									<li><a href="#">裤子</a>
									</li>
									<li><a href="#">卡其裤</a>
									</li>
									<li><a href="#">休闲裤</a>
									</li>
									<li><a href="#">牛仔裤</a>
									</li>
									<li><a href="#">风衣 & 运动夹克</a>
									</li>
								</ul>
							</li>
							<li><a href="#">装饰品</a>
								<ul>
									<li><a href="#">太阳镜</a>
									</li>
									<li><a href="#">围巾</a>
									</li>
									<li><a href="#">发饰品</a>
									</li>
									<li><a href="#">帽子和手套</a>
									</li>
									<li><a href="#">生活时尚</a>
									</li>
									<li><a href="#">牛仔系列</a>
									</li>
									<li><a href="#">风衣 & 西服</a>
									</li>
								</ul>
							</li>
						</ul>
					</li>
					<!--二级菜单结束-->
					<li><a href="#">男装</a> <!--二级菜单-->
						<ul class="sub_menu">
							<li><a href="#">男士夏装</a>
								<ul>
									<li><a href="#">裤子</a>
									</li>
									<li><a href="#">休闲裤</a>
									</li>
									<li><a href="#">卡其裤</a>
									</li>
									<li><a href="#">牛仔裤</a>
									</li>
									<li><a href="#">风衣 & 运动夹克</a>
									</li>
								</ul>
							</li>
							<li><a href="#">装饰品</a>
								<ul>
									<li><a href="#">太阳镜</a>
									</li>
									<li><a href="#">围巾</a>
									</li>
									<li><a href="#">发饰品</a>
									</li>
									<li><a href="#">帽子和手套</a>
									</li>
									<li><a href="#">生活时尚</a>
									</li>
									<li><a href="#">牛仔系列</a>
									</li>
									<li><a href="#">风衣 & 西服</a>
									</li>
								</ul>
							</li>
						</ul> <!--二级菜单结束-->
					</li>
					<li><a href="#">儿童</a>
					</li>
					<li><a href="#">时尚</a>
					</li>
					<li><a href="#">装饰品</a>
					</li>
				</ul>
			</div>
		</div>
		<!--导航栏结束-->
		<div class="section_container">
			<!-- 用户注册页面 -->
			<div id="register">
			<!-- style="display:inline-block; *display:inline; *zoom:1; text-align: left;" -->
				<div id="bg" >
					<form action="${shop }/user_register.action" method="post" id="ff" >
						<div>
							<span>用户昵称：</span>
							<input type="text" name="login" />
							<span>用户名要在3~6位之间</span>
						</div>
						<div>
							<span> 用户姓名： </span> 
							<input type="text" name="name" />
							<span>请填写真正的姓名，方便送货</span>
						</div>
						<div>
							<span> 性别： </span> 
							<input type="radio" name="sex" value="男" checked="checked" style="width: 65"/>男
							<input type="radio" name="sex" value="女" style="width: 65"/>女
							<!-- <span>请填写真正的姓名，方便送货</span> -->
						</div>
						<div>
							<span> 用户密码： </span> 
							<input type="password" name="pass" id="pass"/> 
							<span>密码长度 6 ~ 16 位之间</span>
						</div>
						<div>
							<span> 确认密码： </span> 
							<input type="password" name="pass2" /> 
							<span>重复输入以上的密码</span>
						</div>
						<div>
							<span> 通讯电话： </span> 
							<input type="text" name="phone" /> 
							<span>请填写手机号码</span>
						</div>
						<div>
							<span> 电子邮件： </span> 
							<input type="text" name="email" /> 
							<span>请填写正确的电子邮箱地址</span>
						</div>
						<div>
							<span> 验证码：&nbsp;&nbsp;&nbsp; </span> 
							<input type="text" name="validationCode" id="validationCode"/> 
							<span><a id="upclick" onclick="upValidationCode()"><img src="${shop }/validationCodeAction.action" id="validationImage"/></a></span><br>
							<font color="red"><span id="point" style="margin-left: 78px" >&nbsp;</span></font>
						</div>
						<div style="padding-left: 60px;">
							<!-- <input id="submitBtn" type="submit" value="注册" style="width:60px;height:30px" /> -->
							<input type="button" id="submitBtn" value="注册" style="width:60px;height:30px" >
							&nbsp;&nbsp;
							<input type="reset" value="重置" style="width:60px;height:30px" />
						</div>
						<s:debug/>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 导航栏结束 -->
	<%@include file="/public/bottom.jsp" %>
</body>
</html>
