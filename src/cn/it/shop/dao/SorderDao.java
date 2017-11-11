package cn.it.shop.dao;

import java.util.List;

import cn.it.shop.model.Sorder;

public interface SorderDao extends BaseDao<Sorder> {


	//查询热点商品的销量
	public List<Object> querySale(int number);
	
	////根据订单id查找购物项
	public List<Sorder> querySorderByFId(int fid);
}
