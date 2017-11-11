<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<%@include file="/public/head.jspf" %>
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
			title:'DataGrid - DetailView',
			width:800,
			height:250,
			loadMsg:'正在加载......',
			remoteSort:false,
			singleSelect:true,
			nowrap:false,
			fitColumns:true,
			//显示分页栏
    		pagination:true,
    		
    		pageSize:5,
    		pageList:[5,10,15,20],
    		
			columns:[[
				{field:'id',title:'订单编号',width:100},
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
				{field:'price',title:'单价',width:200,align:'right',sortable:true},
				{field:'number',title:'购买数量',width:250,align:'right',sortable:true},
			   ]],
			   
			   onResize:function(){
				    $('#datagrid').datagrid('fixDetailRowHeight',index);
				   },
				   onLoadSuccess:function(){
				    setTimeout(function(){
				     $('#datagrid').datagrid('fixDetailRowHeight',index);
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
