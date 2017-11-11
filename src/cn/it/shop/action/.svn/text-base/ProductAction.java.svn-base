package cn.it.shop.action;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import net.sf.json.JSONSerializer;

import org.apache.commons.io.FilenameUtils;
import org.aspectj.util.FileUtil;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.it.shop.model.Category;
import cn.it.shop.model.Product;

import com.opensymphony.xwork2.ActionSupport;

@Controller
@Scope("prototype")
public class ProductAction extends BaseAction<Product> {
	
	public String queryJoinCategory(){
		System.out.println("name:"+model.getName());
		//用来存储分页数据
		pageMap = new HashMap<String,Object>();
				
		//根据关键字和分页的参数查询相应的数据
		List<Product> productList = productService.queryJoinCategory(model.getName(), page, rows);
			
		pageMap.put("rows", productList);
		
		//根据关键字查询总记录数
		Long total = productService.getCount(model.getName());
		System.out.println(total);
		pageMap.put("total", total);
		return "jsonMap";
	}
	
	public void save() {
		
		String pic = fileUploadUtil.uploadFile(getFileImage());
		model.setPic(pic);
		//商品信息入库
		productService.save(model);
		System.out.println(model);
		
	}
	
	public String get(){
		
		request.put("product", productService.get(model.getId()));
		return "detail";
	}
}
