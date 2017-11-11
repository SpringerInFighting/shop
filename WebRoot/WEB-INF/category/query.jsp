<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<%@include file="/public/head.jspf" %>
	<style type="text/css">
		.searchbox {
			  margin: -2;
		}
	</style>
	
	<script type="text/javascript">
		$(function(){
			$('#dg').datagrid({    
	    		url:'category_queryJoinAccount.action',
	    		//在请求远程数据的时候发送额外的参数。
	    		queryParams:{type:""},
	    		loadMsg:'正在加载......',
	    		//指定id字段为标识字段，在删除，更新的时候有用，如果配置此字段，在翻页的时候被选中的记录不会丢失
	    		idField:'id',
	    		//width:250,
	    		//斑马线
	    		striped: true,
	    		//显示在同行，默认true
	    		nowrap:true,
	    		//自动适应列宽度，防止水平滚动
	    		fitColumns:true,
	    		//如果为true则只能选择一行
	    		singleSelect:false,
	    		//显示分页栏
	    		pagination:true,
	    		
	    		pageSize:5,
	    		pageList:[5,10,15,20],
	    		toolbar: [{
					iconCls: 'icon-add',
					text:'添加类别',
					handler: function(){					
						parent.$("#win").window({ 
							   title:'添加类别',
							   width:350,
							   height:200,
						    content:'<iframe src="send_category_save.action" frameborder="0" width="100%" height="100%"/>'
						});  
					}
				},'-',{
					iconCls: 'icon-edit',
					text:'更新类别',
					handler: function(){
						var rows=$("#dg").datagrid("getSelections");
						if(rows.length != 1){
							$.messager.show({
								title:'当前没有选择记录！',
								msg:'只能选择一行记录！',
								timeout:2000,
								showType:'slide'
							});
						}else{
							parent.$("#win").window({ 
							   title:'更新类别',
							   width:350,
							   height:200,
						    content:'<iframe src="send_category_update.action" frameborder="0" width="100%" height="100%"/>'
						});  
						}
					}
				},'-',{
					iconCls: 'icon-remove',
					text:'删除类别',
					handler: function(){
						//判断是否有选中的记录
						var rows=$("#dg").datagrid("getSelections");
						//rows 返回所有被选中的行，当没有记录被选中的时候将返回一个空数组。
						if(rows.length==0){
							$.messager.show({
								title:'当前没有选择记录！',
								msg:'请选择一行或多行记录！',
								timeout:2000,
								showType:'slide'
							});
							
						}else{
							$.messager.confirm('确认对话框', '您想要删除该记录吗？', function(r){
								if (r){
							    	// 退出操作;
				
							    	//获取记录的id
							    	var ids="";
							    	for(var i=0; i<rows.length; i++){
							    		ids +=rows[i].id+",";
							    	}
							    	
							    	//拼接ids的值，然后发送后台1,2,3,4
							    	ids = ids.substring(0,ids.lastIndexOf(","));
							    	//发送ajax请求
							    	$.post("category_deleteByIds.action",{ids:ids},function(result){
							    		if(result=='true'){
											//删除成功后，取消勾选当前页中的所有行
											$("#dg").datagrid("uncheckAll");
											//刷新当前页面
							    			$("#dg").datagrid("reload");
							    		}else{
							    			alert("------删除失败------");
							    		}
							    	},"text");
								}
							});	
						}
					}
				
				},'-',{
					text:"<input id='ss' name='search'/>"
				}
				],
	    		
	    		//显示分页位置
	    		//pagePosition:top,
	    		//行样式
	    		/* rowStyler:function(index,row){
	    			if(index%2==0){
	    				return 'background-color:#6223BB;color:#fff;';
	    			}else{
	    				return 'background-color:#6293BB;color:#fff;';
	    			}
	    		}, */
	    		//同列属性，但是这些列会冻结在左侧
	    		frozenColumns:[[
	    					//设置复选框
	    				 {field:'checkbox', checkbox:true},
	    				 {field:'id',title:'编号',width:100}
	    		]],
	    					   
	    		columns:[[     
			        {field:'type',title:'类型名称',width:100,
			        	//格式化当前列的值，返回的是最终的数据
			        	formatter:function(value,row,index){
							return "<span title=" + value +">" + value +"</span>";
						}
			        	
			        },    
			        {field:'hot',title:'热点',width:100,align:'right',
			        	//设置当前单元格的样式，返回的字符串直接交给 style属性
			        	/* styler: function(value,row,index){
							if (value < 20){
								return 'background-color:#fff;color:red;';
							}
						} */
			        	formatter:function(value,row,index){
			        		if(value){
			        			return "<input type='checkbox' value='true' checked='checked' disabled='disabled'/>";
			        		}else{
			        			return "<input type='checkbox' value='true' disabled='disabled' />"
			        		}
			        	}
			        },
			        {field:'account.login',title:'所属管理员',width:100,
			        	formatter:function(value,row,index){
			        		if(row.account != null && row.account.login != null){
			        			return row.account.login;
			        		}
			        	}
			        
			        }    
			    ]]    
			});  
			//把普通的文本框转化为搜索框
			$('#ss').searchbox({ 
				//触发查询事件
				searcher:function(value,name){ 
					$('#dg').datagrid('load',{type:value});
				},  
				prompt:'Please Input Value' 
			}); 
		});
	</script>
  </head>
   
  <body>
  <table id="dg"></table>  
  </body>
</html>
