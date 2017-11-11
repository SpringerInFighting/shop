package cn.it.shop.service.impl;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.stereotype.Service;

import cn.it.shop.model.Forder;
import cn.it.shop.model.Sorder;
import cn.it.shop.model.Status;
import cn.it.shop.service.ForderService;

@SuppressWarnings("unchecked")
@Service("forderService")
public class ForderServiceImpl extends BaseServiceImpl<Forder> implements
		ForderService {
	//计算购物车总价格
	@Override
	public BigDecimal total(Forder forder) {
		// TODO Auto-generated method stub
		BigDecimal total = new BigDecimal(0.00);
		for(Sorder sorder : forder.getSorderList()){
			/*total += sorder.getProduct().getPrice() * sorder.getNumber();*/
			BigDecimal temp = sorder.getPrice().multiply(new BigDecimal(sorder.getNumber()));
			total = total.add(temp);
		}
		
		return total;
	}

	@Override
	public void UpdateStatusById(int id, int sid) {
		forderDao.UpdateStatusById(id, sid);
	}

	//计算购物车里一共有多少个商品
	@Override
	public int queryProductTotal(Forder forder){
		int pTotal = 0;
		for(Sorder temp : forder.getSorderList()){
			pTotal += temp.getNumber();
		}
		return pTotal;
	}

	@Override
	public List<Forder> queryArreForder(String name, int page, int size,
			int status) {
		// TODO Auto-generated method stub
		
		
		return forderDao.queryArreForder(name, page, size, status);
	}
	//根据关键字查询总记录数
	@Override
	public Long getCount(String name,int status){
			
		return forderDao.getCount(name, status);
	}

	@Override
	public void deleteForderByFId(String fid) {
		// TODO Auto-generated method stub
		forderDao.deleteForderByFId(fid);
	}
}
