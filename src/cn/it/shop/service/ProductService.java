package cn.it.shop.service;

import java.util.List;

import cn.it.shop.model.Category;
import cn.it.shop.model.Product;
import cn.it.shop.service.impl.BaseServiceImpl;

public interface ProductService extends BaseService<Product>{

	public List<Product> queryJoinCategory(String name, int page, int size);
	
	//根据关键字查询总记录数
	public Long getCount(String name);
	//根据ids删除记录
	public void deleteByIds(String ids);
	//// 根据热点类别编号,查询当前类别的推荐商品
	public List<Product> queryByCid(int cid);
}
