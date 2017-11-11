package cn.it.shop.service.impl;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONSerializer;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.it.shop.model.Forder;
import cn.it.shop.model.Product;
import cn.it.shop.model.Sorder;
import cn.it.shop.model.Status;
import cn.it.shop.service.ForderService;
import cn.it.shop.service.ProductService;
import cn.it.shop.service.SorderService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext-*.xml")
public class ProductServiceImplTest {

	@Resource
	private ProductService productService;
	@Resource
	private SorderService sorderService;
	@Resource
	private ForderService forderService;
	
	@Test
	public void testQueryJoinCategory() {
		
		List<Product> list = productService.queryJoinCategory("", 1, 5);
		for(Product p : list){
			//p.setCategory(null);
			p.getCategory().setAccount(null);
			System.out.println(JSONSerializer.toJSON(p));
		}
		System.out.println(list);
		
		
	}

	@Test
	public void testGetCount() {
		List<Forder> listForder = forderService.queryArreForder("", 1, 5, 1);
		for(Forder temp : listForder){
			/*temp.setUser(null);*/
			for(Sorder s:temp.getSorderList()){
				s.setForder(null);
				s.setProduct(null);
			}
			/*temp.setStatus(null);*/
			System.out.println(JSONSerializer.toJSON(temp));
		}
		//System.out.println(listForder.size());
		
	}

	@Test
	public void testDeleteByIds() {
		Forder forder = forderService.get(201407025);
		System.out.println(JSONSerializer.toJSON(forder));
	}
	@Test
	public void test3(){
		Status status = new Status();
		status.setId(1);
		status.setStatus("未支付");
		System.out.println(forderService.getCount("bb", 1));
	}

	@Test
	public void test4(){
		List<Sorder> slist = sorderService.querySorderByFId(201407015);
		for(Sorder temp:slist){
			temp.setForder(null);
			temp.getProduct().setCategory(null);
			System.out.println(JSONSerializer.toJSON(temp));
		}
	}
	
	@Test
	public void test5(){
		forderService.deleteForderByFId("201407013");
	}
	@Test
	public void test6(){
		
		sorderService.querySorderByFId(20170705);
	}
}
