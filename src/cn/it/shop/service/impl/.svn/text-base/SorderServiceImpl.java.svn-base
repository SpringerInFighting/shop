package cn.it.shop.service.impl;


import java.io.ByteArrayInputStream;
import java.util.List;

import org.springframework.stereotype.Service;

import cn.it.shop.model.Forder;
import cn.it.shop.model.Product;
import cn.it.shop.model.Sorder;
import cn.it.shop.service.SorderService;

@Service("sorderService")
public class SorderServiceImpl extends BaseServiceImpl<Sorder> implements
		SorderService {

	// 把product对象转化为sorder对象
	private Sorder productToSorder(Product product){
		
		Sorder sorder = new Sorder();
		sorder.setName(product.getName());
		sorder.setNumber(1);
		sorder.setPrice(product.getPrice());
		sorder.setProduct(product);
		return sorder;
	}
	// 添加购物项, 并且判断重复
	@Override
	public Forder addSorder(Forder forder, Product product) {
		// TODO Auto-generated method stub
		boolean isHave=false;
		Sorder sorder = productToSorder(product);
		
		if(forder != null){
			// 获取当前购物车中已有的购物项
			for(Sorder old: forder.getSorderList()){
				if(old.getProduct().getId().equals(sorder.getProduct().getId())){
					// 不需要重复添加,修改数量即可
					old.setNumber(old.getNumber() + sorder.getNumber());
					isHave=true;
					break;
				}
			}
		}else{
			forder = new Forder();
		}
		
		if(!isHave){
			sorder.setForder(forder);//为了级联
			forder.getSorderList().add(sorder);
		}
		return forder;
	}
	@Override
	public Forder alterSorder(Forder forder, Sorder sorder) {
		// TODO Auto-generated method stub
		for(Sorder temp:forder.getSorderList()){
			if(temp.getProduct().getId().equals(sorder.getProduct().getId())){
				temp.setNumber(sorder.getNumber());
			}	
		}	
		return forder;
	}

	@Override
	public List<Object> querySale(int number) {
		return sorderDao.querySale(number);
	}
	
	//删除购物车里的指定购物项
	@Override
	public Forder deleteSorderById(Forder forder, Sorder sorder){
		Sorder sorderTemp = null;
		if(forder != null){
			for(Sorder temp:forder.getSorderList()){
				if(temp.getProduct().getId().equals(sorder.getProduct().getId())){
					sorderTemp = temp;
				}
			}
			if(sorderTemp != null){
				//System.out.println(temp.getPrice()+ "|" +temp.getNumber());
				forder.getSorderList().remove(sorderTemp);
				//
			}
			
		}
		return forder;
	}
	@Override
	public List<Sorder> querySorderByFId(int fid) {
		// TODO Auto-generated method stub
		
		return sorderDao.querySorderByFId(fid);
	}

}
