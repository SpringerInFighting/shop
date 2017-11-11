package cn.it.shop.service;

import java.util.List;

import cn.it.shop.model.Forder;
import cn.it.shop.model.Product;
import cn.it.shop.model.Sorder;

public interface SorderService extends BaseService<Sorder> {

	// 添加购物项, 并且判断重复
	public Forder addSorder(Forder forder, Product product);
	// 根据商品编号更新商品数量
	public Forder alterSorder(Forder forder, Sorder sorder);
	//查询热点商品的销量
	public List<Object> querySale(int number);
	//删除购物车里的指定购物项
	public Forder deleteSorderById(Forder forder, Sorder sorder);
	//根据订单id查找购物项
	public List<Sorder> querySorderByFId(int fid);
}
