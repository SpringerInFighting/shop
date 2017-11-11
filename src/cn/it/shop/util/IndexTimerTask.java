package cn.it.shop.util;

import java.util.ArrayList;
import java.util.List;
import java.util.TimerTask;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

import cn.it.shop.model.Category;
import cn.it.shop.model.Product;
import cn.it.shop.service.CategoryService;
import cn.it.shop.service.ProductService;

@Component("indexTimerTask")
public class IndexTimerTask extends TimerTask {

	@Resource
	private ProductService productService = null;
	private ServletContext context = null;
	@Resource
	private CategoryService categoryService = null;
	
	
	public void setContext(ServletContext context) {
		this.context = context;
	}


	@Override
	public void run() {
		// TODO Auto-generated method stub
		List<List<Product>> bigList = new ArrayList<List<Product>>();
		
		List<Category> listCategory = categoryService.queryByHot(true);
		for(Category c: listCategory){
			bigList.add(productService.queryByCid(c.getId()));
		}
		context.setAttribute("bigList", bigList);
	}

}
