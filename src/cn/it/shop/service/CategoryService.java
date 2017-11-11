package cn.it.shop.service;

import java.util.List;

import cn.it.shop.model.Category;

public interface CategoryService extends BaseService<Category> {
	
	public List<Category> queryJoinAccount(String type, int page, int size);
	//根据关键字查询总记录数
	public Long getCount(String type);
	//根据ids删除记录
	public void deleteByIds(String ids);
	//根据类别热点获取类别id
	public List<Category> queryByHot(boolean hot);
}
