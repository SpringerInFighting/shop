package cn.it.shop.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.springframework.stereotype.Service;

import cn.it.shop.dao.ProductDao;
import cn.it.shop.model.Product;

@SuppressWarnings("unchecked")
@Service("productDao")
public class ProductDaoImpl extends BaseDaoImpl<Product> implements
		ProductDao {

	@Override
	public List<Product> queryJoinCategory(String name, int page, int size) {
		// TODO Auto-generated method stub
		/*String hql = "from Product p left join fetch p.category where p.name like :name";
		return getSession().createQuery(hql)
				.setString("name", "%"+ name +"%")
				.setFirstResult((page-1)*size)
				.setMaxResults(size)
				.list();*/
		// hql：操作对象是类, 是通过ORM映射文件转化为sql语句的
				String hql = "FROM Product p LEFT JOIN FETCH p.category WHERE p.name LIKE :name";
				Session session = getSession();
				return session.createQuery(hql) //
						.setString("name", "%" + name + "%") //
						.setFirstResult((page - 1) * size)//
						.setMaxResults(size) //
						.list();
	}

	@Override
	public Long getCount(String name) {
		// TODO Auto-generated method stub
		String hql = "select count(p) from Product p where p.name like :name";
		
		return (Long) getSession().createQuery(hql)
				.setString("name", "%" + name + "%")
				.uniqueResult();
	}

	@Override
	public void deleteByIds(String ids) {
		// TODO Auto-generated method stub
		String hql = "delete from Product where id in("+ ids +")";
		getSession().createQuery(hql).executeUpdate();
	}

	@Override
	public List<Product> queryByCid(int cid) {
		// TODO Auto-generated method stub
		String hql = "from Product p join fetch p.category where p.commend=true and p.open=true and p.category.id=:cid order by p.date DESC";
		
		return getSession().createQuery(hql)
				.setInteger("cid", cid)
				.setFirstResult(0)
				.setMaxResults(4)
				.list();
	}

	
}
