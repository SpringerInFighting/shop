package cn.it.shop.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.annotations.Source;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import cn.it.shop.dao.BaseDao;
import cn.it.shop.model.Category;
import cn.it.shop.service.BaseService;

/*
 * 公共模块的抽取
 */
@SuppressWarnings("unchecked")
@Service
@Lazy(value=true)
public class BaseDaoImpl<T> implements BaseDao<T> {

	
	private Class clazz;
	private Session session;
	public BaseDaoImpl(){
		ParameterizedType  type = (ParameterizedType) this.getClass().getGenericSuperclass();
		clazz = (Class) type.getActualTypeArguments()[0];	
	}
	// 有侵入性
	// private HibernateTemplate hibernateTemplate;
	@Resource
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		try{
			session = this.sessionFactory.getCurrentSession();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return session;
	}
	
	
	

	@Override
	public void save(T t) {
		// TODO Auto-generated method stub
		System.out.println(t);
		
		getSession().save(t);
		System.out.println("ee");
		
	}

	@Override
	public void update(T t) {
		// TODO Auto-generated method stub
		getSession().update(t);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		String hql = "delete " + clazz.getSimpleName() + " where id=:id";
		getSession().createQuery(hql)
					.setInteger("id", id)
					.executeUpdate();
	}

	
	@Override
	public T get(int id) {
		// TODO Auto-generated method stub
		return (T) getSession().get(clazz, id);
	}

	@Override
	public List<T> query() {
		// TODO Auto-generated method stub
		String qhl = "from " + clazz.getSimpleName();
		return getSession().createQuery(qhl).list();
	}

}
