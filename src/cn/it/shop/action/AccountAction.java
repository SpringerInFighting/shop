package cn.it.shop.action;


import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.it.shop.model.Account;
import cn.it.shop.model.Category;
import cn.it.shop.service.CategoryService;

import com.opensymphony.xwork2.ActionSupport;

@Controller
@Scope("prototype")
public class AccountAction extends BaseAction<Account>{
	
	public String query(){
		System.out.println("---------query-------");
		jsonList = accountService.query();
		return "jsonList";
	}
}
