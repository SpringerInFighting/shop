<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<%@include file="/public/head.jspf" %>
	<style type="text/css">
		form div{
			margin: 5px;
		}
	</style>
	
	<script type="text/javascript">
		$(function(){
			//远程获取类别管理员下拉列表
			$('#cc').combobox({    
			    url:'account_query.action',    
			    valueField:'id',    
			    textField:'login',
			    panelHeight:'auto',
			    panelWidth:120,
			    width:120,
			    editable:false   
			});  
			
			$("input[name=type]").validatebox({
				required:true,
				missingMessage:'请输入类别名称',
			});
			/* $("#cc").validatebox({
				required:true,
				missingMessage:'请选择管理员',
			}); */
			//窗体弹出默认时禁用验证
			$("#ff").form("disableValidation");
			//注册button事件
			$("#btn").click(function(){
				//开启验证
				$("#ff").form("enableValidation");
				//如果验证成功，则提交数据
				if($("#ff").form("validate")){
					//提交数据
					$('#ff').form('submit', {
						url: 'category_save.action',
						success: function(){
							//关闭当前窗口
							parent.$("#win").window("close");
							//刷新页面 先获取aindex---->iframe---->dg     dom--->jquery--->easyui
							//这样可能有兼容问题
							//var rows = parent.$("iframe[title='类别管理']").contents().find("#dg").datagrid("getSelections");
							parent.$("iframe[title='类别管理']").get(0).contentWindow.$("#dg").datagrid("reload");
						}
					});
					
				}
			});
		});
	</script>
  </head>
   
  <body>
 	<form id="ff" method="post">   
	    <div>   
	        <label for="type">类型名称:</label>   
	        <input type="text" name="type" />   
	    </div>   
	    <div>   
	        <label for="hot">热点:</label>   
	        热点：<input type="radio" name="hot" value="true"/>
	       非热点： <input type="radio" name="hot" value="false" checked="checked"/>
	    </div>
	    <div>
	    	<label for="account">所属管理员：</label>
	    	
	    	<input id="cc" name="account.id"/>  

	    </div>      
    	<div>
    		<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加类别</a> 
    	</div>
	</form>  

  
  </body>
</html>
