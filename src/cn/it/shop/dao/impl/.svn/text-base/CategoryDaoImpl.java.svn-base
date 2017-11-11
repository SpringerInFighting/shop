package cn.it.shop.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Service;

import cn.it.shop.dao.CategoryDao;
import cn.it.shop.model.Category;
import cn.it.shop.service.CategoryService;
import cn.it.shop.util.HibernateSessionFactory;


/*
 * 模块自身的业务逻辑
 */
@SuppressWarnings("unchecked")
@Service("categoryDao")
public class CategoryDaoImpl extends BaseDaoImpl<Category> implements CategoryDao {

	@Override
	public List<Category> queryJoinAccount(String type, int page, int size) {
		// TODO Auto-generated method stub
		String hql = "from Category c left join fetch c.account where c.type like :type";
		return getSession().createQuery(hql)
								.setString("type", "%"+type+"%")
								.setFirstResult((page-1)*size)
								.setMaxResults(size)
								.list();	
	}

	@Override
	public Long getCount(String type) {
		// TODO Auto-generated method stub
		String hql = "select count(c)  from Category c where c.type like :type";
		
		return (Long) getSession().createQuery(hql).setString("type", "%"+type+"%").uniqueResult();
	}

	@Override
	public void deleteByIds(String ids) {
		// TODO Auto-generated method stub
		String hql = "delete from Category where id in("+ ids +")";
		getSession().createQuery(hql).executeUpdate();
	}

	@Override
	public List<Category> queryByHot(boolean hot) {
		// TODO Auto-generated method stub
		String hql = "from Category c where c.hot=:hot";
		
					
		return getSession().createQuery(hql).setBoolean("hot", hot).list();
	}
	
}
