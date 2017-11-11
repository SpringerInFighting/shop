package cn.it.test_1;

import static org.junit.Assert.fail;

import java.util.Date;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.it.shop.model.Account;
import cn.it.shop.model.Category;
import cn.it.shop.service.AccountService;
import cn.it.shop.service.CategoryService;
import cn.it.shop.service.impl.CategoryServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext-*.xml")
public class SSHTest {

	
	@Resource   //这里为什么要接口类型？
	private AccountService accountService;
	@Resource
	private CategoryService categoryService;
	
	@Test //测试spring IOC 的开发环境
	public void SpringIoc(){
		/*System.out.println(date);*/
	}
	
	@Test //测试Hibernate的开发环境
	public void hibernate(){
		/*CategoryService cs = new CategoryServiceImpl();*/
		
		accountService.save(new Account("admin", "管理员", "admin"));
	}
	
	@Test //测试spring和Hibernate整合环境
	public void springAndhibernate(){
		accountService.update(new Account(1 ,"user", "美眉客服", "user"));
	}
	
	
	
	@Test
	public void testSave() {
		for(Category c : categoryService.queryJoinAccount("",1,2)){
			System.out.println(c.getType());
			System.out.println(c.getAccount().getName());
		}
	}

	@Test
	public void testUpdate() {
		fail("Not yet implemented");
	}

	@Test
	public void testDelete() {
		fail("Not yet implemented");
	}

	@Test
	public void testGet() {
		fail("Not yet implemented");
	}

	@Test
	public void testQuery() {
		fail("Not yet implemented");
	}

}
