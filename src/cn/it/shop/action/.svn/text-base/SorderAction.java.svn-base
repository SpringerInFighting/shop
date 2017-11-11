package cn.it.shop.action;

import java.io.ByteArrayInputStream;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONSerializer;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import cn.it.shop.model.Forder;
import cn.it.shop.model.Product;
import cn.it.shop.model.Sorder;
@SuppressWarnings("unchecked")
@Controller
@Scope("prototype")
public class SorderAction extends BaseAction<Sorder> {

	private int totalProduct;
	private String totalPrice;

	private void addProductSorder(){
		// 通过 product.id获取当前的商品信息
				System.out.println(model.getProduct().getId());
				Product product = productService.get(model.getProduct().getId());
				// 从session中获取购物车
				Forder forder = (Forder)session.get("forder");
				// 添加购物项到购物车中,且判断重复
				forder = sorderService.addSorder(forder, product);
				// 根据商品编号更新从购物车传来的商品数量
				if(model.getNumber() != null){
					forder = sorderService.alterSorder(forder, model);
					System.out.println("根据商品编号更新从购物车传来的商品数量");
					System.out.println(model.getNumber());
				}
				//计算总价格
				forder.setTotal(forderService.total(forder));
				//获得总价格和中商品量，放入session
				totalProduct = forderService.queryProductTotal(forder);
				System.out.println("totalProduct:"+totalProduct);
				totalPrice = forder.getTotal().toString();
				System.out.println(totalProduct + "|" + totalPrice);
				session.put("totalProduct", totalProduct);
				session.put("totalPrice",totalPrice);
				// 吧购物车重新放到session中
				session.put("forder", forder);
	}
	// 把商品添加到购物车
	public String addSorder(){
		addProductSorder();
		return "showCar";
	}
	
	// 在首页点 添加到购物车 后通过ajax更新首页的购物车图标的数量
	public String addIndexSorder(){
		
		addProductSorder();
		//把计算的总价格和商品中数量放入pageMap里转json	
		pageMap = new HashMap<String,Object>();
		pageMap.put("totalProduct", totalProduct);
		pageMap.put("totalPrice", totalPrice);
		return "jsonMap";
	}
		
	//更新商品的总数量和总金额
	public String alterSorder(){

		/*// 从session中获取购物车
		Forder forder = (Forder) session.get("forder");
		// 根据商品编号更新商品数量
		sorderService.alterSorder(forder, model);
		//计算新的总价格
		forder.setTotal(forderService.total(forder));*/
		// 通过流的方式返回新的总价格
		//inputStream = new ByteArrayInputStream(forder.getTotal().toString().getBytes());
		addProductSorder();
		inputStream = new ByteArrayInputStream(totalPrice.getBytes());
		//修改后将forder重新放进session
		//session.put("forder", forder);
		pageMap = new HashMap<String,Object>();
		pageMap.put("totalProduct", totalProduct);
		pageMap.put("totalPrice", totalPrice);
		return "jsonMap";
	}
	
	public String querySale(){
		
		int number = model.getNumber();
		List<Object> jsonList = sorderService.querySale(number);
		ActionContext.getContext().getValueStack().push(jsonList);
		return "jsonList";
	}
	//根据id删除购物车中的购物项
	public String deleteSorderById(){
		Forder forder = (Forder) session.get("forder");
		forder = sorderService.deleteSorderById(forder, model);
		
		forder.setTotal(forderService.total(forder));
		String totalPrice = forder.getTotal().toString();
		int totalProduct = forderService.queryProductTotal(forder);
		session.put("totalProduct", totalProduct);
		session.put("totalPrice", totalPrice);
		inputStream = new ByteArrayInputStream("true".getBytes());
		return "stream";
	}
	
	//根据订单id查找购物项
	public String querySorderByFId(){
		pageMap = new HashedMap();
		System.out.println(model.getForder().getId());
		List<Sorder> sorderList = sorderService.querySorderByFId(model.getForder().getId());
		
		pageMap.put("rows", sorderList);
		
		return "jsonMap";
	}
}
