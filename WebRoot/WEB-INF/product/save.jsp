<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<!-- 引入公共的JSP片段 -->
	<%@ include file="/public/head.jspf"%>
	<style type="text/css">
		form div{
			margin: 10px;
		}
	</style>
	
	<script type="text/javascript">
		$(function(){
			//自定义验证方法向validatebox.defaults.rules中注册新函数
			$.extend($.fn.validatebox.defaults.rules, {
				//函数的名称：函数的实现体（又是一个json对象，里面包括函数的实现，和错误消息设置）    
			    format: { 
			    	//函数实现，如果返回为false，则验证失败   
			        validator: function(value,param){
			            
			            var ext=value.substring(value.lastIndexOf(".")+1);
			            var arr=param[0].split(",");
			            
			            for(var i=0; i<arr.length; i++){
			            	if(ext==arr[i]){
			            		return true;
			            	}
			            }
			            return false;    
			        },
			        //错误消息    
			        message: '文件必须为：{0}'   
			    }    
			});  
			
			//远程加载类别名称下拉框
			$('#cc').combobox({    
			    url:'category_query.action',    
			    valueField:'id',    
			    textField:'type',
			    panelHeight:'auto',
			    panelWidth:120,
			    width:120,
			    editable:false,
			    required:true,
			    missingMessage:'请选择所属类别'
			}); 
			
			$("input[name=name]").validatebox({
				required:true,
				missingMessage:'请输入商品名称'
			});
			
			$("input[name=price]").numberbox({
				required:true,
				missingMessage:'请输入商品价格',
				min:0,
				precision:2,
				prefix:'￥'
			});
			
			$("input[name='fileImage.upload']").validatebox({
				validType:"format['gif,jpg,jpeg,png']"
			});
			//当文件域的内容发生变化时，则调用验证方法（默认是单击提交时调用验证）
			$("input[name='fileImage.upload']").change(function(){
				//验证文本框的内容是否有效
				$(this).validatebox("validate");
			});
			
			$("textarea[name=remark]").validatebox({
				required:true,
				missingMessage:'请简单描述!'
			});
			
			$("textarea[name=xremark]").validatebox({
				required:true,
				missingMessage:'请详细描述!'
			});
			//默认关闭验证
			$("#ff").form("disableValidation");
			//注册button的事件
			$("#submit").click(function(){
				//开启验证
				$('#ff').form("enableValidation");
				//做表单字段验证，当所有字段都有效的时候返回true。该方法使用validatebox(验证框)插件。
				if($('#ff').form("validate")){
					
					$('#ff').form('submit', {
						url: 'product_save.action',
						
						success: function(){
							parent.$("#win").window("close");
							parent.$("iframe[title='商品管理']").get(0).contentWindow.$("#dg").datagrid("reload");
						}
					});
				}
				
			});
			
			$("#reset").click(function(){
				//重置当前表单数据
				$("#ff").form("reset");
			});
			
		})
	</script>
</head>

<body>
<form title="添加商品" id="ff" method="post" enctype="multipart/form-data">
	<div>
		<label>商品名称:</label> <input type="text" name="name" />
	</div>
	<div>
		<label>商品价格:</label> <input type="text" name="price" />
	</div>
	<div>
		<label>图片上传:</label> <input type="file" name="fileImage.upload" />
	</div>
	<div>
		<label>所属类别：</label> 
		<input id="cc" name="category.id">  

	</div>
	<div>
		<label>加入推荐:</label> 推荐:<input type="radio" name="commend"
			checked="checked" value="true" />  不推荐:<input type="radio"
			name="commend" value="false" /> 
	</div>
	<div>
		<label>是否有效:</label>
		上架:<input type="radio" name="open" checked="checked"value="true" />
		下架:<input type="radio" name="open" value="false" />
				
	</div>
	<div>
		<label>简单描述:</label>
		<textarea name="remark" cols="40" rows="4"></textarea>
	</div>
	<div>
		<label>详细描述:</label>
		<textarea name="xremark" cols="40" rows="8"></textarea>
	</div>
	<div>
		<a id="submit" href="#" class="easyui-linkbutton">添 加</a> 
		<a id="reset" href="#" class="easyui-linkbutton">重 置</a>
	</div>
</form>
</body>
</html>
