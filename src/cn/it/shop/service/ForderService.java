package cn.it.shop.service;

import java.math.BigDecimal;
import java.util.List;

import cn.it.shop.model.Forder;
import cn.it.shop.model.Status;

public interface ForderService extends BaseService<Forder> {

	// 计算购物车总价格
	public BigDecimal total(Forder forder);

	// 更新订单状态
	public void UpdateStatusById(int id, int sid);

	// 计算购物车里一共有多少个商品
	public int queryProductTotal(Forder forder);
	
	//获取未支付的订单
	public List<Forder> queryArreForder(String name, int page, int size, int status);
	
	//根据关键字查询总记录数
	public Long getCount(String name, int status);
	
	//根据订单编号删除订单
	public void deleteForderByFId(String fid);
}
