package cn.it.shop.service.impl;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.management.RuntimeErrorException;

import org.hibernate.Session;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import cn.it.shop.dao.AccountDao;
import cn.it.shop.dao.BaseDao;
import cn.it.shop.dao.CategoryDao;
import cn.it.shop.dao.ForderDao;
import cn.it.shop.dao.ProductDao;
import cn.it.shop.dao.SorderDao;
import cn.it.shop.dao.UserDao;
import cn.it.shop.model.Category;
import cn.it.shop.service.BaseService;

/*
 * 公共模块的抽取
 */
@SuppressWarnings("unchecked")
@Service
@Lazy(value=true)
public class BaseServiceImpl<T> implements BaseService<T> {

	
	private Class clazz;
	private Session session;
	public BaseServiceImpl(){
		ParameterizedType  type = (ParameterizedType) this.getClass().getGenericSuperclass();
		clazz = (Class) type.getActualTypeArguments()[0];	
		System.out.println(clazz + "----------------------------");
	}
	// 有侵入性
	// private HibernateTemplate hibernateTemplate;
	@PostConstruct   // init方法是在构造方法与set注入之后执行, 也就是XML的: init-method=""
	private void init() throws Exception{
		// 1: 根据具体的泛型, 获取相应的Field字段, categoryDao
		String clazzName = clazz.getSimpleName();
		//根据获取的clazzName修改字段名，例如Account改为accountDao
		String clazzDaoName = clazzName.substring(0, 1).toLowerCase() + clazzName.substring(1, clazzName.length()) + "Dao";
		//获取相应的Field字段
		Field clazzDao = this.getClass().getSuperclass().getDeclaredField(clazzDaoName);
		Field baseDao = this.getClass().getSuperclass().getDeclaredField("baseDao");
		//把相应的Dao赋给baseDao，如accountDao赋给baseDao
		baseDao.set(this, clazzDao.get(this));
		System.out.println("baseDao:"+baseDao);
	}

	protected BaseDao baseDao;
	@Resource
	protected AccountDao accountDao;
	@Resource
	protected CategoryDao categoryDao;
	@Resource
	protected ForderDao forderDao;
	
	protected ProductDao productDao;
	@Resource
	public void setProductDao(ProductDao productDao) {
		System.out.println(productDao + "--------------------********");
		this.productDao = productDao;
	}

	@Resource
	protected SorderDao sorderDao;
	@Resource
	protected UserDao userDao;
	@Override
	public void save(T t) {
		// TODO Auto-generated method stub
		baseDao.save(t);
	}
	@Override
	public void update(T t) {
		// TODO Auto-generated method stub
		baseDao.update(t);
	}
	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		baseDao.delete(id);
	}
	@Override
	public T get(int id) {
		// TODO Auto-generated method stub
		return (T) baseDao.get(id);
	}
	@Override
	public List<T> query() {
		// TODO Auto-generated method stub
		return baseDao.query();
	}

	
	
}
