package cn.it.shop.action;

import java.io.ByteArrayInputStream;
import java.util.HashMap;
import java.util.List;

import net.sf.json.JSONSerializer;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.it.shop.model.Forder;
import cn.it.shop.model.Product;
import cn.it.shop.model.Status;
import cn.it.shop.model.User;

@Controller
@Scope("prototype")
public class ForderAction extends BaseAction<Forder> {

	
	@Override
	public Forder getModel() {
		// TODO Auto-generated method stub
		if(session.get("forder") != null){
			
			model = (Forder) session.get("forder");
		}else{
			model = new Forder();
		}
		return model;
	}

	// 实现购物车与购物项的级联入库
	public String save(){
		// 客户填写的配送信息存储到当前的model中, 但是购物项存储到session的forder中
		Forder forder = (Forder) session.get("forder");
		// 购物车的订单信息,与购物项 级联入库
		model.setSorderList(forder.getSorderList());
		model.setUser((User)session.get("user"));
		model.setStatus(new Status(1));//不知道为什么一定要传参数1
		// 在添加购物项的时候就要关联购物车, SorderServiceImpl.addSorder
		forderService.save(model);
		session.put("oldForder", forder);
		//此时的购物车已入库，那么原来的购物车就应该清空
		session.put("forder", new Forder());
		
		session.put("totalProduct", "0");
		session.put("totalPrice", "0.00");
		return "bank";
	}
	
	public String deleteForder(){
		
		session.remove("forder");
		session.remove("totalPrice");
		session.remove("totalProduct");
		inputStream = new ByteArrayInputStream("true".getBytes());
		return "stream";
	}
	//根据订单状态和用户名获取订单信息
	public String queryForderByStatus(){
		System.out.println("name:"+model.getName());
		System.out.println("status:"+model.getStatus().getId());
		System.out.println("page:"+page);
		System.out.println("rows:"+rows);
		//用来存储分页数据
		pageMap = new HashMap<String,Object>();
		//根据关键字和分页的参数查询相应的数据
		List<Forder> forderList = forderService.queryArreForder(model.getName(), page, rows, model.getStatus().getId());
		
		pageMap.put("rows", forderList);
		//根据关键字查询总记录数
		Long total = forderService.getCount(model.getName(), model.getStatus().getId());
		System.out.println(total);
		pageMap.put("total", total);
		return "jsonMap";
	}
	//根据订单编号删除订单
	public String deleteForderByFId(){
		forderService.deleteForderByFId(ids);
		inputStream = new ByteArrayInputStream("true".getBytes());
		return "stream";
	}

}
