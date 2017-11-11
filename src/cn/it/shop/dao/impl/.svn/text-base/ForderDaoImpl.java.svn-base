package cn.it.shop.dao.impl;



import java.util.List;

import org.springframework.stereotype.Service;

import cn.it.shop.dao.ForderDao;
import cn.it.shop.model.Forder;
import cn.it.shop.model.Status;

@SuppressWarnings("unchecked")
@Service("forderDao")
public class ForderDaoImpl extends BaseDaoImpl<Forder> implements
		ForderDao {
	

	@Override
	public void UpdateStatusById(int id, int sid) {
		// TODO Auto-generated method stub
		String hql = "update Forder f set f.status.id=:sid where f.id=:id";
		getSession().createQuery(hql)
					.setInteger("sid", sid)
					.setInteger("id", id)
					.executeUpdate();
	}

	@Override
	public List<Forder> queryArreForder(String name, int page, int size, int status) {
		// TODO Auto-generated method stub
		String hql = "from Forder f left join fetch f.user left join fetch f.status left join fetch f.sorderList where f.name like:name and f.status=:status";
		String hql2 = "select distinct f from Forder f left join fetch f.sorderList where f.name like:name and f.status=:status";
		return getSession().createQuery(hql)
				.setString("name", "%"+name+"%")
				.setInteger("status", status)
				.setFirstResult((page-1)*size)
				.setMaxResults(size)
				.list();
	}

	//根据关键字查询总记录数
	@Override
	public Long getCount(String name, int status) {
		// TODO Auto-generated method stub
		String hql = "select count(f) from Forder f where f.name like :name and f.status=:status";
		
		return (Long)getSession().createQuery(hql)
								 .setString("name", "%"+name+"%")
								 .setInteger("status", status)
								 .uniqueResult();
	}

	@Override
	public void deleteForderByFId(String fid) {
		// TODO Auto-generated method stub
		String hql = "delete from Forder where id in(" + fid +")" ;
		getSession().createQuery(hql)
					.executeUpdate();
	}

	
}
