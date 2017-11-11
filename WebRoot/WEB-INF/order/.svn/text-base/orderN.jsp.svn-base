<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
	$(function() {
		$('#tt').datagrid({
			url:'forder_queryForderByStatus.action',
			//在请求远程数据的时候发送额外的参数。
    		queryParams:{
    				name:"",
    				'status.id':1
    			},
    		/* queryParams:{'status.id':1}, */
			//width:1100,
			height:350,
			loadMsg:'正在加载......',
			remoteSort:false,
			singleSelect:true,
			nowrap:false,
			fitColumns:true,
			//指定id字段为标识字段，在删除，更新的时候有用，如果配置此字段，在翻页的时候被选中的记录不会丢失
    		idField:'id',
			//斑马线
    		striped: true,
    		//自动适应列宽度，防止水平滚动
    		fitColumns:true,
			//显示分页栏
    		pagination:true,
    		//如果为true则只能选择一行
    		singleSelect:false,
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
					var rows=$("#tt").datagrid("getSelections");
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
					var rows=$("#tt").datagrid("getSelections");
					
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
						    	$.post("forder_deleteForderByFId.action",{ids:ids},function(result){
						    		if(result=='true'){
										//删除成功后，取消勾选当前页中的所有行
										$("#tt").datagrid("uncheckAll");
										//刷新当前页面
						    			$("#tt").datagrid("reload");
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
			//同列属性，但是这些列会冻结在左侧
    		/* frozenColumns:[[
    					//设置复选框
    				 {field:'checkbox', checkbox:true},
    				 {field:'id',title:'订单编号',width:100}
    		]], */
    		
			columns:[[
				
				{field:'name',title:'用户名',width:100,sortable:true},
				{field:'remark',title:'备注信息',width:200,align:'right',sortable:true},
				{field:'date',title:'下单时间',width:250,align:'right',sortable:true},
				{field:'total',title:'总价格',width:100,sortable:true},
				{field:'address',title:'地址',width:250,align:'center'},
				{field:'status',title:'状态',width:250,align:'center',
					formatter:function(value,row,index){
		        		if(row.status != null && row.status.status != null){
		        			return row.status.status;
		        		}
		        	}
				}
			]],
			view: detailview,
			
			detailFormatter: function(rowIndex, rowData){
				
				return  '<div style="padding:5px"><table class="ddv"></table></div>';
				
				/* '<table><tr>' +
						'<td rowspan=2 style="border:0"><img src="images/' + rowData.itemid + '.png" style="height:50px;"></td>' +
						'<td style="border:0">' +
						'<p>商品名称: ' + rowData.sorderList[rowIndex].name + '</p>' +
						'<p>商品单价: ' + rowData.sorderList[rowIndex].price + '</p>' +
						'</td>' +
						'</tr></table>'; */
			},
    		onExpandRow:function(index, row){
    				getFItemDetail(index,row); 
    		},
    		
		});
		//把普通的文本框转化为搜索框
		$('#ss').searchbox({ 
			//触发查询事件
			searcher:function(value,nam){ 
				$('#tt').datagrid('load',{name:value});
			},  
			prompt:'输入用户名搜索' 
		});
	});
	function getFItemDetail(index,row){
		var ddv = $("#tt").datagrid('getRowDetail',index).find('table.ddv');
		ddv.datagrid({
			//url:"../financeitem/feeByDocuNo.shtml?documentId="+row.id,
			url:'sorder_querySorderByFId.action',
			
			queryParams:{'forder.id':row.id},
			fitColumns:true,   
			
			 rownumbers:true,
			   loadMsg:'',
			   height:'auto',     
			   columns:[[  
			    {field:'id',title:'商品编号',width:100},
				{field:'name',title:'商品名称',width:100,sortable:true},
				{field:'remark',title:'简单介绍',width:100,sortable:true,
					formatter:function(value,row,index){
		        		if(row.product != null && row.product.remark != null){
		        			return row.product.remark;
		        		}
		        	}
				},
				{field:'price',title:'单价',width:100,align:'right',sortable:true},
				{field:'number',title:'购买数量',width:100,align:'right',sortable:true},
			   ]],
			   
			   onResize:function(){
				    $('#tt').datagrid('fixDetailRowHeight',index);
				   },
				   onLoadSuccess:function(){
				    setTimeout(function(){
				     $('#tt').datagrid('fixDetailRowHeight',index);
				    },0);
				   }
			
		});
		$('#tt').datagrid('fixDetailRowHeight',index);
	};
	</script>
  </head>
  
  <body>
  
    <table id="tt"></table>
  </body>
</html>
