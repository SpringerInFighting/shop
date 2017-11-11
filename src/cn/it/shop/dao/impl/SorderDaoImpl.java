package cn.it.shop.dao.impl;


import java.util.List;

import org.springframework.stereotype.Service;

import cn.it.shop.dao.SorderDao;
import cn.it.shop.model.Sorder;

@SuppressWarnings("unchecked")
@Service("sorderDao")
public class SorderDaoImpl extends BaseDaoImpl<Sorder> implements
		SorderDao {

	@Override
	public List<Object> querySale(int number) {
		// TODO Auto-generated method stub
		
		String hql = "select s.name, sum(s.number) from Sorder s join s.product group by s.product.id";
		
		return getSession().createQuery(hql)
				.setFirstResult(0)
				.setMaxResults(number)
				.list();
	}

	//根据订单id查找购物项
	@Override
	public List<Sorder> querySorderByFId(int fid) {
		// TODO Auto-generated method stub
		String hql = "from Sorder s left join fetch s.product where s.forder.id=:fid";
		
		
		return getSession().createQuery(hql)
				.setInteger("fid", fid)
				.list();
	}
	

	
}
