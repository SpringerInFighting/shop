package cn.it.shop.dao;

import java.math.BigDecimal;
import java.util.List;

import cn.it.shop.model.Forder;
import cn.it.shop.model.Status;

public interface ForderDao extends BaseDao<Forder> {

		//更新订单状态
		public void UpdateStatusById(int id, int sid);
		//获取所有未支付订单
		public List<Forder> queryArreForder(String name, int page, int size, int status);
		//根据关键字查询总记录数
		public Long getCount(String name, int status);
		//根据订单编号删除订单
		public void deleteForderByFId(String fid);
}
