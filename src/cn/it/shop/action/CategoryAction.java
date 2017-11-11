package cn.it.shop.action;

import java.io.ByteArrayInputStream;
import java.util.HashMap;
import java.util.List;

import javax.resource.spi.Connector;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.it.shop.model.Category;
import cn.it.shop.service.CategoryService;

import com.opensymphony.xwork2.ActionSupport;

@Controller
@Scope("prototype")
public class CategoryAction extends BaseAction<Category>{

	
	public String queryJoinAccount(){
		System.out.println("type:"+model.getType());
		//用来存储分页数据
		pageMap = new HashMap<String,Object>();
		//根据关键字和分页的参数查询相应的数据
		List<Category> categoryList = categoryService.queryJoinAccount(model.getType(), page, rows);
		
		pageMap.put("rows", categoryList);
		//根据关键字查询总记录数
		Long total = categoryService.getCount(model.getType());
		System.out.println(total);
		pageMap.put("total", total);
		return "jsonMap";
	}
	
	public String deleteByIds(){
		
		System.out.println("删除id为："+ids);
		categoryService.deleteByIds(ids);
		inputStream=new ByteArrayInputStream("true".getBytes());
		return "stream";
	}
	
	public void save(){
		
		System.out.println(model);
		categoryService.save(model);
	}
	
	public void update(){
		System.out.println(model);
		categoryService.update(model);
		
	}
	
	public String query(){
		
		jsonList = categoryService.query();
		return "jsonList";
	}
}
